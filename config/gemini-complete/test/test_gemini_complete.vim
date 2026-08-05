vim9script

gemini_complete#Setup()
assert_equal('gemini-2.5-flash-lite', g:gemini_complete_model, 'default model should be flash-lite')
assert_equal(1, g:gemini_complete_enabled, 'should be enabled by default')

# --- BuildPrompt ---
var prompt = gemini_complete#BuildPrompt(['func foo() {'], ['}'], 'go')
assert_equal(true, prompt =~ 'func foo() {', 'prompt should contain prefix')
assert_equal(true, prompt =~ '<CURSOR>', 'prompt should contain cursor marker')
assert_equal(true, prompt =~ '}', 'prompt should contain suffix')

# --- StripCodeFences ---
assert_equal("foo()", gemini_complete#StripCodeFences("```go\nfoo()\n```"), 'should strip fences')
assert_equal("foo()", gemini_complete#StripCodeFences("foo()"), 'no fences, unchanged')

# --- TruncateLines ---
assert_equal(['a', 'b'], gemini_complete#TruncateLines("a\nb\nc", 2), 'should truncate to 2 lines')
assert_equal(['a', 'b', 'c'], gemini_complete#TruncateLines("a\nb\nc\n", 5), 'trailing empty line dropped')

# --- ParseGeminiResponse ---
var fakeJson = '{"candidates":[{"content":{"parts":[{"text":"line1\nline2"}]}}]}'
assert_equal(['line1', 'line2'], gemini_complete#ParseGeminiResponse(fakeJson), 'should parse gemini json')
assert_equal([], gemini_complete#ParseGeminiResponse('not valid json'), 'invalid json returns empty')

# --- ShouldRequest ---
g:gemini_complete_excluded_ft = ['markdown', 'gitcommit']
assert_equal(true, gemini_complete#ShouldRequest('go'), 'go should be allowed')
assert_equal(false, gemini_complete#ShouldRequest('markdown'), 'markdown should be excluded')

# --- SplitForInsert ---
assert_equal({'first': 'a', 'rest': ['b', 'c']}, gemini_complete#SplitForInsert(['a', 'b', 'c']), 'split first/rest')
assert_equal({'first': '', 'rest': []}, gemini_complete#SplitForInsert([]), 'empty input')

# --- BuildCurlConfig ---
var cfg = gemini_complete#BuildCurlConfig('MYTESTKEY', 'gemini-2.5-flash-lite', 'hello world prompt')
var cfgContent = join(readfile(cfg.cfgFile), "\n")
assert_equal(true, cfgContent =~ 'x-goog-api-key: MYTESTKEY', 'api key must be in header line, not argv')
assert_equal(true, cfgContent =~ 'gemini-2.5-flash-lite', 'model must be in url')
assert_equal(true, cfgContent =~ 'data-binary', 'must reference body file')
var bodyContent = join(readfile(cfg.bodyFile), "\n")
assert_equal(true, bodyContent =~ 'hello world prompt', 'prompt must be in request body')
delete(cfg.cfgFile)
delete(cfg.bodyFile)

var resultFile = getenv('GEMINI_TEST_RESULT_FILE')
if len(v:errors) > 0
  writefile(v:errors + ['FAIL'], resultFile)
  cquit 1
else
  writefile(['ALL TESTS PASSED'], resultFile)
endif

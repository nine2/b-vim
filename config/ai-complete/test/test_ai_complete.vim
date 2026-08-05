vim9script

ai_complete#Setup()
assert_equal('Qwen/Qwen3-Coder-30B-A3B-Instruct', g:ai_complete_model, 'default model should be Qwen3-Coder')
assert_equal(1, g:ai_complete_enabled, 'should be enabled by default')

# --- BuildPrompt ---
var prompt = ai_complete#BuildPrompt(['func foo() {'], ['}'], 'go')
assert_equal(true, prompt =~ 'func foo() {', 'prompt should contain prefix')
assert_equal(true, prompt =~ '<CURSOR>', 'prompt should contain cursor marker')
assert_equal(true, prompt =~ '}', 'prompt should contain suffix')

# --- StripCodeFences ---
assert_equal("foo()", ai_complete#StripCodeFences("```go\nfoo()\n```"), 'should strip fences')
assert_equal("foo()", ai_complete#StripCodeFences("foo()"), 'no fences, unchanged')

# --- TruncateLines ---
assert_equal(['a', 'b'], ai_complete#TruncateLines("a\nb\nc", 2), 'should truncate to 2 lines')
assert_equal(['a', 'b', 'c'], ai_complete#TruncateLines("a\nb\nc\n", 5), 'trailing empty line dropped')

# --- ParseAIResponse ---
var fakeJson = '{"choices":[{"message":{"content":"line1\nline2"}}]}'
assert_equal(['line1', 'line2'], ai_complete#ParseAIResponse(fakeJson), 'should parse OpenAI-compatible json')
assert_equal([], ai_complete#ParseAIResponse('not valid json'), 'invalid json returns empty')

# --- ShouldRequest ---
g:ai_complete_excluded_ft = ['markdown', 'gitcommit']
assert_equal(true, ai_complete#ShouldRequest('go'), 'go should be allowed')
assert_equal(false, ai_complete#ShouldRequest('markdown'), 'markdown should be excluded')

# --- SplitForInsert ---
assert_equal({'first': 'a', 'rest': ['b', 'c']}, ai_complete#SplitForInsert(['a', 'b', 'c']), 'split first/rest')
assert_equal({'first': '', 'rest': []}, ai_complete#SplitForInsert([]), 'empty input')

# --- BuildCurlConfig ---
var cfg = ai_complete#BuildCurlConfig('MYTESTKEY', 'Qwen/Qwen3-Coder-30B-A3B-Instruct', 'hello world prompt')
var cfgContent = join(readfile(cfg.cfgFile), "\n")
assert_equal(true, cfgContent =~ 'Authorization: Bearer MYTESTKEY', 'api key must be in header line, not argv')
assert_equal(true, cfgContent =~ 'api-inference.modelscope.cn', 'url must point to modelscope api-inference')
assert_equal(true, cfgContent =~ 'data-binary', 'must reference body file')
var bodyContent = join(readfile(cfg.bodyFile), "\n")
assert_equal(true, bodyContent =~ 'hello world prompt', 'prompt must be in request body')
assert_equal(true, bodyContent =~ 'Qwen3-Coder', 'model must be in request body')
delete(cfg.cfgFile)
delete(cfg.bodyFile)

# --- Accept()/HasSuggestion()/Dismiss()（不依赖网络，用调试注入函数直接验证） ---
assert_equal(false, ai_complete#HasSuggestion(), 'no suggestion initially')
ai_complete#DebugSetSuggestion(['foo()', 'bar()'])
assert_equal(true, ai_complete#HasSuggestion(), 'suggestion present after inject')

# 光标停在行中间（非行尾），避开 Normal/Insert 模式下 cursor() 钳制行为不一致的问题：
# Normal 模式的光标不能停在"最后一个字符之后"，只有真正的 Insert 模式才允许，headless
# batch 脚本很难可靠模拟"真处于 Insert 模式、光标在行尾"这个状态——这部分留给 Task 7
# 手动验证清单里"真实交互"的一条，这里只验证任意光标位置下的文本拼接逻辑本身是否正确
new
setline(1, 'x = END')
cursor(1, 5)
ai_complete#DebugSetSuggestion(['foo()', 'bar()'])
ai_complete#Accept()
assert_equal('x = foo()END', getline(1), 'suggestion should be spliced in at cursor position')
assert_equal('bar()', getline(2), 'second line should be appended below')
assert_equal(false, ai_complete#HasSuggestion(), 'suggestion cleared after accept')
bwipeout!

new
setline(1, 'unchanged')
ai_complete#Accept()
assert_equal('unchanged', getline(1), 'Accept with no suggestion should not modify buffer')
bwipeout!

var resultFile = getenv('AI_TEST_RESULT_FILE')
if len(v:errors) > 0
  writefile(v:errors + ['FAIL'], resultFile)
  cquit 1
else
  writefile(['ALL TESTS PASSED'], resultFile)
endif

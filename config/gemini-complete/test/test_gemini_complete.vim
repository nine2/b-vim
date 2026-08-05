vim9script

gemini_complete#Setup()
assert_equal('gemini-2.5-flash-lite', g:gemini_complete_model, 'default model should be flash-lite')
assert_equal(1, g:gemini_complete_enabled, 'should be enabled by default')

var resultFile = getenv('GEMINI_TEST_RESULT_FILE')
if len(v:errors) > 0
  writefile(v:errors + ['FAIL'], resultFile)
  cquit 1
else
  writefile(['ALL TESTS PASSED'], resultFile)
endif

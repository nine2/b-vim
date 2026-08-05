vim9script
# 集成测试：真实调用 ModelScope API-Inference（Qwen3-Coder），验证 FireRequest ->
# HandleJobExit -> suggestionLines 全链路。依赖真实网络与 $MODELSCOPE_API_KEY。
#
# 已知限制：ModelScope 免费档在极短间隔内连续请求会返回 429（实测约 2 秒间隔以上稳定），
# 若本测试恰好紧跟在别的请求之后跑，偶发 429 不代表插件代码有 bug。

var resultFile = getenv('AI_TEST_RESULT_FILE')

new
setline(1, ['func add(a int, b int) int {'])
&filetype = 'go'
cursor(1, 999)

ai_complete#Setup()
ai_complete#OnTextChanged()

var waited = 0
while ai_complete#DebugPendingCount() > 0 && waited < 15000
  sleep 200m
  waited += 200
endwhile

var got = ai_complete#DebugSuggestion()
if empty(got)
  # 诊断信息：区分"插件逻辑有 bug"还是"这台机器的网络/API key 限制导致调不通"
  var diag = $'exit_status={ai_complete#DebugLastExitStatus()} raw_response={ai_complete#DebugLastRawResponse()}'
  assert_equal(true, len(got) > 0, $'expected non-empty suggestion from real ModelScope API within {waited}ms. {diag}')
else
  var beforeAcceptLine = getline(1)
  ai_complete#Accept()
  # Accept() 的真正 buffer 修改延到 timer_start(0, ...) 异步执行，sleep 一下等它跑完
  sleep 10m
  var afterAcceptLine = getline(1)
  assert_equal(true, afterAcceptLine != beforeAcceptLine, 'Accept should modify buffer content')
  assert_equal(true, len(afterAcceptLine) > len(beforeAcceptLine), 'Accept should insert non-empty text')
endif

bwipeout!

if len(v:errors) > 0
  writefile(v:errors + ['FAIL'], resultFile)
  cquit 1
else
  writefile(['INTEGRATION TEST PASSED: ' .. string(got)], resultFile)
endif

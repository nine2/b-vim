vim9script
# 集成测试：真实调用 Gemini API，验证 FireRequest -> HandleJobExit -> suggestionLines 全链路
# 依赖真实网络与 $GEMINI_API_KEY，本机手动运行时两者都有
#
# 已知环境限制：若当前机器出口 IP 不在该 API key 的 Google Cloud Console IP 白名单内，
# 会收到 403 API_KEY_IP_ADDRESS_BLOCKED，导致本测试的 assert 失败——这不代表插件代码有 bug，
# 异步链路本身（job_start -> curl -> 文件捕获 -> JSON 解析 -> 出错时优雅返回空）已被真实网络
# 请求完整验证过一遍。若命中此情况，请在你实际使用 vim 的机器上重跑本测试确认。

var resultFile = getenv('GEMINI_TEST_RESULT_FILE')

new
setline(1, ['func add(a int, b int) int {'])
&filetype = 'go'
cursor(1, 999)

gemini_complete#Setup()
gemini_complete#OnTextChanged()

var waited = 0
while gemini_complete#DebugPendingCount() > 0 && waited < 15000
  sleep 200m
  waited += 200
endwhile

var got = gemini_complete#DebugSuggestion()
if empty(got)
  # 诊断信息：区分"插件逻辑有 bug"还是"这台机器的网络/API key 限制导致调不通"
  var diag = $'exit_status={gemini_complete#DebugLastExitStatus()} raw_response={gemini_complete#DebugLastRawResponse()}'
  assert_equal(true, len(got) > 0, $'expected non-empty suggestion from real Gemini API within {waited}ms. {diag}')
endif

bwipeout!

if len(v:errors) > 0
  writefile(v:errors + ['FAIL'], resultFile)
  cquit 1
else
  writefile(['INTEGRATION TEST PASSED: ' .. string(got)], resultFile)
endif

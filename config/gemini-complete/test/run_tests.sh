#!/usr/bin/env bash
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export GEMINI_TEST_RESULT_FILE="$(mktemp)"

vim -Nu NONE --not-a-term -es \
  -c "set rtp+=${DIR}" \
  -c "source ${DIR}/test/test_gemini_complete.vim" \
  -c "qa!" || true

cat "${GEMINI_TEST_RESULT_FILE}"
if grep -q "^FAIL$" "${GEMINI_TEST_RESULT_FILE}" 2>/dev/null || [ ! -s "${GEMINI_TEST_RESULT_FILE}" ]; then
  rm -f "${GEMINI_TEST_RESULT_FILE}"
  exit 1
fi
rm -f "${GEMINI_TEST_RESULT_FILE}"
exit 0

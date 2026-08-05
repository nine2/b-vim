#!/usr/bin/env bash
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export AI_TEST_RESULT_FILE="$(mktemp)"

vim -Nu NONE --not-a-term -es \
  -c "set rtp+=${DIR}" \
  -c "source ${DIR}/test/test_integration.vim" \
  -c "qa!" || true

cat "${AI_TEST_RESULT_FILE}"
if grep -q "^FAIL$" "${AI_TEST_RESULT_FILE}" 2>/dev/null || [ ! -s "${AI_TEST_RESULT_FILE}" ]; then
  rm -f "${AI_TEST_RESULT_FILE}"
  exit 1
fi
rm -f "${AI_TEST_RESULT_FILE}"
exit 0

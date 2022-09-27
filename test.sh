#!/bin/bash
echo "Running tests..."
echo

output=$(./a.out)
expected_output="這裡改成預期輸出"

if [ $? -eq 0 ] ; then
  echo "Pass: Program exited zero"
else
  echo "Fail: Program did not exit zero"
  exit 1
fi

# Print output
echo "Output:"
diff  --old-line-format='⏩ %L' \
      --new-line-format='❌ %L' \
      --unchanged-line-format='✅ %L' \
      <(echo "$expected_output" ) <(echo "$output")

# 等待一下，不然輸出比對結果會被切斷
sleep 0.5
if [ "$output" == "$expected_output" ] ; then
  echo "Pass: Output is correct"
else
  echo "Failed!"
  exit 1
fi

echo
echo "All tests passed."

exit 0
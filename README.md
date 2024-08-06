# Test cuda #

First check if nvcc is found with:
`nvcc --version`

if not found add to path
`PATH="$PATH:/usr/local/cuda-12.6/bin"`

Final test is to run the test program
`nvcc cuda-test.cu -o cuda-test && ./cuda-test`

# Bend #

https://github.com/HigherOrderCO/Bend
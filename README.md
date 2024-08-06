# Test cuda #

First check if nvcc is found with:
`nvcc --version`

if not found add to path
`PATH="$PATH:/usr/local/cuda-12.6/bin"`

Final test is to run the test program
`nvcc cuda-test.cu -o cuda-test && ./cuda-test`

# Bend #

https://github.com/HigherOrderCO/Bend

# Useful #

mkdir ~/hvmtmp
cd ~/hvmtmp
cargo init
cargo add hvm@=2.0.21 //or newer
cargo vendor vendor
cd vendor/hvm
Open and edit `src/hvm.cu`. Reduce L_NODE_LEN and L_VARS_LEN
cd ~/hvmtmp/vendor/hvm
cargo install --path .
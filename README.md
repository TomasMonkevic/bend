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

# Struggles #

Running on CUDA (CUDA on WSL)
    - No cuda found
    - Invalid arguments (something related to the HVM memory config being too high on lower GPUs because the config was optimized for GTX 4090)
    - Running benchmark on GPU gives 2x lower performance than on 4 thread CPU. Bend only works with 4090, but should work on 3 series gpu with L1 cache non less than 96kB

Built in functions:
    - IO syntax is detected but doesn't work. Almost no examples with IO and the existing ones also don't work. This should work only on run-c.
    - Importing syntax isn't even detected and doesn't work
    - Limited mount of bultin functions. No funtions like parse(string) -> int
    - Cannot debug because can't event print values
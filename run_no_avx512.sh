nix-shell --run '
if [ -x "./rpcs3-perf/build/bin/rpcs3" ]; then
    ./rpcs3-perf/build/bin/rpcs3
else
    echo "No permission to run RPCS3 executable. Attempting to change permissions."
    chmod 755 ./rpcs3-perf/build/bin/rpcs3
    if [ -x "./rpcs3-perf/build/bin/rpcs3" ]; then
        echo "Success! Opening RPCS3."
        GLIBC_TUNABLES=glibc.cpu.hwcaps=-AVX512F,-AVX512BW,-AVX512DQ,-AVX512VL ./rpcs3-perf/build/bin/rpcs3
    else
        echo "Unsuccessful. Try to change permissions manually."
    fi
fi
'

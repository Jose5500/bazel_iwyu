FROM bazel_iwyu/builder AS builder

FROM scratch AS x86_64
COPY --from=builder /usr/lib/llvm-16/lib/clang/16/include/ /lib/clang/16/include/
COPY --from=builder /tmp/iwyu-0.20-x86_64-linux-gnu /

FROM scratch AS aarch64
COPY --from=builder /usr/lib/llvm-16/lib/clang/16/include/ /lib/clang/16/include/
COPY --from=builder /tmp/iwyu-0.20-aarch64-linux-gnu /

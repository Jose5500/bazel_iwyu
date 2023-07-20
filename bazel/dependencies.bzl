load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@bazel_iwyu//bazel:prebuilt_pkg.bzl", "prebuilt_pkg")

def bazel_iwyu_dependencies():
    maybe(
        prebuilt_pkg,
        name = "iwyu_prebuilt_pkg",
        build_file = Label("//bazel/iwyu:BUILD.prebuilt_pkg"),
        urls = {
            "linux-aarch64": [
                "https://github.com/Jose5500/include-what-you-use/releases/download/fixesCycleErrors/iwyu-0.19.2-aarch64-linux-gnu.tar.xz",
            ],
            "linux-x86_64": [
                "https://github.com/Jose5500/include-what-you-use/releases/download/fixesCycleErrors/iwyu-0.19.2-x86_64-linux-gnu.tar.gz",
            ],
        },
        strip_prefix = {
            "linux-aarch64": "iwyu-0.19.2-x86_64-linux-gnu_test",
            "linux-x86_64": "iwyu-0.19.2-x86_64-linux-gnu",
        },
        sha256 = {
            "linux-aarch64": "6f61443877cb92f9caac1bd2cf1b170af15fffc66b2417e2fc0bdfc2a4602f96",
            "linux-x86_64": "4fdbba04bb609d7b30b71333af1305c2f966f2d5fb91ee5574d2edb7ad5f85e1",
        },
    )

    maybe(
        http_archive,
        name = "bazel_skylib",
        urls = [
            "https://github.com/bazelbuild/bazel-skylib/archive/1.3.0.tar.gz",
        ],
        sha256 = "3b620033ca48fcd6f5ef2ac85e0f6ec5639605fa2f627968490e52fc91a9932f",
        strip_prefix = "bazel-skylib-1.3.0",
    )

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")
load("@com_github_storypku_bazel_iwyu//bazel:prebuilt_pkg.bzl", "prebuilt_pkg")

def bazel_iwyu_dependencies():
    maybe(
        prebuilt_pkg,
        name = "iwyu_prebuilt_pkg",
        build_file = Label("//bazel/iwyu:BUILD.prebuilt_pkg"),
        urls = {
            "linux-aarch64": [
                "https://github.com/Jose5500/include-what-you-use/archive/fixesCycleErrors/iwyu-0.19.2-aarch64-linux-gnu.tar.gz",
            ],
            "linux-x86_64": [
                "https://github.com/Jose5500/include-what-you-use/archive/fixesCycleErrors/iwyu-0.19.2-x86_64-linux-gnu.tar.gz",
            ],
        },
        strip_prefix = {
            "linux-aarch64": "iwyu-0.19.2-aarch64-linux-gnu",
            "linux-x86_64": "iwyu-0.19.2-x86_64-linux-gnu",
        },
        sha256 = {
            "linux-aarch64": "3a2ea1d364eb01cefd994ac6ce52ad4c9435c287568e7528ea93214cda47133f",
            "linux-x86_64": "ce488485a5c5d4131a81468fcba5106fffb2d49b9b57036bf73b7fbeda354653",
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

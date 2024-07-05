Example setup for [Raylib.lean](https://github.com/KislyjKisel/Raylib.lean), [Flecs.lean](https://github.com/KislyjKisel/Flecs.lean) and [Luau.lean](https://github.com/KislyjKisel/Luau.lean).

Can be run using `lake exe Game`.

# Troubleshooting

## General

* No guarantee of stability is given,
  so it is recommended to specify commit hashes in the lakefile's require commands.
* First build may take a few minutes to clone library repos (lake shows "Computing build jobs").
* Building bindings and libraries requires `git`, `make`, `mkdir`, a C compiler and,
  when using Luau, `clang++` and `libc++`.
* See bindings readme files.

## Linux

* `LEAN_CC=cc` may be required due to incompatibilities between the Lean's bundled older glibc
  and the newer system glibc used when compiling Luau.

## Windows

* See [this](https://github.com/KislyjKisel/Raylib.lean/issues/3#issuecomment-1869814806).

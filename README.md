### Blink the Uno's built-in LED with Rust & Nix 💡
This is mostly an example thing, I wanted to combine embedded Rust with Nix.

- **Target**: Arduino UNO (atmega328p)
- **Abstraction layer:** [Rahix/avr-hal](https://github.com/Rahix/avr-hal)
- **Rust provider:** [oxalica/rust-overlay](https://github.com/oxalica/rust-overlay)

### Warning ⚠️
This **does not compile** (yet), with the following message: 
```console
   Compiling compiler_builtins v0.1.92
LLVM ERROR: Expected a constant shift amount!
error: could not compile `core` (lib)
warning: build failed, waiting for other jobs to finish...
LLVM ERROR: Expected a constant shift amount!
error: could not compile `compiler_builtins` (lib)
```
I'm not the only one who has encountered this, and a fix seems to be on its way. See [Here](https://github.com/rust-lang/compiler-builtins/issues/523#issuecomment-1574833723)

### To-do:
- [ ] Wait for [upstream changes](https://reviews.llvm.org/D152059) in LLVM to solve the compilation issue
- [ ] Get rid of the hardcoded `system = "x86_64-linux"` in flake.nix

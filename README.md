### Blink the Uno's built-in LED with Rust & Nix 💡

This is mostly an example thing, I wanted to combine embedded Rust with Nix.

- **Target**: Arduino UNO (**`atmega328p`**)
- **Abstraction layer:** [`Rahix/avr-hal`](https://github.com/Rahix/avr-hal)

### To-do:

- [x] Wait for [upstream changes](https://reviews.llvm.org/D152059) in **LLVM** to solve the compilation issue
- [x] Figure out the proper way to compile this for the target
- [x] Test the binary on an actual board (Works!)

# List available recipes.
default:
    @just --list

# Build a binary for the board.
build:
    cargo build -Z build-std=core --target ./avr-atmega328p.json --release

# Flash the binary to the board.
flash: build
    sudo avrdude -patmega328p -carduino -P/dev/ttyACM0 -b115200 -D -Uflash:w:target/avr-atmega328p/release/arduino_blink_rs.elf

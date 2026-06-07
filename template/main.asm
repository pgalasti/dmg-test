include "hardware.inc/hardware.inc"
include "utils.inc"

def ROM_HEADER_ADDRESS    equ $0100
def ROM_MAIN_ADDRESS      equ $0150

section "header", rom0[ROM_HEADER_ADDRESS]
entrypoint:
  di
  jp main
  ds (ROM_MAIN_ADDRESS - @), 0     ; RGBDS toolchain functionality

section "main", rom0
main:
  DisableLCD ; We weant to (wait for vblank and) disable the LCD to load tiles into memory
  ; Tile loading here or maybe in Init secetion?
  call InitSample
  .loop
    call UpdateSample
    jr .loop

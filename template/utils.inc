if !def(G_UTILS_INC)
def G_UTILS_INC equ 1

include "hardware.inc/hardware.inc"

; Pulled from https://github.com/mdagois/gca

def TILE_COUNT                 equ (384)
def BYTES_PER_TILE             equ (16)
def TILES_BYTE_SIZE            equ (TILE_COUNT * BYTES_PER_TILE)
def TILEMAP_BYTE_SIZE          equ (1024)
def GRAPHICS_DATA_SIZE         equ (TILES_BYTE_SIZE + TILEMAP_BYTE_SIZE)
def GRAPHICS_DATA_ADDRESS_END  equ ($8000)
def GRAPHICS_DATA_ADDRESS_START \
                               equ (GRAPHICS_DATA_ADDRESS_END-GRAPHICS_DATA_SIZE)

; Pulled from https://github.com/mdagois/gca
macro LoadGraphicsDataIntoVRAM
  ld de, GRAPHICS_DATA_ADDRESS_START
  ld hl, _VRAM8000
  .load_tile\@
    ld a, [de]
    inc de
    ld [hli], a
    ld a, d
    cp a, high(GRAPHICS_DATA_ADDRESS_END)
    jr nz, .load_tile\@
endm

macro DisableLCD
  .wait_vblank\@
    ld a, [rLY]
    cp a, SCREEN_HEIGHT_PX
    jr nz, .wait_vblank\@

  xor a
  ld [rLCDC], a
endm

endc

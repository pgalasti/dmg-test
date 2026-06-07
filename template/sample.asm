include "utils.inc"

section "sample", rom0

InitSample:
  ld a, 0
  inc a
  ret

UpdateSample:
  inc a
  inc a
  inc a
  ret

export InitSample, UpdateSample

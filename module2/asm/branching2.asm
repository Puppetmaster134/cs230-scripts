; branching2.asm
; Branching 2 -- Even or Odd

; Load an immediate as a word
; If it's odd, store in register $5 and if it's even store in register $6
lis $1
.word 0x10

addi $2, $0, 2
div $1, $2
mfhi $2
slt $3, $0, $2
beq $3, $0, number_is_even

number_is_odd:
    add $5, $0, $1
    beq $0, $0, final

number_is_even:
    add $6, $0, $1

final:
    jr $31

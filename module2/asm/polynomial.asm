; polynomial.asm
; Solve the polynomial (a + b) - (c + d)

; Load first (a) immediate as a word
lis $2
.word 0x14

; Load second (b) immediate as a word
lis $3
.word 0x0C

; Load third (c) immediate as a word
lis $4
.word 0x05

; Load fourth (d) immediate as a word
lis $5
.word 0x07

add $2, $2, $3
add $4, $4, $5
sub $6, $2, $4

jr $31
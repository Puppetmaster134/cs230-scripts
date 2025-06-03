; compute_average.asm
; Compute the average of 3 values, loaded as immediates

; Load first immediate as a word
lis $2
.word 0x3F

; Load second immediate as a word
lis $3
.word 0x1E

; Load third immediate as a word
lis $4
.word 0x0D

; Compute the sum
add $2, $2, $3
add $2, $2, $4

; Divide by the number of values
addi $3, $0, 3
div $2, $3
mflo $2

jr $31
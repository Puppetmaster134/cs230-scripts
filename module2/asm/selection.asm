addi $8, $0, 4

; multiply 4 (bytes) by length of array
mult $2, $8

; Move product from lo to $8
mflo $8

; Add offset to the starting address from $1
add $8, $8, $1

; Loop between addr at $1 and addr at $8
; Store "i" address into $9
addi $9, $1, 0

outer_loop:
    addi $10, $9, 0 ; Set minpos to address
    lw $11, 0($10) ; Set minimum to value at minpos
    addi $12, $9, 0

inner_loop:
    lw $13, 0($12)
    slt $14, $13, $11
    beq $14, $0, notmin
    addi $11, $13, 0
    addi $10, $12, 0


notmin:
    addi $12, $12, 4
    bne $12, $8, inner_loop
    lw $14, 0($9) ; Load the value at A[i] into $14
    sw $14, 0($10) ; Store the value in $14 to A[minpos]
    sw $11, 0($9) ; Store the value in $11 to A[i]
    addi $9, $9, 4 ; Increment i
    bne $9, $8, outer_loop

lis $6 ; Load output address to $6
.word 0xFFFF000C

add $3,$0,$0
add $4, $1, $0 ; Address to print

print:
    lw $5, 0($4) ; Load in value
    sw $5, 0($6) ; Store value to output
    addi $4, $4, 4 ; Increment print address by 1 word (4 bytes)
    addi $3, $3, 1 ; Increment loop variable
    bne $3, $2, print ; Loop until loop var == length

lis $7
.word 0x0A
sw $7, 0($6)


jr $31



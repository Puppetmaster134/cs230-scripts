; io_example.asm
; IO Example

; Input Address
lis $1
.word 0xFFFF0004

; Output Address
lis $2
.word 0xFFFF000C

; Define termination character with ASCII
addi $3, $0, 0x1B

loop:
    lw $4, 0($1)
    sw $4, 0($2)
    bne $3, $4, loop

jr $31
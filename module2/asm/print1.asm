; print1.asm
; input: $4
; locals $8, $9, $10

printeger:
    lis $8
    .word 0xFFFF000C
    addi $9, $4, 0

loop:
    lw $10, 0($9)
    beq $10, $0, end
    sw $10, 0($8)
    addi $9, $9, 4
    beq $0, $0, loop

end:
    addi $10, $0, 0xA
    sw $10, 0($8)
    jr $31

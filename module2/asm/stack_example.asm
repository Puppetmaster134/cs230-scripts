; stack_example.asm
; Stack Example -- Moving the Stack Pointer

; Store 5 immediates into different registers
addi $8, $0, 1
addi $9, $0, 2
addi $10, $0, 3
addi $11, $0, 4
addi $12, $0, 5

; Move the stack pointer "down" by 5 words
addi $30, $30, -20

sw $8, 0($30)
sw $9, 4($30)
sw $10, 8($30)
sw $11, 12($30)
sw $12, 16($30)

; Move the stack pointer "up" by 4 words
addi $30, $30, 16

; Load in the value at the tip of the stack to register $13
lw $13, 0($30)

; IMPORTANT: Restore stack pointer to original value
addi $30, $30, 4

jr $31

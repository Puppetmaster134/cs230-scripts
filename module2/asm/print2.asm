; print2.asm
; input: $4
; locals $8, $9, $10, $11



addi $4, $0, -123           ; Load a some value as immediate

addi $30, $30, -4           ; Make room on the stack
sw $31, 0($30)              ; Save exit address so we can exit later
jal printeger               ; Call our subroutine with jal

lw $31, 0($30)              ; Restore our exit address
addi $30, $30, 4            ; Restore the stack pointer
jr $31                      ; Jump to our exit address

printeger:
    lis $8                  ; Set up print address
    .word 0xFFFF000C
    addi $9, $4, 0          ; Value
    addi $11, $0, 0         ; Digit counter
    slt $10, $9, $0         ; ???
    beq $10, $0, get_digits
    addi $10, $0, 0x2D      ; Load and print 0x2d
    sw $10, 0($8)
    sub $9, $0, $9


get_digits:
    addi $11, $11, 1        ; Increment digit counter
    addi $10, $0, 10        ; Store "10" in register 10
    div $9, $10             ; Divide value by 10
    mfhi $10                ; Remainder goes to $10
    addi $30, $30, -4       ; Decrement stack pointer
    sw $10, 0($30)          ; Push remainder to stack
    mflo $9                 ; New value is quotient
    bne $9, $0, get_digits  ; Loop until quotient is 0

output:
    lw $10, 0($30)          ; Pop digit from stack
    addi $30, $30, 4        ; Increment stack pointer
    addi $10, $10, 0x30     ; ASCII digits start from 0x30, add offset
    sw $10, 0($8)           ; Print digit (ASCII)
    addi $11, $11, -1       ; Decrement digit counter
    bne $11, $0, output     ; Loop if we have more digits on the stack     
    addi $10, $0, 0xA       ; Print LF (newline)
    sw $10, 0($8)
    jr $31                  ; Return from our function


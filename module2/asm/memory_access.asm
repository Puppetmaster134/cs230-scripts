; memory_access.asm
; Memory Access

; Use some known address
lis $1
.word 0x00

; Load a value into register $2
addi $2, $0, 32

; Store the value into the memory address in $1
sw $2, 0($1)

; Load the value back from $1 into a different register
lw $3, 0($1)

jr $31
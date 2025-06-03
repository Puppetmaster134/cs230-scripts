; branching1.asm
; Branching 1 -- Factorial

; Initialize our product into register $2
addi $2, $0, 1

; Set our loop variable in register $1, initialized to 10
addi $1, $0, 10

; Multiply the current product in register $2 with our loop variable
mult $2, $1

; Store the result into $2
mflo $2

; Decrement our loop variable
addi $1, $1, -1

; If our loop variable is not equal to 0 yet, move backwards by 4 words
bne $1, $0, -4

; Terminate program
jr $31
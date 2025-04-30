// Load input number
@R0
D=M

// Assume it's positive by default
@POS
D;JGT

@ZERO
D;JEQ

// Handle negative input
@R7
M=1        // R7: sign flag = negative

D=-D       // Try to negate it
@TOO_BIG
D;JLT      // If still negative => overflow

@R6
M=D        // R6: store abs value
@R8
M=0        // R8: overflow flag = 0
@FINISH
0;JMP

(TOO_BIG)
@R8
M=1        // overflow occurred
@R6
M=0        // result invalid

@FINISH
0;JMP

(ZERO)
@R6
M=0
@R7
M=0
@R8
M=0
@FINISH
0;JMP

(POS)
@R6
M=D
@R7
M=0
@R8
M=0

(FINISH)
@FINISH
0;JMP
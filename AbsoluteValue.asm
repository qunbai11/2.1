// Load the input number from R0
@R0
D=M
@IS_POS
D;JGE     // If >= 0, jump to IS_POS

// If number is negative:
@R2
M=1       // Mark as negative

D=-D      // Try to get absolute value
@CHECK_OVF
D;JLT     // If still negative => overflow

@R1
M=D       // Store absolute value
@R3
M=0       // No overflow
@END
0;JMP

(CHECK_OVF)
@R3
M=1       // Mark overflow
@R0
D=M
@R1
M=D       // Keep original number

@END
0;JMP

(IS_POS)
@R2
M=0       // Not negative
@R3
M=0       // No overflow
@R1
M=D       // Store as is

(END)
@END
0;JMP     // Halt
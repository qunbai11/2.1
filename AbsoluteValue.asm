// Step 1: Get the value from R0
@R0
D=M

// Step 2: Assume negative by default
@R9
M=1       // isNegative = 1 (default)

@R8
M=0       // overflow = 0 (reset)

// Step 3: Check if number >= 0
@SKIP_NEG_CHECK
D;JGE     // Jump if non-negative

// If negative, flip sign
D=-D

// Step 4: Check if overflow happened after negation
@HANDLE_OVERFLOW
D;JLT

// Step 5: Store result if no overflow
@R1
M=D       // R1 = abs(input)
@R3
M=0       // overflow = 0
@GOTO_END
0;JMP

(HANDLE_OVERFLOW)
@R3
M=1       // overflow = 1
@R0
D=M
@R1
M=D       // store original input (invalid abs)

@GOTO_END
0;JMP

(SKIP_NEG_CHECK)
// If already positive
@R1
M=D       // store original input
@R9
M=0       // isNegative = 0
@R3
M=0       // overflow = 0

(GOTO_END)
@GOTO_END
0;JMP     // halt
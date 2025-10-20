addi x1, x0, 5        # x1 = 5
addi x2, x0, 3        # x2 = 3
add x3, x1, x2        # x3 = x1 + x2 = 8
sub x4, x1, x2        # x4 = x1 - x2 = 2
and x5, x1, x2        # x5 = x1 & x2 = 5 & 3 = 1
or x6, x1, x2         # x6 = x1 | x2 = 5 | 3 = 7
xor x7, x1, x2        # x7 = x1 ^ x2 = 5 ^ 3 = 6
slli x8, x1, 1        # x8 = x1 << 1 = 10
srli x9, x1, 1        # x9 = x1 >> 1 = 2
srai x10, x1, 1       # x10 = x1 >> 1 (算术右移) = 2
slt x11, x1, x2       # x11 = (x1 < x2) ? 1 : 0 = 0
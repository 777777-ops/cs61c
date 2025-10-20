addi x1, x0, 5        # x1 = 5
addi x2, x0, 3        # x2 = 3
mul x3, x1, x2        # x3 = 5 * 3 = 15 (低32位)
mulh x4, x1, x2       # x4 = 5 * 3的高32位 = 0

lui x5, 0x12345       # x5 = 0x12345000
auipc x6, 0           # x6 = PC + 0

jal x7, jump_target   # 跳转到jump_target，x7 = PC + 4
addi x8, x0, 1        # 不应该执行
jump_target:
addi x9, x0, 2        # x9 = 2
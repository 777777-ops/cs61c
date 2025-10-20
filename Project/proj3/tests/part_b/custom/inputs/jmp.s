addi x1, x0, 1        # x1 = 1
addi x2, x0, 1        # x2 = 1
beq x1, x2, branch_taken  # 应该跳转
addi x3, x0, 1        # 不应该执行
addi x4, x0, 1        # 不应该执行
branch_taken:
addi x5, x0, 2        # x5 = 2

jal x6, func          # 调用函数
addi x7, x0, 4        # x7 = 4 (函数返回后执行)
j end

func:
addi x8, x0, 3        # x8 = 3
jalr x0, x6, 0        # 返回

end:
addi x9, x0, 5        # x9 = 5
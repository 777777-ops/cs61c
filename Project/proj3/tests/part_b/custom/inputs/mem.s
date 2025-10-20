addi x1, x0, 0x100    # 设置内存基地址
addi x2, x0, 0x55    # 测试数据
sw x2, 0(x1)          # 存储字到内存
lw x3, 0(x1)          # 从内存加载字，x3 = 0x55

addi x4, x0, 10       # x4 = 10
addi x5, x0, 10       # x5 = 10
beq x4, x5, label1    # 应该跳转
addi x6, x0, 1        # 不应该执行
label1:
addi x7, x0, 2        # x7 = 2

addi x8, x0, 5        # x8 = 5
addi x9, x0, 10       # x9 = 10
blt x8, x9, label2    # 应该跳转
addi x10, x0, 1       # 不应该执行
label2:
addi x11, x0, 3       # x11 = 3
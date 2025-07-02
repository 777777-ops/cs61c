.globl main

.data
source:
    .word   3
    .word   1
    .word   4
    .word   1
    .word   5
    .word   9
    .word   0
dest:
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0

.text
fun:
    addi t0, a0, 1
    sub t1, x0, a0
    mul a0, t0, t1
    jr ra

main:
    # BEGIN PROLOGUE
    addi sp, sp, -20
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)
    sw s3, 12(sp)
    sw ra, 16(sp)
    # END PROLOGUE
    addi t0, x0, 0       #k
    addi s0, x0, 0       #sum
    la s1, source        #source
    la s2, dest          #dest
loop:
    #字节寻址，每个存储单元4字节，t0作为偏移量要×4
    
    slli s3, t0, 2           #左移×4
    add t1, s1, s3           #t1目标地址
    lw t2, 0(t1)             #t2---source[k]
    beq t2, x0, exit         #equal to break
    add a0, x0, t2           #source[k]作为函数参数传参
    addi sp, sp, -8          #调用fun
    sw t0, 0(sp)             #k  保存
    sw t2, 4(sp)	     #source[k]  保存
    jal fun		
		  #ra寄存器更新至下一条指令的pc		
    lw t0, 0(sp)
    lw t2, 4(sp)
    addi sp, sp,8            #取出k 和 source[k]
    add t2, x0, a0	     #函数结果转移至t2
    add t3, s2, s3	     #结果的内存地址
    sw t2, 0(t3)             #写入内存
    add s0, s0, t2           #sum求和
    addi t0, t0, 1           #k++
    jal x0, loop	     #重新新欢
exit:
    add a0, x0, s0
    # BEGIN EPILOGUE
    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    lw s3, 12(sp)
    lw ra, 16(sp)
    addi sp, sp, 20
    # END EPILOGUE
    jr ra

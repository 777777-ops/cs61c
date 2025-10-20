.globl relu  # 必须声明为全局符号
.text
# ==============================================================================
# FUNCTION: Performs an inplace element-wise ReLU on an array of ints
# Arguments:
# 	a0 (int*) is the pointer to the array
#	a1 (int)  is the # of elements in the array
# Returns:
#	None
# Exceptions:
# - If the length of the vector is less than 1,
#   this function terminates the program with error code 78.
# ==============================================================================
relu:
    # Prologue
    addi sp, sp, -8
    sw s0, 0(sp)
    sw ra, 4(sp)

    addi t0, x0, 1    #t0设为1
    blt a1, t0, error #错误跳转

    #t0——下标
    #s0——数组地址

loop_start:

    add s0, a0, x0
    add t0, x0, x0

loop_continue:

    #开始 转义地
    slli t1, t0, 2
    
    #t1——地址 t2——数值
    add t1, t1, s0
    lw t2, 0(t1)

    add a0, t2, x0
    jal ra, reluf
    add t2, a0, x0

    sw t2, 0(t1)

    #结束
    addi t0, t0, 1
    blt t0, a1, loop_continue

loop_end:

    lw s0 0(sp)
    lw ra 4(sp)
    addi sp, sp, 8
	ret

reluf:
    bge a0, x0, done
    add a0, x0, x0
done:
    ret
    
error:
    li a0, 78
    ecall 


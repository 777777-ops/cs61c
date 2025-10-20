.globl argmax

.text
# =================================================================
# FUNCTION: Given a int vector, return the index of the largest
#	element. If there are multiple, return the one
#	with the smallest index.
# Arguments:
# 	a0 (int*) is the pointer to the start of the vector
#	a1 (int)  is the # of elements in the vector
# Returns:
#	a0 (int)  is the first index of the largest element
# Exceptions:
# - If the length of the vector is less than 1,
#   this function terminates the program with error code 77.
# =================================================================
argmax:

    bge x0, a1, error
    
    # Prologue
    addi sp, sp, -12
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)

    #s0数组地址  s1数组长度
    add s0, a0, x0
    add s1, a1, x0 
loop_start:
    
    #t0数组下标  t1是最大数 t2遍历下标 t3数值地址/数值
    add t0, x0, x0
    lw t1, 0(s0)
    add t2, x0, x0
    

loop_continue:

    slli t3, t2, 2
    add t3, s0, t3
    lw t3, 0(t3)
    
    #最大数小于当前下标数跳转
    blt t1, t3, func
    j done
func:
    #最大数下标改变
    add t0, t2, x0
    #最大数改变
    add t1, t3, x0
done:
    addi t2, t2, 1
    blt t2, s1, loop_continue

loop_end:
        
    add a0, t0, x0
    # Epilogue    
    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    addi sp, sp, 12

    ret


error:
    li a0,77
    ecall

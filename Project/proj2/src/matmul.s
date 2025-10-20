.globl matmul 

.text
# =======================================================
# FUNCTION: Matrix Multiplication of 2 integer matrices
# 	d = matmul(m0, m1)
# Arguments:
# 	a0 (int*)  is the pointer to the start of m0 
#	a1 (int)   is the # of rows (height) of m0
#	a2 (int)   is the # of columns (width) of m0
#	a3 (int*)  is the pointer to the start of m1
# 	a4 (int)   is the # of rows (height) of m1
#	a5 (int)   is the # of columns (width) of m1
#	a6 (int*)  is the pointer to the the start of d
# Returns:
#	None (void), sets d = matmul(m0, m1)
# Exceptions:
#   Make sure to check in top to bottom order!
#   - If the dimensions of m0 do not make sense,
#     this function terminates the program with exit code 72.
#   - If the dimensions of m1 do not make sense,
#     this function terminates the program with exit code 73.
#   - If the dimensions of m0 and m1 don't match,
#     this function terminates the program with exit code 74.
# =======================================================
matmul:

    # Error checks
    bge x0, a1, error72
    bge x0, a2, error72
    bge x0, a4, error73
    bge x0, a5, error73

    bne a2, a4, error74
    # Prologue
    addi sp, sp, -40
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)
    sw s3, 12(sp)
    sw s4, 16(sp)
    sw s5, 20(sp)
    sw s6, 24(sp)
    sw s7, 28(sp)
    sw s8, 32(sp)
    sw ra, 36(sp)
        
    add s0, a0, x0
    add s1, a1, x0
    add s2, a2, x0
    add s3, a3, x0
    add s4, a4, x0
    add s5, a5, x0
    add s6, a6, x0

outer_loop_start:
    
    #s8-外循环下标
    add s8, x0, x0

inner_loop_start:

    add s7, x0, x0
inner_loop_continue:
   
    #t2左数组地址
    mul t2, s8, s2
    slli t2, t2, 2
    add t2, t2, s0
    add a0, t2, x0
    #t3右数组地址
    slli t3, s7, 2
    add t3, t3, s3
    add a1, t3, x0

    add a2, s2, x0
    li a3, 1
    add a4, s5, x0
    jal dot
    
    #t2结果地址
    mul t2, s8, s5
    add t2, s7, t2
    slli  t2, t2, 2
    add t2, s6, t2
    sw a0, 0(t2) 

    addi s7, s7, 1
    blt s7, s5, inner_loop_continue
inner_loop_end:

    addi s8, s8, 1
    blt s8, s1, inner_loop_start
outer_loop_end:


    # Epilogu
    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    lw s3, 12(sp)
    lw s4, 16(sp)
    lw s5, 20(sp)
    lw s6, 24(sp)
    lw s7, 28(sp)
    lw s8, 32(sp)
    lw ra, 36(sp)
    addi sp, sp, 40
    ret

error72:
    li a0, 72   
    li a7, 93       
    j error     
         

error73:
    li a0, 73
    li a7, 93
    j error
    

error74:
    li a0, 74
    li a7, 93 
error:
    ret

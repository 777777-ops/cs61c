.globl dot

.text
# =======================================================
# FUNCTION: Dot product of 2 int vectors
# Arguments:
#   a0 (int*) is the pointer to the start of v0
#   a1 (int*) is the pointer to the start of v1
#   a2 (int)  is the length of the vectors
#   a3 (int)  is the stride of v0
#   a4 (int)  is the stride of v1
# Returns:
#   a0 (int)  is the dot product of v0 and v1
# Exceptions:
# - If the length of the vector is less than 1,
#   this function terminates the program with error code 75.
# - If the stride of either vector is less than 1,
#   this function terminates the program with error code 76.
# =======================================================
dot:
    bge x0, a2, error75
    bge x0, a3, error76
    bge x0, a4, error76
    # Prologue
    addi sp, sp, -24
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)
    sw s3, 12(sp)
    sw s4, 16(sp)
    sw s5, 20(sp)

    add s0, a0, x0
    add s1, a1, x0
    add s2, a2, x0   #length
    add s3, a3, x0
    add s4, a4, x0
    add s5, x0, x0   #s5是sum


loop_start:
    #t0循环次数
    add t0, x0, x0
    #t1/2数组下标
    add t1, x0, x0
    add t2, x0, x0

loop_continue:

    slli t3, t1, 2
    slli t4, t2, 2
    add t3, s0, t3
    add t4, s1, t4
    lw t3, 0(t3)
    lw t4, 0(t4)
    mul t5, t3, t4
    
    add s5, s5, t5
    add t1, t1, s3
    add t2, t2, s4

    addi t0, t0, 1
    blt t0, s2, loop_continue
loop_end:

    add a0, s5, x0
    # Epilogue
    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    lw s3, 12(sp)
    lw s4, 16(sp)
    lw s5, 20(sp)
    addi sp, sp, 24
    ret


error75:
    li a0, 75
    j dot_error
error76:
    li a0, 76
dot_error:
    ecall

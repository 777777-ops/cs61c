.globl factorial

.data
n: .word 8

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit
factorial:
	
    beq a0, x0, factorial_b1
    add t0, x0, a0          #原数寄存
    addi a0, a0, -1         #n-1
    #递归 
    addi sp, sp, -8
    sw t0, 0(sp) 
    sw ra, 4(sp)
    jal ra, factorial
    #调用结束
    lw t0, 0(sp)
    lw ra, 4(sp)
    addi sp, sp, 8
 
    mul a0, a0, t0
    jr ra

factorial_b1:
    addi a0, x0, 1
    jr ra





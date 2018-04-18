      .data
input_array:        .space 64000
      .text
      .globl main
main:
      li $v0,5
      syscall
      move $t0,$v0
      li $t1,-1
      li.s $f1,0.0

input:
      addi $t1,$t1,1
      slt $t2,$t1,$t0
      beq $t2,$0,print_output
      li $v0, 6
      syscall
      add.s $f1,$f1,$f0
      addi $t1,$t1,1
      slt $t2,$t1,$t0
      beq $t2, $0, print_output
      li $v0,6
      syscall
      sub.s $f1,$f1,$f0
      j input

print_output:
      li $v0,2

      mov.s $f12,$f1
      syscall
      li $v0,17
      syscall

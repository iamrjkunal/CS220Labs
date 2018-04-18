      .data
input_array:        .space 48
elememt_found:      .asciiz "element found at index\n "
element_not_found:  .asciiz "element is not present\n "

      .text
      .globl main
main:
      li $v0,5
      syscall
      move $t0,$v0
      li $t1,-1
      li $t5,-1
      la $s1, input_array
      la $s0, input_array

input:
      addi $t1,$t1,1
      slt $t2,$t1,$t0
      beq $t2,$0,scanf
      li $v0, 5
      syscall
      sw $v0, 0($s1)
      addi $s1,$s1,4
      j input

scanf:
      li $v0,5
      syscall
      move $t3,$v0

binary_search:
      addi $t5,$t5,1
      beq $t5,$t0, no
      lw $t4, 0($s0)
      beq $t3,$t4, yes
      addi $s0,$s0,4
      j binary_search

yes:
      li $v0,4
      la $a0, elememt_found
      syscall
      li $v0,1
      move $a0,$t5
      syscall
      li $v0,17
      syscall
no:
    li $v0,4
    la $a0,element_not_found
    syscall

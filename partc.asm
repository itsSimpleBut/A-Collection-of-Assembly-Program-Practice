# student id: 240466176
# 6: count the elements A[i] which are divisible by four

# template for:   lw $s3, $t3($t0)
		# add $t4, $t0, $t3
		# lw $s3, 0($t4)


li $t0, 4 		# t0 = CONSTANT 4

# for (int i = 0($a0); i < $a1; i++)

lw $t6, 0($a0)
beq $t6, $a1, ENDloop1
addiu $t6, $zero, 1	# imagined index = 1

loop1:
mul $t6, $t6, $t0	# do (imagined index * 4) to find actual index
add $t6, $a0, $t6	# add actual index (the offset) to a0
lw $t6 0($t6)		# load offseted index
bne $t6, $a1, loop1


ENDloop1:


# for(int i = $a1; i < $a2; i++)


# int i = $a1
move $t1, $zero		# t1 = holds the counter
move $t2, $t6		# t2 = holds the index minus the offset

jal increment

# for()
loop2:


loop2IF:
# if ( (A[i] % 4) == 0) THEN counter++

div $t4, $t0		# HI = A[i] % 4
mfhi $t5		# t5 = A[i] % 4 
beq $t5, $zero, count	# t5  == 0? THEN counter++

loop2CONT:
jal increment

# i < $a2
bne $t4, $a2, loop2
j ENDLoop2


# i++
increment:
addiu $t2, $t2, 1
mul $t3, $t2, $t0	# t3 = index * 4
add $t4, $t3, $a0	# t4 = t3(a0)	/   t4 = current index offset by (4 * index)
lw $t4 0($t4)		# t4 = index version of address above
jr $ra



# counter++
count:
addiu $t1, $t1, 1
j loop2CONT


ENDLoop2:
move $v0, $t1
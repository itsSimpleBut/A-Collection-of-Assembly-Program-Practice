# student id: 240466176	

# transferring the inputs into temps 0-3
lw $t0, 0($a0) #x
lw $t1, 4($a0) #y
lw $t2, 8($a0) #w
lw $t3, 12($a0) #z

# offset 16 = (x*w)+(z%y)

mul $t4, $t0, $t2
div $t3, $t1
mfhi $t5
add $t5, $t4, $t5
sw $t5, 16($a0)


# offset 20 = ((x+y)*2)%(-(z*w))

add $t5, $t0, $t1    
sll $t5, $t5, 1      
mul $t6, $t3, $t2   
sub $t6, $zero, $t6 
div $t5, $t6         
mfhi $t7
sw $t7, 20($a0)
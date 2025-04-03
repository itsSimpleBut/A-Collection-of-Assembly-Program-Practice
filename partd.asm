# student id: 240466176
# 0: Carry out the encoding (code point to UTF-8) as on line 3 of the table (3 byte UTF-8)

# First Byte zzzzyyyy = 1110zzzz

li $t0, 0xe0
srl $t1, $a0, 12
or $t2, $t0, $t1

# Second Byte zzzzyyyy yyxx.... = 10yyyyyy

li $t3, 0xfff		
and $t4, $a0, $t3	# 0000yyyy yyxxxxxx
li $t3, 0x80		
sra $t4, $t4, 6		# 00000000 00yyyyyy
or $t5, $t3, $t4

# Third Byte zzz...yyxxxxxx = 10xxxxxx

li $t6, 0xff		
and $t7, $a0, $t6	# 00000000 yyxxxxxx
li $t6, 0x3f
and $t7, $t6, $t7
li $t6, 0x80	
or $t7, $t6, $t7

# Putting it together
move $t1, $t2	# first byte 
move $t2, $t5	# second byte
move $t3, $t7	# third byte

sll $t3, $t3, 16
sll $t2, $t2, 8
or $t2, $t3, $t2
or $t1, $t2, $t1

sw $t1, 0($a1)








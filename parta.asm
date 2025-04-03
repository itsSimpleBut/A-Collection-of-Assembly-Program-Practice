# student id: 240466176	
# $v0 = (14*$a2)+($a3-$a1)

mul $t0, $a2, 14
sub $t1, $a3, $a1
add $v0, $t0, $t1

# $v1 = (-($a2-$a3)) * (($a0 + $a1)/2)

sub $t2, $a2, $a3
sub $t2, $zero, $t2   # makes it a negative number

add $t3, $a0, $a1
srl $t4, $t3, 1

mul $v1, $t2, $t4
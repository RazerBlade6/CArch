.data
array1: .word 1, 24, 56, 78, 90
array2: .word 11, 24, 32, 11, 9
array3: .word 0, 0, 0, 0, 0
length: .word 5

.text
main:   la	        $t0, array1		# $t0 = [array1]
        la		$t1, array2		# $t1 = [array2]
        lw		$t2, length		# $t2 = length 
        li		$t3, 0		        # $t3 = 0 
        la		$s0, array3		# $s0 = [array3]
        
loop:   beq		$t3, $t2, end   	# if $t0 == $t1 then goto end
        lw              $s1, 0($t0)
        lw		$s2, 0($t1)		
        add		$t4, $s1, $s2	        # $t4 = $s1 + $s2
        sw		$t4, 0($s0)		# [s0] = $t4
        addi	        $t3, $t3, 1		# $t3 = $t3 + 1
        addi	        $t0, $t0, 4		# $t0 = $t0 + 4
        addi	        $t1, $t1, 4		# $t0 = $t0 + 4
        addi	        $s0, $s0, 4		# $t0 = $t0 + 4
        j		loop			# jump to loop

end:    addi	        $v0, $0, 10		# System call 10 - Exit
        syscall					# execute
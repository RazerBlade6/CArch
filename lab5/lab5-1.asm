.data
array:  .word 10, 15, 12, 14, 20, 50, 88, 21, 0, 5
length: .word 10
string: .asciiz "Largest element is: "
loc:    .asciiz " at position: "

.text
main:   la		$s0, array		    # $s0 = [array]
        add		$s1, $0, $s0		# $s1 = $s1 + 0
        lw		$t1, length		    # $t0 = length
        lb		$t1, 0($s1)		# 
        li		$t2, 0		        # $t2 = 0
        lw		$t3, 0($s1)		    # $t3 = [s0 + 0]
        li		$t4, 0		        # $t4 = 0 
loop:   beq		$t2, $t1, end	    # if $t2 == $t1 goto end
        lw		$t0, 0($s1)		    # $t2 = [s0 + 0] 
        bgt		$t0, $t3, change	# if $t0 > $t3 then goto change
        j		next				# jump to next
change: move 	$t3, $t0		    # $t3 = $t0
        sub		$t4, $s1, $s0		# $t4 = $s1 - $s0
        j		next				# jump to next
next:   addi	$s1, $s1, 4			# $s1 = s1 + 4
        addi	$t2, $t2, 1			# $t2 = $t2 + 1
        
        j		loop				# jump to loop
        
end:    srl		$t4, $t4, 2			# $t0 = $t1 >> 2
        addi	$v0, $0, 4		    # system call #4 - print string
        la		$a0, string
        syscall						# execute
        addi	$v0, $0, 1	    	# system call #1 - print int
        add		$a0, $0, $t3
        syscall						# execute
        addi	$v0, $0, 4  		# system call #4 - print string
        la		$a0, loc
        syscall						# execute
        addi	$v0, $0, 1	    	# system call #1 - print int
        add		$a0, $0, $t4
        syscall						# execute

        addi	$v0, $0, 10		# System call 10 - Exit
        syscall					# execute

        
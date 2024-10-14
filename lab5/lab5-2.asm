.data
array:  .word 10, 15, 12, 14, 20
length: .word 5
string: .asciiz "Sum of elements is: "

.text
main:   la		$s0, array		    # $s0 = [array]
        lw		$t1, length		    # $t1 = length
        li		$t2, 0		        # $t2 = 0
        li		$t4, 0		        # $t4 = 0 

loop:   beq		$t2, $t1, end	    # if $t2 == $t1 then goto end
        lw		$t0, 0($s0)		    # $t0 = [$s0]
        add	    $t4, $t4, $t0		# $t4 = $t4 + $t0
        addi	$s0, $s0, 4			# $s0 = $s0 + 4
        addi	$t2, $t2, 1			# $t2 = $t2 + 1
        j		loop				# jump to loop

end:    addi	$v0, $0, 4		# system call #4 - print string
        la		$a0, string
        syscall						# execute
        addi	$v0, $0, 1		# system call #1 - print int
        add		$a0, $0, $t4
        syscall						# execute

        addi	$v0, $0, 10		    # System call 10 - Exit
        syscall					    # execute
        
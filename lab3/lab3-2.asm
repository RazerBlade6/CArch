# 2

        .data
text:   .asciiz         "Enter a number: "
sum_s:  .asciiz         "Sum of Digits is: "
 
        .text
main:   li      $v0, 4              # System call #4 - print string
        la      $a0, text         
        syscall                     # execute

        li      $v0, 5              # System call #5 - enter value
        syscall
        li		$s0, 0              # $s0 = 0

        move 	$t1, $v0            # $t1 = $v0
        move 	$t0, $v0            # $t0 = $v0
        li		$t2, 10		        # $t2 = 10
        

loop:   beq		$t0, $zero, end	    # beq - Branch if Equal
                                    # if {arg1} == {arg2} goto label
                                    # FORMAT: beq {register}, {register}, {label}
                                    # if $t0 == 0 goto end

        div		$t0, $t2			# $t0 / $t2
        mflo	$t0					# $t0 = floor($t0 / $t2) 
        mfhi	$t3					# $t3 = $t0 % $t2 
        
        add	    $s0, $t3, $s0
        j		loop				# jump to loop

end:    li		$v0, 4		        # system call #4 - print string
        la		$a0, sum_s		    
        syscall                     # execute
        li	    $v0, 1		        # system call #1 - print int
        move    $a0, $s0            
        syscall                     # execute

        li      $v0, 10		        # system call #10 - exit
        syscall			            # execute

        .data
text:   .asciiz         "Enter a number: "
pri_s:  .asciiz         "Prime"
com_s:  .asciiz         "Composite"

        .text
main:   li              $v0,            4
        la              $a0,            text
        syscall         

        li              $v0,            5
        syscall

        move 	        $t0,            $v0	                # $t0 = $v0
        li		$t1,            2 		        # $t1 = 2
        li		$t2,            1  
        
prime:  beq		$t2,            $zero,          not_pr
        bge		$t1,            $t0,            is_pr	# if $t0 >= $t1 then goto target
        rem             $t2,            $t0,            $t1
        addi	        $t1,            $t1,            1	# $t1 = $t1 + 1
        j		prime				        # jump to prime

not_pr: addi		$v0,            $0,             4       # system call #4 - print string
        la		$a0,            com_s
        syscall						        # execute
        j		exit				        # jump to exit

is_pr:  addi		$v0,            $0,             4       # system call #4 - print string
        la		$a0,            pri_s      
        syscall						        # execute
        j		exit				        # jump to exit
        
exit:   addi	        $v0,            $0,             10	# System call 10 - Exit
        syscall			        		        # execute
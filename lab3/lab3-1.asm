# 1
        .data
text:   .asciiz     "Enter a number: "
odd_s:  .asciiz     "Odd"
eve_s:  .asciiz     "Even"          

        .text
main:   li          $v0, 4      # system call #4 - print string
        la          $a0, text   # load string to print in $a0
        syscall                 # execute

        li          $v0, 5      # System call #5 - enter value
        syscall                 # execute
                                # value will be stored in $v0

        move 	    $s0, $v0	# $s0 = $v0

        andi	    $s1, $v0, 1 # $s1 = $v0 & 1 (logical and)
        bnez    	$s1, odd    # bnez - Branch if Not Equal to Zero
                                # FORMAT: bnez {register}, {label}
                                # label is the location you want to go to
                                # if $s1 != 0 goto odd
        
        li	        $v0, 4      # system call #4 - print string
        la		    $a0, eve_s  # load string to print in $a0
        syscall                 # execute
        j		    exit        # j - jump (unconditionally go to)
                                # FORMAT: j {label}
         
odd:    li		    $v0, 4      # system call #4 - print string
        la		    $a0, odd_s
        syscall                 # execute
        
exit:
        li          $v0, 10     # system call #10 - exit
        syscall                 # execute
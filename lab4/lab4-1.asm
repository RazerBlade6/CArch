.data
array:  .word 1, 24, 56, 78, 90, 100, 323, 4326, 57456, 74554
length: .word 10

msg:    .asciiz "Enter the element to find: "
acc:    .asciiz "Element found at position "
rej:    .asciiz "Element not found"

.text
main:   addi    $v0, $0, 4		# system call #4 - print string
        la		$a0, msg
        syscall				    # execute
	
        addi	$v0, $0, 5		# system call #5 - input int
        syscall					# execute

        move 	$t0, $v0		# $t0 = $v0
        li		$t1, 0		    # $t1 = 0
        lw		$t2, length		# $t2 = length 
        lw		$t3, array		# $t3 = [array]

loop:   beq		$t1, $t2, reject# if $t1 == $t2 then goto reject
        la		$t4, 0($t3)		# $t4 = [$t3]
        beq		$t4, $t0, accept# if $t4 == $t0 then goto accept
        addi	$t3, $t3, 4		# $t3 = $t3 + 4
        addi	$t1, $t1, 1		# $t1 = $t1 + 1
        j		loop			# jump to loop

accept: addi	$v0, $0, 4		# system call #4 - print string
        la		$a0, acc
        syscall					# execute

        addi	$v0, $0, 1		# system call #1 - print int
        add		$a0, $0, $t0
        syscall					# execute
        j		end			    # jump to end

reject: addi	$v0, $0, 4		# system call #4 - print string
        la		$a0, reject
        syscall					# execute

end:    addi	$v0, $0, 10		# System call 10 - Exit
        syscall					# execute
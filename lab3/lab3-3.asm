        .data
_a:     .word            2
_b:     .word            3
_c:     .word            4
_d:     .word            5
_e:     .word            6

        .text
main:   lw		$t0,            _a
        lw		$t1,            _b
        lw		$t2,            _c
        lw		$t3,            _d
        lw		$t4,            _e		        # 
        
        div		$t1,            $t2			# $t0 / $t1
        mflo	        $t1 
        mult	        $t0,            $t1			# $t0 * $t1 = Hi and Lo registers
        mflo	        $t0					# copy Lo to $t2
        rem             $t0,            $t0,            $t3
        add		$t0,            $t0,            $t4     # $t0 = $t1 + $t2

        move 	        $a0,            $t0	                # $v0 = $t0
        li		$v0,		1  
        syscall

        addi	        $v0,            $0,             10      # System call 10 - Exit
        syscall					                # execute

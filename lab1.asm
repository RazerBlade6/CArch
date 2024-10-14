        .data                   # declare data segment 
                                # This is where all data and variables go
msg:    .asciiz "Hello World"   # Make a variable 'msg' of type asciiz (String) and value "Hello World"

        .text                   # Code segment
main:   li		$v0, 		4   # li = load immediate
                                # load an integer value into the register
                                # FORMAT: li {register} {value}
                                # $v0 = 4
                                # system call #4 - print string

        la		$a0,        msg # la = load address
                                # This loads the address of the variable into the register
                                # Use this when working with arrays or strings 
                                # FORMAT: la {register} {value}

        syscall                 # execute a system call
                                # syscall will execute the call in $v0
                                # 

        li		$v0, 		10  # System call #10 - Exit 
        syscall                 # execute
        
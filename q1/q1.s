.global twosevenmultiple

twosevenmultiple: # %rdi , %rsi , %rdx , %rcx (order of input)
            # n = %rdi, array = %rsi
            # i = %r8 , %rax = for idivq numerator (quotient goes to rax) , %rdx = remainder
            # $2 = %r10 , $7 = %r11

            movq $1 , %r8       # i = 1
            movq $2 , %r10      # r10 = 2
            movq $7 , %r11      # r11 = 7

L2:
    cmp %rdi , %r8      # (i - n > 0)
    jg L5

    movq  %r8 , -8(%rsi,%r8,8)     # array[i-1] = i

    movq %r8 , %rax     # %rax = i
    cqo      # %rdx = 0 for floating point exception
    idivq %r10            # %rdx = remainder
    cmp $0 , %rdx       # (is remainder 0)
    jne L3

    movq $-1 , -8(%rsi,%r8,8)       # array[i-1] = -1
    
    movq %r8 , %rax
    cqo      # %rdx = 0 for floating point exception
    idivq %r11
    cmp $0 , %rdx      # (is remainder 0)
    jne L4

    movq $-3 , -8(%rsi,%r8,8)       # array[i-1] = -3

    jmp L4

L3:
    movq %r8 , %rax
    cqo      # %rdx = 0 for floating point exception
    idivq %r11
    cmp $0 , %rdx    # (is remainder 0) if it came here then not divisible by 2
    jne L4

    movq $-2 , -8(%rsi,%r8,8)       # array[i-1] = -2
    jmp L4

L4:
    incq %r8        # i++
    jmp L2

L5:
    ret

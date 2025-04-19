.global palindrome

palindrome: # %rdi %rsi %rdx %rcx (order of input)
        # %rdi = n
        # temp = %r8 , reverse = %r9 %rdx:%rax = dividend %rdx = remainder %rax = quotient
        # $10 = %r10, %r11 = store remainder

        movq %rdi , %r8     # temp = n
        movq $10 , %r10
        movq $0 , %r9       # reverse = 0

L2:
    cmp $0 , %r8    # (temp - 0)
    je L3

    movq %r8 , %rax    # %rax = temp
    cqo                 # sign extend for %rdx:%rax
    idivq %r10          # %rdx:%rax / %r10 || %rdx:%rax = %rdx + %rax* % r10
    
    movq %rax , %r8     # temp /= 10

    movq %r9 , %rax
    movq %rdx , %r11
    cqo
    imulq %r10     # reverse = reverse*10
    movq %rax , %r9
    addq %r11 , %r9     # reverse += remainder

    jmp L2

L3:
    cmp %rdi , %r9      # (reverse - n)
    jne L4

    movq $1 , %rax
    ret

L4:
    movq $0 , %rax
    ret

.global specialnumber

factorial:
        # %rdi = n
        # fact = %rax , i = %r13

        pushq %r13

        movq $1 , %rax  # fact = 1
        movq $1 , %r13  # i = 1

fact_for:
    cmp %r13 , %rdi     # (n - i < 0)
    jl fact_return

    imulq %r13

    incq %r13

    jmp fact_for

fact_return:
    popq %r13
    ret

specialnumber:
            # %rdi = n
            # temp = %r8 , answer = %r9 , $10 = %r10, (callee save registers), fact = %rax, i = %r13

            cmp $0 , %rdi       # (n - 0 <= 0)
            jle L3              #( return 0)

            movq $10 , %r10     # %r10 = 10
            movq %rdi , %r8     # temp = n
            movq $0 , %r9     # answer = 0

while:
        cmp $0 , %r8    # (temp - 0 <= 0)
        jle L2

        movq %r8 , %rax
        cqto
        idivq %r10          # %rdx:%rax / %r10 , %r10*%rax + %rdx
        movq %rax , %r8     # temp = quotient
        pushq %rdi
        movq %rdx , %rdi     # first argument = remainder
        call factorial
        popq %rdi
        addq %rax , %r9

        jmp while

L2:
    cmp %rdi , %r9
    jne L3

    movq $1 , %rax
    ret

L3:
    movq $0 , %rax
    ret



        
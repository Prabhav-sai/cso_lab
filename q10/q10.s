.global balance

balance:
        # %rdi = n, %rsi = array pointer
        # i = %r8 , top = %r9 , %r10 = array value, %r12 = check value , %r11 = store rsp

        movq %rsp , %r11    # store rsp
        movq $0 , %r8      # i = 0
        movq $0 , %r9      # top = 0


balance_for:
    cmp %rdi , %r8      # (i - n >= 0)
    jge balance_ret

    movb (%rsi,%r8,1) , %r10b

    cmpb $40 , %r10b
    je  balance_push

    cmpb $123 , %r10b
    je balance_push

    cmpb $91, %r10b
    je balance_push

    cmpb $41 , %r10b
    je balance_curve_bracket

    cmpb $125 , %r10b
    je balance_curly_bracket

    cmpb $93 , %r10b
    je balance_square_bracket

balance_curve_bracket:
    cmp $0 , %r9        # (top - 0 <= 0)
    jle balance_ret_zero

    decq    %r9
    pop    %r12

    cmpb $40 , %r12b
    jne balance_ret_zero

    incq %r8
    jmp balance_for

balance_curly_bracket:
    cmp $0 , %r9        # (top - 0 <= 0)
    jle balance_ret_zero

    decq    %r9
    pop    %r12

    cmpb $123 , %r12b
    jne balance_ret_zero

    incq %r8
    jmp balance_for

balance_square_bracket:
    cmp $0 , %r9        # (top - 0 <= 0)
    jle balance_ret_zero

    decq    %r9
    pop    %r12

    cmpb $91 , %r12b
    jne balance_ret_zero

    incq %r8
    jmp balance_for

balance_push:
        incq    %r9
        push   %r10

        incq %r8
        jmp balance_for


balance_ret:
        movq %r11 , %rsp
        cmp $0 , %r9
        jne balance_ret_zero

        movq    $1 , %rax
        ret

balance_ret_zero:
    movq %r11 , %rsp
    movq    $0 , %rax
    ret

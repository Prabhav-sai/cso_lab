.global ascii_score

ascii_score: # %rdi %rsi %rdx %rcx
        # %rdi = string
        # %rax = score , %r8 = i , %r9 = temp

    movq $0 , %rax      # score = 0
    movq $1 , %r8       # i = 1

L2:
    cmpb $0 , (%rdi,%r8,1)   # (string[i] - 0)
    je  L5

    movb (%rdi,%r8,1) , %r9b     # temp = string[i]
    subb -1(%rdi,%r8,1) , %r9b   # temp = string[i]-string[i-1]

    movsbq %r9b , %r9
    

    js L3       # jump is temp is negative

    addq %r9 , %rax     # score += temp
    
    jmp L4

L3:
    subq %r9 , %rax     # score -= temp

L4:
    incq %r8    # i++
    
    jmp L2

L5:
    ret

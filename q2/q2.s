.global recursion

recursion:  # %rdi %rsi %rdx %rcx %r8 %r9(order of input)
            # %rdi = n %rsi = r %r8 = temp
        cmp $0 , %rsi       # (r-0>0)
        je  base_case

        # %rbx %r12 save registers

        pushq %rbx
        pushq %r12

        movq %rdi , %rbx    # %rbx = n
        movq %rsi , %r12    # %r12 = r

        decq %rsi        # r = r-1
        call recursion
        movq %rax , %r8

        movq %rbx , %rax        # rax = n
        subq %r12 , %rax        # rax = rax - r = n-r
        incq %rax               # rax = n-r+1
        imulq %r8 , %rax
        cqto
        idivq %r12

        # restore registers

        popq %r12
        popq %rbx

        ret

base_case:
    movq $1 , %rax
    ret

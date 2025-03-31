.global subarray

subarray: # %r8 = answer %r9 = sum %r10 = i %r11 = j (iterators for loop) # %rdi %rsi %rdx %rcx %r8 %r9(order of input)
          # %rdi = n %rsi = input array pointer
          # %r12 = temp
        movq $0 , %r8       # answer = 0
        movq $0 , %r9       # sum = 0
        movq $0 , %r10      # i = 0
        movq $0 , %r11      # j = 0
        movq $0 , %r12      # temp = 0        

L2:
    cmp %rdi , %r10 # (i-n) condition for breaking i-n>=0 i>=n
    jge L5

    movq %r10 , %r11        # j = i
L3:
    cmp %rdi , %r11 # (j-n) condition for breaking j-n>=0 j>=n
    jge L4

    addq (%rsi,%r11,8) , %r9    # sum += array[j]

    cmp $0 , %r9    # (sum - 0)
    sete %r12b       # (temp = zeroflag)

    addq %r12 , %r8        # answer += temp

    incq %r11       # j++

    jmp L3

L4:
    movq $0 , %r9      # sum = 0
    incq %r10          # i++

    jmp L2

L5:
    movq %r8 , %rax     # return value = answer
    ret

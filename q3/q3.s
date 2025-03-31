.global next_high

next_high:
            # %rdi = n , %rsi = array pointer , %rdx = answer pointer
            # %r8 = i , %r9 = top , %r10 = temp
        
        pushq %rbp              # Save base pointer
        movq %rsp, %rbp         # Set up stack frame
        
        movq %rdi, %r8          # i = n
        decq %r8                # i-- , i = n-1
        movq $0, %r9            # top = 0 (stack is empty)

L2:
        cmp $0, %r8             # (i - 0 < 0) i < 0
        jl L8                  # Exit loop if i < 0

L3:
        cmp $0, %r9             # (top - 0 <= 0) top <= 0
        jle L4

        # Get top of stack value
        movq (%rsp), %r10       # %r10 = stack[top-1] (top of stack)
        
        movq (%rsi, %r8, 8), %rax  # rax = array[i]

        cmp %r10, %rax          #  (array[i] - stack top < 0 ) array[i] < stack top
        jl L4                   # If array[i] < stack top, skip popping
        
        popq %r10               # Pop stack element
        decq %r9                # top = top - 1
        jmp L3                  # Continue while loop

L4:
        cmp $0, %r9             # (top - 0 <= 0) top <= 0
        je L5                   # If empty, set answer[i] = -1 at L5
        
        movq (%rsp), %rax       # Get stack top
        movq %rax, (%rdx, %r8, 8)  # answer[i] = stack top
        jmp L6

L5:
        movq $-1, (%rdx, %r8, 8)   # answer[i] = -1

L6:
        # Push current element to stack
        movq (%rsi, %r8, 8), %r11  # Load array[i] to register
        pushq %r11              # Push array[i] onto the stack
        incq %r9                # top = top + 1
        
        decq %r8                # i--
        jmp L2                  # Repeat for the next element
        
L8:
        movq %rbp, %rsp         # Restore stack pointer
        popq %rbp               # Restore base pointer
        ret                     # Return from the function

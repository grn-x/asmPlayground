.section .data
.global save4

    a4:     .long 3
    b4:     .long 5
    tmp4:   .long 0
    save4:  .long 0

.section .text
.global compute4

compute4:
    movl a4(%rip), %eax      # LOAD a
    imull a4(%rip), %eax     # MUL a
    movl %eax, tmp4(%rip)    # STORE tmp
    movl b4(%rip), %eax      # LOAD b
    imull b4(%rip), %eax     # MUL b
    addl tmp4(%rip), %eax    # ADD tmp
    movl %eax, save4(%rip)   # STORE save4
    ret
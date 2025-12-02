.section .data
.global save3

    a3:     .long 12
    b3:     .long 4
    c3:     .long 3
    tmp3:   .long 0
    save3:  .long 0

.section .text
.global compute3

compute3:
    movl b3(%rip), %eax      # LOAD b
    addl c3(%rip), %eax      # ADD c
    movl %eax, tmp3(%rip)    # STORE tmp
    movl b3(%rip), %eax      # LOAD b
    subl c3(%rip), %eax      # SUB c
    imull tmp3(%rip), %eax   # MUL tmp
    movl %eax, tmp3(%rip)    # STORE tmp
    movl a3(%rip), %eax      # LOAD a
    subl tmp3(%rip), %eax    # SUB tmp
    movl %eax, save3(%rip)   # STORE save3
    ret
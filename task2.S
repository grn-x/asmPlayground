.section .data
.global save2

    a2:     .long 4
    b2:     .long 4
    c2:     .long 2
    d2:     .long 2
    save2:  .long 0

.section .text
.global compute2

compute2:
    movl b2(%rip), %eax      # LOAD b
    subl c2(%rip), %eax      # SUB c
    imull d2(%rip), %eax     # MUL d
    addl a2(%rip), %eax      # ADD a
    movl %eax, save2(%rip)   # STORE save2
    ret
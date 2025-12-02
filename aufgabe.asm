.section .data
    a: .long 7
    b: .long 3
    c: .long 5
    d: .long 0

.section .text
.global _start

_start:
    movl a, %eax
    addl b, %eax
    cltd
    idivl c
    movl %eax, d
    movl $0, %ebx
    movl $1, %eax
    int $0x80

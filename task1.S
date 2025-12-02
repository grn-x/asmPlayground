.section .data
.global save1

    a1:     .long 7
    b1:     .long 3
    c1:     .long 5
    save1:  .long 0

.section .text
.global compute1

compute1:
    movl a1(%rip), %eax      # LOAD a
    addl b1(%rip), %eax      # ADD b
    cltd                     # Vorzeichenerweiterung für Division
    idivl c1(%rip)           # DIV c (Ergebnis in %eax)
    movl %eax, save1(%rip)   # STORE save1
    ret                      # HOLD (return)
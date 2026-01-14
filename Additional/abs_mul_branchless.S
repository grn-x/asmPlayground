.section .data
.global abs_mul_branchless

    a1:                 .long 7         #Zahl
    b1:                 .long 0         #bitmaske
    abs_mul_branchless:  .long 0     #Ergebnis

.section .text
.global abs_mul_branchless_fct

abs_mul_branchless_fct:
    movl a1(%rip), %eax      # LOAD a
    shrl $31, %eax
    imull $-1, %eax
    movl %eax, b1(%rip)   #bitmaske in speichern (%edx register nutzen)

    movl a1(%rip), %eax      # LOAD a
    xorl b1(%rip), %eax
    subl b1(%rip), %eax
    movl %eax, abs_mul_branchless(%rip)   # STORE save1

    ret                                     # HOLD (return)



/*


## Aufgabe 6 S.78: Betrag einer Zahl in Register speichern - Brancheless
# SHR+SHL -> Vorzeichenbit isolieren; MULI -1 um Bytes mit Vorzeichenbit zu füllen
# => BitMaske = 0000 für null-positiv; 1111 für negativ
# Zahl XOR BitMaske (= unverändert für positiv; spiegeln für negativ)
# SUB 0 für positiv; SUB -1 für negativ

	LOAD 	Zahl
	SHRI 	15
	MULI 	-1
	STORE 	BitMaske

	LOAD 	Zahl
	XOR		BitMaske
	SUB		BitMaske
	STORE	Ergebnis

	HOLD

	# Datenteil
	Zahl:	WORD	-18
	BitMaske:	WORD	-1
	Ergebnis:	WORD	-1

*/
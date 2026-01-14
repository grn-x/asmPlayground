.section .data
.global abs_shift_branchless

    a1:                 .long 7         #Zahl
    b1:                 .long 0         #bitmaske
    abs_shift_branchless:  .long 0     #Ergebnis

.section .text
.global abs_shift_branchless_fct

abs_shift_branchless_fct:
    movl a1(%rip), %eax      # LOAD a
    shrl $31, %eax
    sall $31, %eax
    sarl $31, %eax
    movl %eax, b1(%rip)   #bitmaske in speichern (%edx register nutzen)

    movl a1(%rip), %eax      # LOAD a
    xorl b1(%rip), %eax
    subl b1(%rip), %eax
    movl %eax, abs_shift_branchless(%rip)   # STORE save1

    ret                                     # HOLD (return)



/*

## Aufgabe 6 S.78: Betrag einer Zahl in Register speichern - Brancheless
# SHR+SHL -> Vorzeichenbit isolieren; SHRA (arithmetic/signed shift) um Bytes mit Vorzeichenbit zu füllen
# => BitMaske = 0000 für null-positiv; 1111 für negativ
# Zahl XOR BitMaske (= unverändert für positiv; spiegeln für negativ) 
# SUB 0 für positiv; sub -1 für negativ 

	LOAD 	Zahl
	SHRI 	15
	SHLI	15
	SHRAI 	15
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
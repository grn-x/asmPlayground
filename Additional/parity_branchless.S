.section .data
.global parity_branchless

    a1:                 .long 7     #Zahl
    parity_branchless:  .long 0     #Ergebnis

.section .text
.global parity_branchless_fct

parity_branchless_fct:
    movl a1(%rip), %eax      # LOAD a
    notl %eax
    andl $1, %eax
    movl %eax, parity_branchless(%rip)   # STORE save1
    ret                                  # HOLD (return)



/*
## Aufgabe 9 S.79: Parität Zahl in Register speichern - Branchless
# Prüfen, ob eine Zahl gerade ist -> 1; ungerade -> 0 (<- resultierende Registerwerte)
# Auskunft per letztem Bit (xxx0 = gerade; xxx1=ungerade)
# Bytes spiegeln anschließend mit *AND 0001* Bitmaske letztes Bit filtern

                LOAD 	Zahl
                NOT
                ANDI	1
                STORE 	Ergebnis
                HOLD

            # Datenteil
            Zahl:		WORD	-18
            Ergebnis:	WORD	-1

*/

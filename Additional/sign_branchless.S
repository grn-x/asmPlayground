.section .data
.global sign_branchless

    a1:                 .long 7     #Zahl
    sign_branchless:  .long 0     #Ergebnis

.section .text
.global sign_branchless_fct

sign_branchless_fct:
    movl a1(%rip), %eax      # LOAD a
    shrl $31, %eax
    xorl $1, %eax
    movl %eax, sign_branchless(%rip)   # STORE save1
    ret                                # HOLD (return)

/*

## Abwandlung von Aufgabe 9 S.79: Vorzeichen Zahl in Register speichern - Branchless
  # Prüfen, ob eine Zahl null-positiv ist -> 1; negativ -> 0 (<- resultierende Registerwerte)
  # Auskunft per vorderstem Bit (0xxx = Null+; 1xxx=negativ)
  # Vorzeichenbit von MSb zu LSb schieben und von vorne mit 0 füllen
  # Acc enthält nun 0 für Null-positiv und 1 für negativ -> *XOR 0001* Bitmaske um letztes Bit zu drehen

            LOAD 	Zahl
            SHRI 	15
            XORI	1
            STORE 	Ergebnis
            HOLD

          # Datenteil
          Zahl:		WORD	-18
          Ergebnis:	WORD	-1


*/
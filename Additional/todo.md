# Noch zu übersetzen:
Dynamische Liste an Eingangswerten ans Arbeitsspeicherende kopieren und per Bubble-Sort sortieren

```asm
	LOAD 	PTRergebnisErster
	ADDI	15
	STORE	PTRergebnisErster
	# ergebnis ptr auf erste freie zelle initialisieren
	# für größeren offset, 1 austauschen
	
	LOAD 	PTRletzter
	SUB	PTRerster
	STORE 	LENarray
	
	#test
	LOAD 	LENarray
	STORE 	(PTRergebnisErster	)
	
	# Array ans programmende kopieren:
	LOAD	PTRerster
	STORE	PTRakt
	LOAD	PTRergebnisErster
	STORE	PTRergebnisAkt
ArrayCopyStart:
LOAD	POSarrayCounter
ADD	PTRerster
STORE	PTRakt

	LOAD 	POSarrayCounter
	ADD	PTRergebnisErster
	STORE	PTRergebnisAkt		
	
	LOAD	(PTRakt)	
	STORE	(PTRergebnisAkt)	#original ptr ref laden und in ergebnis ptr ref speichern

	LOAD 	POSarrayCounter
	ADDI	1
	STORE	POSarrayCounter

	SUB	LENarray

	JMPP 	ArrayCopyEnd 	#counter-arraylength; wenn ergebnis positiv ist (größer 0!); loop beenden
				# Wenn counter = len letzte schleife 
	
	JMP	ArrayCopyStart


ArrayCopyEnd:


ArraySortOuter:
# Sortieren
LOAD	PTRergebnisErster
STORE	PTRergebnisAkt

	LOADI 	0
	STORE	POSarrayCounter

	LOADI	0
	STORE	FLGwasChanged

ArraySortStart:

	LOAD 	POSarrayCounter
	ADD	PTRergebnisErster
	STORE	PTRergebnisAkt
	ADDI 	1
	STORE	PTRergebnisAktNext
		
	LOAD	(PTRergebnisAktNext) 	#vergleichen
	SUB	(PTRergebnisAkt)	#aufsteigend sortieren; wenn negativ-> kleiner index größer; swap
				# nur springen wenn negativ und nicht 0! werte müssen sich unterscheiden
	JMPN	Fct_SwapXOR
PostXORsub:

	LOAD 	POSarrayCounter
	ADDI 	1
	STORE	POSarrayCounter
	
	SUB	LENarray

				 #counter-arraylength; wenn ergebnis 0 ist loop beenden
	JMPNZ	ArraySortStart	# Wenn counter = len nicht weiterführen, da AktNext +1 ist	
	
	# hier eine schleife durchlaufen; überprüfen ob verändert 
	LOAD	FLGwasChanged
	JMPNZ	ArraySortOuter

	JMP ArraySortEnd


#sort ende; xor swap method
ArraySortEnd:

	JMP	Fct_SwapXORend 	# programmcode wie funktion behandeln, und überspringen
Fct_SwapXOR:
#xor swap; a,b müssen ungleich: sonst a^a=0
# add swap? over/underflow? modular arithmetic, cyclic?

	#xor is commutative
	LOAD 	(PTRergebnisAkt)
	XOR	(PTRergebnisAktNext)
	STORE	(PTRergebnisAkt)
	
	LOAD 	(PTRergebnisAktNext)
	XOR	(PTRergebnisAkt)
	STORE 	(PTRergebnisAktNext)

	LOAD 	(PTRergebnisAkt)
	XOR 	(PTRergebnisAktNext)
	STORE	(PTRergebnisAkt)

	LOADI	1
	STORE	FLGwasChanged
	
	#RTS 	#return subroutine	
	JMP	PostXORsub	
Fct_SwapXORend:


	HOLD

#Dynamische Programm Variablen
PTRakt:		WORD	0
PTRergebnisAkt:	WORD	placeholder
PTRergebnisAktNext:	WORD	placeholder
POSarrayCounter:	WORD	0
FLGwasChanged:	WORD	-1001	#wenn beim sortieren eine veränderung vorgenommen wurde auf 1 setzen
#variable wird bei jedem schleifendurchlauf zurückgesetzt

#Dynamischer User input (erster und letzter Eintrag nicht verschieben!)
ersterEintrag: 	WORD	19
dynamischerEintrag1:	WORD	18
dynamischerEintrag2:	WORD	17
dynamischerEintrag3:	WORD	16
dynamischerEintrag4:	WORD	15
dynamischerEintrag5:	WORD	14
dynamischerEintrag6:	WORD	12341
dynamischerEintrag7:	WORD	-21
dynamischerEintrag8:	WORD	15
dynamischerEintrag9:	WORD	15
dynamischerEintrag10:	WORD	15
letzterEintrag: 	WORD	123

PTRerster:		WORD	ersterEintrag
PTRletzter:	 	WORD	letzterEintrag
LENarray:	 	WORD	-2
PTRergebnisErster:	WORD	placeholder

# Letzte Variable! (sonst fehler in pointer arithmetik!)
placeholder:		WORD	0
```


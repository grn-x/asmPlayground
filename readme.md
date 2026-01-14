# Assembly Tasks for the "Minimaschine"

This workspace contains asm solutions to tasks originally designed for the ["Minimaschine"](https://www.schule.awiedemann.de/minimaschine.htm), a simplified educational CPU simulator.
These tasks were given as part of this years cs class. My contribution here is merely the conversion of the curriculum-based pseudo code into actual assembly.

Edit: As of 14.01. this project is being extended by some additional cases. 


## Assembly Specifications


This project uses `x86-64` assembly with `AT&T` syntax, running on Windows (shame on me).
Im assembling with GNU (GAS), we’re working with 32-bit integers `.long` and using RIP-relative addressing.
For registers, you’ll see the usual suspects like `%eax` and `%ebx`.

## Tasks

<details>
<summary>Task 1: ((a + b) / c)</summary>

### Pseudo-Instructions
```
LOAD    a
ADD     b
DIV     c
STORE   d # expecting 2
HOLD
```

### Data
```
a:  WORD    7
b:  WORD    3
c:  WORD    5
d:  WORD    0
```

### Assembly Code
```asm
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
```
</details>

<details>
<summary>Task 2: (a + (b - c) * d)</summary>

### Pseudo-Instructions
```
LOAD    b
SUB     c
MUL     d
ADD     a
STORE   save
HOLD
```

### Data
```
a:  WORD    4
b:  WORD    4
c:  WORD    2
d:  WORD    2
save: WORD   -1 # expecting 8
```

### Assembly Code
```asm
.section .data
    a2: .long 4
    b2: .long 4
    c2: .long 2
    d2: .long 2
    save2: .long 0

.section .text
.global compute2

compute2:
    movl b2(%rip), %eax
    subl c2(%rip), %eax
    imull d2(%rip), %eax
    addl a2(%rip), %eax
    movl %eax, save2(%rip)
    ret
```
</details>

<details>
<summary>Task 3: (a - (b + c) * (b - c))</summary>

### Pseudo-Instructions
```
LOAD    b
ADD     c
STORE   tmp
LOAD    b
SUB     c
MUL     tmp
STORE   tmp
LOAD    a
SUB     tmp
STORE   save
HOLD
```

### Data
```
a:  WORD    12
b:  WORD    4
c:  WORD    3
tmp: WORD   -1
save: WORD   -1 # expecting 5
```

### Assembly Code
```asm
.section .data
    a3: .long 12
    b3: .long 4
    c3: .long 3
    tmp3: .long 0
    save3: .long 0

.section .text
.global compute3

compute3:
    movl b3(%rip), %eax
    addl c3(%rip), %eax
    movl %eax, tmp3(%rip)
    movl b3(%rip), %eax
    subl c3(%rip), %eax
    imull tmp3(%rip), %eax
    movl %eax, tmp3(%rip)
    movl a3(%rip), %eax
    subl tmp3(%rip), %eax
    movl %eax, save3(%rip)
    ret
```
</details>

<details>
<summary>Task 4: (a^2 + b^2)</summary>

### Pseudo-Instructions
```
LOAD    a
MUL     a
STORE   tmp
LOAD    b
MUL     b
ADD     tmp
STORE   save
HOLD
```

### Data
```
a:  WORD    3
b:  WORD    5
tmp: WORD   -1
save: WORD   -1 # expecting 34
```

### Assembly Code
```asm
.section .data
    a4: .long 3
    b4: .long 5
    tmp4: .long 0
    save4: .long 0

.section .text
.global compute4

compute4:
    movl a4(%rip), %eax
    imull a4(%rip), %eax
    movl %eax, tmp4(%rip)
    movl b4(%rip), %eax
    imull b4(%rip), %eax
    addl tmp4(%rip), %eax
    movl %eax, save4(%rip)
    ret
```
</details>

## Structure

Each task is modularized into its own assembly file, `taskX.S`, and is loaded by `main.c` allowing easy interfacing and lets me ignore sysout peripherals :D

### Build

1. Ensure you have `gcc` (+ `as`) installed.
2. Use the provided `CMakeLists.txt` to build the project:
   ```shell
   mkdir build
   cd build
   cmake -G "MinGW Makefiles" ..
   mingw32-make
   ```
3. Run either of the executables found in the build dir:
   ```shell
   ./assembler.exe
   ./Additional/additional.exe
   ```


cmake_minimum_required(VERSION 3.30)
project(assembler C ASM)

set(CMAKE_C_STANDARD 11) # 17? 23?
#enable_language(ASM)

#add_executable(assembler main.c)
add_executable(assembler
        main.c
        task1.S
        task2.S
        task3.S
        task4.S
)

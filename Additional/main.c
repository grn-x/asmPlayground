#include <stdio.h>

// externe fkts aus Assemblerdateien
extern void parity_branchless_fct();
extern void sign_branchless_fct();
extern void abs_mul_branchless_fct();
extern void abs_shift_branchless_fct();

// externe save Variablen
extern int parity_branchless;
extern int sign_branchless;
extern int abs_mul_branchless;
extern int abs_shift_branchless;

int main() {
    int choice;

    printf("Welche Aufgabe (1-4): ");
    scanf("%d", &choice);

    switch (choice) {
        case 1:
            parity_branchless_fct();
        printf("parity_branchless = %d\n", parity_branchless);
        break;

        case 2:
            sign_branchless_fct();
        printf("sign_branchless = %d\n", sign_branchless);
        break;

        case 3:
            abs_mul_branchless_fct();
        printf("abs_mul_branchless = %d\n", abs_mul_branchless);
        break;

        case 4:
            abs_shift_branchless_fct();
        printf("abs_shift_branchless.S = %d\n", abs_shift_branchless);
        break;

        default:
            printf("??Mach richtig\n");
    }

    return 0;
}

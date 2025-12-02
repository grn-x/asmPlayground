#include <stdio.h>

// externe fkts aus Assemblerdateien
extern void compute1();
extern void compute2();
extern void compute3();
extern void compute4();

// externe save Variablen
extern int save1;
extern int save2;
extern int save3;
extern int save4;

int main() {
    int choice;

    printf("Welche Aufgabe (1-4): ");
    scanf("%d", &choice);

    switch (choice) {
        case 1:
            compute1();
        printf("save1 = %d\n", save1);
        break;

        case 2:
            compute2();
        printf("save2 = %d\n", save2);
        break;

        case 3:
            compute3();
        printf("save3 = %d\n", save3);
        break;

        case 4:
            compute4();
        printf("save4 = %d\n", save4);
        break;

        default:
            printf("??Mach richtig\n");
    }

    return 0;
}

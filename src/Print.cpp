#include "../h/Print.hpp"
#include "../h/syscall_c.hpp"

void print_String(const char *string) {
    while (*string != '\0') {
        putc(*string);
        string++;
    }
}

void print_Integer(long value){
    if (value == 0) {
        putc('0');
        return;
    }

    bool negative = false;
    if (value < 0) {
        value = -value;
        negative = true;
    }

    char digits[] = "0123456789";
    char number[16];
    int i;

    for (i = 0; value != 0; value /= 10) {
        number[i++] = digits[value % 10];
    }

    if (negative) number[i++] = '-';
    while (--i >= 0) putc(number[i]);
}

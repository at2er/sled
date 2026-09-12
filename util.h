/* See LICENSE file for copyright and license details. */
#include <sys/types.h>

#include <regex.h>
#include <stddef.h>
#include <stdio.h>
#include <stdarg.h>

#include "arg.h"

#undef MIN
#define MIN(x,y)  ((x) < (y) ? (x) : (y))
#undef MAX
#define MAX(x,y)  ((x) > (y) ? (x) : (y))
#undef LIMIT
#define LIMIT(x, a, b)  (x) = (x) < (a) ? (a) : (x) > (b) ? (b) : (x)

#define LEN(x) (sizeof (x) / sizeof *(x))

extern char *argv0;

void enprintf(int, const char *, ...);
void eprintf(const char *, ...);
void weprintf(const char *, ...);
void xvprintf(const char *, va_list);

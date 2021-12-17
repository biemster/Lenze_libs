/*********************************************************************\
|*                                                                  *|
|*    Copyright (C) 2006--2014 by SimpLight Nanoelectronics, Ltd.   *|
|*    All rights reserved.                                          *|
|*                                                                  *|
|* This material constitutes the trade secrets and confidential,    *|
|* proprietary information of SimpLight.  This material is not to   *|
|* be disclosed, reproduced, copied, or used in any manner  not     *|
|* permitted under license from SimpLight Nanoelectronics Ltd.      *|
|*                                                                  *|
\*********************************************************************/

#include <stdarg.h>
#include <string.h>
#include <ctype.h>

/************    Do not include stdio.h  **************/
extern int vsprintf_local(char *buf, const char *fmt, va_list args);
extern int vsnprintf_local(char *buf, size_t size, const char *fmt, va_list args);
/*************         stdio.h  end      **************/

#define CFG_PBSIZE 	(0x100)
#define CFG_RESERVE (0x8)

#define ZEROPAD		1		/* pad with zero */
#define SIGN			2		/* unsigned/signed long */
#define PLUS			4		/* show plus */
#define SPACE			8		/* space if plus */
#define LEFT			16		/* left justified */
#define SPECIAL		32		/* 0x */
#define LARGE			64		/* use 'ABCDEF' instead of 'abcdef' */

#define do_div(n,base) ({ \
        int __res; \
        __res = ((unsigned long) n) % (unsigned) base; \
        n = ((unsigned long) n) / (unsigned) base; \
        __res; \
    })

/* we use this so that we can do without the ctype library */
#define is_digit(c)	((c) >= '0' && (c) <= '9')


/*
  Function which defined in this library only: we use same function name as which in uclibc
  So, if we include uclibc, _SL_USE_UCLIBC_ must be defined.
*/

static int skip_atoi(const char **s)
{
    int i = 0;

    while (is_digit(**s))
        i = i * 10 + *((*s)++) - '0';
    return i;
}

static char * nnumber_local(char * str, long num, int base, int size, int precision , int type, size_t *max_size)
{
    char c, sign, tmp[66];
    const char *digits = "0123456789abcdefghijklmnopqrstuvwxyz";
    int i;

    size_t msize;
    msize = *max_size;

    if (type & LARGE)
        digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    if (type & LEFT)
        type &= ~ZEROPAD;
    if (base < 2 || base > 36)
        return 0;
    c = (type & ZEROPAD) ? '0' : ' ';
    sign = 0;
    if (type & SIGN)
    {
        if (num < 0)
        {
            sign = '-';
            num = -num;
            size--;
        }
        else if (type & PLUS)
        {
            sign = '+';
            size--;
        }
        else if (type & SPACE)
        {
            sign = ' ';
            size--;
        }
    }
    if (type & SPECIAL)
    {
        if (base == 16)
            size -= 2;
        else if (base == 8)
            size--;
    }
    i = 0;
    if (num == 0)
        tmp[i++] = '0';
    else while (num != 0)
            tmp[i++] = digits[do_div(num, base)];
    if (i > precision)
        precision = i;
    size -= precision;
    if (!(type & (ZEROPAD + LEFT)))
        while(size-- > 0 && msize)
        {
            *str++ = ' ';
            msize--;
        }
    if (sign && msize)
    {
        *str++ = sign;
        msize--;
    }
    if(msize)
    {
        if (type & SPECIAL)
        {
            if (base == 8)
            {
                *str++ = '0';
                msize--;
            }
            else if (base == 16)
            {
                *str++ = '0';
                msize--;
                if(msize)
                {
                    *str++ = digits[33];
                    msize--;
                }
            }
        }
    }

    if (!(type & LEFT))
        while (size-- > 0 && msize)
        {
            *str++ = c;
            msize--;
        }
    while (i < precision-- && msize)
    {
        *str++ = '0';
        msize--;
    }
    while (i-- > 0 && msize)
    {
        *str++ = tmp[i];
        msize--;
    }
    while (size-- > 0 && msize)
    {
        *str++ = ' ';
        msize--;
    }

    *max_size = msize;
    return str;
}
static char * number(char * str, long num, int base, int size, int precision , int type)
{
    char c, sign, tmp[66];
    const char *digits = "0123456789abcdefghijklmnopqrstuvwxyz";
    int i;

    if (type & LARGE)
        digits = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    if (type & LEFT)
        type &= ~ZEROPAD;
    if (base < 2 || base > 36)
        return 0;
    c = (type & ZEROPAD) ? '0' : ' ';
    sign = 0;
    if (type & SIGN)
    {
        if (num < 0)
        {
            sign = '-';
            num = -num;
            size--;
        }
        else if (type & PLUS)
        {
            sign = '+';
            size--;
        }
        else if (type & SPACE)
        {
            sign = ' ';
            size--;
        }
    }
    if (type & SPECIAL)
    {
        if (base == 16)
            size -= 2;
        else if (base == 8)
            size--;
    }
    i = 0;
    if (num == 0)
        tmp[i++] = '0';
    else while (num != 0)
            tmp[i++] = digits[do_div(num, base)];
    if (i > precision)
        precision = i;
    size -= precision;
    if (!(type & (ZEROPAD + LEFT)))
        while(size-- > 0)
            *str++ = ' ';
    if (sign)
        *str++ = sign;
    if (type & SPECIAL)
    {
        if (base == 8)
            *str++ = '0';
        else if (base == 16)
        {
            *str++ = '0';
            *str++ = digits[33];
        }
    }
    if (!(type & LEFT))
        while (size-- > 0)
            *str++ = c;
    while (i < precision--)
        *str++ = '0';
    while (i-- > 0)
        *str++ = tmp[i];
    while (size-- > 0)
        *str++ = ' ';
    return str;
}

int vsprintf_local(char *buf, const char *fmt, va_list args)
{
    int len;
    unsigned long num;
    int i, base;
    char * str;
    const char *s;

    int flags;		/* flags to number() */

    int field_width;	/* width of output field */
    int precision;		/* min. # of digits for integers; max
				   number of chars for from string */
    int qualifier;		/* 'h', 'l', or 'q' for integer fields */

    for (str = buf ; *fmt ; ++fmt)
    {
        if (*fmt != '%')
        {
            *str++ = *fmt;
            continue;
        }

        /* process flags */
        flags = 0;
repeat:
        ++fmt;		/* this also skips first '%' */
        switch (*fmt)
        {
        case '-':
            flags |= LEFT;
            goto repeat;
        case '+':
            flags |= PLUS;
            goto repeat;
        case ' ':
            flags |= SPACE;
            goto repeat;
        case '#':
            flags |= SPECIAL;
            goto repeat;
        case '0':
            flags |= ZEROPAD;
            goto repeat;
        }

        /* get field width */
        field_width = -1;
        if (is_digit(*fmt))
            field_width = skip_atoi(&fmt);
        else if (*fmt == '*')
        {
            ++fmt;
            /* it's the next argument */
            field_width = va_arg(args, int);
            if (field_width < 0)
            {
                field_width = -field_width;
                flags |= LEFT;
            }
        }

        /* get the precision */
        precision = -1;
        if (*fmt == '.')
        {
            ++fmt;
            if (is_digit(*fmt))
                precision = skip_atoi(&fmt);
            else if (*fmt == '*')
            {
                ++fmt;
                /* it's the next argument */
                precision = va_arg(args, int);
            }
            if (precision < 0)
                precision = 0;
        }

        /* get the conversion qualifier */
        qualifier = -1;
        if (*fmt == 'h' || *fmt == 'l' || *fmt == 'q')
        {
            qualifier = *fmt;
            ++fmt;
        }

        /* default base */
        base = 10;

        switch (*fmt)
        {
        case 'c':
            if (!(flags & LEFT))
                while (--field_width > 0)
                    *str++ = ' ';
            *str++ = (unsigned char) va_arg(args, int);
            while (--field_width > 0)
                *str++ = ' ';
            continue;

        case 's':
            s = va_arg(args, char *);
            if (!s)
                s = "<NULL>";

            len = strnlen(s, precision);

            if (!(flags & LEFT))
                while (len < field_width--)
                    *str++ = ' ';
            /* to avoid overflow */
            if(buf +  CFG_PBSIZE - CFG_RESERVE - str < len)
                len = buf +  CFG_PBSIZE - str - CFG_RESERVE;

            for (i = 0; i < len; ++i)
                *str++ = *s++;
            while (len < field_width--)
                *str++ = ' ';
            continue;

        case 'p':
            if (field_width == -1)
            {
                field_width = 2 * sizeof(void *);
                flags |= ZEROPAD;
            }
            str = number(str,
                         (unsigned long) va_arg(args, void *), 16,
                         field_width, precision, flags);
            continue;


        case 'n':
            if (qualifier == 'l')
            {
                long * ip = va_arg(args, long *);
                *ip = (str - buf);
            }
            else
            {
                int * ip = va_arg(args, int *);
                *ip = (str - buf);
            }
            continue;

        case '%':
            *str++ = '%';
            continue;

        /* integer number formats - set up the flags and "break" */
        case 'o':
            base = 8;
            break;

        case 'X':
            flags |= LARGE;
        case 'x':
            base = 16;
            break;

        case 'd':
        case 'i':
            flags |= SIGN;
        case 'u':
            break;

        default:
            *str++ = '%';
            if (*fmt)
                *str++ = *fmt;
            else
                --fmt;
            continue;
        }
        if (qualifier == 'l')
            num = va_arg(args, unsigned long);
        else if (qualifier == 'h')
        {
            num = (unsigned short) va_arg(args, int);
            if (flags & SIGN)
                num = (short) num;
        }
        else if (flags & SIGN)
            num = va_arg(args, int);
        else
            num = va_arg(args, unsigned int);
        str = number(str, num, base, field_width, precision, flags);
        if(str - buf > CFG_PBSIZE - CFG_RESERVE)
            break;
    }
    *str = '\0';
    return str - buf;
}

/*
** This vsnprintf() emulation does not implement the conversions:
**	%e, %E, %g, %G, %wc, %ws
** The %f implementation is not supported.
*/
int vsnprintf_local(char *buf, size_t size, const char *fmt, va_list args)
{
    int len;
    unsigned long num;
    int i, base;
    char * str;
    const char *s;

    int flags;		/* flags to number() */

    int field_width;	/* width of output field */
    int precision;		/* min. # of digits for integers; max
				   number of chars for from string */
    int qualifier;		/* 'h', 'l', or 'q' for integer fields */

    size--;
    for (str = buf ; *fmt && size ; ++fmt)
    {
        if (*fmt != '%')
        {
            *str++ = *fmt;
            size--;
            continue;
        }

        /* process flags */
        flags = 0;
repeat:
        ++fmt;		/* this also skips first '%' */
        switch (*fmt)
        {
        case '-':
            flags |= LEFT;
            goto repeat;
        case '+':
            flags |= PLUS;
            goto repeat;
        case ' ':
            flags |= SPACE;
            goto repeat;
        case '#':
            flags |= SPECIAL;
            goto repeat;
        case '0':
            flags |= ZEROPAD;
            goto repeat;
        }

        /* get field width */
        field_width = -1;
        if (is_digit(*fmt))
            field_width = skip_atoi(&fmt);
        else if (*fmt == '*')
        {
            ++fmt;
            /* it's the next argument */
            field_width = va_arg(args, int);
            if (field_width < 0)
            {
                field_width = -field_width;
                flags |= LEFT;
            }
        }

        /* get the precision */
        precision = -1;
        if (*fmt == '.')
        {
            ++fmt;
            if (is_digit(*fmt))
                precision = skip_atoi(&fmt);
            else if (*fmt == '*')
            {
                ++fmt;
                /* it's the next argument */
                precision = va_arg(args, int);
            }
            if (precision < 0)
                precision = 0;
        }

        /* get the conversion qualifier */
        qualifier = -1;
        if (*fmt == 'h' || *fmt == 'l' || *fmt == 'q')
        {
            qualifier = *fmt;
            ++fmt;
        }

        /* default base */
        base = 10;

        switch (*fmt)
        {
        case 'c':
            if (!(flags & LEFT))
                while (--field_width > 0 && size)
                {
                    *str++ = ' ';
                    size--;
                }
            if(size)
            {
                *str++ = (unsigned char) va_arg(args, int);
                size--;
            }
            while (--field_width > 0 && size)
            {
                *str++ = ' ';
                size--;
            }
            continue;

        case 's':
            s = va_arg(args, char *);
            if (!s)
                s = "<NULL>";

            len = strnlen(s, precision);

            if (!(flags & LEFT))
                while (len < field_width-- && size)
                {
                    *str++ = ' ';
                    size--;
                }

            for (i = 0; i < len && size; ++i)
            {
                *str++ = *s++;
                size--;
            }
            while (len < field_width-- && size)
            {
                *str++ = ' ';
                size--;
            }
            continue;

        case 'p':
            if(size)
            {
                *str++ = '0';
                size--;
            }
            if(size)
            {
                *str++ = 'x';
                size--;
            }
            str = nnumber_local(str,
                                (unsigned long) va_arg(args, void *), 16,
                                field_width, precision, flags, &size);
            continue;


        case 'n':
            if (qualifier == 'l')
            {
                long * ip = va_arg(args, long *);
                *ip = (str - buf);
            }
            else
            {
                int * ip = va_arg(args, int *);
                *ip = (str - buf);
            }
            continue;

        case '%':
            if(size)
            {
                *str++ = '%';
                size--;
            }
            continue;

        /* integer number formats - set up the flags and "break" */
        case 'o':
            base = 8;
            break;

        case 'X':
            flags |= LARGE;
        case 'x':
            base = 16;
            break;

        case 'd':
        case 'i':
            flags |= SIGN;
        case 'u':
            break;

        default:
            if(size)
            {
                *str++ = '%';
                size--;
            }
            if (*fmt && size)
            {
                *str++ = *fmt;
                size--;
            }
            else
                --fmt;
            continue;
        }
        if (qualifier == 'l')
            num = va_arg(args, unsigned long);
        else if (qualifier == 'h')
        {
            num = (unsigned short) va_arg(args, int);
            if (flags & SIGN)
                num = (short) num;
        }
        else if (flags & SIGN)
            num = va_arg(args, int);
        else
            num = va_arg(args, unsigned int);
        str = nnumber_local(str, num, base, field_width, precision, flags, &size);
    }

    *str = '\0';
    return str - buf;
}
#define LOG_SIZE_MAX	(CFG_PBSIZE - 1)
int sprintf(char *__restrict buf, const char * __restrict format, ...)
{
    va_list arg;
    int rv;

    va_start(arg, format);
    rv = vsnprintf_local(buf, LOG_SIZE_MAX, format, arg);
    va_end(arg);

    return rv;
}


int snprintf(char *__restrict buf, size_t size, const char * __restrict format, ...)
{
    va_list arg;
    int rv;

    va_start(arg, format);
    rv = vsnprintf_local(buf, size, format, arg);
    va_end(arg);

    return rv;
}


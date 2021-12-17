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
#include <stdint.h>
#include "string.h"

#ifndef BZERO_USE_ASM
void bzero (void * s, size_t count)
{
    char *to = (char *)s;
    while (count-- > 0)
    {
        *to++ = 0;
    }
}
#endif /* !BZERO_USE_ASM */

#ifndef MEMSET_USE_ASM
void * memset(void * s, int c, size_t count)
{
    char *xs = (char *) s;

    while (count--)
        *xs++ = c;

    return s;
}
#endif /* !MEMSET_USE_ASM */


#ifndef MEMCPY_USE_ASM
void * memcpy(void * dest, const void * src, size_t count)
{
    uint32_t *p;
    uint32_t *q;
    uint8_t *p1 = (uint8_t *)src;
    uint8_t *q1 = (uint8_t *)dest;
    uint32_t i;
    uint32_t src_off = (uint32_t)src & 3;
    uint32_t des_off = (uint32_t)dest & 3;
    uint32_t bytes_save = count;

    if (count >= 16)
    {
        if (des_off)
        {
            for (i = 0; i < 4 - des_off; i++)
                q1[i] = p1[i];
            count = count - (4 - des_off);
        }
        if (src_off == des_off)
        {
            p = (uint32_t *)(((uint32_t)src  + 3) & 0xfffffffc);
            q = (uint32_t *)(((uint32_t)dest + 3) & 0xfffffffc);
            uint32_t cnt = count >> 3;
            uint32_t j, k, val1, val2;
            for (i = 0, j = 0, k = 0; i < (cnt); i++)
            {
                val1 = p[j];
                val2 = p[j + 1];
                j = j + 2;
                q[k] = val1;
                q[k + 1] = val2;
                k = k + 2;
            }
            uint32_t rem_bytes = (count) & 7;
            if (rem_bytes)
            {
                q1 = (uint8_t *)&q[cnt << 1];
                p1 = (uint8_t *)&p[cnt << 1];
                for (i = 0; i < rem_bytes; i++)
                    q1[i] = p1[i];
            }
        }
        else
        {
            if (des_off)
            {
                p = (uint32_t *)((uint32_t)src  + 4 - des_off); // point to next byte
                q = (uint32_t *)((uint32_t)dest + 4 - des_off); // point to write word-aligned boundary
            }
            else
            {
                p = (uint32_t *)src;
                q = (uint32_t *)dest;
            }

            uint32_t l_shift, r_shift;
            src_off = (uint32_t) p & 3;
            r_shift = src_off << 3;
            l_shift = (4 - src_off) << 3;

            uint32_t pre_val, val, val1, word_pair;
            pre_val = *p++;

            word_pair = (count >> 2) & 0xfffffffe;
            for (i = 0; i < word_pair; i += 2)
            {
                val = p[i];
                val1 = p[i + 1];
                q[i] = (pre_val >> r_shift) | (val << l_shift);
                q[i + 1] = (val >> r_shift) | (val1 << l_shift);
                pre_val = val1;
            }
            uint32_t rem_bytes = count & 7;
            if (rem_bytes)
            {
                p1 = (uint8_t *)((uint32_t)src + bytes_save - rem_bytes);
                q1 = (uint8_t *)&q[i];
                for (i = 0; i < rem_bytes; i++)
                {
                    q1[i] = p1[i];
                }
            }
        }
    }
    else
    {
        for (i = 0; i < count; i++)
        {
            q1[i] = p1[i];
        }
    }

    return dest;
}
#endif /* !MEMCPY_USE_ASM */

void *memmove(void *s1, const void *s2, size_t n)
{

    register char *s = (char *) s1;
    register const char *p = (const char *) s2;

#ifdef _CHECK_NULL_POINTER_
    if( (NULL == s1) || (NULL == s2) )
    {
        pointer_err_st(__FILE__, __LINE__);
        return s1;
    }
#endif

    if (p >= s)
    {
        while (n)
        {
            *s++ = *p++;
            --n;
        }
    }
    else
    {
        while (n)
        {
            --n;
            s[n] = p[n];
        }
    }

    return s1;

}
int memcmp(const void *s1, const void *s2, unsigned n)
{
    register const unsigned char *r1 = (const unsigned char *) s1;
    register const unsigned char *r2 = (const unsigned char *) s2;

    int r = 0;
#ifdef _CHECK_NULL_POINTER_
    if( (NULL == s1) || (NULL == s2) )
    {
        pointer_err_st(__FILE__, __LINE__);
        return r;
    }
#endif
    while (n-- && ((r = ((int)(*r1++)) - *r2++) == 0));

    return r;

}

#define LONG_MAX_32_BITS 2147483647


/* Find the first occurrence of C in S.  */
void *rawmemchr (const void * s, int c_in)
{
    const unsigned char *char_ptr;
    const unsigned long int *longword_ptr;
    unsigned long int longword, magic_bits, charmask;
    unsigned char c;

    c = (unsigned char) c_in;

    /* Handle the first few characters by reading one character at a time.
       Do this until CHAR_PTR is aligned on a longword boundary.  */
    for (char_ptr = (const unsigned char *) s;
         ((unsigned long int) char_ptr & (sizeof (longword) - 1)) != 0;
         ++char_ptr)
        if (*char_ptr == c)
            return (void *) char_ptr;

    /* All these elucidatory comments refer to 4-byte longwords,
       but the theory applies equally well to 8-byte longwords.  */

    longword_ptr = (unsigned long int *) char_ptr;

    /* Bits 31, 24, 16, and 8 of this number are zero.  Call these bits
       the "holes."  Note that there is a hole just to the left of
       each byte, with an extra at the end:

       bits:  01111110 11111110 11111110 11111111
       bytes: AAAAAAAA BBBBBBBB CCCCCCCC DDDDDDDD

       The 1-bits make sure that carries propagate to the next 0-bit.
       The 0-bits provide holes for carries to fall into.  */

    if (sizeof (longword) != 4 && sizeof (longword) != 8)
    {
        void abort();
        abort();
    }

#if  1
    //#if LONG_MAX <= LONG_MAX_32_BITS
    magic_bits = 0x7efefeff;
#else
    magic_bits = ((unsigned long int) 0x7efefefe << 32) | 0xfefefeff;
#endif

    /* Set up a longword, each of whose bytes is C.  */
    charmask = c | (c << 8);
    charmask |= charmask << 16;
#if 0
    //#if LONG_MAX > LONG_MAX_32_BITS
    charmask |= charmask << 32;
#endif

    /* Instead of the traditional loop which tests each character,
       we will test a longword at a time.  The tricky part is testing
       if *any of the four* bytes in the longword in question are zero.  */
    while (1)
    {
        /* We tentatively exit the loop if adding MAGIC_BITS to
        LONGWORD fails to change any of the hole bits of LONGWORD.

         1) Is this safe?  Will it catch all the zero bytes?
         Suppose there is a byte with all zeros.  Any carry bits
         propagating from its left will fall into the hole at its
         least significant bit and stop.  Since there will be no
         carry from its most significant bit, the LSB of the
         byte to the left will be unchanged, and the zero will be
         detected.

         2) Is this worthwhile?  Will it ignore everything except
         zero bytes?  Suppose every byte of LONGWORD has a bit set
         somewhere.  There will be a carry into bit 8.  If bit 8
         is set, this will carry into bit 16.  If bit 8 is clear,
         one of bits 9-15 must be set, so there will be a carry
         into bit 16.  Similarly, there will be a carry into bit
         24.  If one of bits 24-30 is set, there will be a carry
         into bit 31, so all of the hole bits will be changed.

         The one misfire occurs when bits 24-30 are clear and bit
         31 is set; in this case, the hole at bit 31 is not
         changed.  If we had access to the processor carry flag,
         we could close this loophole by putting the fourth hole
         at bit 32!

         So it ignores everything except 128's, when they're aligned
         properly.

         3) But wait!  Aren't we looking for C, not zero?
         Good point.  So what we do is XOR LONGWORD with a longword,
         each of whose bytes is C.  This turns each byte that is C
         into a zero.  */

        longword = *longword_ptr++ ^ charmask;

        /* Add MAGIC_BITS to LONGWORD.  */
        if ((((longword + magic_bits)

              /* Set those bits that were unchanged by the addition.  */
              ^ ~longword)

             /* Look at only the hole bits.  If any of the hole bits
                are unchanged, most likely one of the bytes was a
                zero.  */
             & ~magic_bits) != 0)
        {
            /* Which of the bytes was C?  If none of them were, it was
               a misfire; continue the search.  */

            const unsigned char *cp = (const unsigned char *) (longword_ptr - 1);

            if (cp[0] == c)
                return (void *) cp;
            if (cp[1] == c)
                return (void *) &cp[1];
            if (cp[2] == c)
                return (void *) &cp[2];
            if (cp[3] == c)
                return (void *) &cp[3];
#if 0
            //#if LONG_MAX > 2147483647
            if (cp[4] == c)
                return (void *) &cp[4];
            if (cp[5] == c)
                return (void *) &cp[5];
            if (cp[6] == c)
                return (void *) &cp[6];
            if (cp[7] == c)
                return (void *) &cp[7];
#endif
        }
    }
}



unsigned strlen(const char * buf)
{
    unsigned rv = 0;
#ifdef _CHECK_NULL_POINTER_
    if(NULL == buf)
    {
        pointer_err_st(__FILE__, __LINE__);
        return rv;
    }
#endif
    while(buf[rv] != '\0')
    {
        rv++;
    };

    return rv;
}

/**
 * strnlen - Find the length of a length-limited string
 * @s: The string to be sized
 * @count: The maximum number of bytes to search
 */
size_t strnlen(const char * s, size_t count)
{
    const char *sc;

    for (sc = s; count-- && *sc != '\0'; ++sc)
        /* nothing */;
    return sc - s;
}

char * strcat(char * dest, const char *src)
{
    char * pdest = dest;
    register char c;
#ifdef _CHECK_NULL_POINTER_
    if( (NULL == dest) || (NULL == src) )
    {
        pointer_err_st(__FILE__, __LINE__);
        return dest;
    }
#endif
    while(*pdest != '\0')pdest++;

    do
    {
        c = *src++;
        *pdest++ = c;
    }
    while(c != '\0');

    return dest;
}

/**
 * strncat - Append a length-limited, %NUL-terminated string to another
 * @dest: The string to be appended to
 * @src: The string to append to it
 * @count: The maximum numbers of bytes to copy
 *
 * Note that in contrast to strncpy, strncat ensures the result is
 * terminated.
 */
char * strncat(char *dest, const char *src, size_t count)
{
    char *tmp = dest;

#ifdef _CHECK_NULL_POINTER_
    if( (NULL == dest) || (NULL == src) )
    {
        pointer_err_st(__FILE__, __LINE__);
        return tmp;
    }
#endif

    if (count)
    {
        while (*dest)
            dest++;
        while ((*dest++ = *src++))
        {
            if (--count == 0)
            {
                *dest = '\0';
                break;
            }
        }
    }

    return tmp;
}
char *strcpy(char * __restrict s1, const char * __restrict s2)
{
    register char *s = s1;
#ifdef _CHECK_NULL_POINTER_
    if( (NULL == s1) || (NULL == s2) )
    {
        pointer_err_st(__FILE__, __LINE__);
        return s1;
    }
#endif
    while ( (*s++ = *s2++) != 0 );
    return s1;
}

char *strncpy(char * __restrict s1, register const char * __restrict s2,
              size_t n)
{
    register char *s = s1;
#ifdef _CHECK_NULL_POINTER_
    if( (NULL == s1) || (NULL == s2) )
    {
        pointer_err_st(__FILE__, __LINE__);
        return s1;
    }
#endif
    while (n)
    {
        if ((*s = *s2) != 0) s2++;
        ++s;
        --n;
    }


    return s1;
}

int strcmp (const char *p1, const char *p2)
{
    register const unsigned char *s1 = (const unsigned char *) p1;
    register const unsigned char *s2 = (const unsigned char *) p2;
    unsigned c1, c2;
#ifdef _CHECK_NULL_POINTER_
    if( (NULL == p1) || (NULL == p2) )
    {
        pointer_err_st(__FILE__, __LINE__);
        return 100;		// Do not know what value should be return?
    }
#endif
    do
    {
        c1 = (unsigned char) * s1++;
        c2 = (unsigned char) * s2++;
        if (c1 == '\0')
            return c1 - c2;
    }
    while (c1 == c2);

    return c1 - c2;
}

/**
 * strncmp - Compare two length-limited strings
 * @cs: One string
 * @ct: Another string
 * @count: The maximum number of bytes to compare
 */
int strncmp(const char * cs, const char * ct, size_t count)
{
    char __res = 0;
#ifdef _CHECK_NULL_POINTER_
    if( (NULL == cs) || (NULL == ct) )
    {
        pointer_err_st(__FILE__, __LINE__);
        return 0;
    }
#endif
    while (count)
    {
        if ((__res = *cs - *ct++) != 0 || !*cs++)
            break;
        count--;
    }

    return __res;
}

char *strchr(register const char *s, int c)
{
#ifdef _CHECK_NULL_POINTER_
    if( NULL == s )
    {
        pointer_err_st(__FILE__, __LINE__);
        return ((void *)0);
    }
#endif
    do
    {
        if (*s == ((char)c))
        {
            return (char *) s;
        }
    }
    while (*s++);

    return ((void *)0);
}

/**
 * strrchr - Find the last occurrence of a character in a string
 * @s: The string to be searched
 * @c: The character to search for
 */
char * strrchr(const char * s, int c)
{
    const char *p = s + strlen(s);
#ifdef _CHECK_NULL_POINTER_
    if( NULL == s)
    {
        pointer_err_st(__FILE__, __LINE__);
        return NULL;
    }
#endif

    do
    {
        if (*p == (char)c)
            return (char *)p;
    }
    while (--p >= s);
    return NULL;
}

/**
 * strstr - Find the first substring in a %NUL terminated string
 * @s1: The string to be searched
 * @s2: The string to search for
 */
char * strstr(const char * s1, const char * s2)
{
    int l1, l2;

#ifdef _CHECK_NULL_POINTER_
    if( (NULL == s1) || (NULL == s2) )
    {
        pointer_err_st(__FILE__, __LINE__);
        return NULL;
    }
#endif

    l2 = strlen(s2);
    if (!l2)
        return (char *) s1;
    l1 = strlen(s1);
    while (l1 >= l2)
    {
        l1--;
        if (!memcmp(s1, s2, l2))
            return (char *) s1;
        s1++;
    }
    return NULL;
}

static char *olds = NULL;

char *strtok(char *s, const char *delim)
{
    char *token;

    if (s == NULL)
        s = olds;

    /* Scan leading delimiters.  */
    s += strspn (s, delim);
    if (*s == '\0')
    {
        olds = s;
        return NULL;
    }

    /* Find the end of the token.  */
    token = s;
    s = strpbrk (token, delim);
    if (s == NULL)
        /* This token finishes the string.	*/
        olds = rawmemchr (token, '\0');
    else
    {
        /* Terminate the token and make OLDS point past it.  */
        *s = '\0';
        olds = s + 1;
    }
    return token;
}


/**
 * strpbrk - Find the first occurrence of a set of characters
 * @cs: The string to be searched
 * @ct: The characters to search for
 */
char * strpbrk(const char * cs, const char * ct)
{
    const char *sc1, *sc2;

#ifdef _CHECK_NULL_POINTER_
    if( (NULL == cs) || (NULL == ct) )
    {
        pointer_err_st(__FILE__, __LINE__);
        return NULL;
    }
#endif

    for( sc1 = cs; *sc1 != '\0'; ++sc1)
    {
        for( sc2 = ct; *sc2 != '\0'; ++sc2)
        {
            if (*sc1 == *sc2)
                return (char *) sc1;
        }
    }
    return NULL;
}

/**
 * strspn - Calculate the length of the initial substring of @s which only
 *  contain letters in @accept
 * @s: The string to be searched
 * @accept: The string to search for
 */
size_t strspn(const char *s, const char *accept)
{
    const char *p;
    const char *a;
    size_t count = 0;

#ifdef _CHECK_NULL_POINTER_
    if( (NULL == s) || (NULL == accept) )
    {
        pointer_err_st(__FILE__, __LINE__);
        return 0;
    }
#endif

    for (p = s; *p != '\0'; ++p)
    {
        for (a = accept; *a != '\0'; ++a)
        {
            if (*p == *a)
                break;
        }
        if (*a == '\0')
            return count;
        ++count;
    }

    return count;
}

size_t strcspn(const char *s1 , const char *s2)
{
    const char *s = s1;
    const char *p;

#ifdef _CHECK_NULL_POINTER_
    if( (NULL == s1) || (NULL == s2) )
    {
        pointer_err_st(__FILE__, __LINE__);
        return 0;
    }
#endif

    while (*s1)
    {
        for (p = s2; *p; p++)
        {
            if (*s1 == *p)
                break;
        }

        if (*p)
            break;

        s1++;
    }
    return s1 - s;
}

size_t strxfrm(char *s1, const char *s2, size_t n)
{
    size_t res;
    res = 0;

#ifdef _CHECK_NULL_POINTER_
    if( (NULL == s1) || (NULL == s2) )
    {
        pointer_err_st(__FILE__, __LINE__);
        return 0;
    }
#endif

    while (n-- > 0)
    {
        if ((*s1++ = *s2++) != '\0')
            ++res;
        else
            return res;
    }
    while (*s2)
    {
        ++s2;
        ++res;
    }

    return res;
}

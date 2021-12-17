#ifndef _SLI_STRING_H_
#define _SLI_STRING_H_

#ifdef __cplusplus
extern "C" {
#endif

#include <stddef.h>
/*
* copies the value of c (converted to an unsigned char) into each of the
* first n charactes of the object pointed to by s.
* Returns: the value of s.
*/
extern void *memset(void * /*s*/, int /*c*/, size_t /*n*/);

/*
* copies n characters from the object pointed to by s2 into the object
* pointed to by s1. If copying takes place between objects that overlap,
* the behaviour is undefined.
* Returns: the value of s1.
*/
extern void *memcpy(void * /*s1*/, const void * /*s2*/, size_t /*n*/);

/*
* copies n characters from the object pointed to by s2 into the object
* pointed to by s1. Copying takes place as if the n characters from the
* object pointed to by s2 are first copied into a temporary array of n
* characters that does not overlap the objects pointed to by s1 and s2,
* and then the n characters from the temporary array are copied into the
* object pointed to by s1.
* Returns: the value of s1.
*/
extern void *memmove(void * /*s1*/, const void * /*s2*/, size_t /*n*/);

/*
* compares the first n characters of the object pointed to by s1 to the
* first n characters of the object pointed to by s2.
* Returns: an integer greater than, equal to, or less than zero, according
*          as the object pointed to by s1 is greater than, equal to, or
*          less than the object pointed to by s2.
*/
extern int memcmp(const void * /*s1*/, const void * /*s2*/, size_t /*n*/);

extern void bzero (void * s,  size_t count);

/*
* locates the first occurence of c (converted to an unsigned char) in the
* initial n characters (each interpreted as unsigned char) of the object
* pointed to by s.
* Returns: a pointer to the located character, or a null pointer if the
*          character does not occur in the object.
*/
extern void *memchr(const void * /*s*/, int /*c*/, size_t /*n*/);

/*
* computes the length of the string pointed to by s.
* Returns: the number of characters that precede the terminating null
*          character.
*/
extern size_t strlen(const char * /*s*/);
extern size_t strnlen(const char * s, size_t count);

/*
* copies the string pointed to by s2 (including the terminating nul
* character) into the array pointed to by s1. If copying takes place
* between objects that overlap, the behaviour is undefined.
* Returns: the value of s1.
*/
extern char *strcpy(char * /*s1*/, const char * /*s2*/);

/*
* copies not more than n characters (characters that follow a null
* character are not copied) from the array pointed to by s2 into the array
* pointed to by s1. If copying takes place between objects that overlap,
* the behaviour is undefined.
* Returns: the value of s1.
*/
extern char *strncpy(char * /*s1*/, const char * /*s2*/, size_t /*n*/);

/*
* appends a copy of the string pointed to by s2 (including the terminating
* null character) to the end of the string pointed to by s1. The initial
* character of s2 overwrites the null character at the end of s1.
* Returns: the value of s1.
*/
extern char *strcat(char * /*s1*/, const char * /*s2*/);

/*
* appends not more than n characters (a null character and characters that
* follow it are not appended) from the array pointed to by s2 to the end of
* the string pointed to by s1. The initial character of s2 overwrites the
* null character at the end of s1. A terminating null character is always
* appended to the result.
* Returns: the value of s1.
*/
extern char *strncat(char * /*s1*/, const char * /*s2*/, size_t /*n*/);

/*
* compares the string pointed to by s1 to the string pointed to by s2.
* Returns: an integer greater than, equal to, or less than zero, according
*          as the string pointed to by s1 is greater than, equal to, or
*          less than the string pointed to by s2.
*/
extern int strcmp(const char * /*s1*/, const char * /*s2*/);

/*
* compares not more than n characters (characters that follow a null
* character are not compared) from the array pointed to by s1 to the array
* pointed to by s2.
* Returns: an integer greater than, equal to, or less than zero, according
*          as the string pointed to by s1 is greater than, equal to, or
*          less than the string pointed to by s2.
*/
extern int strncmp(const char * /*s1*/, const char * /*s2*/, size_t /*n*/);

/*
* locates the first occurence of c (converted to an char) in the string
* pointed to by s (including the terminating null character).
* Returns: a pointer to the located character, or a null pointer if the
*          character does not occur in the string.
*/
extern char *strchr(const char * /*s*/, int /*c*/);

/*
* locates the last occurence of c (converted to a char) in the string
* pointed to by s. The terminating null character is considered part of
* the string.
* Returns: returns a pointer to the character, or a null pointer if c does
*          not occur in the string.
*/
char *strrchr(const char * /*s*/, int /*c*/);

/*
* locates the first occurence in the string pointed to by s1 of the
* sequence of characters (excluding the terminating null character) in the
* string pointed to by s2.
* Returns: a pointer to the located string, or a null pointer if the string
*          is not found.
*/
extern char *strstr(const char * /*s1*/, const char * /*s2*/);

extern char *strtok(char *s, const char *delim);

/*
* transforms the string pointed to by s2 and places the resulting string
* into the array pointed to by s1. The transformation function is such that
* if the strcmp function is applied to two transformed strings, it returns
* a value greater than, equal to or less than zero, corresponding to the
* result of the strcoll function applied to the same two original strings.
* No more than n characters are placed into the resulting array pointed to
* by s1, including the terminating null character. If n is zero, s1 is
* permitted to be a null pointer. If copying takes place between objects
* that overlap, the behaviour is undefined.
* Returns: The length of the transformed string is returned (not including
*          the terminating null character). If the value returned is n or
*          more, the contents of the array pointed to by s1 are
*          indeterminate.
*/
extern size_t strxfrm(char * /*s1*/, const char * /*s2*/, size_t /*n*/);

/*
* computes the length of the initial segment of the string pointed to by s1
* which consists entirely of characters not from the string pointed to by
* s2. The terminating null character is not considered part of s2.
* Returns: the length of the segment.
*/
extern size_t strcspn(const char * /*s1*/, const char * /*s2*/);


/*
* locates the first occurence in the string pointed to by s1 of any
* character from the string pointed to by s2.
* Returns: returns a pointer to the character, or a null pointer if no
*          character form s2 occurs in s1.
*/
extern char *strpbrk(const char * /*s1*/, const char * /*s2*/);


/*
* computes the length of the initial segment of the string pointed to by s1
* which consists entirely of characters from the string pointed to by S2
* Returns: the length of the segment.
*/
extern size_t strspn(const char * /*s1*/, const char * /*s2*/);


#ifdef __cplusplus
};
#endif

#endif  //_SL_STRING_H_

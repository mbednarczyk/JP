Poprawka tego kodu https://gist.github.com/2225959

#include <stdio.h>
#include <string.h>

int
main (int argc, char *argv[])
{
 char tablica[20];

 while (scanf ("%s", tablica) == 1)
   {
     if (!strncmp (tablica, argv[1], strlen (argv[1])))
printf ("%s\n", tablica);
   }


 return 0;
}
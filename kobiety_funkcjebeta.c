// Odpalamy tak ./kobiety_funkcjebeta.c prefiks

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int pobieranie_slownika(char slownik[][20]);
void wypisywanie(char slownik[][20], char* prefiks, int ilosc_wczytanych);

int main(int argc, char* argv[]){
  char slownik[4960][20];
  char* prefiks=argv[1];
  int i = 0;
  
  printf("Podaj imiona (aby zakonczyć ^D): \n");
  i = pobieranie_slownika(slownik);
  printf("Imiona zaczynające się na %s, to :\n",prefiks);
  wypisywanie(slownik,prefiks,i);
  
  
  return 0;
}

int pobieranie_slownika(char slownik[][20]){
  char temp[20];
  
  int i = 0;
  while(scanf("%s",temp) == 1){
    strcpy(slownik[i],temp);
    i++;
  }
  return i;

}

void wypisywanie(char slownik[][20], char* prefiks, int ilosc_wczytanych){
  int i;
  for(i = 0 ; i < ilosc_wczytanych; i++){
	if (!strncmp (slownik[i], prefiks, strlen (prefiks)))
	  printf("%s\n",slownik[i]);
  }

}

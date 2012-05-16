#!/bin/bash

# Zmienne.
miasto="gdansk,miasto,32"
browser="elinks"
tmpdir=/tmp/weather


# Tworzenie katalogu.
mkdir ${tmpdir}

# Pobieranie informacji o prognozie pogody na jutro.
${browser} -dump "http://pogoda.money.pl/${miasto}.html" | grep -iB9 'jutro' | \
  head -n8 > ${tmpdir}/tomorrow

tomMax=`grep -i max ${tmpdir}/tomorrow | awk '{print $3}'`
mintemp1=`grep -i min ${tmpdir}/tomorrow | awk '{print $3}'`
wiatr1=`grep -i wiatr ${tmpdir}/tomorrow `
deszcz1=`grep -i deszcz ${tmpdir}/tomorrow | awk '{print $2" "$3}'`
snieg1=`grep -i nieg ${tmpdir}/tomorrow | awk '{print $2" "$3}'`
cisnienie1=`grep -i nienie ${tmpdir}/tomorrow | awk '{print $2}' | cut -f1 -d.`
wschod1=`grep -i wsch ${tmpdir}/tomorrow | awk '{print $3}'`
zachod1=`grep -i zach ${tmpdir}/tomorrow | awk '{print $3}'`

# Wypisywanie prognozy.
echo
echo "Prognoza pogody dla Gdanska na jutrzejszy dzien wyglada nastepujaco:"
echo
echo "Temperatura bedzie sie wahac miedzy ${mintemp1} *C, a ${tomMax} *C"
echo
echo "Opady deszczu: ${deszcz1}"
echo
echo "Opady sniegu: ${snieg1}"
echo
echo "Przewidywane cisnienie atmosferyczne: ${cisnienie1} hPa" 
echo
echo "${wiatr1}"
echo
echo "Wschod slonca nastapi o godzinie: ${wschod1}"
echo
echo "Zachod slonca nastapi o godzinie: ${zachod1}"
echo
# Wypisywanie wskazowek.
echo "Wskazowki do ubioru na jutrzejsza pogode:"
#TEMPERATURA
if [ ${mintemp1} -gt 21 ]
then
echo "Rozpoczyna sie lato, bierz znajomych, zimne piwo i lec na plaze. Idealna temperatura na urlop lub wagary ! :). "
fi

if [ ${mintemp1} -ge 16 ]
then
echo "Temperatura wiosenno-letnia, wieczory moga byc jeszcze chlode wiec przyda sie ciepla bluza :)."
echo
fi


if [ ${mintemp1} -ge 11 ] && [ ${mintemp1} -le 15 ]
then
echo "Przyjemna wiosenna temperatura, mozna pomyslec o lzejszym i bardziej przewiewnym ubraniu :). "
echo
fi

if [ ${mintemp1} -ge 5 ] && [ ${mintemp1} -le 10 ]
then
echo "Typowo jesienna temperatura, ubierz sie cieplo :)."
echo
fi

if [ ${mintemp1} -ge 0 ] && [ ${mintemp1} -le 4 ]
then 
echo "Uwazaj temperatura zbliza sie do 0 stopni Celsjusza, przyda sie czapka i rekawiczki :). "
echo
fi

if [ ${mintemp1} -ge -5 ] && [ ${mintemp1} -le -1 ] 
then
echo "Lekki mroz, uwazaj na drodze. Czapka, szalik, rekawiczki to rzeczy obowiazkowe"
echo
fi

if [ ${mintemp1} -le -6 ]
then
echo "Srogi mroz, zostan w domu i pij ciepla herbate "
echo 
fi

#DESZCZ
if [ ${deszcz1} != brak ]
then
echo "Zapowiada sie na deszcz, zadbaj o parasol lub kurtke przeciwdeszczowa !!"
echo
fi

#SNIEG
if [ ${snieg1} != brak ]
then
echo "Mozliwe opady sniegu, moze byc slisko. Przyda sie cieple i nieprzemakalne ubranie."
echo
fi

#CISNIENIE
if [ ${cisnienie1} -lt 1000 ]
then
echo "UWAGA niskie cisnienie, Twoje jutrzejsze samopoczucie moze byc zle." 
echo
fi

if [ ${cisnienie1} -ge 1000 ]
then
echo "Cisnienie bedzie sprzyjac Twojemu jutrzejszemu samopoczuciu."
echo
fi

# Usuwanie utworzonego katalogu.
rm -rf ${tmpdir}



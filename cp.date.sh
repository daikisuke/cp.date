#!/bin/bash
archivo="";
conI=0;
conFinal="$#";
arrayIn=( "$@" );
function init_home {
if [[ -e "$archivo" ]];
then
nameFile="${archivo%.*}";
extFile="${archivo##*.}";
fechaFile="`date +"%y%m%d%X"|tr -d ':'`";
if [[ "$archivo" == *"."* ]]
then
  extFile=".$extFile";
else
  extFile="";
fi
newNameFile="${nameFile}-${fechaFile}${extFile}";
echo -e "\nCopiando...!";
cp "$archivo" "$newNameFile";
echo -e "Original: $archivo\nNuevo Nombre: $newNameFile";
echo "Terminando!.";
else
echo "El archivo: $archivo, No existe";
fi
}
while [ $conFinal -ge $((conI+1)) ]
do
  archivo="${arrayIn[$conI]}";
  if [ -f $archivo ];
  then
  init_home;
  fi
  (( conI++ ))
done

#!/bin/bash
#
# distrux: (08/12/2020)
#
# Variables y Colores
#
OS=$(uname -o)
verde='\033[32m'
blanco='\033[37m'
rojo='\033[31m'
azul='\033[34m'
negro='\033[0;30m'
rosa='\033[38;5;207m'
amarillo='\033[33m'
morado='\033[35m'
cian='\033[1;36m'
magenta='\033[1;35m'
#
# Dependencias del Script
#
if [ "${OS}" == "Android" ]; then
	if [ -x ${PREFIX}/bin/proot ]; then
		Ruta=$(pwd)
	else
		Ruta=$(pwd)
		pkg install proot -y
	fi
	if [ -x ${PREFIX}/bin/proot-distro ]; then
		Ruta=$(pwd)
	else
		Ruta=$(pwd)
		pkg install proot-distro -y
	fi
else
echo -e "${rojo}
┌═════════════════════════════┐
█ ${blanco}EJECUTE EL SCRIPT EN TERMUX ${rojo}█
└═════════════════════════════┘
"${blanco}
fi
#
# Capturando Errores
#
function Error {
echo -e "${rojo}
┌═════════════════════┐
█ ${blanco}¡OPCIÓN INCORRECTA! ${rojo}█
└═════════════════════┘
"${blanco}
sleep 0.5
}
#
# Banner distrux
#
function distrux {
	sleep 0.5
	clear
echo -e "${verde}
██████╗ ██╗███████╗████████╗██████╗ ██╗   ██╗██╗  ██╗
██╔══██╗██║██╔════╝╚══██╔══╝██╔══██╗██║   ██║╚██╗██╔╝
██║  ██║██║███████╗   ██║   ██████╔╝██║   ██║ ╚███╔╝
██║  ██║██║╚════██║   ██║   ██╔══██╗██║   ██║ ██╔██╗
██████╔╝██║███████║   ██║   ██║  ██║╚██████╔╝██╔╝ ██╗
╚═════╝ ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝"${blanco}
}
#
# Seleccionando Distribución Linux
#
function Distribution {
	distrux
echo -e -n "${verde}
┌══════════════════════════════════════════┐
█ ${blanco}¿CUÁL DISTRIBUCIÓN LINUX DESEA INSTALAR? ${verde}█
└══════════════════════════════════════════┘
┃    ┌════════════════════════════┐
└═>>>█ [${blanco}01${verde}] ┃ ${blanco}Alpine Linux 3.12.0 ${verde}█
┃    └════════════════════════════┘
┃    ┌═══════════════════┐
└═>>>█ [${blanco}02${verde}] ┃ ${blanco}Arch Linux ${verde}█
┃    └═══════════════════┘
┃    ┌═══════════════════════════┐
└═>>>█ [${blanco}03${verde}] ┃ ${blanco}Debian 10 (Buster) ${verde}█
┃    └═══════════════════════════┘
┃    ┌═══════════════════════┐
└═>>>█ [${blanco}04${verde}] ┃ ${blanco}Kali Nethunter ${verde}█
┃    └═══════════════════════┘
┃    ┌═════════════════════┐
└═>>>█ [${blanco}05${verde}] ┃ ${blanco}Ubuntu 18.04 ${verde}█
┃    └═════════════════════┘
┃    ┌═════════════════════┐
└═>>>█ [${blanco}06${verde}] ┃ ${blanco}Ubuntu 20.04 ${verde}█
┃    └═════════════════════┘
┃    ┌════════════════┐
└═>>>█ [${blanco}00${verde}] ┃ ${rojo}NINGUNA ${verde}█
┃    └════════════════┘
┃
└═>>> "${blanco}
read -r Distro
sleep 0.5

if [[ ${Distro} == 0 || ${Distro} == 00 ]]; then
exit
elif [[ ${Distro} == 1 || ${Distro} == 01 ]]; then
Distro="alpine"
elif [[ ${Distro} == 2 || ${Distro} == 02 ]]; then
Distro="archlinux"
elif [[ ${Distro} == 3 || ${Distro} == 03 ]]; then
Distro="debian-buster"
elif [[ ${Distro} == 4 || ${Distro} == 04 ]]; then
Distro="nethunter"
elif [[ ${Distro} == 5 || ${Distro} == 05 ]]; then
Distro="ubuntu-18.04"
elif [[ ${Distro} == 6 || ${Distro} == 06 ]]; then
Distro="ubuntu-20.04"
else
Error
Distribution
fi
}
#
# Instalando Distribución Linux
#
function Install {
	distrux
echo -e "${verde}
┌══════════════════════════════════┐
█ ${blanco}INSTALANDO DISTRIBUCIÓN LINUX... ${verde}█
└══════════════════════════════════┘
┃
└═>>>${blanco} ${Distro}
"
proot-distro install ${Distro}
echo -e "${verde}
┌══════════════════════════════┐
█ ${blanco}DISTRIBUCIÓN LINUX INSTALADA ${verde}█
└══════════════════════════════┘
"${blanco}
echo -e "alias ${Distro}='proot-distro login ${Distro}'" >> ${PREFIX}/etc/bash.bashrc
echo -e "alias ${Distro}='proot-distro login ${Distro}'" >> ${PREFIX}/etc/fish/config.fish
echo -e "${verde}
┌═════════════════════════════════════════┐
█ ${blanco}REINICIAR TERMUX Y EJECUTAR EL COMANDO: ${verde}█
└═════════════════════════════════════════┘
┃
└═>>>${blanco} ${Distro}
"
proot-distro login ${Distro}
source ${Ruta}/distrux.sh
}
#
# Declarando Funciones
#
Distribution
Install
#
# Creado por Darkmux
#
# White Hacks 2020 ©

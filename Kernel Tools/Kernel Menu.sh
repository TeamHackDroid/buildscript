#!/bin/sh

clear

echo
echo "================================================================="
echo " Kernel Build Tool - by cars1189 (xda-developers.com) aka Doadin"
echo "================================================================="
echo " Version 0.0.1"
echo
echo "> MAIN MENU"
echo
echo "  1 - Build Ancora_TMO Kernels(Galaxy Exhibit 4G)"
echo "  2 - Build Ancora Kernels (Galaxy W)"
echo "  3 - Build ariesve Kernels (Galaxy S Plus GT-I9001))"
echo
echo
echo "  x - Exit"
echo
echo
echo "For first time run build environment setup first if needed."
echo "Also if first time setting up run setup for your device/rom choice then build"
echo -n "Select Option: "
options=("1" "2" "3" "x")
select opt in "${options[@]}"
do
    case $opt in
      1) compile_ancora_tmo_kernels;;
      2) compile_ancora_kernels;;
      3) compile_ariesve_kernels;;
      x) exit
      *) echo "Invalid option"; continue;;
    esac
done
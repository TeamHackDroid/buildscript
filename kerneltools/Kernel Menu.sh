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
echo "  1 - Build All Ancora_TMO Kernels Options(Galaxy Exhibit 4G)"
echo "  2 - Build All Ancora Kernels Options(Galaxy W)"
echo "  3 - Build All Ariesve Kernels Options(Galaxy S Plus GT-I9001))"
echo
echo
echo "  x - Exit"
echo
echo
echo -n "Select Option: "
options=("1" "2" "3" "x")
select opt in "${options[@]}"
do
    case $opt in
      1) compile_ancora_tmo_kernel_Options;;
      2) compile_ancora_kernels_Options;;
      3) compile_ariesve_kernels_Options;;
      x) exit
      *) echo "Invalid option"; continue;;
    esac
done
#!/bin/sh

clear

echo
echo "================================================================="
echo " Kernel Build Tool - by cars1189 (xda-developers.com) aka Doadin"
echo "================================================================="
echo
echo "> MAIN MENU"
echo
echo "  1 - Build All Ancora_TMO Linaro Kernels(Galaxy Exhibit 4G)"
echo "  2 - Build All Ancora_TMO K^Kernels"
echo "  3 - Build Ancora_TMO ADC/Linaro Kernel"
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
      1) compile_all_ancora_kernels;;
      2) compile_all_kkernel_ancora_kernels;;
      3) compile_adc_ancora_kernel;;
      x) exit
      *) echo "Invalid option"; continue;;
    esac
done
#!/bin/bash

source /tool/dotfiles/master
source /tool/cad/prod/module/slproj_bourne
module -f gcc 9.3.0

python3 --version

export FORCE_PYTHON_INC=/designtools/python_3.6.5/include
export FORCE_PYTHON_LIB=/designtools/python_3.6.5/lib
export FORCE_PYTHON_VER=3
export FORCE_CC=g++
export LD_LIBRARY_PATH=${FORCE_PYTHON_LIB}:${LD_LIBRARY_PATH}
export OPTIMIZATION=-O0

bsub -Ip -q batch -n 8 ./regenerate_and_build.bash -n



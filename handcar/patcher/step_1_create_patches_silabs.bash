#!/bin/bash

mkdir -p originals/insns
mkdir -p modified/insns
mkdir -p patches/insns
mkdir -p patched/insns

cp ../standalone/riscv/processor.cc ./originals
cp ../standalone/spike_main/spike.cc ./originals

rm patches/processor.cc.patch  
rm patches/spike.cc.patch

echo "#" >> patches/processor.cc.patch
echo "# Copyright (C) [2020] Futurewei Technologies, Inc." >> patches/processor.cc.patch
echo "#" >> patches/processor.cc.patch
echo "# FORCE-RISCV is licensed under the Apache License, Version 2.0 (the "License");" >> patches/processor.cc.patch
echo "#  you may not use this file except in compliance with the License." >> patches/processor.cc.patch
echo "#  You may obtain a copy of the License at" >> patches/processor.cc.patch
echo "#" >> patches/processor.cc.patch
echo "#  http://www.apache.org/licenses/LICENSE-2.0" >> patches/processor.cc.patch
echo "#" >> patches/processor.cc.patch
echo "# THIS SOFTWARE IS PROVIDED ON AN \"AS IS\" BASIS, WITHOUT WARRANTIES OF ANY KIND, EITHER" >> patches/processor.cc.patch
echo "# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT, MERCHANTABILITY OR" >> patches/processor.cc.patch
echo "# FIT FOR A PARTICULAR PURPOSE." >> patches/processor.cc.patch
echo "# See the License for the specific language governing permissions and" >> patches/processor.cc.patch
echo "# limitations under the License." >> patches/processor.cc.patch
echo "#" >> patches/processor.cc.patch
diff originals/processor.cc modified/processor.cc >> patches/processor.cc.patch  

echo "#" >> patches/spike.cc.patch
echo "# Copyright (C) [2020] Futurewei Technologies, Inc." >> patches/spike.cc.patch
echo "#" >> patches/spike.cc.patch
echo "# FORCE-RISCV is licensed under the Apache License, Version 2.0 (the "License");" >> patches/spike.cc.patch
echo "#  you may not use this file except in compliance with the License." >> patches/spike.cc.patch
echo "#  You may obtain a copy of the License at" >> patches/spike.cc.patch
echo "#" >> patches/spike.cc.patch
echo "#  http://www.apache.org/licenses/LICENSE-2.0" >> patches/spike.cc.patch
echo "#" >> patches/spike.cc.patch
echo "# THIS SOFTWARE IS PROVIDED ON AN \"AS IS\" BASIS, WITHOUT WARRANTIES OF ANY KIND, EITHER" >> patches/spike.cc.patch
echo "# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT, MERCHANTABILITY OR" >> patches/spike.cc.patch
echo "# FIT FOR A PARTICULAR PURPOSE." >> patches/spike.cc.patch
echo "# See the License for the specific language governing permissions and" >> patches/spike.cc.patch
echo "# limitations under the License." >> patches/spike.cc.patch
echo "#" >> patches/spike.cc.patch
diff originals/spike.cc modified/handcar* >> patches/spike.cc.patch

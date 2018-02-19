# Copyright (C) 2016-2017 ParanoidAndroid Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

SDCLANG ?= true
SDCLANG_FORCED ?= false

SDCLANG_PATH := vendor/qcom/sdclang/bin

SDCLANG_LTO_DEFS := vendor/omni/sdclang/sdllvm-lto-defs.mk

SDCLANG_COMMON_FLAGS := -O3 -march=armv8-a+crc+lse+crypto+fp+simd -mcpu=kryo+crc+crypto+fp+simd -mfpu=crypto-neon-fp-armv8 \
			-mllvm -polly \
			-mllvm -disable-thumb-scale-addressing=true \
			-mllvm -enable-round-robin-RA \
			-mllvm -enable-select-to-intrinsics \
			-mllvm -favor-r0-7 -ffp-contract=on \
			-ftree-vectorize -fslp-vectorize \
			-foptimize-sibling-calls -funit-at-a-time 

LTO_FLAGS	:= -flto -mllvm -fuse-ld=qcld

LLVM_FLAGS	:= -falign-inner-loops -fvectorize-loops -floop-pragma \
		-mllvm -disable-thumb-scale-addressing=true \
		-mllvm -enable-round-robin-RA \
		-mllvm -enable-select-to-intrinsics \
		-mllvm -favor-r0-7 -falign-inner-loops -foptimize-sibling-calls -funit-at-a-time 


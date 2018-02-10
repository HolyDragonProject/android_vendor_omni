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

SDCLANG_COMMON_FLAGS := -O3 -march=armv8-a -mcpu=cortex-a53 -mfpu=crypto-neon-fp-armv8 -ffp-contract=on -mllvm -polly \
			-mllvm -favor-r0-7 -falign-inner-loops -ftree-vectorize -fno-prefetch-loop-arrays

// RUN: llvm-mc -triple=aarch64 -show-encoding -mattr=+sve < %s \
// RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INST
// RUN: not llvm-mc -triple=aarch64 -show-encoding < %s 2>&1 \
// RUN:        | FileCheck %s --check-prefix=CHECK-ERROR
// RUN: llvm-mc -triple=aarch64 -filetype=obj -mattr=+sve < %s \
// RUN:        | llvm-objdump -d -mattr=+sve - | FileCheck %s --check-prefix=CHECK-INST
// RUN: llvm-mc -triple=aarch64 -filetype=obj -mattr=+sve < %s \
// RUN:        | llvm-objdump -d - | FileCheck %s --check-prefix=CHECK-UNKNOWN

fmsb z0.h, p7/m, z1.h, z31.h
// CHECK-INST: fmsb	z0.h, p7/m, z1.h, z31.h
// CHECK-ENCODING: [0x20,0xbc,0x7f,0x65]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 20 bc 7f 65 <unknown>

fmsb z0.s, p7/m, z1.s, z31.s
// CHECK-INST: fmsb	z0.s, p7/m, z1.s, z31.s
// CHECK-ENCODING: [0x20,0xbc,0xbf,0x65]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 20 bc bf 65 <unknown>

fmsb z0.d, p7/m, z1.d, z31.d
// CHECK-INST: fmsb	z0.d, p7/m, z1.d, z31.d
// CHECK-ENCODING: [0x20,0xbc,0xff,0x65]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 20 bc ff 65 <unknown>


.//Obj/adc.elf:     file format elf32-csky-little


Disassembly of section .text:

1fff1000 <__Vectors>:
1fff1000:	08 10 ff 1f 00 00 00 00                             ........

1fff1008 <Reset_Handler>:
    .text
    .align  2
    .globl  Reset_Handler
    .type   Reset_Handler, %function
Reset_Handler:
    lrw     r0, 0x80000200
1fff1008:	1012      	lrw      	r0, 0x80000200	// 1fff1050 <__exit+0x2>
    mtcr    r0, psr
1fff100a:	c0006420 	mtcr      	r0, cr<0, 0>

    lrw     r0, g_top_irqstack
1fff100e:	1012      	lrw      	r0, 0x1fff4640	// 1fff1054 <__exit+0x6>
    mov     sp, r0
1fff1010:	6f83      	mov      	r14, r0
 *    __data_start__: VMA of start of the section to copy to
 *    __data_end__: VMA of end of the section to copy to
 *
 *  All addresses must be aligned to 4 bytes boundary.
 */
    lrw     r1, __erodata
1fff1012:	1032      	lrw      	r1, 0x1fff3600	// 1fff1058 <__exit+0xa>
    lrw     r2, __data_start__
1fff1014:	1052      	lrw      	r2, 0x1fff3600	// 1fff105c <__exit+0xe>
    lrw     r3, __data_end__
1fff1016:	1073      	lrw      	r3, 0x1fff3640	// 1fff1060 <__exit+0x12>

    subu    r3, r2
1fff1018:	60ca      	subu      	r3, r2
    cmpnei  r3, 0
1fff101a:	3b40      	cmpnei      	r3, 0
    bf      .L_loop0_done
1fff101c:	0c08      	bf      	0x1fff102c	// 1fff102c <Reset_Handler+0x24>

.L_loop0:
    ldw     r0, (r1, 0)
1fff101e:	9100      	ld.w      	r0, (r1, 0x0)
    stw     r0, (r2, 0)
1fff1020:	b200      	st.w      	r0, (r2, 0x0)
    addi    r1, 4
1fff1022:	2103      	addi      	r1, 4
    addi    r2, 4
1fff1024:	2203      	addi      	r2, 4
    subi    r3, 4
1fff1026:	2b03      	subi      	r3, 4
    cmpnei  r3, 0
1fff1028:	3b40      	cmpnei      	r3, 0
    bt      .L_loop0
1fff102a:	0bfa      	bt      	0x1fff101e	// 1fff101e <Reset_Handler+0x16>
 *    __bss_start__: start of the BSS section.
 *    __bss_end__: end of the BSS section.
 *
 *  Both addresses must be aligned to 4 bytes boundary.
 */
    lrw     r1, __bss_start__
1fff102c:	102e      	lrw      	r1, 0x1fff3640	// 1fff1064 <__exit+0x16>
    lrw     r2, __bss_end__
1fff102e:	104f      	lrw      	r2, 0x1fff5274	// 1fff1068 <__exit+0x1a>

    movi    r0, 0
1fff1030:	3000      	movi      	r0, 0

    subu    r2, r1
1fff1032:	6086      	subu      	r2, r1
    cmpnei  r2, 0
1fff1034:	3a40      	cmpnei      	r2, 0
    bf      .L_loop1_done
1fff1036:	0c06      	bf      	0x1fff1042	// 1fff1042 <Reset_Handler+0x3a>

.L_loop1:
    stw     r0, (r1, 0)
1fff1038:	b100      	st.w      	r0, (r1, 0x0)
    addi    r1, 4
1fff103a:	2103      	addi      	r1, 4
    subi    r2, 4
1fff103c:	2a03      	subi      	r2, 4
    cmpnei  r2, 0
1fff103e:	3a40      	cmpnei      	r2, 0
    bt      .L_loop1
1fff1040:	0bfc      	bt      	0x1fff1038	// 1fff1038 <Reset_Handler+0x30>
.L_loop1_done:

#ifndef __NO_SYSTEM_INIT
    jbsr    SystemInit
1fff1042:	e0000729 	bsr      	0x1fff1e94	// 1fff1e94 <SystemInit>
#endif

#ifndef __NO_BOARD_INIT
    jbsr    board_init
1fff1046:	e0000726 	bsr      	0x1fff1e92	// 1fff1e92 <board_init>
#endif

    jbsr    main
1fff104a:	e0000c19 	bsr      	0x1fff287c	// 1fff287c <main>

1fff104e <__exit>:
    .size   Reset_Handler, . - Reset_Handler

__exit:
    br      __exit
1fff104e:	0400      	br      	0x1fff104e	// 1fff104e <__exit>
1fff1050:	80000200 	.long	0x80000200
1fff1054:	1fff4640 	.long	0x1fff4640
1fff1058:	1fff3600 	.long	0x1fff3600
1fff105c:	1fff3600 	.long	0x1fff3600
1fff1060:	1fff3640 	.long	0x1fff3640
1fff1064:	1fff3640 	.long	0x1fff3640
1fff1068:	1fff5274 	.long	0x1fff5274

1fff106c <___gnu_csky_case_uqi>:
1fff106c:	1421      	subi      	r14, r14, 4
1fff106e:	b820      	st.w      	r1, (r14, 0x0)
1fff1070:	6c7f      	mov      	r1, r15
1fff1072:	6040      	addu      	r1, r0
1fff1074:	8120      	ld.b      	r1, (r1, 0x0)
1fff1076:	4121      	lsli      	r1, r1, 1
1fff1078:	63c4      	addu      	r15, r1
1fff107a:	9820      	ld.w      	r1, (r14, 0x0)
1fff107c:	1401      	addi      	r14, r14, 4
1fff107e:	783c      	jmp      	r15

1fff1080 <_fpadd_parts>:
1fff1080:	14c4      	push      	r4-r7
1fff1082:	1421      	subi      	r14, r14, 4
1fff1084:	9060      	ld.w      	r3, (r0, 0x0)
1fff1086:	3b01      	cmphsi      	r3, 2
1fff1088:	0c3e      	bf      	0x1fff1104	// 1fff1104 <_fpadd_parts+0x84>
1fff108a:	9180      	ld.w      	r4, (r1, 0x0)
1fff108c:	3c01      	cmphsi      	r4, 2
1fff108e:	0c3d      	bf      	0x1fff1108	// 1fff1108 <_fpadd_parts+0x88>
1fff1090:	3b44      	cmpnei      	r3, 4
1fff1092:	0c76      	bf      	0x1fff117e	// 1fff117e <_fpadd_parts+0xfe>
1fff1094:	3c44      	cmpnei      	r4, 4
1fff1096:	0c39      	bf      	0x1fff1108	// 1fff1108 <_fpadd_parts+0x88>
1fff1098:	3c42      	cmpnei      	r4, 2
1fff109a:	0c5f      	bf      	0x1fff1158	// 1fff1158 <_fpadd_parts+0xd8>
1fff109c:	3b42      	cmpnei      	r3, 2
1fff109e:	0c35      	bf      	0x1fff1108	// 1fff1108 <_fpadd_parts+0x88>
1fff10a0:	9063      	ld.w      	r3, (r0, 0xc)
1fff10a2:	90a2      	ld.w      	r5, (r0, 0x8)
1fff10a4:	91e2      	ld.w      	r7, (r1, 0x8)
1fff10a6:	5d9d      	subu      	r4, r5, r7
1fff10a8:	3cdf      	btsti      	r4, 31
1fff10aa:	b860      	st.w      	r3, (r14, 0x0)
1fff10ac:	6d93      	mov      	r6, r4
1fff10ae:	9163      	ld.w      	r3, (r1, 0xc)
1fff10b0:	0870      	bt      	0x1fff1190	// 1fff1190 <_fpadd_parts+0x110>
1fff10b2:	3e3f      	cmplti      	r6, 32
1fff10b4:	082d      	bt      	0x1fff110e	// 1fff110e <_fpadd_parts+0x8e>
1fff10b6:	655d      	cmplt      	r7, r5
1fff10b8:	0c5f      	bf      	0x1fff1176	// 1fff1176 <_fpadd_parts+0xf6>
1fff10ba:	3300      	movi      	r3, 0
1fff10bc:	9001      	ld.w      	r0, (r0, 0x4)
1fff10be:	9121      	ld.w      	r1, (r1, 0x4)
1fff10c0:	6442      	cmpne      	r0, r1
1fff10c2:	0c36      	bf      	0x1fff112e	// 1fff112e <_fpadd_parts+0xae>
1fff10c4:	3840      	cmpnei      	r0, 0
1fff10c6:	9880      	ld.w      	r4, (r14, 0x0)
1fff10c8:	5b31      	subu      	r1, r3, r4
1fff10ca:	5c6d      	subu      	r3, r4, r3
1fff10cc:	c4610c40 	inct      	r3, r1, 0
1fff10d0:	3bdf      	btsti      	r3, 31
1fff10d2:	0862      	bt      	0x1fff1196	// 1fff1196 <_fpadd_parts+0x116>
1fff10d4:	3100      	movi      	r1, 0
1fff10d6:	b2a2      	st.w      	r5, (r2, 0x8)
1fff10d8:	b221      	st.w      	r1, (r2, 0x4)
1fff10da:	b263      	st.w      	r3, (r2, 0xc)
1fff10dc:	c7a05024 	bmaski      	r4, 30
1fff10e0:	5b23      	subi      	r1, r3, 1
1fff10e2:	6504      	cmphs      	r1, r4
1fff10e4:	080b      	bt      	0x1fff10fa	// 1fff10fa <_fpadd_parts+0x7a>
1fff10e6:	9222      	ld.w      	r1, (r2, 0x8)
1fff10e8:	2900      	subi      	r1, 1
1fff10ea:	4361      	lsli      	r3, r3, 1
1fff10ec:	5b03      	subi      	r0, r3, 1
1fff10ee:	6410      	cmphs      	r4, r0
1fff10f0:	6d47      	mov      	r5, r1
1fff10f2:	2900      	subi      	r1, 1
1fff10f4:	0bfb      	bt      	0x1fff10ea	// 1fff10ea <_fpadd_parts+0x6a>
1fff10f6:	b263      	st.w      	r3, (r2, 0xc)
1fff10f8:	b2a2      	st.w      	r5, (r2, 0x8)
1fff10fa:	3103      	movi      	r1, 3
1fff10fc:	3bdf      	btsti      	r3, 31
1fff10fe:	b220      	st.w      	r1, (r2, 0x0)
1fff1100:	0821      	bt      	0x1fff1142	// 1fff1142 <_fpadd_parts+0xc2>
1fff1102:	6c0b      	mov      	r0, r2
1fff1104:	1401      	addi      	r14, r14, 4
1fff1106:	1484      	pop      	r4-r7
1fff1108:	6c07      	mov      	r0, r1
1fff110a:	1401      	addi      	r14, r14, 4
1fff110c:	1484      	pop      	r4-r7
1fff110e:	3c20      	cmplti      	r4, 1
1fff1110:	084a      	bt      	0x1fff11a4	// 1fff11a4 <_fpadd_parts+0x124>
1fff1112:	3401      	movi      	r4, 1
1fff1114:	c4c34047 	lsr      	r7, r3, r6
1fff1118:	7118      	lsl      	r4, r6
1fff111a:	2c00      	subi      	r4, 1
1fff111c:	68d0      	and      	r3, r4
1fff111e:	9001      	ld.w      	r0, (r0, 0x4)
1fff1120:	9121      	ld.w      	r1, (r1, 0x4)
1fff1122:	3b40      	cmpnei      	r3, 0
1fff1124:	c4000503 	mvc      	r3
1fff1128:	6442      	cmpne      	r0, r1
1fff112a:	6cdc      	or      	r3, r7
1fff112c:	0bcc      	bt      	0x1fff10c4	// 1fff10c4 <_fpadd_parts+0x44>
1fff112e:	9820      	ld.w      	r1, (r14, 0x0)
1fff1130:	604c      	addu      	r1, r3
1fff1132:	6cc7      	mov      	r3, r1
1fff1134:	b223      	st.w      	r1, (r2, 0xc)
1fff1136:	3bdf      	btsti      	r3, 31
1fff1138:	3103      	movi      	r1, 3
1fff113a:	b201      	st.w      	r0, (r2, 0x4)
1fff113c:	b2a2      	st.w      	r5, (r2, 0x8)
1fff113e:	b220      	st.w      	r1, (r2, 0x0)
1fff1140:	0fe1      	bf      	0x1fff1102	// 1fff1102 <_fpadd_parts+0x82>
1fff1142:	4b21      	lsri      	r1, r3, 1
1fff1144:	e4632001 	andi      	r3, r3, 1
1fff1148:	6cc4      	or      	r3, r1
1fff114a:	b263      	st.w      	r3, (r2, 0xc)
1fff114c:	6c0b      	mov      	r0, r2
1fff114e:	9262      	ld.w      	r3, (r2, 0x8)
1fff1150:	2300      	addi      	r3, 1
1fff1152:	b262      	st.w      	r3, (r2, 0x8)
1fff1154:	1401      	addi      	r14, r14, 4
1fff1156:	1484      	pop      	r4-r7
1fff1158:	3b42      	cmpnei      	r3, 2
1fff115a:	0bd5      	bt      	0x1fff1104	// 1fff1104 <_fpadd_parts+0x84>
1fff115c:	b260      	st.w      	r3, (r2, 0x0)
1fff115e:	9061      	ld.w      	r3, (r0, 0x4)
1fff1160:	b261      	st.w      	r3, (r2, 0x4)
1fff1162:	9062      	ld.w      	r3, (r0, 0x8)
1fff1164:	9121      	ld.w      	r1, (r1, 0x4)
1fff1166:	b262      	st.w      	r3, (r2, 0x8)
1fff1168:	9063      	ld.w      	r3, (r0, 0xc)
1fff116a:	b263      	st.w      	r3, (r2, 0xc)
1fff116c:	9061      	ld.w      	r3, (r0, 0x4)
1fff116e:	68c4      	and      	r3, r1
1fff1170:	b261      	st.w      	r3, (r2, 0x4)
1fff1172:	6c0b      	mov      	r0, r2
1fff1174:	07c8      	br      	0x1fff1104	// 1fff1104 <_fpadd_parts+0x84>
1fff1176:	3400      	movi      	r4, 0
1fff1178:	6d5f      	mov      	r5, r7
1fff117a:	b880      	st.w      	r4, (r14, 0x0)
1fff117c:	07a0      	br      	0x1fff10bc	// 1fff10bc <_fpadd_parts+0x3c>
1fff117e:	3c44      	cmpnei      	r4, 4
1fff1180:	0bc2      	bt      	0x1fff1104	// 1fff1104 <_fpadd_parts+0x84>
1fff1182:	9041      	ld.w      	r2, (r0, 0x4)
1fff1184:	9161      	ld.w      	r3, (r1, 0x4)
1fff1186:	64ca      	cmpne      	r2, r3
1fff1188:	1050      	lrw      	r2, 0x1fff3438	// 1fff11c8 <_fpadd_parts+0x148>
1fff118a:	c4020c40 	inct      	r0, r2, 0
1fff118e:	07bb      	br      	0x1fff1104	// 1fff1104 <_fpadd_parts+0x84>
1fff1190:	3600      	movi      	r6, 0
1fff1192:	6192      	subu      	r6, r4
1fff1194:	078f      	br      	0x1fff10b2	// 1fff10b2 <_fpadd_parts+0x32>
1fff1196:	3101      	movi      	r1, 1
1fff1198:	b2a2      	st.w      	r5, (r2, 0x8)
1fff119a:	b221      	st.w      	r1, (r2, 0x4)
1fff119c:	3100      	movi      	r1, 0
1fff119e:	596d      	subu      	r3, r1, r3
1fff11a0:	b263      	st.w      	r3, (r2, 0xc)
1fff11a2:	079d      	br      	0x1fff10dc	// 1fff10dc <_fpadd_parts+0x5c>
1fff11a4:	3c40      	cmpnei      	r4, 0
1fff11a6:	0f8b      	bf      	0x1fff10bc	// 1fff10bc <_fpadd_parts+0x3c>
1fff11a8:	9880      	ld.w      	r4, (r14, 0x0)
1fff11aa:	c4c44047 	lsr      	r7, r4, r6
1fff11ae:	3401      	movi      	r4, 1
1fff11b0:	7118      	lsl      	r4, r6
1fff11b2:	6158      	addu      	r5, r6
1fff11b4:	98c0      	ld.w      	r6, (r14, 0x0)
1fff11b6:	2c00      	subi      	r4, 1
1fff11b8:	6918      	and      	r4, r6
1fff11ba:	3c40      	cmpnei      	r4, 0
1fff11bc:	c4000504 	mvc      	r4
1fff11c0:	6d1c      	or      	r4, r7
1fff11c2:	b880      	st.w      	r4, (r14, 0x0)
1fff11c4:	077c      	br      	0x1fff10bc	// 1fff10bc <_fpadd_parts+0x3c>
1fff11c6:	0000      	bkpt
1fff11c8:	1fff3438 	.long	0x1fff3438

1fff11cc <__addsf3>:
1fff11cc:	14d0      	push      	r15
1fff11ce:	142e      	subi      	r14, r14, 56
1fff11d0:	b800      	st.w      	r0, (r14, 0x0)
1fff11d2:	6c3b      	mov      	r0, r14
1fff11d4:	b821      	st.w      	r1, (r14, 0x4)
1fff11d6:	1902      	addi      	r1, r14, 8
1fff11d8:	e0000458 	bsr      	0x1fff1a88	// 1fff1a88 <__unpack_f>
1fff11dc:	1906      	addi      	r1, r14, 24
1fff11de:	1801      	addi      	r0, r14, 4
1fff11e0:	e0000454 	bsr      	0x1fff1a88	// 1fff1a88 <__unpack_f>
1fff11e4:	1a0a      	addi      	r2, r14, 40
1fff11e6:	1906      	addi      	r1, r14, 24
1fff11e8:	1802      	addi      	r0, r14, 8
1fff11ea:	e3ffff4b 	bsr      	0x1fff1080	// 1fff1080 <_fpadd_parts>
1fff11ee:	e00003dd 	bsr      	0x1fff19a8	// 1fff19a8 <__pack_f>
1fff11f2:	140e      	addi      	r14, r14, 56
1fff11f4:	1490      	pop      	r15
	...

1fff11f8 <__subsf3>:
1fff11f8:	14d0      	push      	r15
1fff11fa:	142e      	subi      	r14, r14, 56
1fff11fc:	b800      	st.w      	r0, (r14, 0x0)
1fff11fe:	6c3b      	mov      	r0, r14
1fff1200:	b821      	st.w      	r1, (r14, 0x4)
1fff1202:	1902      	addi      	r1, r14, 8
1fff1204:	e0000442 	bsr      	0x1fff1a88	// 1fff1a88 <__unpack_f>
1fff1208:	1906      	addi      	r1, r14, 24
1fff120a:	1801      	addi      	r0, r14, 4
1fff120c:	e000043e 	bsr      	0x1fff1a88	// 1fff1a88 <__unpack_f>
1fff1210:	9867      	ld.w      	r3, (r14, 0x1c)
1fff1212:	e4634001 	xori      	r3, r3, 1
1fff1216:	b867      	st.w      	r3, (r14, 0x1c)
1fff1218:	1a0a      	addi      	r2, r14, 40
1fff121a:	1906      	addi      	r1, r14, 24
1fff121c:	1802      	addi      	r0, r14, 8
1fff121e:	e3ffff31 	bsr      	0x1fff1080	// 1fff1080 <_fpadd_parts>
1fff1222:	e00003c3 	bsr      	0x1fff19a8	// 1fff19a8 <__pack_f>
1fff1226:	140e      	addi      	r14, r14, 56
1fff1228:	1490      	pop      	r15
	...

1fff122c <__mulsf3>:
1fff122c:	14d3      	push      	r4-r6, r15
1fff122e:	142e      	subi      	r14, r14, 56
1fff1230:	b800      	st.w      	r0, (r14, 0x0)
1fff1232:	6c3b      	mov      	r0, r14
1fff1234:	b821      	st.w      	r1, (r14, 0x4)
1fff1236:	1902      	addi      	r1, r14, 8
1fff1238:	e0000428 	bsr      	0x1fff1a88	// 1fff1a88 <__unpack_f>
1fff123c:	1906      	addi      	r1, r14, 24
1fff123e:	1801      	addi      	r0, r14, 4
1fff1240:	e0000424 	bsr      	0x1fff1a88	// 1fff1a88 <__unpack_f>
1fff1244:	9862      	ld.w      	r3, (r14, 0x8)
1fff1246:	3b01      	cmphsi      	r3, 2
1fff1248:	0c4a      	bf      	0x1fff12dc	// 1fff12dc <__mulsf3+0xb0>
1fff124a:	9846      	ld.w      	r2, (r14, 0x18)
1fff124c:	3a01      	cmphsi      	r2, 2
1fff124e:	0c3a      	bf      	0x1fff12c2	// 1fff12c2 <__mulsf3+0x96>
1fff1250:	3b44      	cmpnei      	r3, 4
1fff1252:	0c43      	bf      	0x1fff12d8	// 1fff12d8 <__mulsf3+0xac>
1fff1254:	3a44      	cmpnei      	r2, 4
1fff1256:	0c34      	bf      	0x1fff12be	// 1fff12be <__mulsf3+0x92>
1fff1258:	3b42      	cmpnei      	r3, 2
1fff125a:	0c41      	bf      	0x1fff12dc	// 1fff12dc <__mulsf3+0xb0>
1fff125c:	3a42      	cmpnei      	r2, 2
1fff125e:	0c32      	bf      	0x1fff12c2	// 1fff12c2 <__mulsf3+0x96>
1fff1260:	9865      	ld.w      	r3, (r14, 0x14)
1fff1262:	6d0f      	mov      	r4, r3
1fff1264:	9869      	ld.w      	r3, (r14, 0x24)
1fff1266:	6c8f      	mov      	r2, r3
1fff1268:	6c13      	mov      	r0, r4
1fff126a:	3300      	movi      	r3, 0
1fff126c:	3100      	movi      	r1, 0
1fff126e:	e000037b 	bsr      	0x1fff1964	// 1fff1964 <__muldi3>
1fff1272:	98a4      	ld.w      	r5, (r14, 0x10)
1fff1274:	9848      	ld.w      	r2, (r14, 0x20)
1fff1276:	98c3      	ld.w      	r6, (r14, 0xc)
1fff1278:	6094      	addu      	r2, r5
1fff127a:	5aa6      	addi      	r5, r2, 2
1fff127c:	b8ac      	st.w      	r5, (r14, 0x30)
1fff127e:	98a7      	ld.w      	r5, (r14, 0x1c)
1fff1280:	6cc7      	mov      	r3, r1
1fff1282:	655a      	cmpne      	r6, r5
1fff1284:	c4000505 	mvc      	r5
1fff1288:	39df      	btsti      	r1, 31
1fff128a:	6d03      	mov      	r4, r0
1fff128c:	b8ab      	st.w      	r5, (r14, 0x2c)
1fff128e:	0c3f      	bf      	0x1fff130c	// 1fff130c <__mulsf3+0xe0>
1fff1290:	e4612001 	andi      	r3, r1, 1
1fff1294:	2202      	addi      	r2, 3
1fff1296:	3b40      	cmpnei      	r3, 0
1fff1298:	0810      	bt      	0x1fff12b8	// 1fff12b8 <__mulsf3+0x8c>
1fff129a:	4961      	lsri      	r3, r1, 1
1fff129c:	b84c      	st.w      	r2, (r14, 0x30)
1fff129e:	e443207f 	andi      	r2, r3, 127
1fff12a2:	eb420040 	cmpnei      	r2, 64
1fff12a6:	0c26      	bf      	0x1fff12f2	// 1fff12f2 <__mulsf3+0xc6>
1fff12a8:	b86d      	st.w      	r3, (r14, 0x34)
1fff12aa:	3303      	movi      	r3, 3
1fff12ac:	180a      	addi      	r0, r14, 40
1fff12ae:	b86a      	st.w      	r3, (r14, 0x28)
1fff12b0:	e000037c 	bsr      	0x1fff19a8	// 1fff19a8 <__pack_f>
1fff12b4:	140e      	addi      	r14, r14, 56
1fff12b6:	1493      	pop      	r4-r6, r15
1fff12b8:	4881      	lsri      	r4, r0, 1
1fff12ba:	3cbf      	bseti      	r4, 31
1fff12bc:	07ef      	br      	0x1fff129a	// 1fff129a <__mulsf3+0x6e>
1fff12be:	3b42      	cmpnei      	r3, 2
1fff12c0:	0c24      	bf      	0x1fff1308	// 1fff1308 <__mulsf3+0xdc>
1fff12c2:	9867      	ld.w      	r3, (r14, 0x1c)
1fff12c4:	9843      	ld.w      	r2, (r14, 0xc)
1fff12c6:	1806      	addi      	r0, r14, 24
1fff12c8:	64ca      	cmpne      	r2, r3
1fff12ca:	c4000503 	mvc      	r3
1fff12ce:	b867      	st.w      	r3, (r14, 0x1c)
1fff12d0:	e000036c 	bsr      	0x1fff19a8	// 1fff19a8 <__pack_f>
1fff12d4:	140e      	addi      	r14, r14, 56
1fff12d6:	1493      	pop      	r4-r6, r15
1fff12d8:	3a42      	cmpnei      	r2, 2
1fff12da:	0c17      	bf      	0x1fff1308	// 1fff1308 <__mulsf3+0xdc>
1fff12dc:	9843      	ld.w      	r2, (r14, 0xc)
1fff12de:	9867      	ld.w      	r3, (r14, 0x1c)
1fff12e0:	1802      	addi      	r0, r14, 8
1fff12e2:	64ca      	cmpne      	r2, r3
1fff12e4:	c4000503 	mvc      	r3
1fff12e8:	b863      	st.w      	r3, (r14, 0xc)
1fff12ea:	e000035f 	bsr      	0x1fff19a8	// 1fff19a8 <__pack_f>
1fff12ee:	140e      	addi      	r14, r14, 56
1fff12f0:	1493      	pop      	r4-r6, r15
1fff12f2:	e4232080 	andi      	r1, r3, 128
1fff12f6:	3940      	cmpnei      	r1, 0
1fff12f8:	0bd8      	bt      	0x1fff12a8	// 1fff12a8 <__mulsf3+0x7c>
1fff12fa:	3c40      	cmpnei      	r4, 0
1fff12fc:	0fd6      	bf      	0x1fff12a8	// 1fff12a8 <__mulsf3+0x7c>
1fff12fe:	60c8      	addu      	r3, r2
1fff1300:	3200      	movi      	r2, 0
1fff1302:	2a7f      	subi      	r2, 128
1fff1304:	68c8      	and      	r3, r2
1fff1306:	07d1      	br      	0x1fff12a8	// 1fff12a8 <__mulsf3+0x7c>
1fff1308:	100b      	lrw      	r0, 0x1fff3438	// 1fff1334 <__mulsf3+0x108>
1fff130a:	07d3      	br      	0x1fff12b0	// 1fff12b0 <__mulsf3+0x84>
1fff130c:	c7a05020 	bmaski      	r0, 30
1fff1310:	6440      	cmphs      	r0, r1
1fff1312:	0fc6      	bf      	0x1fff129e	// 1fff129e <__mulsf3+0x72>
1fff1314:	3501      	movi      	r5, 1
1fff1316:	5a22      	addi      	r1, r2, 1
1fff1318:	4361      	lsli      	r3, r3, 1
1fff131a:	3cdf      	btsti      	r4, 31
1fff131c:	6c8f      	mov      	r2, r3
1fff131e:	6cd4      	or      	r3, r5
1fff1320:	c4620c20 	incf      	r3, r2, 0
1fff1324:	6d87      	mov      	r6, r1
1fff1326:	64c0      	cmphs      	r0, r3
1fff1328:	4481      	lsli      	r4, r4, 1
1fff132a:	2900      	subi      	r1, 1
1fff132c:	0bf6      	bt      	0x1fff1318	// 1fff1318 <__mulsf3+0xec>
1fff132e:	b8cc      	st.w      	r6, (r14, 0x30)
1fff1330:	07b7      	br      	0x1fff129e	// 1fff129e <__mulsf3+0x72>
1fff1332:	0000      	bkpt
1fff1334:	1fff3438 	.long	0x1fff3438

1fff1338 <__divsf3>:
1fff1338:	14d1      	push      	r4, r15
1fff133a:	142a      	subi      	r14, r14, 40
1fff133c:	b800      	st.w      	r0, (r14, 0x0)
1fff133e:	6c3b      	mov      	r0, r14
1fff1340:	b821      	st.w      	r1, (r14, 0x4)
1fff1342:	1902      	addi      	r1, r14, 8
1fff1344:	e00003a2 	bsr      	0x1fff1a88	// 1fff1a88 <__unpack_f>
1fff1348:	1906      	addi      	r1, r14, 24
1fff134a:	1801      	addi      	r0, r14, 4
1fff134c:	e000039e 	bsr      	0x1fff1a88	// 1fff1a88 <__unpack_f>
1fff1350:	9862      	ld.w      	r3, (r14, 0x8)
1fff1352:	3b01      	cmphsi      	r3, 2
1fff1354:	0c2b      	bf      	0x1fff13aa	// 1fff13aa <__divsf3+0x72>
1fff1356:	9826      	ld.w      	r1, (r14, 0x18)
1fff1358:	3901      	cmphsi      	r1, 2
1fff135a:	0c49      	bf      	0x1fff13ec	// 1fff13ec <__divsf3+0xb4>
1fff135c:	9843      	ld.w      	r2, (r14, 0xc)
1fff135e:	9807      	ld.w      	r0, (r14, 0x1c)
1fff1360:	3b44      	cmpnei      	r3, 4
1fff1362:	6c81      	xor      	r2, r0
1fff1364:	b843      	st.w      	r2, (r14, 0xc)
1fff1366:	0c27      	bf      	0x1fff13b4	// 1fff13b4 <__divsf3+0x7c>
1fff1368:	3b42      	cmpnei      	r3, 2
1fff136a:	0c25      	bf      	0x1fff13b4	// 1fff13b4 <__divsf3+0x7c>
1fff136c:	3944      	cmpnei      	r1, 4
1fff136e:	0c2b      	bf      	0x1fff13c4	// 1fff13c4 <__divsf3+0x8c>
1fff1370:	3942      	cmpnei      	r1, 2
1fff1372:	0c39      	bf      	0x1fff13e4	// 1fff13e4 <__divsf3+0xac>
1fff1374:	9844      	ld.w      	r2, (r14, 0x10)
1fff1376:	9868      	ld.w      	r3, (r14, 0x20)
1fff1378:	9809      	ld.w      	r0, (r14, 0x24)
1fff137a:	608e      	subu      	r2, r3
1fff137c:	9865      	ld.w      	r3, (r14, 0x14)
1fff137e:	b844      	st.w      	r2, (r14, 0x10)
1fff1380:	640c      	cmphs      	r3, r0
1fff1382:	0c1d      	bf      	0x1fff13bc	// 1fff13bc <__divsf3+0x84>
1fff1384:	321f      	movi      	r2, 31
1fff1386:	3400      	movi      	r4, 0
1fff1388:	ea214000 	movih      	r1, 16384
1fff138c:	640c      	cmphs      	r3, r0
1fff138e:	0c03      	bf      	0x1fff1394	// 1fff1394 <__divsf3+0x5c>
1fff1390:	6d04      	or      	r4, r1
1fff1392:	60c2      	subu      	r3, r0
1fff1394:	2a00      	subi      	r2, 1
1fff1396:	3a40      	cmpnei      	r2, 0
1fff1398:	4921      	lsri      	r1, r1, 1
1fff139a:	4361      	lsli      	r3, r3, 1
1fff139c:	0bf8      	bt      	0x1fff138c	// 1fff138c <__divsf3+0x54>
1fff139e:	e444207f 	andi      	r2, r4, 127
1fff13a2:	eb420040 	cmpnei      	r2, 64
1fff13a6:	0c14      	bf      	0x1fff13ce	// 1fff13ce <__divsf3+0x96>
1fff13a8:	b885      	st.w      	r4, (r14, 0x14)
1fff13aa:	1802      	addi      	r0, r14, 8
1fff13ac:	e00002fe 	bsr      	0x1fff19a8	// 1fff19a8 <__pack_f>
1fff13b0:	140a      	addi      	r14, r14, 40
1fff13b2:	1491      	pop      	r4, r15
1fff13b4:	644e      	cmpne      	r3, r1
1fff13b6:	0bfa      	bt      	0x1fff13aa	// 1fff13aa <__divsf3+0x72>
1fff13b8:	100e      	lrw      	r0, 0x1fff3438	// 1fff13f0 <__divsf3+0xb8>
1fff13ba:	07f9      	br      	0x1fff13ac	// 1fff13ac <__divsf3+0x74>
1fff13bc:	2a00      	subi      	r2, 1
1fff13be:	4361      	lsli      	r3, r3, 1
1fff13c0:	b844      	st.w      	r2, (r14, 0x10)
1fff13c2:	07e1      	br      	0x1fff1384	// 1fff1384 <__divsf3+0x4c>
1fff13c4:	3300      	movi      	r3, 0
1fff13c6:	1802      	addi      	r0, r14, 8
1fff13c8:	b865      	st.w      	r3, (r14, 0x14)
1fff13ca:	b864      	st.w      	r3, (r14, 0x10)
1fff13cc:	07f0      	br      	0x1fff13ac	// 1fff13ac <__divsf3+0x74>
1fff13ce:	e4242080 	andi      	r1, r4, 128
1fff13d2:	3940      	cmpnei      	r1, 0
1fff13d4:	0bea      	bt      	0x1fff13a8	// 1fff13a8 <__divsf3+0x70>
1fff13d6:	3b40      	cmpnei      	r3, 0
1fff13d8:	0fe8      	bf      	0x1fff13a8	// 1fff13a8 <__divsf3+0x70>
1fff13da:	6108      	addu      	r4, r2
1fff13dc:	3300      	movi      	r3, 0
1fff13de:	2b7f      	subi      	r3, 128
1fff13e0:	690c      	and      	r4, r3
1fff13e2:	07e3      	br      	0x1fff13a8	// 1fff13a8 <__divsf3+0x70>
1fff13e4:	3304      	movi      	r3, 4
1fff13e6:	1802      	addi      	r0, r14, 8
1fff13e8:	b862      	st.w      	r3, (r14, 0x8)
1fff13ea:	07e1      	br      	0x1fff13ac	// 1fff13ac <__divsf3+0x74>
1fff13ec:	1806      	addi      	r0, r14, 24
1fff13ee:	07df      	br      	0x1fff13ac	// 1fff13ac <__divsf3+0x74>
1fff13f0:	1fff3438 	.long	0x1fff3438

1fff13f4 <__floatsisf>:
1fff13f4:	14d0      	push      	r15
1fff13f6:	1424      	subi      	r14, r14, 16
1fff13f8:	3303      	movi      	r3, 3
1fff13fa:	3840      	cmpnei      	r0, 0
1fff13fc:	b860      	st.w      	r3, (r14, 0x0)
1fff13fe:	487f      	lsri      	r3, r0, 31
1fff1400:	b861      	st.w      	r3, (r14, 0x4)
1fff1402:	0808      	bt      	0x1fff1412	// 1fff1412 <__floatsisf+0x1e>
1fff1404:	3302      	movi      	r3, 2
1fff1406:	b860      	st.w      	r3, (r14, 0x0)
1fff1408:	6c3b      	mov      	r0, r14
1fff140a:	e00002cf 	bsr      	0x1fff19a8	// 1fff19a8 <__pack_f>
1fff140e:	1404      	addi      	r14, r14, 16
1fff1410:	1490      	pop      	r15
1fff1412:	331e      	movi      	r3, 30
1fff1414:	38df      	btsti      	r0, 31
1fff1416:	b862      	st.w      	r3, (r14, 0x8)
1fff1418:	0c07      	bf      	0x1fff1426	// 1fff1426 <__floatsisf+0x32>
1fff141a:	ea238000 	movih      	r3, 32768
1fff141e:	64c2      	cmpne      	r0, r3
1fff1420:	0c10      	bf      	0x1fff1440	// 1fff1440 <__floatsisf+0x4c>
1fff1422:	3300      	movi      	r3, 0
1fff1424:	5b01      	subu      	r0, r3, r0
1fff1426:	c4007c43 	ff1      	r3, r0
1fff142a:	2b00      	subi      	r3, 1
1fff142c:	3b40      	cmpnei      	r3, 0
1fff142e:	0c07      	bf      	0x1fff143c	// 1fff143c <__floatsisf+0x48>
1fff1430:	700c      	lsl      	r0, r3
1fff1432:	321e      	movi      	r2, 30
1fff1434:	5a6d      	subu      	r3, r2, r3
1fff1436:	b803      	st.w      	r0, (r14, 0xc)
1fff1438:	b862      	st.w      	r3, (r14, 0x8)
1fff143a:	07e7      	br      	0x1fff1408	// 1fff1408 <__floatsisf+0x14>
1fff143c:	b803      	st.w      	r0, (r14, 0xc)
1fff143e:	07e5      	br      	0x1fff1408	// 1fff1408 <__floatsisf+0x14>
1fff1440:	ea20cf00 	movih      	r0, 52992
1fff1444:	07e5      	br      	0x1fff140e	// 1fff140e <__floatsisf+0x1a>
	...

1fff1448 <__fixsfsi>:
1fff1448:	14d0      	push      	r15
1fff144a:	1425      	subi      	r14, r14, 20
1fff144c:	1901      	addi      	r1, r14, 4
1fff144e:	b800      	st.w      	r0, (r14, 0x0)
1fff1450:	6c3b      	mov      	r0, r14
1fff1452:	e000031b 	bsr      	0x1fff1a88	// 1fff1a88 <__unpack_f>
1fff1456:	9861      	ld.w      	r3, (r14, 0x4)
1fff1458:	3b02      	cmphsi      	r3, 3
1fff145a:	0c1c      	bf      	0x1fff1492	// 1fff1492 <__fixsfsi+0x4a>
1fff145c:	3b44      	cmpnei      	r3, 4
1fff145e:	0c06      	bf      	0x1fff146a	// 1fff146a <__fixsfsi+0x22>
1fff1460:	9863      	ld.w      	r3, (r14, 0xc)
1fff1462:	3bdf      	btsti      	r3, 31
1fff1464:	0817      	bt      	0x1fff1492	// 1fff1492 <__fixsfsi+0x4a>
1fff1466:	3b3e      	cmplti      	r3, 31
1fff1468:	080a      	bt      	0x1fff147c	// 1fff147c <__fixsfsi+0x34>
1fff146a:	9862      	ld.w      	r3, (r14, 0x8)
1fff146c:	3b40      	cmpnei      	r3, 0
1fff146e:	c4000500 	mvc      	r0
1fff1472:	c7c05023 	bmaski      	r3, 31
1fff1476:	600c      	addu      	r0, r3
1fff1478:	1405      	addi      	r14, r14, 20
1fff147a:	1490      	pop      	r15
1fff147c:	301e      	movi      	r0, 30
1fff147e:	586d      	subu      	r3, r0, r3
1fff1480:	9804      	ld.w      	r0, (r14, 0x10)
1fff1482:	700d      	lsr      	r0, r3
1fff1484:	9862      	ld.w      	r3, (r14, 0x8)
1fff1486:	3b40      	cmpnei      	r3, 0
1fff1488:	0ff8      	bf      	0x1fff1478	// 1fff1478 <__fixsfsi+0x30>
1fff148a:	3300      	movi      	r3, 0
1fff148c:	5b01      	subu      	r0, r3, r0
1fff148e:	1405      	addi      	r14, r14, 20
1fff1490:	1490      	pop      	r15
1fff1492:	3000      	movi      	r0, 0
1fff1494:	1405      	addi      	r14, r14, 20
1fff1496:	1490      	pop      	r15

1fff1498 <__extendsfdf2>:
1fff1498:	14d1      	push      	r4, r15
1fff149a:	1426      	subi      	r14, r14, 24
1fff149c:	1902      	addi      	r1, r14, 8
1fff149e:	b801      	st.w      	r0, (r14, 0x4)
1fff14a0:	1801      	addi      	r0, r14, 4
1fff14a2:	e00002f3 	bsr      	0x1fff1a88	// 1fff1a88 <__unpack_f>
1fff14a6:	9865      	ld.w      	r3, (r14, 0x14)
1fff14a8:	4b82      	lsri      	r4, r3, 2
1fff14aa:	9844      	ld.w      	r2, (r14, 0x10)
1fff14ac:	437e      	lsli      	r3, r3, 30
1fff14ae:	9823      	ld.w      	r1, (r14, 0xc)
1fff14b0:	9802      	ld.w      	r0, (r14, 0x8)
1fff14b2:	b880      	st.w      	r4, (r14, 0x0)
1fff14b4:	e000022a 	bsr      	0x1fff1908	// 1fff1908 <__make_dp>
1fff14b8:	1406      	addi      	r14, r14, 24
1fff14ba:	1491      	pop      	r4, r15

1fff14bc <__floatunsisf>:
1fff14bc:	14d0      	push      	r15
1fff14be:	1424      	subi      	r14, r14, 16
1fff14c0:	3300      	movi      	r3, 0
1fff14c2:	3840      	cmpnei      	r0, 0
1fff14c4:	b861      	st.w      	r3, (r14, 0x4)
1fff14c6:	0c16      	bf      	0x1fff14f2	// 1fff14f2 <__floatunsisf+0x36>
1fff14c8:	3303      	movi      	r3, 3
1fff14ca:	c4007c42 	ff1      	r2, r0
1fff14ce:	b860      	st.w      	r3, (r14, 0x0)
1fff14d0:	3a40      	cmpnei      	r2, 0
1fff14d2:	331e      	movi      	r3, 30
1fff14d4:	b862      	st.w      	r3, (r14, 0x8)
1fff14d6:	5a63      	subi      	r3, r2, 1
1fff14d8:	0c14      	bf      	0x1fff1500	// 1fff1500 <__floatunsisf+0x44>
1fff14da:	3b40      	cmpnei      	r3, 0
1fff14dc:	0c1e      	bf      	0x1fff1518	// 1fff1518 <__floatunsisf+0x5c>
1fff14de:	700c      	lsl      	r0, r3
1fff14e0:	321e      	movi      	r2, 30
1fff14e2:	5a6d      	subu      	r3, r2, r3
1fff14e4:	b803      	st.w      	r0, (r14, 0xc)
1fff14e6:	b862      	st.w      	r3, (r14, 0x8)
1fff14e8:	6c3b      	mov      	r0, r14
1fff14ea:	e000025f 	bsr      	0x1fff19a8	// 1fff19a8 <__pack_f>
1fff14ee:	1404      	addi      	r14, r14, 16
1fff14f0:	1490      	pop      	r15
1fff14f2:	3302      	movi      	r3, 2
1fff14f4:	6c3b      	mov      	r0, r14
1fff14f6:	b860      	st.w      	r3, (r14, 0x0)
1fff14f8:	e0000258 	bsr      	0x1fff19a8	// 1fff19a8 <__pack_f>
1fff14fc:	1404      	addi      	r14, r14, 16
1fff14fe:	1490      	pop      	r15
1fff1500:	e4602001 	andi      	r3, r0, 1
1fff1504:	4801      	lsri      	r0, r0, 1
1fff1506:	6c0c      	or      	r0, r3
1fff1508:	b803      	st.w      	r0, (r14, 0xc)
1fff150a:	331f      	movi      	r3, 31
1fff150c:	6c3b      	mov      	r0, r14
1fff150e:	b862      	st.w      	r3, (r14, 0x8)
1fff1510:	e000024c 	bsr      	0x1fff19a8	// 1fff19a8 <__pack_f>
1fff1514:	1404      	addi      	r14, r14, 16
1fff1516:	1490      	pop      	r15
1fff1518:	b803      	st.w      	r0, (r14, 0xc)
1fff151a:	07e7      	br      	0x1fff14e8	// 1fff14e8 <__floatunsisf+0x2c>

1fff151c <__muldf3>:
1fff151c:	14d4      	push      	r4-r7, r15
1fff151e:	143b      	subi      	r14, r14, 108
1fff1520:	b86b      	st.w      	r3, (r14, 0x2c)
1fff1522:	b808      	st.w      	r0, (r14, 0x20)
1fff1524:	b829      	st.w      	r1, (r14, 0x24)
1fff1526:	b84a      	st.w      	r2, (r14, 0x28)
1fff1528:	190c      	addi      	r1, r14, 48
1fff152a:	1808      	addi      	r0, r14, 32
1fff152c:	e00003c4 	bsr      	0x1fff1cb4	// 1fff1cb4 <__unpack_d>
1fff1530:	1911      	addi      	r1, r14, 68
1fff1532:	180a      	addi      	r0, r14, 40
1fff1534:	e00003c0 	bsr      	0x1fff1cb4	// 1fff1cb4 <__unpack_d>
1fff1538:	986c      	ld.w      	r3, (r14, 0x30)
1fff153a:	3b01      	cmphsi      	r3, 2
1fff153c:	0cad      	bf      	0x1fff1696	// 1fff1696 <__muldf3+0x17a>
1fff153e:	9851      	ld.w      	r2, (r14, 0x44)
1fff1540:	3a01      	cmphsi      	r2, 2
1fff1542:	0c9d      	bf      	0x1fff167c	// 1fff167c <__muldf3+0x160>
1fff1544:	3b44      	cmpnei      	r3, 4
1fff1546:	0ca6      	bf      	0x1fff1692	// 1fff1692 <__muldf3+0x176>
1fff1548:	3a44      	cmpnei      	r2, 4
1fff154a:	0c97      	bf      	0x1fff1678	// 1fff1678 <__muldf3+0x15c>
1fff154c:	3b42      	cmpnei      	r3, 2
1fff154e:	0ca4      	bf      	0x1fff1696	// 1fff1696 <__muldf3+0x17a>
1fff1550:	3a42      	cmpnei      	r2, 2
1fff1552:	0c95      	bf      	0x1fff167c	// 1fff167c <__muldf3+0x160>
1fff1554:	98ef      	ld.w      	r7, (r14, 0x3c)
1fff1556:	98b4      	ld.w      	r5, (r14, 0x50)
1fff1558:	9875      	ld.w      	r3, (r14, 0x54)
1fff155a:	6d8f      	mov      	r6, r3
1fff155c:	6c9f      	mov      	r2, r7
1fff155e:	3300      	movi      	r3, 0
1fff1560:	6c17      	mov      	r0, r5
1fff1562:	3100      	movi      	r1, 0
1fff1564:	9890      	ld.w      	r4, (r14, 0x40)
1fff1566:	e00001ff 	bsr      	0x1fff1964	// 1fff1964 <__muldi3>
1fff156a:	6c9f      	mov      	r2, r7
1fff156c:	b804      	st.w      	r0, (r14, 0x10)
1fff156e:	b825      	st.w      	r1, (r14, 0x14)
1fff1570:	3300      	movi      	r3, 0
1fff1572:	6c1b      	mov      	r0, r6
1fff1574:	3100      	movi      	r1, 0
1fff1576:	b8c2      	st.w      	r6, (r14, 0x8)
1fff1578:	e00001f6 	bsr      	0x1fff1964	// 1fff1964 <__muldi3>
1fff157c:	6d83      	mov      	r6, r0
1fff157e:	6dc7      	mov      	r7, r1
1fff1580:	9842      	ld.w      	r2, (r14, 0x8)
1fff1582:	3300      	movi      	r3, 0
1fff1584:	6c13      	mov      	r0, r4
1fff1586:	3100      	movi      	r1, 0
1fff1588:	e00001ee 	bsr      	0x1fff1964	// 1fff1964 <__muldi3>
1fff158c:	6c97      	mov      	r2, r5
1fff158e:	b806      	st.w      	r0, (r14, 0x18)
1fff1590:	b827      	st.w      	r1, (r14, 0x1c)
1fff1592:	3300      	movi      	r3, 0
1fff1594:	6c13      	mov      	r0, r4
1fff1596:	3100      	movi      	r1, 0
1fff1598:	e00001e6 	bsr      	0x1fff1964	// 1fff1964 <__muldi3>
1fff159c:	6401      	cmplt      	r0, r0
1fff159e:	6019      	addc      	r0, r6
1fff15a0:	605d      	addc      	r1, r7
1fff15a2:	65c4      	cmphs      	r1, r7
1fff15a4:	0c91      	bf      	0x1fff16c6	// 1fff16c6 <__muldf3+0x1aa>
1fff15a6:	645e      	cmpne      	r7, r1
1fff15a8:	0c8d      	bf      	0x1fff16c2	// 1fff16c2 <__muldf3+0x1a6>
1fff15aa:	3300      	movi      	r3, 0
1fff15ac:	3400      	movi      	r4, 0
1fff15ae:	b862      	st.w      	r3, (r14, 0x8)
1fff15b0:	b883      	st.w      	r4, (r14, 0xc)
1fff15b2:	9884      	ld.w      	r4, (r14, 0x10)
1fff15b4:	98a5      	ld.w      	r5, (r14, 0x14)
1fff15b6:	3600      	movi      	r6, 0
1fff15b8:	6dc3      	mov      	r7, r0
1fff15ba:	6c93      	mov      	r2, r4
1fff15bc:	6cd7      	mov      	r3, r5
1fff15be:	6489      	cmplt      	r2, r2
1fff15c0:	6099      	addc      	r2, r6
1fff15c2:	60dd      	addc      	r3, r7
1fff15c4:	6d8b      	mov      	r6, r2
1fff15c6:	6dcf      	mov      	r7, r3
1fff15c8:	6c93      	mov      	r2, r4
1fff15ca:	6cd7      	mov      	r3, r5
1fff15cc:	64dc      	cmphs      	r7, r3
1fff15ce:	0c71      	bf      	0x1fff16b0	// 1fff16b0 <__muldf3+0x194>
1fff15d0:	65ce      	cmpne      	r3, r7
1fff15d2:	0c6d      	bf      	0x1fff16ac	// 1fff16ac <__muldf3+0x190>
1fff15d4:	6c87      	mov      	r2, r1
1fff15d6:	3300      	movi      	r3, 0
1fff15d8:	9806      	ld.w      	r0, (r14, 0x18)
1fff15da:	9827      	ld.w      	r1, (r14, 0x1c)
1fff15dc:	6401      	cmplt      	r0, r0
1fff15de:	6009      	addc      	r0, r2
1fff15e0:	604d      	addc      	r1, r3
1fff15e2:	6c83      	mov      	r2, r0
1fff15e4:	6cc7      	mov      	r3, r1
1fff15e6:	9802      	ld.w      	r0, (r14, 0x8)
1fff15e8:	9823      	ld.w      	r1, (r14, 0xc)
1fff15ea:	6401      	cmplt      	r0, r0
1fff15ec:	6009      	addc      	r0, r2
1fff15ee:	604d      	addc      	r1, r3
1fff15f0:	6c83      	mov      	r2, r0
1fff15f2:	6cc7      	mov      	r3, r1
1fff15f4:	988e      	ld.w      	r4, (r14, 0x38)
1fff15f6:	9833      	ld.w      	r1, (r14, 0x4c)
1fff15f8:	980d      	ld.w      	r0, (r14, 0x34)
1fff15fa:	6104      	addu      	r4, r1
1fff15fc:	5c2e      	addi      	r1, r4, 4
1fff15fe:	b838      	st.w      	r1, (r14, 0x60)
1fff1600:	9832      	ld.w      	r1, (r14, 0x48)
1fff1602:	c7805025 	bmaski      	r5, 29
1fff1606:	6442      	cmpne      	r0, r1
1fff1608:	c4000501 	mvc      	r1
1fff160c:	64d4      	cmphs      	r5, r3
1fff160e:	b837      	st.w      	r1, (r14, 0x5c)
1fff1610:	0877      	bt      	0x1fff16fe	// 1fff16fe <__muldf3+0x1e2>
1fff1612:	b8a4      	st.w      	r5, (r14, 0x10)
1fff1614:	2404      	addi      	r4, 5
1fff1616:	3001      	movi      	r0, 1
1fff1618:	3100      	movi      	r1, 0
1fff161a:	6808      	and      	r0, r2
1fff161c:	684c      	and      	r1, r3
1fff161e:	6c04      	or      	r0, r1
1fff1620:	b882      	st.w      	r4, (r14, 0x8)
1fff1622:	3840      	cmpnei      	r0, 0
1fff1624:	0c0e      	bf      	0x1fff1640	// 1fff1640 <__muldf3+0x124>
1fff1626:	473f      	lsli      	r1, r7, 31
1fff1628:	4e01      	lsri      	r0, r6, 1
1fff162a:	6c04      	or      	r0, r1
1fff162c:	4f21      	lsri      	r1, r7, 1
1fff162e:	b800      	st.w      	r0, (r14, 0x0)
1fff1630:	b821      	st.w      	r1, (r14, 0x4)
1fff1632:	3000      	movi      	r0, 0
1fff1634:	98c0      	ld.w      	r6, (r14, 0x0)
1fff1636:	98e1      	ld.w      	r7, (r14, 0x4)
1fff1638:	ea218000 	movih      	r1, 32768
1fff163c:	6d80      	or      	r6, r0
1fff163e:	6dc4      	or      	r7, r1
1fff1640:	4b21      	lsri      	r1, r3, 1
1fff1642:	43bf      	lsli      	r5, r3, 31
1fff1644:	6cc7      	mov      	r3, r1
1fff1646:	9824      	ld.w      	r1, (r14, 0x10)
1fff1648:	4a01      	lsri      	r0, r2, 1
1fff164a:	64c4      	cmphs      	r1, r3
1fff164c:	c4052422 	or      	r2, r5, r0
1fff1650:	2400      	addi      	r4, 1
1fff1652:	0fe2      	bf      	0x1fff1616	// 1fff1616 <__muldf3+0xfa>
1fff1654:	9822      	ld.w      	r1, (r14, 0x8)
1fff1656:	b838      	st.w      	r1, (r14, 0x60)
1fff1658:	30ff      	movi      	r0, 255
1fff165a:	3100      	movi      	r1, 0
1fff165c:	6808      	and      	r0, r2
1fff165e:	684c      	and      	r1, r3
1fff1660:	eb400080 	cmpnei      	r0, 128
1fff1664:	0c36      	bf      	0x1fff16d0	// 1fff16d0 <__muldf3+0x1b4>
1fff1666:	b859      	st.w      	r2, (r14, 0x64)
1fff1668:	b87a      	st.w      	r3, (r14, 0x68)
1fff166a:	3303      	movi      	r3, 3
1fff166c:	1816      	addi      	r0, r14, 88
1fff166e:	b876      	st.w      	r3, (r14, 0x58)
1fff1670:	e0000256 	bsr      	0x1fff1b1c	// 1fff1b1c <__pack_d>
1fff1674:	141b      	addi      	r14, r14, 108
1fff1676:	1494      	pop      	r4-r7, r15
1fff1678:	3b42      	cmpnei      	r3, 2
1fff167a:	0c40      	bf      	0x1fff16fa	// 1fff16fa <__muldf3+0x1de>
1fff167c:	9872      	ld.w      	r3, (r14, 0x48)
1fff167e:	984d      	ld.w      	r2, (r14, 0x34)
1fff1680:	1811      	addi      	r0, r14, 68
1fff1682:	64ca      	cmpne      	r2, r3
1fff1684:	c4000503 	mvc      	r3
1fff1688:	b872      	st.w      	r3, (r14, 0x48)
1fff168a:	e0000249 	bsr      	0x1fff1b1c	// 1fff1b1c <__pack_d>
1fff168e:	141b      	addi      	r14, r14, 108
1fff1690:	1494      	pop      	r4-r7, r15
1fff1692:	3a42      	cmpnei      	r2, 2
1fff1694:	0c33      	bf      	0x1fff16fa	// 1fff16fa <__muldf3+0x1de>
1fff1696:	984d      	ld.w      	r2, (r14, 0x34)
1fff1698:	9872      	ld.w      	r3, (r14, 0x48)
1fff169a:	180c      	addi      	r0, r14, 48
1fff169c:	64ca      	cmpne      	r2, r3
1fff169e:	c4000503 	mvc      	r3
1fff16a2:	b86d      	st.w      	r3, (r14, 0x34)
1fff16a4:	e000023c 	bsr      	0x1fff1b1c	// 1fff1b1c <__pack_d>
1fff16a8:	141b      	addi      	r14, r14, 108
1fff16aa:	1494      	pop      	r4-r7, r15
1fff16ac:	6498      	cmphs      	r6, r2
1fff16ae:	0b93      	bt      	0x1fff15d4	// 1fff15d4 <__muldf3+0xb8>
1fff16b0:	9862      	ld.w      	r3, (r14, 0x8)
1fff16b2:	9883      	ld.w      	r4, (r14, 0xc)
1fff16b4:	2300      	addi      	r3, 1
1fff16b6:	3b40      	cmpnei      	r3, 0
1fff16b8:	c4840c21 	incf      	r4, r4, 1
1fff16bc:	b862      	st.w      	r3, (r14, 0x8)
1fff16be:	b883      	st.w      	r4, (r14, 0xc)
1fff16c0:	078a      	br      	0x1fff15d4	// 1fff15d4 <__muldf3+0xb8>
1fff16c2:	6580      	cmphs      	r0, r6
1fff16c4:	0b73      	bt      	0x1fff15aa	// 1fff15aa <__muldf3+0x8e>
1fff16c6:	3300      	movi      	r3, 0
1fff16c8:	3401      	movi      	r4, 1
1fff16ca:	b862      	st.w      	r3, (r14, 0x8)
1fff16cc:	b883      	st.w      	r4, (r14, 0xc)
1fff16ce:	0772      	br      	0x1fff15b2	// 1fff15b2 <__muldf3+0x96>
1fff16d0:	3940      	cmpnei      	r1, 0
1fff16d2:	0bca      	bt      	0x1fff1666	// 1fff1666 <__muldf3+0x14a>
1fff16d4:	e4222100 	andi      	r1, r2, 256
1fff16d8:	3940      	cmpnei      	r1, 0
1fff16da:	0bc6      	bt      	0x1fff1666	// 1fff1666 <__muldf3+0x14a>
1fff16dc:	c4e62421 	or      	r1, r6, r7
1fff16e0:	3940      	cmpnei      	r1, 0
1fff16e2:	0fc2      	bf      	0x1fff1666	// 1fff1666 <__muldf3+0x14a>
1fff16e4:	3080      	movi      	r0, 128
1fff16e6:	3100      	movi      	r1, 0
1fff16e8:	6401      	cmplt      	r0, r0
1fff16ea:	6009      	addc      	r0, r2
1fff16ec:	604d      	addc      	r1, r3
1fff16ee:	3400      	movi      	r4, 0
1fff16f0:	6cc7      	mov      	r3, r1
1fff16f2:	2cff      	subi      	r4, 256
1fff16f4:	c4802022 	and      	r2, r0, r4
1fff16f8:	07b7      	br      	0x1fff1666	// 1fff1666 <__muldf3+0x14a>
1fff16fa:	1013      	lrw      	r0, 0x1fff3448	// 1fff1744 <__muldf3+0x228>
1fff16fc:	07ba      	br      	0x1fff1670	// 1fff1670 <__muldf3+0x154>
1fff16fe:	c7605020 	bmaski      	r0, 28
1fff1702:	64c0      	cmphs      	r0, r3
1fff1704:	0faa      	bf      	0x1fff1658	// 1fff1658 <__muldf3+0x13c>
1fff1706:	b802      	st.w      	r0, (r14, 0x8)
1fff1708:	5c2a      	addi      	r1, r4, 3
1fff170a:	3fdf      	btsti      	r7, 31
1fff170c:	4a9f      	lsri      	r4, r2, 31
1fff170e:	4301      	lsli      	r0, r3, 1
1fff1710:	42a1      	lsli      	r5, r2, 1
1fff1712:	b820      	st.w      	r1, (r14, 0x0)
1fff1714:	6c97      	mov      	r2, r5
1fff1716:	c4042423 	or      	r3, r4, r0
1fff171a:	0c07      	bf      	0x1fff1728	// 1fff1728 <__muldf3+0x20c>
1fff171c:	3401      	movi      	r4, 1
1fff171e:	3500      	movi      	r5, 0
1fff1720:	6d08      	or      	r4, r2
1fff1722:	6d4c      	or      	r5, r3
1fff1724:	6c93      	mov      	r2, r4
1fff1726:	6cd7      	mov      	r3, r5
1fff1728:	4e9f      	lsri      	r4, r6, 31
1fff172a:	4701      	lsli      	r0, r7, 1
1fff172c:	c4042427 	or      	r7, r4, r0
1fff1730:	9802      	ld.w      	r0, (r14, 0x8)
1fff1732:	46a1      	lsli      	r5, r6, 1
1fff1734:	64c0      	cmphs      	r0, r3
1fff1736:	6d97      	mov      	r6, r5
1fff1738:	2900      	subi      	r1, 1
1fff173a:	0be8      	bt      	0x1fff170a	// 1fff170a <__muldf3+0x1ee>
1fff173c:	9820      	ld.w      	r1, (r14, 0x0)
1fff173e:	b838      	st.w      	r1, (r14, 0x60)
1fff1740:	078c      	br      	0x1fff1658	// 1fff1658 <__muldf3+0x13c>
1fff1742:	0000      	bkpt
1fff1744:	1fff3448 	.long	0x1fff3448

1fff1748 <__divdf3>:
1fff1748:	14d4      	push      	r4-r7, r15
1fff174a:	1432      	subi      	r14, r14, 72
1fff174c:	b867      	st.w      	r3, (r14, 0x1c)
1fff174e:	b804      	st.w      	r0, (r14, 0x10)
1fff1750:	b825      	st.w      	r1, (r14, 0x14)
1fff1752:	b846      	st.w      	r2, (r14, 0x18)
1fff1754:	1908      	addi      	r1, r14, 32
1fff1756:	1804      	addi      	r0, r14, 16
1fff1758:	e00002ae 	bsr      	0x1fff1cb4	// 1fff1cb4 <__unpack_d>
1fff175c:	190d      	addi      	r1, r14, 52
1fff175e:	1806      	addi      	r0, r14, 24
1fff1760:	e00002aa 	bsr      	0x1fff1cb4	// 1fff1cb4 <__unpack_d>
1fff1764:	9868      	ld.w      	r3, (r14, 0x20)
1fff1766:	3b01      	cmphsi      	r3, 2
1fff1768:	0c6a      	bf      	0x1fff183c	// 1fff183c <__divdf3+0xf4>
1fff176a:	982d      	ld.w      	r1, (r14, 0x34)
1fff176c:	3901      	cmphsi      	r1, 2
1fff176e:	0c95      	bf      	0x1fff1898	// 1fff1898 <__divdf3+0x150>
1fff1770:	9849      	ld.w      	r2, (r14, 0x24)
1fff1772:	980e      	ld.w      	r0, (r14, 0x38)
1fff1774:	3b44      	cmpnei      	r3, 4
1fff1776:	6c81      	xor      	r2, r0
1fff1778:	b849      	st.w      	r2, (r14, 0x24)
1fff177a:	0c66      	bf      	0x1fff1846	// 1fff1846 <__divdf3+0xfe>
1fff177c:	3b42      	cmpnei      	r3, 2
1fff177e:	0c64      	bf      	0x1fff1846	// 1fff1846 <__divdf3+0xfe>
1fff1780:	3944      	cmpnei      	r1, 4
1fff1782:	0c66      	bf      	0x1fff184e	// 1fff184e <__divdf3+0x106>
1fff1784:	3942      	cmpnei      	r1, 2
1fff1786:	0c85      	bf      	0x1fff1890	// 1fff1890 <__divdf3+0x148>
1fff1788:	982a      	ld.w      	r1, (r14, 0x28)
1fff178a:	986f      	ld.w      	r3, (r14, 0x3c)
1fff178c:	9890      	ld.w      	r4, (r14, 0x40)
1fff178e:	98b1      	ld.w      	r5, (r14, 0x44)
1fff1790:	604e      	subu      	r1, r3
1fff1792:	984b      	ld.w      	r2, (r14, 0x2c)
1fff1794:	986c      	ld.w      	r3, (r14, 0x30)
1fff1796:	b82a      	st.w      	r1, (r14, 0x28)
1fff1798:	654c      	cmphs      	r3, r5
1fff179a:	6d93      	mov      	r6, r4
1fff179c:	6dd7      	mov      	r7, r5
1fff179e:	0c05      	bf      	0x1fff17a8	// 1fff17a8 <__divdf3+0x60>
1fff17a0:	64d6      	cmpne      	r5, r3
1fff17a2:	080b      	bt      	0x1fff17b8	// 1fff17b8 <__divdf3+0x70>
1fff17a4:	6508      	cmphs      	r2, r4
1fff17a6:	0809      	bt      	0x1fff17b8	// 1fff17b8 <__divdf3+0x70>
1fff17a8:	4a9f      	lsri      	r4, r2, 31
1fff17aa:	4301      	lsli      	r0, r3, 1
1fff17ac:	42a1      	lsli      	r5, r2, 1
1fff17ae:	2900      	subi      	r1, 1
1fff17b0:	6c97      	mov      	r2, r5
1fff17b2:	c4042423 	or      	r3, r4, r0
1fff17b6:	b82a      	st.w      	r1, (r14, 0x28)
1fff17b8:	3000      	movi      	r0, 0
1fff17ba:	3100      	movi      	r1, 0
1fff17bc:	343d      	movi      	r4, 61
1fff17be:	b802      	st.w      	r0, (r14, 0x8)
1fff17c0:	b823      	st.w      	r1, (r14, 0xc)
1fff17c2:	b8c0      	st.w      	r6, (r14, 0x0)
1fff17c4:	b8e1      	st.w      	r7, (r14, 0x4)
1fff17c6:	3000      	movi      	r0, 0
1fff17c8:	ea211000 	movih      	r1, 4096
1fff17cc:	98a0      	ld.w      	r5, (r14, 0x0)
1fff17ce:	98c1      	ld.w      	r6, (r14, 0x4)
1fff17d0:	658c      	cmphs      	r3, r6
1fff17d2:	0c14      	bf      	0x1fff17fa	// 1fff17fa <__divdf3+0xb2>
1fff17d4:	64da      	cmpne      	r6, r3
1fff17d6:	0803      	bt      	0x1fff17dc	// 1fff17dc <__divdf3+0x94>
1fff17d8:	6548      	cmphs      	r2, r5
1fff17da:	0c10      	bf      	0x1fff17fa	// 1fff17fa <__divdf3+0xb2>
1fff17dc:	98a2      	ld.w      	r5, (r14, 0x8)
1fff17de:	98c3      	ld.w      	r6, (r14, 0xc)
1fff17e0:	6d40      	or      	r5, r0
1fff17e2:	6d84      	or      	r6, r1
1fff17e4:	b8a2      	st.w      	r5, (r14, 0x8)
1fff17e6:	b8c3      	st.w      	r6, (r14, 0xc)
1fff17e8:	98a0      	ld.w      	r5, (r14, 0x0)
1fff17ea:	98c1      	ld.w      	r6, (r14, 0x4)
1fff17ec:	6554      	cmphs      	r5, r5
1fff17ee:	c4a20105 	subc      	r5, r2, r5
1fff17f2:	c4c30106 	subc      	r6, r3, r6
1fff17f6:	6c97      	mov      	r2, r5
1fff17f8:	6cdb      	mov      	r3, r6
1fff17fa:	41bf      	lsli      	r5, r1, 31
1fff17fc:	6d97      	mov      	r6, r5
1fff17fe:	49a1      	lsri      	r5, r1, 1
1fff1800:	48e1      	lsri      	r7, r0, 1
1fff1802:	6c57      	mov      	r1, r5
1fff1804:	2c00      	subi      	r4, 1
1fff1806:	4abf      	lsri      	r5, r2, 31
1fff1808:	3c40      	cmpnei      	r4, 0
1fff180a:	c4e62420 	or      	r0, r6, r7
1fff180e:	6d97      	mov      	r6, r5
1fff1810:	43a1      	lsli      	r5, r3, 1
1fff1812:	4261      	lsli      	r3, r2, 1
1fff1814:	6dcf      	mov      	r7, r3
1fff1816:	6c8f      	mov      	r2, r3
1fff1818:	c4a62423 	or      	r3, r6, r5
1fff181c:	0bd8      	bt      	0x1fff17cc	// 1fff17cc <__divdf3+0x84>
1fff181e:	30ff      	movi      	r0, 255
1fff1820:	3100      	movi      	r1, 0
1fff1822:	9882      	ld.w      	r4, (r14, 0x8)
1fff1824:	98a3      	ld.w      	r5, (r14, 0xc)
1fff1826:	6900      	and      	r4, r0
1fff1828:	6944      	and      	r5, r1
1fff182a:	6c13      	mov      	r0, r4
1fff182c:	6c57      	mov      	r1, r5
1fff182e:	eb440080 	cmpnei      	r4, 128
1fff1832:	0c15      	bf      	0x1fff185c	// 1fff185c <__divdf3+0x114>
1fff1834:	9862      	ld.w      	r3, (r14, 0x8)
1fff1836:	9883      	ld.w      	r4, (r14, 0xc)
1fff1838:	b86b      	st.w      	r3, (r14, 0x2c)
1fff183a:	b88c      	st.w      	r4, (r14, 0x30)
1fff183c:	1808      	addi      	r0, r14, 32
1fff183e:	e000016f 	bsr      	0x1fff1b1c	// 1fff1b1c <__pack_d>
1fff1842:	1412      	addi      	r14, r14, 72
1fff1844:	1494      	pop      	r4-r7, r15
1fff1846:	644e      	cmpne      	r3, r1
1fff1848:	0bfa      	bt      	0x1fff183c	// 1fff183c <__divdf3+0xf4>
1fff184a:	1015      	lrw      	r0, 0x1fff3448	// 1fff189c <__divdf3+0x154>
1fff184c:	07f9      	br      	0x1fff183e	// 1fff183e <__divdf3+0xf6>
1fff184e:	3300      	movi      	r3, 0
1fff1850:	3400      	movi      	r4, 0
1fff1852:	b86a      	st.w      	r3, (r14, 0x28)
1fff1854:	b86b      	st.w      	r3, (r14, 0x2c)
1fff1856:	b88c      	st.w      	r4, (r14, 0x30)
1fff1858:	1808      	addi      	r0, r14, 32
1fff185a:	07f2      	br      	0x1fff183e	// 1fff183e <__divdf3+0xf6>
1fff185c:	3940      	cmpnei      	r1, 0
1fff185e:	0beb      	bt      	0x1fff1834	// 1fff1834 <__divdf3+0xec>
1fff1860:	9882      	ld.w      	r4, (r14, 0x8)
1fff1862:	98a3      	ld.w      	r5, (r14, 0xc)
1fff1864:	e4242100 	andi      	r1, r4, 256
1fff1868:	3940      	cmpnei      	r1, 0
1fff186a:	0be5      	bt      	0x1fff1834	// 1fff1834 <__divdf3+0xec>
1fff186c:	6c8c      	or      	r2, r3
1fff186e:	3a40      	cmpnei      	r2, 0
1fff1870:	0fe2      	bf      	0x1fff1834	// 1fff1834 <__divdf3+0xec>
1fff1872:	3280      	movi      	r2, 128
1fff1874:	3300      	movi      	r3, 0
1fff1876:	6c13      	mov      	r0, r4
1fff1878:	6c57      	mov      	r1, r5
1fff187a:	6401      	cmplt      	r0, r0
1fff187c:	6009      	addc      	r0, r2
1fff187e:	604d      	addc      	r1, r3
1fff1880:	6c83      	mov      	r2, r0
1fff1882:	6cc7      	mov      	r3, r1
1fff1884:	3100      	movi      	r1, 0
1fff1886:	29ff      	subi      	r1, 256
1fff1888:	6848      	and      	r1, r2
1fff188a:	b822      	st.w      	r1, (r14, 0x8)
1fff188c:	b863      	st.w      	r3, (r14, 0xc)
1fff188e:	07d3      	br      	0x1fff1834	// 1fff1834 <__divdf3+0xec>
1fff1890:	3304      	movi      	r3, 4
1fff1892:	1808      	addi      	r0, r14, 32
1fff1894:	b868      	st.w      	r3, (r14, 0x20)
1fff1896:	07d4      	br      	0x1fff183e	// 1fff183e <__divdf3+0xf6>
1fff1898:	180d      	addi      	r0, r14, 52
1fff189a:	07d2      	br      	0x1fff183e	// 1fff183e <__divdf3+0xf6>
1fff189c:	1fff3448 	.long	0x1fff3448

1fff18a0 <__floatsidf>:
1fff18a0:	14d2      	push      	r4-r5, r15
1fff18a2:	1425      	subi      	r14, r14, 20
1fff18a4:	3303      	movi      	r3, 3
1fff18a6:	3840      	cmpnei      	r0, 0
1fff18a8:	b860      	st.w      	r3, (r14, 0x0)
1fff18aa:	487f      	lsri      	r3, r0, 31
1fff18ac:	b861      	st.w      	r3, (r14, 0x4)
1fff18ae:	0808      	bt      	0x1fff18be	// 1fff18be <__floatsidf+0x1e>
1fff18b0:	3302      	movi      	r3, 2
1fff18b2:	b860      	st.w      	r3, (r14, 0x0)
1fff18b4:	6c3b      	mov      	r0, r14
1fff18b6:	e0000133 	bsr      	0x1fff1b1c	// 1fff1b1c <__pack_d>
1fff18ba:	1405      	addi      	r14, r14, 20
1fff18bc:	1492      	pop      	r4-r5, r15
1fff18be:	38df      	btsti      	r0, 31
1fff18c0:	0c07      	bf      	0x1fff18ce	// 1fff18ce <__floatsidf+0x2e>
1fff18c2:	ea238000 	movih      	r3, 32768
1fff18c6:	64c2      	cmpne      	r0, r3
1fff18c8:	0c1c      	bf      	0x1fff1900	// 1fff1900 <__floatsidf+0x60>
1fff18ca:	3300      	movi      	r3, 0
1fff18cc:	5b01      	subu      	r0, r3, r0
1fff18ce:	4841      	lsri      	r2, r0, 1
1fff18d0:	c4007c41 	ff1      	r1, r0
1fff18d4:	331f      	movi      	r3, 31
1fff18d6:	e481001c 	addi      	r4, r1, 29
1fff18da:	2902      	subi      	r1, 3
1fff18dc:	60d2      	subu      	r3, r4
1fff18de:	c4204025 	lsl      	r5, r0, r1
1fff18e2:	39df      	btsti      	r1, 31
1fff18e4:	c4624043 	lsr      	r3, r2, r3
1fff18e8:	c4650c20 	incf      	r3, r5, 0
1fff18ec:	7010      	lsl      	r0, r4
1fff18ee:	b864      	st.w      	r3, (r14, 0x10)
1fff18f0:	3300      	movi      	r3, 0
1fff18f2:	c4030c20 	incf      	r0, r3, 0
1fff18f6:	333c      	movi      	r3, 60
1fff18f8:	60d2      	subu      	r3, r4
1fff18fa:	b803      	st.w      	r0, (r14, 0xc)
1fff18fc:	b862      	st.w      	r3, (r14, 0x8)
1fff18fe:	07db      	br      	0x1fff18b4	// 1fff18b4 <__floatsidf+0x14>
1fff1900:	3000      	movi      	r0, 0
1fff1902:	ea21c1e0 	movih      	r1, 49632
1fff1906:	07da      	br      	0x1fff18ba	// 1fff18ba <__floatsidf+0x1a>

1fff1908 <__make_dp>:
1fff1908:	1421      	subi      	r14, r14, 4
1fff190a:	14d1      	push      	r4, r15
1fff190c:	1425      	subi      	r14, r14, 20
1fff190e:	b867      	st.w      	r3, (r14, 0x1c)
1fff1910:	b800      	st.w      	r0, (r14, 0x0)
1fff1912:	9867      	ld.w      	r3, (r14, 0x1c)
1fff1914:	9888      	ld.w      	r4, (r14, 0x20)
1fff1916:	6c3b      	mov      	r0, r14
1fff1918:	b821      	st.w      	r1, (r14, 0x4)
1fff191a:	b842      	st.w      	r2, (r14, 0x8)
1fff191c:	b863      	st.w      	r3, (r14, 0xc)
1fff191e:	b884      	st.w      	r4, (r14, 0x10)
1fff1920:	e00000fe 	bsr      	0x1fff1b1c	// 1fff1b1c <__pack_d>
1fff1924:	1405      	addi      	r14, r14, 20
1fff1926:	d9ee2001 	ld.w      	r15, (r14, 0x4)
1fff192a:	9880      	ld.w      	r4, (r14, 0x0)
1fff192c:	1403      	addi      	r14, r14, 12
1fff192e:	783c      	jmp      	r15

1fff1930 <__truncdfsf2>:
1fff1930:	14d0      	push      	r15
1fff1932:	1427      	subi      	r14, r14, 28
1fff1934:	b800      	st.w      	r0, (r14, 0x0)
1fff1936:	6c3b      	mov      	r0, r14
1fff1938:	b821      	st.w      	r1, (r14, 0x4)
1fff193a:	1902      	addi      	r1, r14, 8
1fff193c:	e00001bc 	bsr      	0x1fff1cb4	// 1fff1cb4 <__unpack_d>
1fff1940:	9845      	ld.w      	r2, (r14, 0x14)
1fff1942:	4a3e      	lsri      	r1, r2, 30
1fff1944:	4242      	lsli      	r2, r2, 2
1fff1946:	9866      	ld.w      	r3, (r14, 0x18)
1fff1948:	3a40      	cmpnei      	r2, 0
1fff194a:	4362      	lsli      	r3, r3, 2
1fff194c:	6cc4      	or      	r3, r1
1fff194e:	0c03      	bf      	0x1fff1954	// 1fff1954 <__truncdfsf2+0x24>
1fff1950:	ec630001 	ori      	r3, r3, 1
1fff1954:	9844      	ld.w      	r2, (r14, 0x10)
1fff1956:	9823      	ld.w      	r1, (r14, 0xc)
1fff1958:	9802      	ld.w      	r0, (r14, 0x8)
1fff195a:	e00000d5 	bsr      	0x1fff1b04	// 1fff1b04 <__make_fp>
1fff195e:	1407      	addi      	r14, r14, 28
1fff1960:	1490      	pop      	r15
	...

1fff1964 <__muldi3>:
1fff1964:	14c4      	push      	r4-r7
1fff1966:	1421      	subi      	r14, r14, 4
1fff1968:	7501      	zexth      	r4, r0
1fff196a:	7589      	zexth      	r6, r2
1fff196c:	b820      	st.w      	r1, (r14, 0x0)
1fff196e:	4830      	lsri      	r1, r0, 16
1fff1970:	c4c48427 	mult      	r7, r4, r6
1fff1974:	7d84      	mult      	r6, r1
1fff1976:	6d43      	mov      	r5, r0
1fff1978:	4a10      	lsri      	r0, r2, 16
1fff197a:	7d00      	mult      	r4, r0
1fff197c:	7c40      	mult      	r1, r0
1fff197e:	6118      	addu      	r4, r6
1fff1980:	4f10      	lsri      	r0, r7, 16
1fff1982:	6100      	addu      	r4, r0
1fff1984:	6590      	cmphs      	r4, r6
1fff1986:	0804      	bt      	0x1fff198e	// 1fff198e <__muldi3+0x2a>
1fff1988:	ea200001 	movih      	r0, 1
1fff198c:	6040      	addu      	r1, r0
1fff198e:	4cd0      	lsri      	r6, r4, 16
1fff1990:	6184      	addu      	r6, r1
1fff1992:	c4a38421 	mult      	r1, r3, r5
1fff1996:	9860      	ld.w      	r3, (r14, 0x0)
1fff1998:	4410      	lsli      	r0, r4, 16
1fff199a:	7cc8      	mult      	r3, r2
1fff199c:	751d      	zexth      	r4, r7
1fff199e:	604c      	addu      	r1, r3
1fff19a0:	6010      	addu      	r0, r4
1fff19a2:	6058      	addu      	r1, r6
1fff19a4:	1401      	addi      	r14, r14, 4
1fff19a6:	1484      	pop      	r4-r7

1fff19a8 <__pack_f>:
1fff19a8:	14c1      	push      	r4
1fff19aa:	9040      	ld.w      	r2, (r0, 0x0)
1fff19ac:	9063      	ld.w      	r3, (r0, 0xc)
1fff19ae:	3a01      	cmphsi      	r2, 2
1fff19b0:	9021      	ld.w      	r1, (r0, 0x4)
1fff19b2:	0c34      	bf      	0x1fff1a1a	// 1fff1a1a <__pack_f+0x72>
1fff19b4:	3a44      	cmpnei      	r2, 4
1fff19b6:	0c29      	bf      	0x1fff1a08	// 1fff1a08 <__pack_f+0x60>
1fff19b8:	3a42      	cmpnei      	r2, 2
1fff19ba:	0c1e      	bf      	0x1fff19f6	// 1fff19f6 <__pack_f+0x4e>
1fff19bc:	3b40      	cmpnei      	r3, 0
1fff19be:	0c1c      	bf      	0x1fff19f6	// 1fff19f6 <__pack_f+0x4e>
1fff19c0:	9042      	ld.w      	r2, (r0, 0x8)
1fff19c2:	3000      	movi      	r0, 0
1fff19c4:	287d      	subi      	r0, 126
1fff19c6:	6409      	cmplt      	r2, r0
1fff19c8:	083e      	bt      	0x1fff1a44	// 1fff1a44 <__pack_f+0x9c>
1fff19ca:	eb22007f 	cmplti      	r2, 128
1fff19ce:	0c1d      	bf      	0x1fff1a08	// 1fff1a08 <__pack_f+0x60>
1fff19d0:	e403207f 	andi      	r0, r3, 127
1fff19d4:	eb400040 	cmpnei      	r0, 64
1fff19d8:	0c2c      	bf      	0x1fff1a30	// 1fff1a30 <__pack_f+0x88>
1fff19da:	233e      	addi      	r3, 63
1fff19dc:	3bdf      	btsti      	r3, 31
1fff19de:	0830      	bt      	0x1fff1a3e	// 1fff1a3e <__pack_f+0x96>
1fff19e0:	227e      	addi      	r2, 127
1fff19e2:	4302      	lsli      	r0, r3, 2
1fff19e4:	4809      	lsri      	r0, r0, 9
1fff19e6:	74c8      	zextb      	r3, r2
1fff19e8:	4009      	lsli      	r0, r0, 9
1fff19ea:	4377      	lsli      	r3, r3, 23
1fff19ec:	4809      	lsri      	r0, r0, 9
1fff19ee:	413f      	lsli      	r1, r1, 31
1fff19f0:	6c0c      	or      	r0, r3
1fff19f2:	6c04      	or      	r0, r1
1fff19f4:	1481      	pop      	r4
1fff19f6:	3000      	movi      	r0, 0
1fff19f8:	3300      	movi      	r3, 0
1fff19fa:	4009      	lsli      	r0, r0, 9
1fff19fc:	4377      	lsli      	r3, r3, 23
1fff19fe:	4809      	lsri      	r0, r0, 9
1fff1a00:	413f      	lsli      	r1, r1, 31
1fff1a02:	6c0c      	or      	r0, r3
1fff1a04:	6c04      	or      	r0, r1
1fff1a06:	1481      	pop      	r4
1fff1a08:	3000      	movi      	r0, 0
1fff1a0a:	33ff      	movi      	r3, 255
1fff1a0c:	4009      	lsli      	r0, r0, 9
1fff1a0e:	4377      	lsli      	r3, r3, 23
1fff1a10:	4809      	lsri      	r0, r0, 9
1fff1a12:	413f      	lsli      	r1, r1, 31
1fff1a14:	6c0c      	or      	r0, r3
1fff1a16:	6c04      	or      	r0, r1
1fff1a18:	1481      	pop      	r4
1fff1a1a:	4303      	lsli      	r0, r3, 3
1fff1a1c:	480a      	lsri      	r0, r0, 10
1fff1a1e:	38b6      	bseti      	r0, 22
1fff1a20:	33ff      	movi      	r3, 255
1fff1a22:	4009      	lsli      	r0, r0, 9
1fff1a24:	4377      	lsli      	r3, r3, 23
1fff1a26:	4809      	lsri      	r0, r0, 9
1fff1a28:	413f      	lsli      	r1, r1, 31
1fff1a2a:	6c0c      	or      	r0, r3
1fff1a2c:	6c04      	or      	r0, r1
1fff1a2e:	1481      	pop      	r4
1fff1a30:	e4832080 	andi      	r4, r3, 128
1fff1a34:	600c      	addu      	r0, r3
1fff1a36:	3c40      	cmpnei      	r4, 0
1fff1a38:	c4600c40 	inct      	r3, r0, 0
1fff1a3c:	07d0      	br      	0x1fff19dc	// 1fff19dc <__pack_f+0x34>
1fff1a3e:	4b61      	lsri      	r3, r3, 1
1fff1a40:	227f      	addi      	r2, 128
1fff1a42:	07d0      	br      	0x1fff19e2	// 1fff19e2 <__pack_f+0x3a>
1fff1a44:	600a      	subu      	r0, r2
1fff1a46:	3839      	cmplti      	r0, 26
1fff1a48:	0fd7      	bf      	0x1fff19f6	// 1fff19f6 <__pack_f+0x4e>
1fff1a4a:	3201      	movi      	r2, 1
1fff1a4c:	c4034044 	lsr      	r4, r3, r0
1fff1a50:	c4024020 	lsl      	r0, r2, r0
1fff1a54:	2800      	subi      	r0, 1
1fff1a56:	68c0      	and      	r3, r0
1fff1a58:	3b40      	cmpnei      	r3, 0
1fff1a5a:	c4000503 	mvc      	r3
1fff1a5e:	6cd0      	or      	r3, r4
1fff1a60:	e443207f 	andi      	r2, r3, 127
1fff1a64:	eb420040 	cmpnei      	r2, 64
1fff1a68:	080e      	bt      	0x1fff1a84	// 1fff1a84 <__pack_f+0xdc>
1fff1a6a:	e4032080 	andi      	r0, r3, 128
1fff1a6e:	3840      	cmpnei      	r0, 0
1fff1a70:	0c02      	bf      	0x1fff1a74	// 1fff1a74 <__pack_f+0xcc>
1fff1a72:	60c8      	addu      	r3, r2
1fff1a74:	c7a05022 	bmaski      	r2, 30
1fff1a78:	4302      	lsli      	r0, r3, 2
1fff1a7a:	64c8      	cmphs      	r2, r3
1fff1a7c:	64c3      	mvcv      	r3
1fff1a7e:	4809      	lsri      	r0, r0, 9
1fff1a80:	74cc      	zextb      	r3, r3
1fff1a82:	07b3      	br      	0x1fff19e8	// 1fff19e8 <__pack_f+0x40>
1fff1a84:	233e      	addi      	r3, 63
1fff1a86:	07f7      	br      	0x1fff1a74	// 1fff1a74 <__pack_f+0xcc>

1fff1a88 <__unpack_f>:
1fff1a88:	14c1      	push      	r4
1fff1a8a:	8861      	ld.h      	r3, (r0, 0x2)
1fff1a8c:	4371      	lsli      	r3, r3, 17
1fff1a8e:	4b78      	lsri      	r3, r3, 24
1fff1a90:	9040      	ld.w      	r2, (r0, 0x0)
1fff1a92:	3b40      	cmpnei      	r3, 0
1fff1a94:	8003      	ld.b      	r0, (r0, 0x3)
1fff1a96:	4249      	lsli      	r2, r2, 9
1fff1a98:	4807      	lsri      	r0, r0, 7
1fff1a9a:	4a49      	lsri      	r2, r2, 9
1fff1a9c:	b101      	st.w      	r0, (r1, 0x4)
1fff1a9e:	0812      	bt      	0x1fff1ac2	// 1fff1ac2 <__unpack_f+0x3a>
1fff1aa0:	3a40      	cmpnei      	r2, 0
1fff1aa2:	0c1b      	bf      	0x1fff1ad8	// 1fff1ad8 <__unpack_f+0x50>
1fff1aa4:	3303      	movi      	r3, 3
1fff1aa6:	4247      	lsli      	r2, r2, 7
1fff1aa8:	c7a05024 	bmaski      	r4, 30
1fff1aac:	b160      	st.w      	r3, (r1, 0x0)
1fff1aae:	3300      	movi      	r3, 0
1fff1ab0:	2b7e      	subi      	r3, 127
1fff1ab2:	4241      	lsli      	r2, r2, 1
1fff1ab4:	6c0f      	mov      	r0, r3
1fff1ab6:	6490      	cmphs      	r4, r2
1fff1ab8:	2b00      	subi      	r3, 1
1fff1aba:	0bfc      	bt      	0x1fff1ab2	// 1fff1ab2 <__unpack_f+0x2a>
1fff1abc:	b102      	st.w      	r0, (r1, 0x8)
1fff1abe:	b143      	st.w      	r2, (r1, 0xc)
1fff1ac0:	1481      	pop      	r4
1fff1ac2:	eb4300ff 	cmpnei      	r3, 255
1fff1ac6:	0c0c      	bf      	0x1fff1ade	// 1fff1ade <__unpack_f+0x56>
1fff1ac8:	2b7e      	subi      	r3, 127
1fff1aca:	b162      	st.w      	r3, (r1, 0x8)
1fff1acc:	4247      	lsli      	r2, r2, 7
1fff1ace:	3303      	movi      	r3, 3
1fff1ad0:	3abe      	bseti      	r2, 30
1fff1ad2:	b160      	st.w      	r3, (r1, 0x0)
1fff1ad4:	b143      	st.w      	r2, (r1, 0xc)
1fff1ad6:	1481      	pop      	r4
1fff1ad8:	3302      	movi      	r3, 2
1fff1ada:	b160      	st.w      	r3, (r1, 0x0)
1fff1adc:	1481      	pop      	r4
1fff1ade:	3a40      	cmpnei      	r2, 0
1fff1ae0:	0c0d      	bf      	0x1fff1afa	// 1fff1afa <__unpack_f+0x72>
1fff1ae2:	ea230040 	movih      	r3, 64
1fff1ae6:	68c8      	and      	r3, r2
1fff1ae8:	4247      	lsli      	r2, r2, 7
1fff1aea:	3b40      	cmpnei      	r3, 0
1fff1aec:	c4000503 	mvc      	r3
1fff1af0:	b160      	st.w      	r3, (r1, 0x0)
1fff1af2:	1064      	lrw      	r3, 0x1fffff80	// 1fff1b00 <__unpack_f+0x78>
1fff1af4:	68c8      	and      	r3, r2
1fff1af6:	b163      	st.w      	r3, (r1, 0xc)
1fff1af8:	1481      	pop      	r4
1fff1afa:	3304      	movi      	r3, 4
1fff1afc:	b160      	st.w      	r3, (r1, 0x0)
1fff1afe:	1481      	pop      	r4
1fff1b00:	1fffff80 	.long	0x1fffff80

1fff1b04 <__make_fp>:
1fff1b04:	14d0      	push      	r15
1fff1b06:	1424      	subi      	r14, r14, 16
1fff1b08:	b800      	st.w      	r0, (r14, 0x0)
1fff1b0a:	6c3b      	mov      	r0, r14
1fff1b0c:	b821      	st.w      	r1, (r14, 0x4)
1fff1b0e:	b842      	st.w      	r2, (r14, 0x8)
1fff1b10:	b863      	st.w      	r3, (r14, 0xc)
1fff1b12:	e3ffff4b 	bsr      	0x1fff19a8	// 1fff19a8 <__pack_f>
1fff1b16:	1404      	addi      	r14, r14, 16
1fff1b18:	1490      	pop      	r15
	...

1fff1b1c <__pack_d>:
1fff1b1c:	14c4      	push      	r4-r7
1fff1b1e:	1423      	subi      	r14, r14, 12
1fff1b20:	9060      	ld.w      	r3, (r0, 0x0)
1fff1b22:	90c3      	ld.w      	r6, (r0, 0xc)
1fff1b24:	90e4      	ld.w      	r7, (r0, 0x10)
1fff1b26:	3b01      	cmphsi      	r3, 2
1fff1b28:	9021      	ld.w      	r1, (r0, 0x4)
1fff1b2a:	0c47      	bf      	0x1fff1bb8	// 1fff1bb8 <__pack_d+0x9c>
1fff1b2c:	3b44      	cmpnei      	r3, 4
1fff1b2e:	0c40      	bf      	0x1fff1bae	// 1fff1bae <__pack_d+0x92>
1fff1b30:	3b42      	cmpnei      	r3, 2
1fff1b32:	0c28      	bf      	0x1fff1b82	// 1fff1b82 <__pack_d+0x66>
1fff1b34:	c4e62423 	or      	r3, r6, r7
1fff1b38:	3b40      	cmpnei      	r3, 0
1fff1b3a:	0c24      	bf      	0x1fff1b82	// 1fff1b82 <__pack_d+0x66>
1fff1b3c:	9062      	ld.w      	r3, (r0, 0x8)
1fff1b3e:	121d      	lrw      	r0, 0xfffffc02	// 1fff1cb0 <__pack_d+0x194>
1fff1b40:	640d      	cmplt      	r3, r0
1fff1b42:	0857      	bt      	0x1fff1bf0	// 1fff1bf0 <__pack_d+0xd4>
1fff1b44:	eb2303ff 	cmplti      	r3, 1024
1fff1b48:	0c33      	bf      	0x1fff1bae	// 1fff1bae <__pack_d+0x92>
1fff1b4a:	34ff      	movi      	r4, 255
1fff1b4c:	3500      	movi      	r5, 0
1fff1b4e:	6918      	and      	r4, r6
1fff1b50:	695c      	and      	r5, r7
1fff1b52:	eb440080 	cmpnei      	r4, 128
1fff1b56:	0c41      	bf      	0x1fff1bd8	// 1fff1bd8 <__pack_d+0xbc>
1fff1b58:	347f      	movi      	r4, 127
1fff1b5a:	3500      	movi      	r5, 0
1fff1b5c:	6599      	cmplt      	r6, r6
1fff1b5e:	6191      	addc      	r6, r4
1fff1b60:	61d5      	addc      	r7, r5
1fff1b62:	c7805022 	bmaski      	r2, 29
1fff1b66:	65c8      	cmphs      	r2, r7
1fff1b68:	0c1a      	bf      	0x1fff1b9c	// 1fff1b9c <__pack_d+0x80>
1fff1b6a:	e48303fe 	addi      	r4, r3, 1023
1fff1b6e:	4718      	lsli      	r0, r7, 24
1fff1b70:	4f68      	lsri      	r3, r7, 8
1fff1b72:	4e48      	lsri      	r2, r6, 8
1fff1b74:	6c80      	or      	r2, r0
1fff1b76:	430c      	lsli      	r0, r3, 12
1fff1b78:	6d4b      	mov      	r5, r2
1fff1b7a:	486c      	lsri      	r3, r0, 12
1fff1b7c:	e48427ff 	andi      	r4, r4, 2047
1fff1b80:	0404      	br      	0x1fff1b88	// 1fff1b88 <__pack_d+0x6c>
1fff1b82:	3400      	movi      	r4, 0
1fff1b84:	3200      	movi      	r2, 0
1fff1b86:	3300      	movi      	r3, 0
1fff1b88:	430c      	lsli      	r0, r3, 12
1fff1b8a:	480c      	lsri      	r0, r0, 12
1fff1b8c:	4474      	lsli      	r3, r4, 20
1fff1b8e:	419f      	lsli      	r4, r1, 31
1fff1b90:	c4602421 	or      	r1, r0, r3
1fff1b94:	6c50      	or      	r1, r4
1fff1b96:	6c0b      	mov      	r0, r2
1fff1b98:	1403      	addi      	r14, r14, 12
1fff1b9a:	1484      	pop      	r4-r7
1fff1b9c:	479f      	lsli      	r4, r7, 31
1fff1b9e:	4e01      	lsri      	r0, r6, 1
1fff1ba0:	4f41      	lsri      	r2, r7, 1
1fff1ba2:	c4042426 	or      	r6, r4, r0
1fff1ba6:	6dcb      	mov      	r7, r2
1fff1ba8:	e48303ff 	addi      	r4, r3, 1024
1fff1bac:	07e1      	br      	0x1fff1b6e	// 1fff1b6e <__pack_d+0x52>
1fff1bae:	ea0407ff 	movi      	r4, 2047
1fff1bb2:	3200      	movi      	r2, 0
1fff1bb4:	3300      	movi      	r3, 0
1fff1bb6:	07e9      	br      	0x1fff1b88	// 1fff1b88 <__pack_d+0x6c>
1fff1bb8:	4798      	lsli      	r4, r7, 24
1fff1bba:	4e08      	lsri      	r0, r6, 8
1fff1bbc:	c4042422 	or      	r2, r4, r0
1fff1bc0:	4705      	lsli      	r0, r7, 5
1fff1bc2:	486d      	lsri      	r3, r0, 13
1fff1bc4:	3400      	movi      	r4, 0
1fff1bc6:	ea250008 	movih      	r5, 8
1fff1bca:	6c90      	or      	r2, r4
1fff1bcc:	6cd4      	or      	r3, r5
1fff1bce:	430c      	lsli      	r0, r3, 12
1fff1bd0:	486c      	lsri      	r3, r0, 12
1fff1bd2:	ea0407ff 	movi      	r4, 2047
1fff1bd6:	07d9      	br      	0x1fff1b88	// 1fff1b88 <__pack_d+0x6c>
1fff1bd8:	3d40      	cmpnei      	r5, 0
1fff1bda:	0bbf      	bt      	0x1fff1b58	// 1fff1b58 <__pack_d+0x3c>
1fff1bdc:	e4462100 	andi      	r2, r6, 256
1fff1be0:	3a40      	cmpnei      	r2, 0
1fff1be2:	0fc0      	bf      	0x1fff1b62	// 1fff1b62 <__pack_d+0x46>
1fff1be4:	3480      	movi      	r4, 128
1fff1be6:	3500      	movi      	r5, 0
1fff1be8:	6599      	cmplt      	r6, r6
1fff1bea:	6191      	addc      	r6, r4
1fff1bec:	61d5      	addc      	r7, r5
1fff1bee:	07ba      	br      	0x1fff1b62	// 1fff1b62 <__pack_d+0x46>
1fff1bf0:	600e      	subu      	r0, r3
1fff1bf2:	eb200038 	cmplti      	r0, 57
1fff1bf6:	0fc6      	bf      	0x1fff1b82	// 1fff1b82 <__pack_d+0x66>
1fff1bf8:	e460101f 	subi      	r3, r0, 32
1fff1bfc:	c4674044 	lsr      	r4, r7, r3
1fff1c00:	47a1      	lsli      	r5, r7, 1
1fff1c02:	b882      	st.w      	r4, (r14, 0x8)
1fff1c04:	321f      	movi      	r2, 31
1fff1c06:	c4064044 	lsr      	r4, r6, r0
1fff1c0a:	6082      	subu      	r2, r0
1fff1c0c:	c4454022 	lsl      	r2, r5, r2
1fff1c10:	6c90      	or      	r2, r4
1fff1c12:	b840      	st.w      	r2, (r14, 0x0)
1fff1c14:	c4074042 	lsr      	r2, r7, r0
1fff1c18:	3bdf      	btsti      	r3, 31
1fff1c1a:	b841      	st.w      	r2, (r14, 0x4)
1fff1c1c:	9882      	ld.w      	r4, (r14, 0x8)
1fff1c1e:	9840      	ld.w      	r2, (r14, 0x0)
1fff1c20:	c4440c20 	incf      	r2, r4, 0
1fff1c24:	b840      	st.w      	r2, (r14, 0x0)
1fff1c26:	3400      	movi      	r4, 0
1fff1c28:	9841      	ld.w      	r2, (r14, 0x4)
1fff1c2a:	c4440c20 	incf      	r2, r4, 0
1fff1c2e:	3401      	movi      	r4, 1
1fff1c30:	c4644025 	lsl      	r5, r4, r3
1fff1c34:	b841      	st.w      	r2, (r14, 0x4)
1fff1c36:	3300      	movi      	r3, 0
1fff1c38:	c4044022 	lsl      	r2, r4, r0
1fff1c3c:	3000      	movi      	r0, 0
1fff1c3e:	c4650c20 	incf      	r3, r5, 0
1fff1c42:	c4400c20 	incf      	r2, r0, 0
1fff1c46:	3a40      	cmpnei      	r2, 0
1fff1c48:	c4630c81 	decf      	r3, r3, 1
1fff1c4c:	2a00      	subi      	r2, 1
1fff1c4e:	6898      	and      	r2, r6
1fff1c50:	68dc      	and      	r3, r7
1fff1c52:	6c8c      	or      	r2, r3
1fff1c54:	3500      	movi      	r5, 0
1fff1c56:	3a40      	cmpnei      	r2, 0
1fff1c58:	c4000504 	mvc      	r4
1fff1c5c:	9840      	ld.w      	r2, (r14, 0x0)
1fff1c5e:	9861      	ld.w      	r3, (r14, 0x4)
1fff1c60:	6c90      	or      	r2, r4
1fff1c62:	6cd4      	or      	r3, r5
1fff1c64:	6d0b      	mov      	r4, r2
1fff1c66:	6d4f      	mov      	r5, r3
1fff1c68:	32ff      	movi      	r2, 255
1fff1c6a:	3300      	movi      	r3, 0
1fff1c6c:	6890      	and      	r2, r4
1fff1c6e:	68d4      	and      	r3, r5
1fff1c70:	eb420080 	cmpnei      	r2, 128
1fff1c74:	081b      	bt      	0x1fff1caa	// 1fff1caa <__pack_d+0x18e>
1fff1c76:	3b40      	cmpnei      	r3, 0
1fff1c78:	0819      	bt      	0x1fff1caa	// 1fff1caa <__pack_d+0x18e>
1fff1c7a:	e4642100 	andi      	r3, r4, 256
1fff1c7e:	3b40      	cmpnei      	r3, 0
1fff1c80:	0c06      	bf      	0x1fff1c8c	// 1fff1c8c <__pack_d+0x170>
1fff1c82:	3280      	movi      	r2, 128
1fff1c84:	3300      	movi      	r3, 0
1fff1c86:	6511      	cmplt      	r4, r4
1fff1c88:	6109      	addc      	r4, r2
1fff1c8a:	614d      	addc      	r5, r3
1fff1c8c:	4518      	lsli      	r0, r5, 24
1fff1c8e:	4c48      	lsri      	r2, r4, 8
1fff1c90:	4d68      	lsri      	r3, r5, 8
1fff1c92:	6c80      	or      	r2, r0
1fff1c94:	430c      	lsli      	r0, r3, 12
1fff1c96:	486c      	lsri      	r3, r0, 12
1fff1c98:	c7605020 	bmaski      	r0, 28
1fff1c9c:	3401      	movi      	r4, 1
1fff1c9e:	6540      	cmphs      	r0, r5
1fff1ca0:	0c02      	bf      	0x1fff1ca4	// 1fff1ca4 <__pack_d+0x188>
1fff1ca2:	3400      	movi      	r4, 0
1fff1ca4:	e4842001 	andi      	r4, r4, 1
1fff1ca8:	0770      	br      	0x1fff1b88	// 1fff1b88 <__pack_d+0x6c>
1fff1caa:	327f      	movi      	r2, 127
1fff1cac:	07ec      	br      	0x1fff1c84	// 1fff1c84 <__pack_d+0x168>
1fff1cae:	0000      	bkpt
1fff1cb0:	fffffc02 	.long	0xfffffc02

1fff1cb4 <__unpack_d>:
1fff1cb4:	1423      	subi      	r14, r14, 12
1fff1cb6:	b880      	st.w      	r4, (r14, 0x0)
1fff1cb8:	b8c1      	st.w      	r6, (r14, 0x4)
1fff1cba:	b8e2      	st.w      	r7, (r14, 0x8)
1fff1cbc:	8843      	ld.h      	r2, (r0, 0x6)
1fff1cbe:	4251      	lsli      	r2, r2, 17
1fff1cc0:	4a55      	lsri      	r2, r2, 21
1fff1cc2:	9061      	ld.w      	r3, (r0, 0x4)
1fff1cc4:	9080      	ld.w      	r4, (r0, 0x0)
1fff1cc6:	3a40      	cmpnei      	r2, 0
1fff1cc8:	8007      	ld.b      	r0, (r0, 0x7)
1fff1cca:	436c      	lsli      	r3, r3, 12
1fff1ccc:	4807      	lsri      	r0, r0, 7
1fff1cce:	4b6c      	lsri      	r3, r3, 12
1fff1cd0:	b101      	st.w      	r0, (r1, 0x4)
1fff1cd2:	081a      	bt      	0x1fff1d06	// 1fff1d06 <__unpack_d+0x52>
1fff1cd4:	c4642422 	or      	r2, r4, r3
1fff1cd8:	3a40      	cmpnei      	r2, 0
1fff1cda:	0c2e      	bf      	0x1fff1d36	// 1fff1d36 <__unpack_d+0x82>
1fff1cdc:	4c58      	lsri      	r2, r4, 24
1fff1cde:	4368      	lsli      	r3, r3, 8
1fff1ce0:	6cc8      	or      	r3, r2
1fff1ce2:	3203      	movi      	r2, 3
1fff1ce4:	4408      	lsli      	r0, r4, 8
1fff1ce6:	b140      	st.w      	r2, (r1, 0x0)
1fff1ce8:	1180      	lrw      	r4, 0xfffffc01	// 1fff1d68 <__unpack_d+0xb4>
1fff1cea:	c7605026 	bmaski      	r6, 28
1fff1cee:	485f      	lsri      	r2, r0, 31
1fff1cf0:	4361      	lsli      	r3, r3, 1
1fff1cf2:	6cc8      	or      	r3, r2
1fff1cf4:	4001      	lsli      	r0, r0, 1
1fff1cf6:	64d8      	cmphs      	r6, r3
1fff1cf8:	6c93      	mov      	r2, r4
1fff1cfa:	2c00      	subi      	r4, 1
1fff1cfc:	0bf9      	bt      	0x1fff1cee	// 1fff1cee <__unpack_d+0x3a>
1fff1cfe:	b142      	st.w      	r2, (r1, 0x8)
1fff1d00:	b103      	st.w      	r0, (r1, 0xc)
1fff1d02:	b164      	st.w      	r3, (r1, 0x10)
1fff1d04:	0414      	br      	0x1fff1d2c	// 1fff1d2c <__unpack_d+0x78>
1fff1d06:	eb4207ff 	cmpnei      	r2, 2047
1fff1d0a:	0c19      	bf      	0x1fff1d3c	// 1fff1d3c <__unpack_d+0x88>
1fff1d0c:	e44213fe 	subi      	r2, r2, 1023
1fff1d10:	b142      	st.w      	r2, (r1, 0x8)
1fff1d12:	3203      	movi      	r2, 3
1fff1d14:	43e8      	lsli      	r7, r3, 8
1fff1d16:	b140      	st.w      	r2, (r1, 0x0)
1fff1d18:	4c58      	lsri      	r2, r4, 24
1fff1d1a:	6dc8      	or      	r7, r2
1fff1d1c:	44c8      	lsli      	r6, r4, 8
1fff1d1e:	3200      	movi      	r2, 0
1fff1d20:	ea231000 	movih      	r3, 4096
1fff1d24:	6d88      	or      	r6, r2
1fff1d26:	6dcc      	or      	r7, r3
1fff1d28:	b1c3      	st.w      	r6, (r1, 0xc)
1fff1d2a:	b1e4      	st.w      	r7, (r1, 0x10)
1fff1d2c:	98e2      	ld.w      	r7, (r14, 0x8)
1fff1d2e:	98c1      	ld.w      	r6, (r14, 0x4)
1fff1d30:	9880      	ld.w      	r4, (r14, 0x0)
1fff1d32:	1403      	addi      	r14, r14, 12
1fff1d34:	783c      	jmp      	r15
1fff1d36:	3302      	movi      	r3, 2
1fff1d38:	b160      	st.w      	r3, (r1, 0x0)
1fff1d3a:	07f9      	br      	0x1fff1d2c	// 1fff1d2c <__unpack_d+0x78>
1fff1d3c:	c4642422 	or      	r2, r4, r3
1fff1d40:	3a40      	cmpnei      	r2, 0
1fff1d42:	0c10      	bf      	0x1fff1d62	// 1fff1d62 <__unpack_d+0xae>
1fff1d44:	ea220008 	movih      	r2, 8
1fff1d48:	688c      	and      	r2, r3
1fff1d4a:	4368      	lsli      	r3, r3, 8
1fff1d4c:	3a40      	cmpnei      	r2, 0
1fff1d4e:	c4000502 	mvc      	r2
1fff1d52:	4408      	lsli      	r0, r4, 8
1fff1d54:	b140      	st.w      	r2, (r1, 0x0)
1fff1d56:	4c58      	lsri      	r2, r4, 24
1fff1d58:	6cc8      	or      	r3, r2
1fff1d5a:	3b9b      	bclri      	r3, 27
1fff1d5c:	b103      	st.w      	r0, (r1, 0xc)
1fff1d5e:	b164      	st.w      	r3, (r1, 0x10)
1fff1d60:	07e6      	br      	0x1fff1d2c	// 1fff1d2c <__unpack_d+0x78>
1fff1d62:	3304      	movi      	r3, 4
1fff1d64:	b160      	st.w      	r3, (r1, 0x0)
1fff1d66:	07e3      	br      	0x1fff1d2c	// 1fff1d2c <__unpack_d+0x78>
1fff1d68:	fffffc01 	.long	0xfffffc01

1fff1d6c <__memset_fast>:
1fff1d6c:	7444      	zextb      	r1, r1
1fff1d6e:	3a40      	cmpnei      	r2, 0
1fff1d70:	0c25      	bf      	0x1fff1dba	// 1fff1dba <__memset_fast+0x4e>
1fff1d72:	6f43      	mov      	r13, r0
1fff1d74:	e5802003 	andi      	r12, r0, 3
1fff1d78:	eb4c0000 	cmpnei      	r12, 0
1fff1d7c:	0c20      	bf      	0x1fff1dbc	// 1fff1dbc <__memset_fast+0x50>
1fff1d7e:	dc2d0000 	st.b      	r1, (r13, 0x0)
1fff1d82:	2a00      	subi      	r2, 1
1fff1d84:	3a40      	cmpnei      	r2, 0
1fff1d86:	0c1a      	bf      	0x1fff1dba	// 1fff1dba <__memset_fast+0x4e>
1fff1d88:	e5ad0000 	addi      	r13, r13, 1
1fff1d8c:	e58d2003 	andi      	r12, r13, 3
1fff1d90:	eb4c0000 	cmpnei      	r12, 0
1fff1d94:	0c14      	bf      	0x1fff1dbc	// 1fff1dbc <__memset_fast+0x50>
1fff1d96:	dc2d0000 	st.b      	r1, (r13, 0x0)
1fff1d9a:	2a00      	subi      	r2, 1
1fff1d9c:	3a40      	cmpnei      	r2, 0
1fff1d9e:	0c0e      	bf      	0x1fff1dba	// 1fff1dba <__memset_fast+0x4e>
1fff1da0:	e5ad0000 	addi      	r13, r13, 1
1fff1da4:	e58d2003 	andi      	r12, r13, 3
1fff1da8:	eb4c0000 	cmpnei      	r12, 0
1fff1dac:	0c08      	bf      	0x1fff1dbc	// 1fff1dbc <__memset_fast+0x50>
1fff1dae:	dc2d0000 	st.b      	r1, (r13, 0x0)
1fff1db2:	2a00      	subi      	r2, 1
1fff1db4:	e5ad0000 	addi      	r13, r13, 1
1fff1db8:	0402      	br      	0x1fff1dbc	// 1fff1dbc <__memset_fast+0x50>
1fff1dba:	783c      	jmp      	r15
1fff1dbc:	4168      	lsli      	r3, r1, 8
1fff1dbe:	6c4c      	or      	r1, r3
1fff1dc0:	4170      	lsli      	r3, r1, 16
1fff1dc2:	6c4c      	or      	r1, r3
1fff1dc4:	3a2f      	cmplti      	r2, 16
1fff1dc6:	080e      	bt      	0x1fff1de2	// 1fff1de2 <__memset_fast+0x76>
1fff1dc8:	dc2d2000 	st.w      	r1, (r13, 0x0)
1fff1dcc:	dc2d2001 	st.w      	r1, (r13, 0x4)
1fff1dd0:	dc2d2002 	st.w      	r1, (r13, 0x8)
1fff1dd4:	dc2d2003 	st.w      	r1, (r13, 0xc)
1fff1dd8:	2a0f      	subi      	r2, 16
1fff1dda:	e5ad000f 	addi      	r13, r13, 16
1fff1dde:	3a2f      	cmplti      	r2, 16
1fff1de0:	0ff4      	bf      	0x1fff1dc8	// 1fff1dc8 <__memset_fast+0x5c>
1fff1de2:	3a23      	cmplti      	r2, 4
1fff1de4:	0808      	bt      	0x1fff1df4	// 1fff1df4 <__memset_fast+0x88>
1fff1de6:	2a03      	subi      	r2, 4
1fff1de8:	dc2d2000 	st.w      	r1, (r13, 0x0)
1fff1dec:	e5ad0003 	addi      	r13, r13, 4
1fff1df0:	3a23      	cmplti      	r2, 4
1fff1df2:	0ffa      	bf      	0x1fff1de6	// 1fff1de6 <__memset_fast+0x7a>
1fff1df4:	3a40      	cmpnei      	r2, 0
1fff1df6:	0fe2      	bf      	0x1fff1dba	// 1fff1dba <__memset_fast+0x4e>
1fff1df8:	2a00      	subi      	r2, 1
1fff1dfa:	dc2d0000 	st.b      	r1, (r13, 0x0)
1fff1dfe:	3a40      	cmpnei      	r2, 0
1fff1e00:	0fdd      	bf      	0x1fff1dba	// 1fff1dba <__memset_fast+0x4e>
1fff1e02:	2a00      	subi      	r2, 1
1fff1e04:	dc2d0001 	st.b      	r1, (r13, 0x1)
1fff1e08:	3a40      	cmpnei      	r2, 0
1fff1e0a:	0fd8      	bf      	0x1fff1dba	// 1fff1dba <__memset_fast+0x4e>
1fff1e0c:	dc2d0002 	st.b      	r1, (r13, 0x2)
1fff1e10:	783c      	jmp      	r15
	...

1fff1e14 <__memcpy_fast>:
1fff1e14:	14c1      	push      	r4
1fff1e16:	6f03      	mov      	r12, r0
1fff1e18:	c401242d 	or      	r13, r1, r0
1fff1e1c:	e48d2003 	andi      	r4, r13, 3
1fff1e20:	3c40      	cmpnei      	r4, 0
1fff1e22:	0c0d      	bf      	0x1fff1e3c	// 1fff1e3c <__memcpy_fast+0x28>
1fff1e24:	3a40      	cmpnei      	r2, 0
1fff1e26:	0c0a      	bf      	0x1fff1e3a	// 1fff1e3a <__memcpy_fast+0x26>
1fff1e28:	8160      	ld.b      	r3, (r1, 0x0)
1fff1e2a:	2100      	addi      	r1, 1
1fff1e2c:	2a00      	subi      	r2, 1
1fff1e2e:	dc6c0000 	st.b      	r3, (r12, 0x0)
1fff1e32:	e58c0000 	addi      	r12, r12, 1
1fff1e36:	3a40      	cmpnei      	r2, 0
1fff1e38:	0bf8      	bt      	0x1fff1e28	// 1fff1e28 <__memcpy_fast+0x14>
1fff1e3a:	1481      	pop      	r4
1fff1e3c:	3a2f      	cmplti      	r2, 16
1fff1e3e:	0815      	bt      	0x1fff1e68	// 1fff1e68 <__memcpy_fast+0x54>
1fff1e40:	d9a12000 	ld.w      	r13, (r1, 0x0)
1fff1e44:	9161      	ld.w      	r3, (r1, 0x4)
1fff1e46:	9182      	ld.w      	r4, (r1, 0x8)
1fff1e48:	ddac2000 	st.w      	r13, (r12, 0x0)
1fff1e4c:	d9a12003 	ld.w      	r13, (r1, 0xc)
1fff1e50:	dc6c2001 	st.w      	r3, (r12, 0x4)
1fff1e54:	dc8c2002 	st.w      	r4, (r12, 0x8)
1fff1e58:	ddac2003 	st.w      	r13, (r12, 0xc)
1fff1e5c:	2a0f      	subi      	r2, 16
1fff1e5e:	210f      	addi      	r1, 16
1fff1e60:	e58c000f 	addi      	r12, r12, 16
1fff1e64:	3a2f      	cmplti      	r2, 16
1fff1e66:	0fed      	bf      	0x1fff1e40	// 1fff1e40 <__memcpy_fast+0x2c>
1fff1e68:	3a23      	cmplti      	r2, 4
1fff1e6a:	080a      	bt      	0x1fff1e7e	// 1fff1e7e <__memcpy_fast+0x6a>
1fff1e6c:	9160      	ld.w      	r3, (r1, 0x0)
1fff1e6e:	2a03      	subi      	r2, 4
1fff1e70:	2103      	addi      	r1, 4
1fff1e72:	dc6c2000 	st.w      	r3, (r12, 0x0)
1fff1e76:	e58c0003 	addi      	r12, r12, 4
1fff1e7a:	3a23      	cmplti      	r2, 4
1fff1e7c:	0ff8      	bf      	0x1fff1e6c	// 1fff1e6c <__memcpy_fast+0x58>
1fff1e7e:	3a40      	cmpnei      	r2, 0
1fff1e80:	0fdd      	bf      	0x1fff1e3a	// 1fff1e3a <__memcpy_fast+0x26>
1fff1e82:	8160      	ld.b      	r3, (r1, 0x0)
1fff1e84:	2100      	addi      	r1, 1
1fff1e86:	2a00      	subi      	r2, 1
1fff1e88:	dc6c0000 	st.b      	r3, (r12, 0x0)
1fff1e8c:	e58c0000 	addi      	r12, r12, 1
1fff1e90:	07f7      	br      	0x1fff1e7e	// 1fff1e7e <__memcpy_fast+0x6a>

1fff1e92 <board_init>:
{
	//unsigned int tmp = *(volatile unsigned int *)0x40003814;
	//*(volatile unsigned int *)0x40003814 = tmp & 0x0f;
	
    //*(volatile unsigned int *)0x40003814 = 0x05;
}
1fff1e92:	783c      	jmp      	r15

1fff1e94 <SystemInit>:
  * @return None
  */
  

void SystemInit(void)
{
1fff1e94:	14d0      	push      	r15
  \details Writes the given value to the VBR Register.
  \param [in]    vbr  VBR Register value to set
 */
__ALWAYS_STATIC_INLINE void __set_VBR(uint32_t vbr)
{
    __ASM volatile("mtcr %0, vbr" : : "r"(vbr));
1fff1e96:	3300      	movi      	r3, 0
1fff1e98:	c0036421 	mtcr      	r3, cr<1, 0>
    __set_VBR(0); //rom vic

    /* Clear active and pending IRQ */
    VIC->IABR[0] = 0x0;
1fff1e9c:	1047      	lrw      	r2, 0xe000e100	// 1fff1eb8 <SystemInit+0x24>
1fff1e9e:	dc622080 	st.w      	r3, (r2, 0x200)
    VIC->ICPR[0] = 0xFFFFFFFF;
1fff1ea2:	2b00      	subi      	r3, 1
1fff1ea4:	dc622060 	st.w      	r3, (r2, 0x180)
  \details Enables interrupts and exceptions by setting the IE-bit and EE-bit in the PSR.
           Can only be executed in Privileged modes.
 */
__ALWAYS_STATIC_INLINE void __enable_excp_irq(void)
{
    __ASM volatile("psrset ee, ie");
1fff1ea8:	c1807420 	psrset      	ee, ie

    __enable_excp_irq();

	/* register trap_c */
    extern void trap_c(uint32_t *regs);
    JUMP_FUNCTION_SET(CK802_TRAP_C , (uint32_t)&trap_c);
1fff1eac:	1024      	lrw      	r1, 0x1fff1ec0	// 1fff1ebc <SystemInit+0x28>
1fff1eae:	3063      	movi      	r0, 99
1fff1eb0:	e0000944 	bsr      	0x1fff3138	// 1fff3138 <rf_phy_ini1+0x110>


}
1fff1eb4:	1490      	pop      	r15
1fff1eb6:	0000      	bkpt
1fff1eb8:	e000e100 	.long	0xe000e100
1fff1ebc:	1fff1ec0 	.long	0x1fff1ec0

1fff1ec0 <trap_c>:

void (*trap_c_callback)(void);


void trap_c(uint32_t *regs)
{
1fff1ec0:	14d4      	push      	r4-r7, r15
1fff1ec2:	1421      	subi      	r14, r14, 4
1fff1ec4:	6d43      	mov      	r5, r0
    __ASM volatile("mfcr %0, psr" : "=r"(result));
1fff1ec6:	c0006021 	mfcr      	r1, cr<0, 0>
    int i;
    uint32_t vec = (__get_PSR() & PSR_VEC_Msk) >> PSR_VEC_Pos;
1fff1eca:	4930      	lsri      	r1, r1, 16
1fff1ecc:	e421207f 	andi      	r1, r1, 127

    LOG_ERROR("CPU Exception: NO.%u\n", vec);
1fff1ed0:	1015      	lrw      	r0, 0x1fff345c	// 1fff1f24 <trap_c+0x64>
1fff1ed2:	6d97      	mov      	r6, r5
1fff1ed4:	e0000084 	bsr      	0x1fff1fdc	// 1fff1fdc <dbg_printf>

    for (i = 0; i < 16; i++) {
        LOG_ERROR("r%d: %08x\t", i, regs[i]);
1fff1ed8:	1074      	lrw      	r3, 0x1fff3472	// 1fff1f28 <trap_c+0x68>
    for (i = 0; i < 16; i++) {
1fff1eda:	3400      	movi      	r4, 0
        LOG_ERROR("r%d: %08x\t", i, regs[i]);
1fff1edc:	b860      	st.w      	r3, (r14, 0x0)

        if ((i % 4) == 3) {
            LOG_ERROR("\n");
1fff1ede:	10f4      	lrw      	r7, 0x1fff3596	// 1fff1f2c <trap_c+0x6c>
        LOG_ERROR("r%d: %08x\t", i, regs[i]);
1fff1ee0:	9640      	ld.w      	r2, (r6, 0x0)
1fff1ee2:	6c53      	mov      	r1, r4
1fff1ee4:	9800      	ld.w      	r0, (r14, 0x0)
1fff1ee6:	e000007b 	bsr      	0x1fff1fdc	// 1fff1fdc <dbg_printf>
        if ((i % 4) == 3) {
1fff1eea:	e4442003 	andi      	r2, r4, 3
1fff1eee:	3a43      	cmpnei      	r2, 3
1fff1ef0:	0804      	bt      	0x1fff1ef8	// 1fff1ef8 <trap_c+0x38>
            LOG_ERROR("\n");
1fff1ef2:	6c1f      	mov      	r0, r7
1fff1ef4:	e0000074 	bsr      	0x1fff1fdc	// 1fff1fdc <dbg_printf>
    for (i = 0; i < 16; i++) {
1fff1ef8:	2400      	addi      	r4, 1
1fff1efa:	3c50      	cmpnei      	r4, 16
1fff1efc:	2603      	addi      	r6, 4
1fff1efe:	0bf1      	bt      	0x1fff1ee0	// 1fff1ee0 <trap_c+0x20>
        }
    }

    LOG_ERROR("\n");
1fff1f00:	100b      	lrw      	r0, 0x1fff3596	// 1fff1f2c <trap_c+0x6c>
1fff1f02:	e000006d 	bsr      	0x1fff1fdc	// 1fff1fdc <dbg_printf>
    LOG_ERROR("epsr: %8x\n", regs[16]);
1fff1f06:	9530      	ld.w      	r1, (r5, 0x40)
1fff1f08:	100a      	lrw      	r0, 0x1fff347d	// 1fff1f30 <trap_c+0x70>
1fff1f0a:	e0000069 	bsr      	0x1fff1fdc	// 1fff1fdc <dbg_printf>
    LOG_ERROR("epc : %8x\n", regs[17]);
1fff1f0e:	9531      	ld.w      	r1, (r5, 0x44)
1fff1f10:	1009      	lrw      	r0, 0x1fff3488	// 1fff1f34 <trap_c+0x74>
1fff1f12:	e0000065 	bsr      	0x1fff1fdc	// 1fff1fdc <dbg_printf>

    if (trap_c_callback) {
1fff1f16:	1069      	lrw      	r3, 0x1fff4644	// 1fff1f38 <trap_c+0x78>
1fff1f18:	9360      	ld.w      	r3, (r3, 0x0)
1fff1f1a:	3b40      	cmpnei      	r3, 0
1fff1f1c:	0c02      	bf      	0x1fff1f20	// 1fff1f20 <trap_c+0x60>
        trap_c_callback();
1fff1f1e:	7bcd      	jsr      	r3
1fff1f20:	0400      	br      	0x1fff1f20	// 1fff1f20 <trap_c+0x60>
1fff1f22:	0000      	bkpt
1fff1f24:	1fff345c 	.long	0x1fff345c
1fff1f28:	1fff3472 	.long	0x1fff3472
1fff1f2c:	1fff3596 	.long	0x1fff3596
1fff1f30:	1fff347d 	.long	0x1fff347d
1fff1f34:	1fff3488 	.long	0x1fff3488
1fff1f38:	1fff4644 	.long	0x1fff4644

1fff1f3c <hal_rtc_clock_config>:
#include "error.h"
#include "gpio.h"


void hal_rtc_clock_config(CLK32K_e clk32Mode)
{
1fff1f3c:	14d0      	push      	r15
    if(clk32Mode == CLK_32K_RCOSC)
1fff1f3e:	3841      	cmpnei      	r0, 1
1fff1f40:	0820      	bt      	0x1fff1f80	// 1fff1f80 <hal_rtc_clock_config+0x44>
    {
        subWriteReg(&(AP_AON->PMCTL0),31,27,0x05);
1fff1f42:	105e      	lrw      	r2, 0x4000f000	// 1fff1fb8 <hal_rtc_clock_config+0x7c>
1fff1f44:	9265      	ld.w      	r3, (r2, 0x14)
1fff1f46:	4365      	lsli      	r3, r3, 5
1fff1f48:	4b65      	lsri      	r3, r3, 5
1fff1f4a:	3bbb      	bseti      	r3, 27
1fff1f4c:	3bbd      	bseti      	r3, 29
1fff1f4e:	b265      	st.w      	r3, (r2, 0x14)
1fff1f50:	6c03      	mov      	r0, r0
        subWriteReg(&(AP_AON->PMCTL2_0),16,7,0x3fb);
1fff1f52:	103b      	lrw      	r1, 0xfffe007f	// 1fff1fbc <hal_rtc_clock_config+0x80>
1fff1f54:	9267      	ld.w      	r3, (r2, 0x1c)
1fff1f56:	68c4      	and      	r3, r1
1fff1f58:	103a      	lrw      	r1, 0x1fd80	// 1fff1fc0 <hal_rtc_clock_config+0x84>
1fff1f5a:	6cc4      	or      	r3, r1
1fff1f5c:	b267      	st.w      	r3, (r2, 0x1c)
1fff1f5e:	6c03      	mov      	r0, r0
        subWriteReg(&(AP_AON->PMCTL2_0),6,6,0x01);
1fff1f60:	9267      	ld.w      	r3, (r2, 0x1c)
1fff1f62:	ec630040 	ori      	r3, r3, 64
1fff1f66:	b267      	st.w      	r3, (r2, 0x1c)
        // P16 P17 for 32K XTAL input
        gpio_pull_set(P16,FLOATING);
        gpio_pull_set(P17,FLOATING);
        subWriteReg(&(AP_AON->PMCTL2_0),9,8,0x03);   //software control 32k_clk
        subWriteReg(&(AP_AON->PMCTL2_0),6,6,0x00);   //disable software control
        subWriteReg(&(AP_AON->PMCTL0),31,27,0x16);
1fff1f68:	6c03      	mov      	r0, r0
        //pGlobal_config[LL_SWITCH]&=0xffffffee;
    }

    //ZQ 20200812 for rc32k wakeup
    subWriteReg(&(AP_AON->PMCTL0),28,28,0x1);//turn on 32kxtal
1fff1f6a:	1074      	lrw      	r3, 0x4000f000	// 1fff1fb8 <hal_rtc_clock_config+0x7c>
1fff1f6c:	9345      	ld.w      	r2, (r3, 0x14)
1fff1f6e:	3abc      	bseti      	r2, 28
1fff1f70:	b345      	st.w      	r2, (r3, 0x14)
1fff1f72:	6c03      	mov      	r0, r0
    subWriteReg(&(AP_AON->PMCTL1),18,17,0x0);// reduce 32kxtl bias current
1fff1f74:	9346      	ld.w      	r2, (r3, 0x18)
1fff1f76:	3a91      	bclri      	r2, 17
1fff1f78:	3a92      	bclri      	r2, 18
1fff1f7a:	b346      	st.w      	r2, (r3, 0x18)
1fff1f7c:	6c03      	mov      	r0, r0
}
1fff1f7e:	1490      	pop      	r15
    else if(clk32Mode == CLK_32K_XTAL)
1fff1f80:	3840      	cmpnei      	r0, 0
1fff1f82:	0bf4      	bt      	0x1fff1f6a	// 1fff1f6a <hal_rtc_clock_config+0x2e>
        gpio_pull_set(P16,FLOATING);
1fff1f84:	3100      	movi      	r1, 0
1fff1f86:	300a      	movi      	r0, 10
1fff1f88:	e00008a2 	bsr      	0x1fff30cc	// 1fff30cc <rf_phy_ini1+0xa4>
        gpio_pull_set(P17,FLOATING);
1fff1f8c:	3100      	movi      	r1, 0
1fff1f8e:	300b      	movi      	r0, 11
1fff1f90:	e000089e 	bsr      	0x1fff30cc	// 1fff30cc <rf_phy_ini1+0xa4>
        subWriteReg(&(AP_AON->PMCTL2_0),9,8,0x03);   //software control 32k_clk
1fff1f94:	1049      	lrw      	r2, 0x4000f000	// 1fff1fb8 <hal_rtc_clock_config+0x7c>
1fff1f96:	9267      	ld.w      	r3, (r2, 0x1c)
1fff1f98:	ec630300 	ori      	r3, r3, 768
1fff1f9c:	b267      	st.w      	r3, (r2, 0x1c)
1fff1f9e:	6c03      	mov      	r0, r0
        subWriteReg(&(AP_AON->PMCTL2_0),6,6,0x00);   //disable software control
1fff1fa0:	9267      	ld.w      	r3, (r2, 0x1c)
1fff1fa2:	3b86      	bclri      	r3, 6
1fff1fa4:	b267      	st.w      	r3, (r2, 0x1c)
1fff1fa6:	6c03      	mov      	r0, r0
        subWriteReg(&(AP_AON->PMCTL0),31,27,0x16);
1fff1fa8:	9265      	ld.w      	r3, (r2, 0x14)
1fff1faa:	4365      	lsli      	r3, r3, 5
1fff1fac:	31b0      	movi      	r1, 176
1fff1fae:	4b65      	lsri      	r3, r3, 5
1fff1fb0:	4138      	lsli      	r1, r1, 24
1fff1fb2:	6cc4      	or      	r3, r1
1fff1fb4:	b265      	st.w      	r3, (r2, 0x14)
1fff1fb6:	07d9      	br      	0x1fff1f68	// 1fff1f68 <hal_rtc_clock_config+0x2c>
1fff1fb8:	4000f000 	.long	0x4000f000
1fff1fbc:	fffe007f 	.long	0xfffe007f
1fff1fc0:	0001fd80 	.long	0x0001fd80

1fff1fc4 <_uart_putc>:
#include <string.h>
#include "uart.h"
#include "log.h"

static void _uart_putc(char* data, uint16_t size)
{
1fff1fc4:	14d0      	push      	r15
1fff1fc6:	6c87      	mov      	r2, r1
    hal_uart_send_buff(UART0, (uint8_t*)data, size);
1fff1fc8:	6c43      	mov      	r1, r0
1fff1fca:	3000      	movi      	r0, 0
1fff1fcc:	e0000976 	bsr      	0x1fff32b8	// 1fff32b8 <rf_phy_ini1+0x290>
}
1fff1fd0:	1490      	pop      	r15

1fff1fd2 <dbg_UART0_IRQHandler>:
    log_vsprintf(_uart_putc, format, args);
    va_end(args);
}

void dbg_UART0_IRQHandler(void)
{
1fff1fd2:	14d0      	push      	r15
    hal_UART0_IRQHandler();
1fff1fd4:	e0000924 	bsr      	0x1fff321c	// 1fff321c <rf_phy_ini1+0x1f4>
}
1fff1fd8:	1490      	pop      	r15
	...

1fff1fdc <dbg_printf>:
{
1fff1fdc:	1424      	subi      	r14, r14, 16
1fff1fde:	b863      	st.w      	r3, (r14, 0xc)
1fff1fe0:	b842      	st.w      	r2, (r14, 0x8)
1fff1fe2:	b821      	st.w      	r1, (r14, 0x4)
1fff1fe4:	b800      	st.w      	r0, (r14, 0x0)
1fff1fe6:	14d0      	push      	r15
    log_vsprintf(_uart_putc, format, args);
1fff1fe8:	1005      	lrw      	r0, 0x1fff1fc4	// 1fff1ffc <dbg_printf+0x20>
1fff1fea:	1a02      	addi      	r2, r14, 8
{
1fff1fec:	9861      	ld.w      	r3, (r14, 0x4)
    log_vsprintf(_uart_putc, format, args);
1fff1fee:	6c4f      	mov      	r1, r3
1fff1ff0:	e00008b0 	bsr      	0x1fff3150	// 1fff3150 <rf_phy_ini1+0x128>
}
1fff1ff4:	d9ee2000 	ld.w      	r15, (r14, 0x0)
1fff1ff8:	1405      	addi      	r14, r14, 20
1fff1ffa:	783c      	jmp      	r15
1fff1ffc:	1fff1fc4 	.long	0x1fff1fc4

1fff2000 <dbg_printf_init>:

void dbg_printf_init(void)
{
1fff2000:	14d0      	push      	r15
1fff2002:	142d      	subi      	r14, r14, 52
    uart_Cfg_t cfg =
1fff2004:	3220      	movi      	r2, 32
1fff2006:	3100      	movi      	r1, 0
1fff2008:	1805      	addi      	r0, r14, 20
1fff200a:	e3fffeb1 	bsr      	0x1fff1d6c	// 1fff1d6c <__memset_fast>
1fff200e:	3305      	movi      	r3, 5
        .hw_fwctrl = FALSE,
        .use_tx_buf = FALSE,
        .parity     = FALSE,
        .evt_handler = NULL,
    };
    JUMP_FUNCTION_SET(UART0_IRQ_HANDLER,(uint32_t)&dbg_UART0_IRQHandler);
1fff2010:	1030      	lrw      	r1, 0x1fff1fd2	// 1fff2050 <dbg_printf_init+0x50>
1fff2012:	3071      	movi      	r0, 113
    uart_Cfg_t cfg =
1fff2014:	b865      	st.w      	r3, (r14, 0x14)
1fff2016:	3306      	movi      	r3, 6
1fff2018:	b866      	st.w      	r3, (r14, 0x18)
1fff201a:	33ff      	movi      	r3, 255
1fff201c:	b867      	st.w      	r3, (r14, 0x1c)
1fff201e:	b868      	st.w      	r3, (r14, 0x20)
1fff2020:	33e1      	movi      	r3, 225
1fff2022:	4369      	lsli      	r3, r3, 9
1fff2024:	b869      	st.w      	r3, (r14, 0x24)
1fff2026:	3301      	movi      	r3, 1
1fff2028:	dc6e0028 	st.b      	r3, (r14, 0x28)
    JUMP_FUNCTION_SET(UART0_IRQ_HANDLER,(uint32_t)&dbg_UART0_IRQHandler);
1fff202c:	e0000886 	bsr      	0x1fff3138	// 1fff3138 <rf_phy_ini1+0x110>
    hal_uart_init(cfg, UART0);//uart init
1fff2030:	3300      	movi      	r3, 0
1fff2032:	3210      	movi      	r2, 16
1fff2034:	6c3b      	mov      	r0, r14
1fff2036:	b864      	st.w      	r3, (r14, 0x10)
1fff2038:	1909      	addi      	r1, r14, 36
1fff203a:	e3fffeed 	bsr      	0x1fff1e14	// 1fff1e14 <__memcpy_fast>
1fff203e:	9805      	ld.w      	r0, (r14, 0x14)
1fff2040:	9826      	ld.w      	r1, (r14, 0x18)
1fff2042:	9847      	ld.w      	r2, (r14, 0x1c)
1fff2044:	9868      	ld.w      	r3, (r14, 0x20)
1fff2046:	e00008c7 	bsr      	0x1fff31d4	// 1fff31d4 <rf_phy_ini1+0x1ac>
}
1fff204a:	140d      	addi      	r14, r14, 52
1fff204c:	1490      	pop      	r15
1fff204e:	0000      	bkpt
1fff2050:	1fff1fd2 	.long	0x1fff1fd2

1fff2054 <hal_pwrmgr_init>:
{
    AP_WDT_FEED;
    osal_pwrmgr_powerconserve0();
}
int hal_pwrmgr_init(void)
{
1fff2054:	14d0      	push      	r15
	
#if(CFG_SLEEP_MODE == PWR_MODE_NO_SLEEP)
	pwrmgr_config(PWR_MODE_NO_SLEEP);
#else
	pwrmgr_config(PWR_MODE_SLEEP);
1fff2056:	3002      	movi      	r0, 2
1fff2058:	e0000912 	bsr      	0x1fff327c	// 1fff327c <rf_phy_ini1+0x254>
#endif

    pwrmgr_init();
1fff205c:	e000084a 	bsr      	0x1fff30f0	// 1fff30f0 <rf_phy_ini1+0xc8>
	
    s_config_swClk0 = DEF_CLKG_CONFIG_0;
1fff2060:	1064      	lrw      	r3, 0x1fff02d4	// 1fff2070 <hal_pwrmgr_init+0x1c>
1fff2062:	1045      	lrw      	r2, 0x82191	// 1fff2074 <hal_pwrmgr_init+0x20>
    if(AP_WDT_ENABLE_STATE)
        JUMP_FUNCTION_SET(OSAL_POWER_CONSERVE,(uint32_t)&osal_idle_task);
#endif

    return PPlus_SUCCESS;
}
1fff2064:	3000      	movi      	r0, 0
    s_config_swClk0 = DEF_CLKG_CONFIG_0;
1fff2066:	b340      	st.w      	r2, (r3, 0x0)
    s_config_swClk1 = DEF_CLKG_CONFIG_1;
1fff2068:	1044      	lrw      	r2, 0x1e00258	// 1fff2078 <hal_pwrmgr_init+0x24>
1fff206a:	1065      	lrw      	r3, 0x1fff02d8	// 1fff207c <hal_pwrmgr_init+0x28>
1fff206c:	b340      	st.w      	r2, (r3, 0x0)
}
1fff206e:	1490      	pop      	r15
1fff2070:	1fff02d4 	.long	0x1fff02d4
1fff2074:	00082191 	.long	0x00082191
1fff2078:	01e00258 	.long	0x01e00258
1fff207c:	1fff02d8 	.long	0x1fff02d8

1fff2080 <hal_watchdog_config>:
#else
	(void) cycle;
	return PPlus_ERR_UNINITIALIZED;
#endif	
    
}
1fff2080:	3018      	movi      	r0, 24
1fff2082:	783c      	jmp      	r15

1fff2084 <clear_adcc_cfg>:
    gpio_pull_set(pin,GPIO_FLOATING);    //
}

static void clear_adcc_cfg(void)
{
	mAdc_Ctx.all_channel = 0x00;
1fff2084:	1064      	lrw      	r3, 0x1fff3600	// 1fff2094 <clear_adcc_cfg+0x10>
1fff2086:	3200      	movi      	r2, 0
1fff2088:	a341      	st.b      	r2, (r3, 0x1)
	mAdc_Ctx.chs_en_shadow = 0x00;
1fff208a:	a342      	st.b      	r2, (r3, 0x2)
	mAdc_Ctx.continue_mode = FALSE;
1fff208c:	a343      	st.b      	r2, (r3, 0x3)
	mAdc_Ctx.evt_handler = NULL;
1fff208e:	3200      	movi      	r2, 0
1fff2090:	b342      	st.w      	r2, (r3, 0x8)
}
1fff2092:	783c      	jmp      	r15
1fff2094:	1fff3600 	.long	0x1fff3600

1fff2098 <adc_wakeup_hdl>:
  \param [in]      IRQn  Interrupt number.
  \param [in]  priority  Priority to set.
 */
__STATIC_INLINE void csi_vic_set_prio(int32_t IRQn, uint32_t priority)
{
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
1fff2098:	1045      	lrw      	r2, 0xe000e100	// 1fff20ac <adc_wakeup_hdl+0x14>
1fff209a:	1026      	lrw      	r1, 0xffff00ff	// 1fff20b0 <adc_wakeup_hdl+0x18>
1fff209c:	d86220c7 	ld.w      	r3, (r2, 0x31c)
1fff20a0:	68c4      	and      	r3, r1
1fff20a2:	ec638000 	ori      	r3, r3, 32768
1fff20a6:	dc6220c7 	st.w      	r3, (r2, 0x31c)
}

static void adc_wakeup_hdl(void)
{
    NVIC_SetPriority((IRQn_Type)ADCC_IRQn, IRQ_PRIO_HAL);
}
1fff20aa:	783c      	jmp      	r15
1fff20ac:	e000e100 	.long	0xe000e100
1fff20b0:	ffff00ff 	.long	0xffff00ff

1fff20b4 <hal_adc_init>:
    @param       None.

    @return      None.
 **************************************************************************************/
void hal_adc_init(void)
{
1fff20b4:	14d1      	push      	r4, r15
    pwrmgr_register(MOD_ADCC,NULL,adc_wakeup_hdl);
1fff20b6:	1058      	lrw      	r2, 0x1fff2098	// 1fff2114 <hal_adc_init+0x60>
1fff20b8:	3100      	movi      	r1, 0
1fff20ba:	3011      	movi      	r0, 17
  mAdc_Ctx.adc_cal_negtive = (uint16_t)(adc_cal&0x0fff);
1fff20bc:	1097      	lrw      	r4, 0x1fff3600	// 1fff2118 <hal_adc_init+0x64>
    pwrmgr_register(MOD_ADCC,NULL,adc_wakeup_hdl);
1fff20be:	e00007e9 	bsr      	0x1fff3090	// 1fff3090 <rf_phy_ini1+0x68>
	clear_adcc_cfg();
1fff20c2:	e3ffffe1 	bsr      	0x1fff2084	// 1fff2084 <clear_adcc_cfg>
  uint32_t adc_cal = read_reg(SPIF_RSVD1_ADC_CALIBRATE);
1fff20c6:	1076      	lrw      	r3, 0x11001000	// 1fff211c <hal_adc_init+0x68>
  LOG("AD_CAL[%x %x]\n",mAdc_Ctx.adc_cal_negtive,mAdc_Ctx.adc_cal_postive);
1fff20c8:	1016      	lrw      	r0, 0x1fff34ae	// 1fff2120 <hal_adc_init+0x6c>
  uint32_t adc_cal = read_reg(SPIF_RSVD1_ADC_CALIBRATE);
1fff20ca:	9340      	ld.w      	r2, (r3, 0x0)
  mAdc_Ctx.adc_cal_negtive = (uint16_t)(adc_cal&0x0fff);
1fff20cc:	e4222fff 	andi      	r1, r2, 4095
  mAdc_Ctx.adc_cal_postive = (uint16_t)((adc_cal>>16)&0x0fff);
1fff20d0:	4a50      	lsri      	r2, r2, 16
1fff20d2:	e4422fff 	andi      	r2, r2, 4095
  mAdc_Ctx.adc_cal_negtive = (uint16_t)(adc_cal&0x0fff);
1fff20d6:	ac23      	st.h      	r1, (r4, 0x6)
  mAdc_Ctx.adc_cal_postive = (uint16_t)((adc_cal>>16)&0x0fff);
1fff20d8:	ac42      	st.h      	r2, (r4, 0x4)
  LOG("AD_CAL[%x %x]\n",mAdc_Ctx.adc_cal_negtive,mAdc_Ctx.adc_cal_postive);
1fff20da:	e3ffff81 	bsr      	0x1fff1fdc	// 1fff1fdc <dbg_printf>
  if((mAdc_Ctx.adc_cal_negtive < 0x733) || (mAdc_Ctx.adc_cal_negtive > 0x8cc) ||
1fff20de:	8c63      	ld.h      	r3, (r4, 0x6)
1fff20e0:	e4631732 	subi      	r3, r3, 1843
1fff20e4:	74cd      	zexth      	r3, r3
1fff20e6:	eb030199 	cmphsi      	r3, 410
1fff20ea:	0808      	bt      	0x1fff20fa	// 1fff20fa <hal_adc_init+0x46>
1fff20ec:	8c62      	ld.h      	r3, (r4, 0x4)
1fff20ee:	e4631732 	subi      	r3, r3, 1843
1fff20f2:	74cd      	zexth      	r3, r3
1fff20f4:	eb030199 	cmphsi      	r3, 410
1fff20f8:	0c0b      	bf      	0x1fff210e	// 1fff210e <hal_adc_init+0x5a>
    LOG("->AD_CAL[%x %x]\n",mAdc_Ctx.adc_cal_negtive, mAdc_Ctx.adc_cal_postive);
1fff20fa:	ea020fff 	movi      	r2, 4095
    mAdc_Ctx.adc_cal_negtive = 0xfff;
1fff20fe:	ea030fff 	movi      	r3, 4095
    LOG("->AD_CAL[%x %x]\n",mAdc_Ctx.adc_cal_negtive, mAdc_Ctx.adc_cal_postive);
1fff2102:	6c4b      	mov      	r1, r2
1fff2104:	1008      	lrw      	r0, 0x1fff34ac	// 1fff2124 <hal_adc_init+0x70>
    mAdc_Ctx.adc_cal_negtive = 0xfff;
1fff2106:	ac63      	st.h      	r3, (r4, 0x6)
    mAdc_Ctx.adc_cal_postive = 0xfff;
1fff2108:	ac62      	st.h      	r3, (r4, 0x4)
    LOG("->AD_CAL[%x %x]\n",mAdc_Ctx.adc_cal_negtive, mAdc_Ctx.adc_cal_postive);
1fff210a:	e3ffff69 	bsr      	0x1fff1fdc	// 1fff1fdc <dbg_printf>
	hal_adc_load_calibration_value();   
	mAdc_Ctx.enable = TRUE;
1fff210e:	3301      	movi      	r3, 1
1fff2110:	a460      	st.b      	r3, (r4, 0x0)
}
1fff2112:	1491      	pop      	r4, r15
1fff2114:	1fff2098 	.long	0x1fff2098
1fff2118:	1fff3600 	.long	0x1fff3600
1fff211c:	11001000 	.long	0x11001000
1fff2120:	1fff34ae 	.long	0x1fff34ae
1fff2124:	1fff34ac 	.long	0x1fff34ac

1fff2128 <hal_adc_start>:
//    subWriteReg(&(AP_PCRM->ADC_CTL4),2,1,clk);
//    return PPlus_SUCCESS;
//}

int hal_adc_start(void)
{
1fff2128:	14d3      	push      	r4-r6, r15
								((mAdc_Ctx.chs_en_shadow&0x20)>>1)|\
								((mAdc_Ctx.chs_en_shadow&0x10)<<1)|\
								((mAdc_Ctx.chs_en_shadow&0x08)>>1)|\
								((mAdc_Ctx.chs_en_shadow&0x04)<<1));
	
	if(mAdc_Ctx.enable == FALSE)
1fff212a:	11b2      	lrw      	r5, 0x1fff3600	// 1fff21f0 <hal_adc_start+0xc8>
1fff212c:	8560      	ld.b      	r3, (r5, 0x0)
1fff212e:	3b40      	cmpnei      	r3, 0
1fff2130:	0c5d      	bf      	0x1fff21ea	// 1fff21ea <hal_adc_start+0xc2>
	uint8_t     all_channel2 = (((mAdc_Ctx.chs_en_shadow&0x80)>>1)|\
1fff2132:	8562      	ld.b      	r3, (r5, 0x2)
1fff2134:	4b41      	lsri      	r2, r3, 1
								((mAdc_Ctx.chs_en_shadow&0x40)<<1)|\
1fff2136:	4361      	lsli      	r3, r3, 1
1fff2138:	74ce      	sextb      	r3, r3
								((mAdc_Ctx.chs_en_shadow&0x04)<<1));
1fff213a:	e4232008 	andi      	r1, r3, 8
								((mAdc_Ctx.chs_en_shadow&0x08)>>1)|\
1fff213e:	e4822004 	andi      	r4, r2, 4
1fff2142:	6d04      	or      	r4, r1
								((mAdc_Ctx.chs_en_shadow&0x10)<<1)|\
1fff2144:	e4232020 	andi      	r1, r3, 32
								((mAdc_Ctx.chs_en_shadow&0x08)>>1)|\
1fff2148:	6d04      	or      	r4, r1
								((mAdc_Ctx.chs_en_shadow&0x20)>>1)|\
1fff214a:	e4222010 	andi      	r1, r2, 16
								((mAdc_Ctx.chs_en_shadow&0x08)>>1)|\
1fff214e:	6d04      	or      	r4, r1
								((mAdc_Ctx.chs_en_shadow&0x40)<<1)|\
1fff2150:	3100      	movi      	r1, 0
1fff2152:	297f      	subi      	r1, 128
1fff2154:	68c4      	and      	r3, r1
								((mAdc_Ctx.chs_en_shadow&0x08)>>1)|\
1fff2156:	6d0c      	or      	r4, r3
	uint8_t     all_channel2 = (((mAdc_Ctx.chs_en_shadow&0x80)>>1)|\
1fff2158:	e4422040 	andi      	r2, r2, 64
								((mAdc_Ctx.chs_en_shadow&0x08)>>1)|\
1fff215c:	6d08      	or      	r4, r2
	uint8_t     all_channel2 = (((mAdc_Ctx.chs_en_shadow&0x80)>>1)|\
1fff215e:	7510      	zextb      	r4, r4
	{
		return PPlus_ERR_NOT_REGISTED;
	}
	
	LOG("all_channel2:0x%x\n",all_channel2);
1fff2160:	6c53      	mov      	r1, r4
1fff2162:	1105      	lrw      	r0, 0x1fff34bd	// 1fff21f4 <hal_adc_start+0xcc>
    _symrom_pwrmgr_lock(MOD_ADCC);
	JUMP_FUNCTION_SET(ADCC_IRQ_HANDLER,(uint32_t)&hal_ADC_IRQ);

	for(int i=MIN_ADC_CH; i<=MAX_ADC_CH; i++)
	{
		if(all_channel2 & (BIT(i)))
1fff2164:	3601      	movi      	r6, 1
	LOG("all_channel2:0x%x\n",all_channel2);
1fff2166:	e3ffff3b 	bsr      	0x1fff1fdc	// 1fff1fdc <dbg_printf>
    _symrom_pwrmgr_lock(MOD_ADCC);
1fff216a:	3011      	movi      	r0, 17
1fff216c:	e000084c 	bsr      	0x1fff3204	// 1fff3204 <rf_phy_ini1+0x1dc>
	JUMP_FUNCTION_SET(ADCC_IRQ_HANDLER,(uint32_t)&hal_ADC_IRQ);
1fff2170:	1122      	lrw      	r1, 0x1fff2608	// 1fff21f8 <hal_adc_start+0xd0>
1fff2172:	307d      	movi      	r0, 125
1fff2174:	e00007e2 	bsr      	0x1fff3138	// 1fff3138 <rf_phy_ini1+0x110>
	for(int i=MIN_ADC_CH; i<=MAX_ADC_CH; i++)
1fff2178:	3202      	movi      	r2, 2
1fff217a:	1161      	lrw      	r3, 0x4000f03c	// 1fff21fc <hal_adc_start+0xd4>
			case ADC_CH3N_P15:
				AP_PCRM->ADC_CTL3 |= BIT(20);
				break;

			case ADC_CH3P_P20:
				AP_PCRM->ADC_CTL3 |= BIT(4);
1fff217c:	3110      	movi      	r1, 16
		if(all_channel2 & (BIT(i)))
1fff217e:	c4444040 	lsr      	r0, r4, r2
1fff2182:	6818      	and      	r0, r6
1fff2184:	3840      	cmpnei      	r0, 0
1fff2186:	0c0c      	bf      	0x1fff219e	// 1fff219e <hal_adc_start+0x76>
			switch (i)
1fff2188:	5a0b      	subi      	r0, r2, 3
1fff218a:	3804      	cmphsi      	r0, 5
1fff218c:	0806      	bt      	0x1fff2198	// 1fff2198 <hal_adc_start+0x70>
1fff218e:	e3fff76f 	bsr      	0x1fff106c	// 1fff106c <___gnu_csky_case_uqi>
1fff2192:	1e1b      	.short	0x1e1b
1fff2194:	00292522 	.long	0x00292522
				AP_PCRM->ADC_CTL1 |= BIT(20);
1fff2198:	930d      	ld.w      	r0, (r3, 0x34)
1fff219a:	38b4      	bseti      	r0, 20
				AP_PCRM->ADC_CTL1 |= BIT(4);
1fff219c:	b30d      	st.w      	r0, (r3, 0x34)
	for(int i=MIN_ADC_CH; i<=MAX_ADC_CH; i++)
1fff219e:	2200      	addi      	r2, 1
1fff21a0:	3a48      	cmpnei      	r2, 8
1fff21a2:	0bee      	bt      	0x1fff217e	// 1fff217e <hal_adc_start+0x56>
				break;
			}
		}		
	}
	    
    AP_PCRM->ANA_CTL |= BIT(3);//ENABLE_ADC;
1fff21a4:	1076      	lrw      	r3, 0x4000f03c	// 1fff21fc <hal_adc_start+0xd4>
   
    NVIC_EnableIRQ((IRQn_Type)ADCC_IRQn); //ADC_IRQ_ENABLE;   
	AP_ADCC->intr_mask = mAdc_Ctx.all_channel; //ENABLE_ADC_INT;
	
    //disableSleep();
    return PPlus_SUCCESS;
1fff21a6:	3000      	movi      	r0, 0
    AP_PCRM->ANA_CTL |= BIT(3);//ENABLE_ADC;
1fff21a8:	9323      	ld.w      	r1, (r3, 0xc)
1fff21aa:	6c84      	or      	r2, r1
1fff21ac:	b343      	st.w      	r2, (r3, 0xc)
    AP_PCRM->ANA_CTL |= BIT(0);//new
1fff21ae:	9343      	ld.w      	r2, (r3, 0xc)
1fff21b0:	ec420001 	ori      	r2, r2, 1
1fff21b4:	b343      	st.w      	r2, (r3, 0xc)
    VIC->ISER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
1fff21b6:	1053      	lrw      	r2, 0xe000e100	// 1fff2200 <hal_adc_start+0xd8>
1fff21b8:	3380      	movi      	r3, 128
1fff21ba:	4376      	lsli      	r3, r3, 22
1fff21bc:	b260      	st.w      	r3, (r2, 0x0)
	AP_ADCC->intr_mask = mAdc_Ctx.all_channel; //ENABLE_ADC_INT;
1fff21be:	ea234005 	movih      	r3, 16389
1fff21c2:	8541      	ld.b      	r2, (r5, 0x1)
1fff21c4:	b34d      	st.w      	r2, (r3, 0x34)
}
1fff21c6:	1493      	pop      	r4-r6, r15
				AP_PCRM->ADC_CTL1 |= BIT(4);
1fff21c8:	930d      	ld.w      	r0, (r3, 0x34)
1fff21ca:	6c04      	or      	r0, r1
1fff21cc:	07e8      	br      	0x1fff219c	// 1fff219c <hal_adc_start+0x74>
				AP_PCRM->ADC_CTL2 |= BIT(20);
1fff21ce:	930e      	ld.w      	r0, (r3, 0x38)
1fff21d0:	38b4      	bseti      	r0, 20
				AP_PCRM->ADC_CTL2 |= BIT(4);
1fff21d2:	b30e      	st.w      	r0, (r3, 0x38)
				break;
1fff21d4:	07e5      	br      	0x1fff219e	// 1fff219e <hal_adc_start+0x76>
				AP_PCRM->ADC_CTL2 |= BIT(4);
1fff21d6:	930e      	ld.w      	r0, (r3, 0x38)
1fff21d8:	6c04      	or      	r0, r1
1fff21da:	07fc      	br      	0x1fff21d2	// 1fff21d2 <hal_adc_start+0xaa>
				AP_PCRM->ADC_CTL3 |= BIT(20);
1fff21dc:	930f      	ld.w      	r0, (r3, 0x3c)
1fff21de:	38b4      	bseti      	r0, 20
				AP_PCRM->ADC_CTL3 |= BIT(4);
1fff21e0:	b30f      	st.w      	r0, (r3, 0x3c)
				break;
1fff21e2:	07de      	br      	0x1fff219e	// 1fff219e <hal_adc_start+0x76>
				AP_PCRM->ADC_CTL3 |= BIT(4);
1fff21e4:	930f      	ld.w      	r0, (r3, 0x3c)
1fff21e6:	6c04      	or      	r0, r1
1fff21e8:	07fc      	br      	0x1fff21e0	// 1fff21e0 <hal_adc_start+0xb8>
		return PPlus_ERR_NOT_REGISTED;
1fff21ea:	3012      	movi      	r0, 18
1fff21ec:	07ed      	br      	0x1fff21c6	// 1fff21c6 <hal_adc_start+0x9e>
1fff21ee:	0000      	bkpt
1fff21f0:	1fff3600 	.long	0x1fff3600
1fff21f4:	1fff34bd 	.long	0x1fff34bd
1fff21f8:	1fff2608 	.long	0x1fff2608
1fff21fc:	4000f03c 	.long	0x4000f03c
1fff2200:	e000e100 	.long	0xe000e100

1fff2204 <hal_adc_config_channel>:

int hal_adc_config_channel(adc_Cfg_t cfg, adc_Hdl_t evt_handler)
{
1fff2204:	14d4      	push      	r4-r7, r15
1fff2206:	1429      	subi      	r14, r14, 36
    uint8_t i;
    volatile uint8_t chn_sel;
    volatile gpio_pin_e pin,pin_neg;
	
	if(mAdc_Ctx.enable == FALSE)
1fff2208:	017d      	lrw      	r3, 0x1fff3600	// 1fff2510 <hal_adc_config_channel+0x30c>
{
1fff220a:	b822      	st.w      	r1, (r14, 0x8)
1fff220c:	b805      	st.w      	r0, (r14, 0x14)
1fff220e:	b860      	st.w      	r3, (r14, 0x0)
	if(mAdc_Ctx.enable == FALSE)
1fff2210:	83c0      	ld.b      	r6, (r3, 0x0)
1fff2212:	3e40      	cmpnei      	r6, 0
1fff2214:	0d78      	bf      	0x1fff2504	// 1fff2504 <hal_adc_config_channel+0x300>
	{
		return PPlus_ERR_NOT_REGISTED;
	}

    if(evt_handler == NULL)
1fff2216:	3940      	cmpnei      	r1, 0
1fff2218:	0d7a      	bf      	0x1fff250c	// 1fff250c <hal_adc_config_channel+0x308>
1fff221a:	d86e0014 	ld.b      	r3, (r14, 0x14)
1fff221e:	e4a32003 	andi      	r5, r3, 3
1fff2222:	b861      	st.w      	r3, (r14, 0x4)
    {
        return PPlus_ERR_INVALID_PARAM;
    }

    if((cfg.channel & BIT(0)) || (cfg.channel & BIT(1)))
1fff2224:	3d40      	cmpnei      	r5, 0
1fff2226:	0971      	bt      	0x1fff2508	// 1fff2508 <hal_adc_config_channel+0x304>
1fff2228:	d88e0016 	ld.b      	r4, (r14, 0x16)
    if(((!cfg.channel) & BIT(1))&&(cfg.is_differential_mode && (cfg.channel & BIT(1))))
    {
        return PPlus_ERR_INVALID_PARAM;
    }

    if(cfg.is_differential_mode != 0)
1fff222c:	e46420f7 	andi      	r3, r4, 247
1fff2230:	3b40      	cmpnei      	r3, 0
1fff2232:	0c07      	bf      	0x1fff2240	// 1fff2240 <hal_adc_config_channel+0x3c>
    {
        if((cfg.is_differential_mode != 0x80) && (cfg.is_differential_mode != 0x20) && (cfg.is_differential_mode != 0x08))
1fff2234:	eb440080 	cmpnei      	r4, 128
1fff2238:	0c04      	bf      	0x1fff2240	// 1fff2240 <hal_adc_config_channel+0x3c>
1fff223a:	eb440020 	cmpnei      	r4, 32
1fff223e:	0967      	bt      	0x1fff250c	// 1fff250c <hal_adc_config_channel+0x308>
        {
            return PPlus_ERR_INVALID_PARAM;
        }
    }

	clear_adcc_cfg();
1fff2240:	e3ffff22 	bsr      	0x1fff2084	// 1fff2084 <clear_adcc_cfg>
	
	AP_AON->PMCTL2_1 = 0x00;
1fff2244:	026b      	lrw      	r3, 0x4000f000	// 1fff2514 <hal_adc_config_channel+0x310>
1fff2246:	3200      	movi      	r2, 0
	AP_PCRM->ANA_CTL &= ~BIT(0);
	AP_PCRM->ANA_CTL &= ~BIT(3);
	
	clk_gate_disable(MOD_ADCC);
1fff2248:	3011      	movi      	r0, 17
	AP_AON->PMCTL2_1 = 0x00;
1fff224a:	b348      	st.w      	r2, (r3, 0x20)
	AP_PCRM->ANA_CTL &= ~BIT(0);
1fff224c:	9352      	ld.w      	r2, (r3, 0x48)
1fff224e:	3a80      	bclri      	r2, 0
1fff2250:	b352      	st.w      	r2, (r3, 0x48)
	AP_PCRM->ANA_CTL &= ~BIT(3);
1fff2252:	9352      	ld.w      	r2, (r3, 0x48)
1fff2254:	3a83      	bclri      	r2, 3
1fff2256:	b352      	st.w      	r2, (r3, 0x48)
	clk_gate_disable(MOD_ADCC);
1fff2258:	e000075e 	bsr      	0x1fff3114	// 1fff3114 <rf_phy_ini1+0xec>
	clk_reset(MOD_ADCC);
1fff225c:	3011      	movi      	r0, 17
1fff225e:	e00007c1 	bsr      	0x1fff31e0	// 1fff31e0 <rf_phy_ini1+0x1b8>
	
    mAdc_Ctx.continue_mode = cfg.is_continue_mode;
1fff2262:	9860      	ld.w      	r3, (r14, 0x0)
1fff2264:	d84e0015 	ld.b      	r2, (r14, 0x15)
    mAdc_Ctx.all_channel = cfg.channel & 0x03;
	
    for(i=2; i<8; i++)
    {
        if(cfg.channel & BIT(i))
1fff2268:	3101      	movi      	r1, 1
    mAdc_Ctx.continue_mode = cfg.is_continue_mode;
1fff226a:	a343      	st.b      	r2, (r3, 0x3)
    mAdc_Ctx.all_channel = cfg.channel & 0x03;
1fff226c:	3200      	movi      	r2, 0
1fff226e:	a341      	st.b      	r2, (r3, 0x1)
1fff2270:	3302      	movi      	r3, 2
1fff2272:	3200      	movi      	r2, 0
        if(cfg.channel & BIT(i))
1fff2274:	98e1      	ld.w      	r7, (r14, 0x4)
1fff2276:	71cd      	lsr      	r7, r3
1fff2278:	69c4      	and      	r7, r1
1fff227a:	740c      	zextb      	r0, r3
1fff227c:	3f40      	cmpnei      	r7, 0
1fff227e:	0c0b      	bf      	0x1fff2294	// 1fff2294 <hal_adc_config_channel+0x90>
        {
            if(i%2)
1fff2280:	e4002001 	andi      	r0, r0, 1
1fff2284:	3840      	cmpnei      	r0, 0
1fff2286:	0c53      	bf      	0x1fff232c	// 1fff232c <hal_adc_config_channel+0x128>
            {
                mAdc_Ctx.all_channel |= BIT(i-1);
1fff2288:	5b43      	subi      	r2, r3, 1
            }
            else
            {
                mAdc_Ctx.all_channel |= BIT(i+1);
1fff228a:	c4414022 	lsl      	r2, r1, r2
1fff228e:	6d48      	or      	r5, r2
1fff2290:	7554      	zextb      	r5, r5
1fff2292:	6c9b      	mov      	r2, r6
1fff2294:	2300      	addi      	r3, 1
    for(i=2; i<8; i++)
1fff2296:	3b48      	cmpnei      	r3, 8
1fff2298:	0bee      	bt      	0x1fff2274	// 1fff2274 <hal_adc_config_channel+0x70>
1fff229a:	3a40      	cmpnei      	r2, 0
1fff229c:	0c03      	bf      	0x1fff22a2	// 1fff22a2 <hal_adc_config_channel+0x9e>
1fff229e:	9860      	ld.w      	r3, (r14, 0x0)
1fff22a0:	a3a1      	st.b      	r5, (r3, 0x1)
            }
        }
    }
	mAdc_Ctx.chs_en_shadow = mAdc_Ctx.all_channel;
1fff22a2:	9860      	ld.w      	r3, (r14, 0x0)
1fff22a4:	8341      	ld.b      	r2, (r3, 0x1)
1fff22a6:	a342      	st.b      	r2, (r3, 0x2)
	//LOG("cfg.channel:0x%x\n",cfg.channel);
	//LOG("mAdc_Ctx.all_channel:0x%x\n",mAdc_Ctx.all_channel);
	
    if((AP_PCR->SW_CLK & BIT(MOD_ADCC)) == 0)
1fff22a8:	3380      	movi      	r3, 128
1fff22aa:	4377      	lsli      	r3, r3, 23
1fff22ac:	3280      	movi      	r2, 128
1fff22ae:	9362      	ld.w      	r3, (r3, 0x8)
1fff22b0:	424a      	lsli      	r2, r2, 10
1fff22b2:	68c8      	and      	r3, r2
1fff22b4:	3b40      	cmpnei      	r3, 0
1fff22b6:	0804      	bt      	0x1fff22be	// 1fff22be <hal_adc_config_channel+0xba>
    {
        clk_gate_enable(MOD_ADCC);
1fff22b8:	3011      	movi      	r0, 17
1fff22ba:	e00007b7 	bsr      	0x1fff3228	// 1fff3228 <rf_phy_ini1+0x200>
    }

    //CLK_1P28M_ENABLE;
    AP_PCRM->CLKSEL |= BIT(6);
1fff22be:	0368      	lrw      	r3, 0x4000f03c	// 1fff2518 <hal_adc_config_channel+0x314>
    AP_AON->PMCTL2_1 = 0x00;
1fff22c0:	3602      	movi      	r6, 2
    AP_PCRM->CLKSEL |= BIT(6);
1fff22c2:	9340      	ld.w      	r2, (r3, 0x0)
1fff22c4:	ec420040 	ori      	r2, r2, 64
1fff22c8:	b340      	st.w      	r2, (r3, 0x0)
        if(channel & BIT(i_channel))
1fff22ca:	3501      	movi      	r5, 1
    //ENABLE_XTAL_OUTPUT;         //enable xtal 16M output,generate the 32M dll clock
    AP_PCRM->CLKHF_CTL0 |= BIT(18);
1fff22cc:	9341      	ld.w      	r2, (r3, 0x4)
1fff22ce:	3ab2      	bseti      	r2, 18
1fff22d0:	b341      	st.w      	r2, (r3, 0x4)
    //ENABLE_DLL;                  //enable DLL
    AP_PCRM->CLKHF_CTL1 |= BIT(7);
1fff22d2:	9342      	ld.w      	r2, (r3, 0x8)
1fff22d4:	ec420080 	ori      	r2, r2, 128
1fff22d8:	b342      	st.w      	r2, (r3, 0x8)
    //ADC_DBLE_CLOCK_DISABLE;      //disable double 32M clock,we are now use 32M clock,should enable bit<13>, diable bit<21>
    AP_PCRM->CLKHF_CTL1 &= ~BIT(21);//check
1fff22da:	9342      	ld.w      	r2, (r3, 0x8)
1fff22dc:	3a95      	bclri      	r2, 21
1fff22de:	b342      	st.w      	r2, (r3, 0x8)
    //subWriteReg(0x4000F044,21,20,3);
    //ADC_CLOCK_ENABLE;            //adc clock enbale,always use clk_32M
    AP_PCRM->CLKHF_CTL1 |= BIT(13);
1fff22e0:	9342      	ld.w      	r2, (r3, 0x8)
1fff22e2:	ec422000 	ori      	r2, r2, 8192
1fff22e6:	b342      	st.w      	r2, (r3, 0x8)
    //subWriteReg(0x4000f07c,4,4,1);    //set adc mode,1:mannual,0:auto mode
    AP_PCRM->ADC_CTL4 |= BIT(4);
1fff22e8:	9350      	ld.w      	r2, (r3, 0x40)
1fff22ea:	ec420010 	ori      	r2, r2, 16
1fff22ee:	b350      	st.w      	r2, (r3, 0x40)
    AP_PCRM->ADC_CTL4 |= BIT(0);
1fff22f0:	9350      	ld.w      	r2, (r3, 0x40)
1fff22f2:	ec420001 	ori      	r2, r2, 1
1fff22f6:	b350      	st.w      	r2, (r3, 0x40)
    AP_AON->PMCTL2_1 = 0x00;
1fff22f8:	3200      	movi      	r2, 0
    set_sampling_resolution_auto(cfg.channel, cfg.is_high_resolution,cfg.is_differential_mode);
1fff22fa:	d86e0017 	ld.b      	r3, (r14, 0x17)
1fff22fe:	b863      	st.w      	r3, (r14, 0xc)
    AP_AON->PMCTL2_1 = 0x00;
1fff2300:	037a      	lrw      	r3, 0x4000f000	// 1fff2514 <hal_adc_config_channel+0x310>
1fff2302:	b348      	st.w      	r2, (r3, 0x20)
        if(channel & BIT(i_channel))
1fff2304:	9821      	ld.w      	r1, (r14, 0x4)
1fff2306:	7059      	lsr      	r1, r6
1fff2308:	6854      	and      	r1, r5
1fff230a:	7498      	zextb      	r2, r6
1fff230c:	3940      	cmpnei      	r1, 0
1fff230e:	0c34      	bf      	0x1fff2376	// 1fff2376 <hal_adc_config_channel+0x172>
                                    (is_high_resolution & BIT(i_channel)),
1fff2310:	c4c54027 	lsl      	r7, r5, r6
1fff2314:	9823      	ld.w      	r1, (r14, 0xc)
    switch(channel)
1fff2316:	5a0b      	subi      	r0, r2, 3
1fff2318:	3804      	cmphsi      	r0, 5
                                    (is_high_resolution & BIT(i_channel)),
1fff231a:	685c      	and      	r1, r7
1fff231c:	b824      	st.w      	r1, (r14, 0x10)
                                    (is_differential_mode & BIT(i_channel)));
1fff231e:	69d0      	and      	r7, r4
    switch(channel)
1fff2320:	0808      	bt      	0x1fff2330	// 1fff2330 <hal_adc_config_channel+0x12c>
1fff2322:	e3fff6a5 	bsr      	0x1fff106c	// 1fff106c <___gnu_csky_case_uqi>
1fff2326:	6c77      	.short	0x6c77
1fff2328:	0075726f 	.long	0x0075726f
                mAdc_Ctx.all_channel |= BIT(i+1);
1fff232c:	5b42      	addi      	r2, r3, 1
1fff232e:	07ae      	br      	0x1fff228a	// 1fff228a <hal_adc_config_channel+0x86>
        diff_aio = 1;
1fff2330:	3101      	movi      	r1, 1
        aio = 0;
1fff2332:	3200      	movi      	r2, 0
    if(is_high_resolution)
1fff2334:	9804      	ld.w      	r0, (r14, 0x10)
1fff2336:	3840      	cmpnei      	r0, 0
1fff2338:	0c71      	bf      	0x1fff241a	// 1fff241a <hal_adc_config_channel+0x216>
        if(is_differential_mode)
1fff233a:	3f40      	cmpnei      	r7, 0
1fff233c:	0c0f      	bf      	0x1fff235a	// 1fff235a <hal_adc_config_channel+0x156>
            subWriteReg(&(AP_AON->PMCTL2_1),(diff_aio+8),(diff_aio+8),0);
1fff233e:	93e8      	ld.w      	r7, (r3, 0x20)
1fff2340:	591e      	addi      	r0, r1, 8
1fff2342:	c4054020 	lsl      	r0, r5, r0
1fff2346:	c4072040 	andn      	r0, r7, r0
1fff234a:	b308      	st.w      	r0, (r3, 0x20)
1fff234c:	6c03      	mov      	r0, r0
            subWriteReg(&(AP_AON->PMCTL2_1),diff_aio,diff_aio,1);
1fff234e:	9308      	ld.w      	r0, (r3, 0x20)
1fff2350:	c4254021 	lsl      	r1, r5, r1
1fff2354:	6c40      	or      	r1, r0
1fff2356:	b328      	st.w      	r1, (r3, 0x20)
1fff2358:	6c03      	mov      	r0, r0
        subWriteReg(&(AP_AON->PMCTL2_1),(aio+8),(aio+8),0);
1fff235a:	9308      	ld.w      	r0, (r3, 0x20)
1fff235c:	5a3e      	addi      	r1, r2, 8
1fff235e:	c4254021 	lsl      	r1, r5, r1
1fff2362:	c4202041 	andn      	r1, r0, r1
1fff2366:	b328      	st.w      	r1, (r3, 0x20)
1fff2368:	6c03      	mov      	r0, r0
        subWriteReg(&(AP_AON->PMCTL2_1),aio,aio,1);
1fff236a:	9328      	ld.w      	r1, (r3, 0x20)
1fff236c:	c4454022 	lsl      	r2, r5, r2
1fff2370:	6c84      	or      	r2, r1
        subWriteReg(&(AP_AON->PMCTL2_1),aio,aio,0);
1fff2372:	b348      	st.w      	r2, (r3, 0x20)
1fff2374:	6c03      	mov      	r0, r0
1fff2376:	2600      	addi      	r6, 1
    for(i_channel =MIN_ADC_CH; i_channel<=MAX_ADC_CH; i_channel++)
1fff2378:	3e48      	cmpnei      	r6, 8
1fff237a:	0bc5      	bt      	0x1fff2304	// 1fff2304 <hal_adc_config_channel+0x100>
    AP_PCRM->ADC_CTL0 &= ~BIT(20);
1fff237c:	1367      	lrw      	r3, 0x4000f03c	// 1fff2518 <hal_adc_config_channel+0x314>
    AP_PCRM->ADC_CTL2 &= ~BIT(4);
    AP_PCRM->ADC_CTL3 &= ~BIT(20);
    AP_PCRM->ADC_CTL3 &= ~BIT(4);
    AP_PCRM->ANA_CTL &= ~BIT(23);//disable micbias

    if(cfg.is_differential_mode == 0)
1fff237e:	3c40      	cmpnei      	r4, 0
    AP_PCRM->ADC_CTL0 &= ~BIT(20);
1fff2380:	934c      	ld.w      	r2, (r3, 0x30)
1fff2382:	3a94      	bclri      	r2, 20
1fff2384:	b34c      	st.w      	r2, (r3, 0x30)
    AP_PCRM->ADC_CTL0 &= ~BIT(4);
1fff2386:	934c      	ld.w      	r2, (r3, 0x30)
1fff2388:	3a84      	bclri      	r2, 4
1fff238a:	b34c      	st.w      	r2, (r3, 0x30)
    AP_PCRM->ADC_CTL1 &= ~BIT(20);
1fff238c:	934d      	ld.w      	r2, (r3, 0x34)
1fff238e:	3a94      	bclri      	r2, 20
1fff2390:	b34d      	st.w      	r2, (r3, 0x34)
    AP_PCRM->ADC_CTL1 &= ~BIT(4);
1fff2392:	934d      	ld.w      	r2, (r3, 0x34)
1fff2394:	3a84      	bclri      	r2, 4
1fff2396:	b34d      	st.w      	r2, (r3, 0x34)
    AP_PCRM->ADC_CTL2 &= ~BIT(20);
1fff2398:	934e      	ld.w      	r2, (r3, 0x38)
1fff239a:	3a94      	bclri      	r2, 20
1fff239c:	b34e      	st.w      	r2, (r3, 0x38)
    AP_PCRM->ADC_CTL2 &= ~BIT(4);
1fff239e:	934e      	ld.w      	r2, (r3, 0x38)
1fff23a0:	3a84      	bclri      	r2, 4
1fff23a2:	b34e      	st.w      	r2, (r3, 0x38)
    AP_PCRM->ADC_CTL3 &= ~BIT(20);
1fff23a4:	934f      	ld.w      	r2, (r3, 0x3c)
1fff23a6:	3a94      	bclri      	r2, 20
1fff23a8:	b34f      	st.w      	r2, (r3, 0x3c)
    AP_PCRM->ADC_CTL3 &= ~BIT(4);
1fff23aa:	934f      	ld.w      	r2, (r3, 0x3c)
1fff23ac:	3a84      	bclri      	r2, 4
1fff23ae:	b34f      	st.w      	r2, (r3, 0x3c)
    AP_PCRM->ANA_CTL &= ~BIT(23);//disable micbias
1fff23b0:	9343      	ld.w      	r2, (r3, 0xc)
1fff23b2:	3a97      	bclri      	r2, 23
1fff23b4:	b343      	st.w      	r2, (r3, 0xc)
    if(cfg.is_differential_mode == 0)
1fff23b6:	084f      	bt      	0x1fff2454	// 1fff2454 <hal_adc_config_channel+0x250>
    {
        AP_PCRM->ADC_CTL4 &= ~BIT(4); //enable auto mode
1fff23b8:	9350      	ld.w      	r2, (r3, 0x40)
1fff23ba:	3a84      	bclri      	r2, 4
1fff23bc:	b350      	st.w      	r2, (r3, 0x40)
		mAdc_Ctx.evt_handler = evt_handler;
1fff23be:	9860      	ld.w      	r3, (r14, 0x0)
1fff23c0:	9842      	ld.w      	r2, (r14, 0x8)
1fff23c2:	3402      	movi      	r4, 2
1fff23c4:	b342      	st.w      	r2, (r3, 0x8)
        for(i=MIN_ADC_CH; i<=MAX_ADC_CH; i++)
        {
            if(cfg.channel & BIT(i))
            {
				gpio_pin_e pin = s_pinmap[i];
1fff23c6:	12d6      	lrw      	r6, 0x1fff360c	// 1fff251c <hal_adc_config_channel+0x318>
            if(cfg.channel & BIT(i))
1fff23c8:	9861      	ld.w      	r3, (r14, 0x4)
1fff23ca:	70d1      	lsr      	r3, r4
1fff23cc:	e4632001 	andi      	r3, r3, 1
1fff23d0:	3b40      	cmpnei      	r3, 0
1fff23d2:	0c10      	bf      	0x1fff23f2	// 1fff23f2 <hal_adc_config_channel+0x1ee>
				gpio_pin_e pin = s_pinmap[i];
1fff23d4:	4462      	lsli      	r3, r4, 2
1fff23d6:	60d8      	addu      	r3, r6
1fff23d8:	93a0      	ld.w      	r5, (r3, 0x0)
				gpio_pull_set(pin,GPIO_FLOATING);
1fff23da:	3100      	movi      	r1, 0
1fff23dc:	6c17      	mov      	r0, r5
1fff23de:	e0000677 	bsr      	0x1fff30cc	// 1fff30cc <rf_phy_ini1+0xa4>
				gpio_ds_control(pin, Bit_ENABLE);
1fff23e2:	3101      	movi      	r1, 1
1fff23e4:	6c17      	mov      	r0, r5
1fff23e6:	e000066d 	bsr      	0x1fff30c0	// 1fff30c0 <rf_phy_ini1+0x98>
				gpio_cfg_analog_io(pin, Bit_ENABLE);							
1fff23ea:	3101      	movi      	r1, 1
1fff23ec:	6c17      	mov      	r0, r5
1fff23ee:	e00006e7 	bsr      	0x1fff31bc	// 1fff31bc <rf_phy_ini1+0x194>
1fff23f2:	2400      	addi      	r4, 1
        for(i=MIN_ADC_CH; i<=MAX_ADC_CH; i++)
1fff23f4:	3c48      	cmpnei      	r4, 8
1fff23f6:	0be9      	bt      	0x1fff23c8	// 1fff23c8 <hal_adc_config_channel+0x1c4>
        //LOG("%d %d %x\n",pin,pin_neg,*(volatile int*)0x40003800);
        mAdc_Ctx.all_channel = (cfg.is_differential_mode >> 1);
        mAdc_Ctx.evt_handler = evt_handler;	
    }

    return PPlus_SUCCESS;
1fff23f8:	3000      	movi      	r0, 0
}
1fff23fa:	1409      	addi      	r14, r14, 36
1fff23fc:	1494      	pop      	r4-r7, r15
        diff_aio = 3;
1fff23fe:	3103      	movi      	r1, 3
        aio = 2;
1fff2400:	3202      	movi      	r2, 2
1fff2402:	0799      	br      	0x1fff2334	// 1fff2334 <hal_adc_config_channel+0x130>
        diff_aio = 2;
1fff2404:	3102      	movi      	r1, 2
        aio = 3;
1fff2406:	3203      	movi      	r2, 3
1fff2408:	0796      	br      	0x1fff2334	// 1fff2334 <hal_adc_config_channel+0x130>
        diff_aio = 7;
1fff240a:	3107      	movi      	r1, 7
        aio = 4;
1fff240c:	3204      	movi      	r2, 4
1fff240e:	0793      	br      	0x1fff2334	// 1fff2334 <hal_adc_config_channel+0x130>
        diff_aio = 4;
1fff2410:	3104      	movi      	r1, 4
1fff2412:	0791      	br      	0x1fff2334	// 1fff2334 <hal_adc_config_channel+0x130>
        diff_aio = 0;
1fff2414:	3100      	movi      	r1, 0
        aio = 1;
1fff2416:	3201      	movi      	r2, 1
1fff2418:	078e      	br      	0x1fff2334	// 1fff2334 <hal_adc_config_channel+0x130>
        if(is_differential_mode)
1fff241a:	3f40      	cmpnei      	r7, 0
1fff241c:	0c0f      	bf      	0x1fff243a	// 1fff243a <hal_adc_config_channel+0x236>
            subWriteReg(&(AP_AON->PMCTL2_1),(diff_aio+8),(diff_aio+8),1);
1fff241e:	93e8      	ld.w      	r7, (r3, 0x20)
1fff2420:	591e      	addi      	r0, r1, 8
1fff2422:	c4054020 	lsl      	r0, r5, r0
1fff2426:	6c1c      	or      	r0, r7
1fff2428:	b308      	st.w      	r0, (r3, 0x20)
1fff242a:	6c03      	mov      	r0, r0
            subWriteReg(&(AP_AON->PMCTL2_1),diff_aio,diff_aio,0);
1fff242c:	9308      	ld.w      	r0, (r3, 0x20)
1fff242e:	c4254021 	lsl      	r1, r5, r1
1fff2432:	c4202041 	andn      	r1, r0, r1
1fff2436:	b328      	st.w      	r1, (r3, 0x20)
1fff2438:	6c03      	mov      	r0, r0
        subWriteReg(&(AP_AON->PMCTL2_1),(aio+8),(aio+8),1);
1fff243a:	9308      	ld.w      	r0, (r3, 0x20)
1fff243c:	5a3e      	addi      	r1, r2, 8
1fff243e:	c4254021 	lsl      	r1, r5, r1
1fff2442:	6c40      	or      	r1, r0
1fff2444:	b328      	st.w      	r1, (r3, 0x20)
1fff2446:	6c03      	mov      	r0, r0
        subWriteReg(&(AP_AON->PMCTL2_1),aio,aio,0);
1fff2448:	9328      	ld.w      	r1, (r3, 0x20)
1fff244a:	c4454022 	lsl      	r2, r5, r2
1fff244e:	c4412042 	andn      	r2, r1, r2
1fff2452:	0790      	br      	0x1fff2372	// 1fff2372 <hal_adc_config_channel+0x16e>
        switch(cfg.is_differential_mode)
1fff2454:	3c48      	cmpnei      	r4, 8
1fff2456:	0c46      	bf      	0x1fff24e2	// 1fff24e2 <hal_adc_config_channel+0x2de>
1fff2458:	3c08      	cmphsi      	r4, 9
1fff245a:	0830      	bt      	0x1fff24ba	// 1fff24ba <hal_adc_config_channel+0x2b6>
1fff245c:	3c42      	cmpnei      	r4, 2
1fff245e:	0c48      	bf      	0x1fff24ee	// 1fff24ee <hal_adc_config_channel+0x2ea>
        gpio_ds_control(pin, Bit_ENABLE);
1fff2460:	9807      	ld.w      	r0, (r14, 0x1c)
1fff2462:	3101      	movi      	r1, 1
1fff2464:	e000062e 	bsr      	0x1fff30c0	// 1fff30c0 <rf_phy_ini1+0x98>
        subWriteReg(&(AP_PCRM->ANA_CTL),7,5,chn_sel);		
1fff2468:	116b      	lrw      	r3, 0x4000f000	// 1fff2514 <hal_adc_config_channel+0x310>
1fff246a:	3000      	movi      	r0, 0
1fff246c:	9352      	ld.w      	r2, (r3, 0x48)
1fff246e:	d82e001b 	ld.b      	r1, (r14, 0x1b)
1fff2472:	28e0      	subi      	r0, 225
1fff2474:	4125      	lsli      	r1, r1, 5
1fff2476:	6880      	and      	r2, r0
1fff2478:	6c84      	or      	r2, r1
1fff247a:	b352      	st.w      	r2, (r3, 0x48)
1fff247c:	6c03      	mov      	r0, r0
    subWriteReg(&( AP_PCRM->ANA_CTL),8,8,0);
1fff247e:	9352      	ld.w      	r2, (r3, 0x48)
1fff2480:	3a88      	bclri      	r2, 8
1fff2482:	b352      	st.w      	r2, (r3, 0x48)
1fff2484:	6c03      	mov      	r0, r0
    subWriteReg(&( AP_PCRM->ANA_CTL),11,11,0);
1fff2486:	9352      	ld.w      	r2, (r3, 0x48)
1fff2488:	3a8b      	bclri      	r2, 11
1fff248a:	b352      	st.w      	r2, (r3, 0x48)
1fff248c:	6c03      	mov      	r0, r0
        gpio_pull_set(pin,GPIO_FLOATING);
1fff248e:	3100      	movi      	r1, 0
1fff2490:	9807      	ld.w      	r0, (r14, 0x1c)
        mAdc_Ctx.all_channel = (cfg.is_differential_mode >> 1);
1fff2492:	4c81      	lsri      	r4, r4, 1
        gpio_pull_set(pin,GPIO_FLOATING);
1fff2494:	e000061c 	bsr      	0x1fff30cc	// 1fff30cc <rf_phy_ini1+0xa4>
        gpio_pull_set(pin_neg,GPIO_FLOATING);
1fff2498:	9808      	ld.w      	r0, (r14, 0x20)
1fff249a:	3100      	movi      	r1, 0
1fff249c:	e0000618 	bsr      	0x1fff30cc	// 1fff30cc <rf_phy_ini1+0xa4>
        gpio_cfg_analog_io(pin,Bit_ENABLE);
1fff24a0:	3101      	movi      	r1, 1
1fff24a2:	9807      	ld.w      	r0, (r14, 0x1c)
1fff24a4:	e000068c 	bsr      	0x1fff31bc	// 1fff31bc <rf_phy_ini1+0x194>
        gpio_cfg_analog_io(pin_neg,Bit_ENABLE);
1fff24a8:	9808      	ld.w      	r0, (r14, 0x20)
1fff24aa:	3101      	movi      	r1, 1
1fff24ac:	e0000688 	bsr      	0x1fff31bc	// 1fff31bc <rf_phy_ini1+0x194>
        mAdc_Ctx.all_channel = (cfg.is_differential_mode >> 1);
1fff24b0:	9860      	ld.w      	r3, (r14, 0x0)
        mAdc_Ctx.evt_handler = evt_handler;	
1fff24b2:	9842      	ld.w      	r2, (r14, 0x8)
        mAdc_Ctx.all_channel = (cfg.is_differential_mode >> 1);
1fff24b4:	a381      	st.b      	r4, (r3, 0x1)
        mAdc_Ctx.evt_handler = evt_handler;	
1fff24b6:	b342      	st.w      	r2, (r3, 0x8)
1fff24b8:	07a0      	br      	0x1fff23f8	// 1fff23f8 <hal_adc_config_channel+0x1f4>
        switch(cfg.is_differential_mode)
1fff24ba:	eb440020 	cmpnei      	r4, 32
1fff24be:	0c0c      	bf      	0x1fff24d6	// 1fff24d6 <hal_adc_config_channel+0x2d2>
1fff24c0:	eb440080 	cmpnei      	r4, 128
1fff24c4:	0bce      	bt      	0x1fff2460	// 1fff2460 <hal_adc_config_channel+0x25c>
            pin = P20;
1fff24c6:	330d      	movi      	r3, 13
1fff24c8:	b867      	st.w      	r3, (r14, 0x1c)
            pin_neg = P15;
1fff24ca:	3309      	movi      	r3, 9
1fff24cc:	b868      	st.w      	r3, (r14, 0x20)
            chn_sel = 0x04;
1fff24ce:	3304      	movi      	r3, 4
            chn_sel = 0x03;
1fff24d0:	dc6e001b 	st.b      	r3, (r14, 0x1b)
            break;
1fff24d4:	07c6      	br      	0x1fff2460	// 1fff2460 <hal_adc_config_channel+0x25c>
            pin = P14;
1fff24d6:	3308      	movi      	r3, 8
1fff24d8:	b867      	st.w      	r3, (r14, 0x1c)
            pin_neg = P24;
1fff24da:	330f      	movi      	r3, 15
1fff24dc:	b868      	st.w      	r3, (r14, 0x20)
            chn_sel = 0x03;
1fff24de:	3303      	movi      	r3, 3
1fff24e0:	07f8      	br      	0x1fff24d0	// 1fff24d0 <hal_adc_config_channel+0x2cc>
            pin = P23;
1fff24e2:	330e      	movi      	r3, 14
1fff24e4:	b867      	st.w      	r3, (r14, 0x1c)
            pin_neg = P11;
1fff24e6:	3307      	movi      	r3, 7
1fff24e8:	b868      	st.w      	r3, (r14, 0x20)
            chn_sel = 0x02;
1fff24ea:	3302      	movi      	r3, 2
1fff24ec:	07f2      	br      	0x1fff24d0	// 1fff24d0 <hal_adc_config_channel+0x2cc>
            pin = P18;
1fff24ee:	330c      	movi      	r3, 12
            *(volatile int*)(0x4000F020) = 0x0060;
1fff24f0:	3260      	movi      	r2, 96
            pin = P18;
1fff24f2:	b867      	st.w      	r3, (r14, 0x1c)
            pin_neg = P25;
1fff24f4:	3310      	movi      	r3, 16
1fff24f6:	b868      	st.w      	r3, (r14, 0x20)
            chn_sel = 0x01;
1fff24f8:	3301      	movi      	r3, 1
1fff24fa:	dc6e001b 	st.b      	r3, (r14, 0x1b)
            *(volatile int*)(0x4000F020) = 0x0060;
1fff24fe:	1066      	lrw      	r3, 0x4000f000	// 1fff2514 <hal_adc_config_channel+0x310>
1fff2500:	b348      	st.w      	r2, (r3, 0x20)
            break;
1fff2502:	07af      	br      	0x1fff2460	// 1fff2460 <hal_adc_config_channel+0x25c>
		return PPlus_ERR_NOT_REGISTED;
1fff2504:	3012      	movi      	r0, 18
1fff2506:	077a      	br      	0x1fff23fa	// 1fff23fa <hal_adc_config_channel+0x1f6>
        return PPlus_ERR_NOT_SUPPORTED;
1fff2508:	3005      	movi      	r0, 5
1fff250a:	0778      	br      	0x1fff23fa	// 1fff23fa <hal_adc_config_channel+0x1f6>
        return PPlus_ERR_INVALID_PARAM;
1fff250c:	3006      	movi      	r0, 6
1fff250e:	0776      	br      	0x1fff23fa	// 1fff23fa <hal_adc_config_channel+0x1f6>
1fff2510:	1fff3600 	.long	0x1fff3600
1fff2514:	4000f000 	.long	0x4000f000
1fff2518:	4000f03c 	.long	0x4000f03c
1fff251c:	1fff360c 	.long	0x1fff360c

1fff2520 <hal_adc_stop>:

int hal_adc_stop(void)
{
1fff2520:	14d4      	push      	r4-r7, r15
								((mAdc_Ctx.chs_en_shadow&0x20)>>1)|\
								((mAdc_Ctx.chs_en_shadow&0x10)<<1)|\
								((mAdc_Ctx.chs_en_shadow&0x08)>>1)|\
								((mAdc_Ctx.chs_en_shadow&0x04)<<1));
	
	if(mAdc_Ctx.enable == FALSE)
1fff2522:	1174      	lrw      	r3, 0x1fff3600	// 1fff25f0 <hal_adc_stop+0xd0>
1fff2524:	8340      	ld.b      	r2, (r3, 0x0)
1fff2526:	3a40      	cmpnei      	r2, 0
1fff2528:	0c62      	bf      	0x1fff25ec	// 1fff25ec <hal_adc_stop+0xcc>
	uint8_t     all_channel2 = (((mAdc_Ctx.chs_en_shadow&0x80)>>1)|\
1fff252a:	8382      	ld.b      	r4, (r3, 0x2)
	{
		return PPlus_ERR_NOT_REGISTED;
	}
	
	AP_AON->PMCTL2_1 = 0x00;	
1fff252c:	3200      	movi      	r2, 0
1fff252e:	1172      	lrw      	r3, 0x4000f000	// 1fff25f4 <hal_adc_stop+0xd4>
    NVIC_DisableIRQ((IRQn_Type)ADCC_IRQn);
	JUMP_FUNCTION_SET(ADCC_IRQ_HANDLER,0);
1fff2530:	3100      	movi      	r1, 0
	AP_AON->PMCTL2_1 = 0x00;	
1fff2532:	b348      	st.w      	r2, (r3, 0x20)
    VIC->ICER[_IR_IDX(IRQn)] = (uint32_t)(1UL << ((uint32_t)(int32_t)IRQn % 32));
1fff2534:	1151      	lrw      	r2, 0xe000e100	// 1fff25f8 <hal_adc_stop+0xd8>
1fff2536:	3380      	movi      	r3, 128
1fff2538:	4376      	lsli      	r3, r3, 22
1fff253a:	dc622020 	st.w      	r3, (r2, 0x80)
	JUMP_FUNCTION_SET(ADCC_IRQ_HANDLER,0);
1fff253e:	307d      	movi      	r0, 125
1fff2540:	e00005fc 	bsr      	0x1fff3138	// 1fff3138 <rf_phy_ini1+0x110>
	AP_ADCC->intr_clear = 0x1FF;	
1fff2544:	ea0201ff 	movi      	r2, 511
1fff2548:	ea234005 	movih      	r3, 16389
1fff254c:	b34e      	st.w      	r2, (r3, 0x38)

    AP_PCRM->ANA_CTL &= ~BIT(3);
1fff254e:	116c      	lrw      	r3, 0x4000f03c	// 1fff25fc <hal_adc_stop+0xdc>
1fff2550:	9343      	ld.w      	r2, (r3, 0xc)
1fff2552:	3a83      	bclri      	r2, 3
1fff2554:	b343      	st.w      	r2, (r3, 0xc)

    if(g_system_clk != SYS_CLK_DBL_32M)
1fff2556:	114b      	lrw      	r2, 0x1fff0388	// 1fff2600 <hal_adc_stop+0xe0>
1fff2558:	9240      	ld.w      	r2, (r2, 0x0)
1fff255a:	3a41      	cmpnei      	r2, 1
1fff255c:	0c04      	bf      	0x1fff2564	// 1fff2564 <hal_adc_stop+0x44>
	{
		AP_PCRM->CLKHF_CTL1 &= ~BIT(13);
1fff255e:	9342      	ld.w      	r2, (r3, 0x8)
1fff2560:	3a8d      	bclri      	r2, 13
1fff2562:	b342      	st.w      	r2, (r3, 0x8)
	uint8_t     all_channel2 = (((mAdc_Ctx.chs_en_shadow&0x80)>>1)|\
1fff2564:	4c41      	lsri      	r2, r4, 1
								((mAdc_Ctx.chs_en_shadow&0x40)<<1)|\
1fff2566:	4481      	lsli      	r4, r4, 1
1fff2568:	74d2      	sextb      	r3, r4
								((mAdc_Ctx.chs_en_shadow&0x04)<<1));
1fff256a:	e4232008 	andi      	r1, r3, 8
								((mAdc_Ctx.chs_en_shadow&0x08)>>1)|\
1fff256e:	e4822004 	andi      	r4, r2, 4
1fff2572:	6d04      	or      	r4, r1
								((mAdc_Ctx.chs_en_shadow&0x10)<<1)|\
1fff2574:	e4232020 	andi      	r1, r3, 32
								((mAdc_Ctx.chs_en_shadow&0x08)>>1)|\
1fff2578:	6d04      	or      	r4, r1
								((mAdc_Ctx.chs_en_shadow&0x20)>>1)|\
1fff257a:	e4222010 	andi      	r1, r2, 16
								((mAdc_Ctx.chs_en_shadow&0x08)>>1)|\
1fff257e:	6d04      	or      	r4, r1
								((mAdc_Ctx.chs_en_shadow&0x40)<<1)|\
1fff2580:	3100      	movi      	r1, 0
1fff2582:	297f      	subi      	r1, 128
1fff2584:	68c4      	and      	r3, r1
								((mAdc_Ctx.chs_en_shadow&0x08)>>1)|\
1fff2586:	6d0c      	or      	r4, r3
	uint8_t     all_channel2 = (((mAdc_Ctx.chs_en_shadow&0x80)>>1)|\
1fff2588:	e4422040 	andi      	r2, r2, 64
								((mAdc_Ctx.chs_en_shadow&0x08)>>1)|\
1fff258c:	6d08      	or      	r4, r2
								((mAdc_Ctx.chs_en_shadow&0x40)<<1)|\
1fff258e:	3502      	movi      	r5, 2
	}
	
    for(i = MIN_ADC_CH; i<= MAX_ADC_CH; i++)
    {
		if(all_channel2 & BIT(i))
1fff2590:	7510      	zextb      	r4, r4
    gpio_pin_e pin = s_pinmap[index];
1fff2592:	10fd      	lrw      	r7, 0x1fff360c	// 1fff2604 <hal_adc_stop+0xe4>
		if(all_channel2 & BIT(i))
1fff2594:	c4a44043 	lsr      	r3, r4, r5
1fff2598:	e4632001 	andi      	r3, r3, 1
1fff259c:	3b40      	cmpnei      	r3, 0
1fff259e:	0c13      	bf      	0x1fff25c4	// 1fff25c4 <hal_adc_stop+0xa4>
    gpio_pin_e pin = s_pinmap[index];
1fff25a0:	4562      	lsli      	r3, r5, 2
1fff25a2:	60dc      	addu      	r3, r7
1fff25a4:	93c0      	ld.w      	r6, (r3, 0x0)
    if(pin == GPIO_DUMMY)
1fff25a6:	eb4600ff 	cmpnei      	r6, 255
1fff25aa:	0c0d      	bf      	0x1fff25c4	// 1fff25c4 <hal_adc_stop+0xa4>
    gpio_cfg_analog_io(pin,Bit_DISABLE);
1fff25ac:	3100      	movi      	r1, 0
1fff25ae:	6c1b      	mov      	r0, r6
1fff25b0:	e0000606 	bsr      	0x1fff31bc	// 1fff31bc <rf_phy_ini1+0x194>
    gpio_dir_r(pin,GPIO_INPUT);       //ie=0,oen=1 set to imput
1fff25b4:	3100      	movi      	r1, 0
1fff25b6:	6c1b      	mov      	r0, r6
1fff25b8:	e00005d8 	bsr      	0x1fff3168	// 1fff3168 <rf_phy_ini1+0x140>
    gpio_pull_set(pin,GPIO_FLOATING);    //
1fff25bc:	3100      	movi      	r1, 0
1fff25be:	6c1b      	mov      	r0, r6
1fff25c0:	e0000586 	bsr      	0x1fff30cc	// 1fff30cc <rf_phy_ini1+0xa4>
    for(i = MIN_ADC_CH; i<= MAX_ADC_CH; i++)
1fff25c4:	2500      	addi      	r5, 1
1fff25c6:	3d48      	cmpnei      	r5, 8
1fff25c8:	0be6      	bt      	0x1fff2594	// 1fff2594 <hal_adc_stop+0x74>
        {
            disable_analog_pin((adc_CH_t)i);
        }
    }

    AP_PCRM->ANA_CTL &= ~BIT(0);//Power down analog LDO
1fff25ca:	104d      	lrw      	r2, 0x4000f03c	// 1fff25fc <hal_adc_stop+0xdc>
	clk_reset(MOD_ADCC);
1fff25cc:	3011      	movi      	r0, 17
    AP_PCRM->ANA_CTL &= ~BIT(0);//Power down analog LDO
1fff25ce:	9263      	ld.w      	r3, (r2, 0xc)
1fff25d0:	3b80      	bclri      	r3, 0
1fff25d2:	b263      	st.w      	r3, (r2, 0xc)
	clk_reset(MOD_ADCC);
1fff25d4:	e0000606 	bsr      	0x1fff31e0	// 1fff31e0 <rf_phy_ini1+0x1b8>
    clk_gate_disable(MOD_ADCC);
1fff25d8:	3011      	movi      	r0, 17
1fff25da:	e000059d 	bsr      	0x1fff3114	// 1fff3114 <rf_phy_ini1+0xec>
    clear_adcc_cfg();
1fff25de:	e3fffd53 	bsr      	0x1fff2084	// 1fff2084 <clear_adcc_cfg>
    //enableSleep();
    pwrmgr_unlock(MOD_ADCC);
1fff25e2:	3011      	movi      	r0, 17
1fff25e4:	e00005ce 	bsr      	0x1fff3180	// 1fff3180 <rf_phy_ini1+0x158>
    return PPlus_SUCCESS;
1fff25e8:	3000      	movi      	r0, 0
}
1fff25ea:	1494      	pop      	r4-r7, r15
		return PPlus_ERR_NOT_REGISTED;
1fff25ec:	3012      	movi      	r0, 18
1fff25ee:	07fe      	br      	0x1fff25ea	// 1fff25ea <hal_adc_stop+0xca>
1fff25f0:	1fff3600 	.long	0x1fff3600
1fff25f4:	4000f000 	.long	0x4000f000
1fff25f8:	e000e100 	.long	0xe000e100
1fff25fc:	4000f03c 	.long	0x4000f03c
1fff2600:	1fff0388 	.long	0x1fff0388
1fff2604:	1fff360c 	.long	0x1fff360c

1fff2608 <hal_ADC_IRQ>:
{
1fff2608:	14d4      	push      	r4-r7, r15
1fff260a:	1435      	subi      	r14, r14, 84
	status = GET_IRQ_STATUS;
1fff260c:	ea234005 	movih      	r3, 16389
1fff2610:	93cf      	ld.w      	r6, (r3, 0x3c)
1fff2612:	e4c623ff 	andi      	r6, r6, 1023
	for (ch = MIN_ADC_CH; ch <= MAX_ADC_CH; ch++)
1fff2616:	3402      	movi      	r4, 2
		if ((mAdc_Ctx.all_channel & BIT(ch)) &&(status & BIT(ch)))
1fff2618:	11ad      	lrw      	r5, 0x1fff3600	// 1fff26cc <hal_ADC_IRQ+0xc4>
1fff261a:	8521      	ld.b      	r1, (r5, 0x1)
1fff261c:	c4814043 	lsr      	r3, r1, r4
1fff2620:	3201      	movi      	r2, 1
1fff2622:	68c8      	and      	r3, r2
1fff2624:	3b40      	cmpnei      	r3, 0
1fff2626:	0c44      	bf      	0x1fff26ae	// 1fff26ae <hal_ADC_IRQ+0xa6>
1fff2628:	c4864043 	lsr      	r3, r6, r4
1fff262c:	68c8      	and      	r3, r2
1fff262e:	3b40      	cmpnei      	r3, 0
1fff2630:	0c3f      	bf      	0x1fff26ae	// 1fff26ae <hal_ADC_IRQ+0xa6>
			ch2=(ch%2)?(ch-1):(ch+1);
1fff2632:	6890      	and      	r2, r4
1fff2634:	3a40      	cmpnei      	r2, 0
1fff2636:	0c49      	bf      	0x1fff26c8	// 1fff26c8 <hal_ADC_IRQ+0xc0>
1fff2638:	5c03      	subi      	r0, r4, 1
			if(mAdc_Ctx.continue_mode == FALSE)
1fff263a:	8563      	ld.b      	r3, (r5, 0x3)
1fff263c:	3b40      	cmpnei      	r3, 0
1fff263e:	080a      	bt      	0x1fff2652	// 1fff2652 <hal_ADC_IRQ+0x4a>
				AP_ADCC->intr_mask &= ~ BIT(ch); //MASK coresponding channel
1fff2640:	ea274005 	movih      	r7, 16389
1fff2644:	974d      	ld.w      	r2, (r7, 0x34)
1fff2646:	2b01      	subi      	r3, 2
1fff2648:	70d3      	rotl      	r3, r4
1fff264a:	688c      	and      	r2, r3
				mAdc_Ctx.all_channel &= ~BIT(ch);//disable channel				
1fff264c:	68c4      	and      	r3, r1
				AP_ADCC->intr_mask &= ~ BIT(ch); //MASK coresponding channel
1fff264e:	b74d      	st.w      	r2, (r7, 0x34)
				mAdc_Ctx.all_channel &= ~BIT(ch);//disable channel				
1fff2650:	a561      	st.b      	r3, (r5, 0x1)
1fff2652:	1a06      	addi      	r2, r14, 24
1fff2654:	b840      	st.w      	r2, (r14, 0x0)
1fff2656:	4427      	lsli      	r1, r4, 7
1fff2658:	107e      	lrw      	r3, 0x40050408	// 1fff26d0 <hal_ADC_IRQ+0xc8>
1fff265a:	105f      	lrw      	r2, 0x4005047c	// 1fff26d4 <hal_ADC_IRQ+0xcc>
1fff265c:	60c4      	addu      	r3, r1
1fff265e:	6048      	addu      	r1, r2
1fff2660:	b821      	st.w      	r1, (r14, 0x4)
1fff2662:	98e0      	ld.w      	r7, (r14, 0x0)
				adc_data[n] = (uint16_t)(read_reg(ADC_CH_BASE + (ch * 0x80) + ((n+2) * 4))&0xfff);
1fff2664:	9820      	ld.w      	r1, (r14, 0x0)
1fff2666:	9340      	ld.w      	r2, (r3, 0x0)
1fff2668:	e4422fff 	andi      	r2, r2, 4095
1fff266c:	a940      	st.h      	r2, (r1, 0x0)
				adc_data[n+1] = (uint16_t)((read_reg(ADC_CH_BASE + (ch * 0x80) + ((n+2) * 4))>>16)&0xfff);
1fff266e:	9340      	ld.w      	r2, (r3, 0x0)
1fff2670:	4a50      	lsri      	r2, r2, 16
1fff2672:	e4422fff 	andi      	r2, r2, 4095
1fff2676:	a941      	st.h      	r2, (r1, 0x2)
1fff2678:	6c87      	mov      	r2, r1
1fff267a:	2201      	addi      	r2, 2
1fff267c:	b840      	st.w      	r2, (r14, 0x0)
			for (n = 0; n < (MAX_ADC_SAMPLE_SIZE-3); n++)
1fff267e:	9841      	ld.w      	r2, (r14, 0x4)
1fff2680:	2303      	addi      	r3, 4
1fff2682:	648e      	cmpne      	r3, r2
1fff2684:	0bf0      	bt      	0x1fff2664	// 1fff2664 <hal_ADC_IRQ+0x5c>
			AP_ADCC->intr_clear = BIT(ch);
1fff2686:	3301      	movi      	r3, 1
1fff2688:	70d0      	lsl      	r3, r4
1fff268a:	ea224005 	movih      	r2, 16389
1fff268e:	b26e      	st.w      	r3, (r2, 0x38)
			if(mAdc_Ctx.enable == FALSE)
1fff2690:	8560      	ld.b      	r3, (r5, 0x0)
1fff2692:	3b40      	cmpnei      	r3, 0
1fff2694:	0c0d      	bf      	0x1fff26ae	// 1fff26ae <hal_ADC_IRQ+0xa6>
			if (mAdc_Ctx.evt_handler)
1fff2696:	9562      	ld.w      	r3, (r5, 0x8)
1fff2698:	3b40      	cmpnei      	r3, 0
1fff269a:	0c0a      	bf      	0x1fff26ae	// 1fff26ae <hal_ADC_IRQ+0xa6>
				evt.type = HAL_ADC_EVT_DATA;
1fff269c:	3201      	movi      	r2, 1
				evt.ch = (adc_CH_t)ch2;
1fff269e:	b803      	st.w      	r0, (r14, 0xc)
				evt.type = HAL_ADC_EVT_DATA;
1fff26a0:	b842      	st.w      	r2, (r14, 0x8)
				evt.size = MAX_ADC_SAMPLE_SIZE-3;
1fff26a2:	321d      	movi      	r2, 29
				evt.data = adc_data;
1fff26a4:	b8e4      	st.w      	r7, (r14, 0x10)
				evt.size = MAX_ADC_SAMPLE_SIZE-3;
1fff26a6:	dc4e0014 	st.b      	r2, (r14, 0x14)
				mAdc_Ctx.evt_handler(&evt);
1fff26aa:	1802      	addi      	r0, r14, 8
1fff26ac:	7bcd      	jsr      	r3
	for (ch = MIN_ADC_CH; ch <= MAX_ADC_CH; ch++)
1fff26ae:	2400      	addi      	r4, 1
1fff26b0:	3c48      	cmpnei      	r4, 8
1fff26b2:	0bb4      	bt      	0x1fff261a	// 1fff261a <hal_ADC_IRQ+0x12>
	if((mAdc_Ctx.all_channel == 0) && (mAdc_Ctx.continue_mode == FALSE))//
1fff26b4:	8561      	ld.b      	r3, (r5, 0x1)
1fff26b6:	3b40      	cmpnei      	r3, 0
1fff26b8:	0806      	bt      	0x1fff26c4	// 1fff26c4 <hal_ADC_IRQ+0xbc>
1fff26ba:	8563      	ld.b      	r3, (r5, 0x3)
1fff26bc:	3b40      	cmpnei      	r3, 0
1fff26be:	0803      	bt      	0x1fff26c4	// 1fff26c4 <hal_ADC_IRQ+0xbc>
		hal_adc_stop();
1fff26c0:	e3ffff30 	bsr      	0x1fff2520	// 1fff2520 <hal_adc_stop>
}
1fff26c4:	1415      	addi      	r14, r14, 84
1fff26c6:	1494      	pop      	r4-r7, r15
1fff26c8:	5c02      	addi      	r0, r4, 1
1fff26ca:	07b8      	br      	0x1fff263a	// 1fff263a <hal_ADC_IRQ+0x32>
1fff26cc:	1fff3600 	.long	0x1fff3600
1fff26d0:	40050408 	.long	0x40050408
1fff26d4:	4005047c 	.long	0x4005047c

1fff26d8 <hal_adc_value_cal>:
	4167902,//P15
	4043344,//P20
};

float hal_adc_value_cal(adc_CH_t ch,uint16_t* buf, uint32_t size, uint8_t high_resol, uint8_t diff_mode)
{
1fff26d8:	14d4      	push      	r4-r7, r15
1fff26da:	1424      	subi      	r14, r14, 16
1fff26dc:	b861      	st.w      	r3, (r14, 0x4)
    uint32_t i;
    int adc_sum = 0;
    volatile float result = 0.0;
1fff26de:	3300      	movi      	r3, 0
{
1fff26e0:	b800      	st.w      	r0, (r14, 0x0)
    volatile float result = 0.0;
1fff26e2:	b863      	st.w      	r3, (r14, 0xc)
{
1fff26e4:	d8ce0024 	ld.b      	r6, (r14, 0x24)
	uint16_t adc_cal_postive = mAdc_Ctx.adc_cal_postive;
1fff26e8:	1265      	lrw      	r3, 0x1fff3600	// 1fff27fc <hal_adc_value_cal+0x124>
    int adc_sum = 0;
1fff26ea:	3000      	movi      	r0, 0
	uint16_t adc_cal_postive = mAdc_Ctx.adc_cal_postive;
1fff26ec:	8be2      	ld.h      	r7, (r3, 0x4)
    uint16_t adc_cal_negtive = mAdc_Ctx.adc_cal_negtive;
1fff26ee:	8b83      	ld.h      	r4, (r3, 0x6)
1fff26f0:	4261      	lsli      	r3, r2, 1
1fff26f2:	59ac      	addu      	r5, r1, r3
	
    for (i = 0; i < size; i++)
1fff26f4:	6456      	cmpne      	r5, r1
1fff26f6:	0833      	bt      	0x1fff275c	// 1fff275c <hal_adc_value_cal+0x84>
1fff26f8:	b842      	st.w      	r2, (r14, 0x8)
    {
        adc_sum += (buf[i]&0xfff);
    }

    result = ((float)adc_sum)/size;
1fff26fa:	e3fff67d 	bsr      	0x1fff13f4	// 1fff13f4 <__floatsisf>
1fff26fe:	9842      	ld.w      	r2, (r14, 0x8)
1fff2700:	6d43      	mov      	r5, r0
1fff2702:	6c0b      	mov      	r0, r2
1fff2704:	e3fff6dc 	bsr      	0x1fff14bc	// 1fff14bc <__floatunsisf>
1fff2708:	6c43      	mov      	r1, r0
1fff270a:	6c17      	mov      	r0, r5
1fff270c:	e3fff616 	bsr      	0x1fff1338	// 1fff1338 <__divsf3>
	//LOG("ch:%d value:%d %dmV\n",ch,adc_sum/size, ((adc_sum/size)*800/4096));
	
	if((adc_cal_postive != 0xfff) && (adc_cal_negtive != 0xfff))
1fff2710:	eb470fff 	cmpnei      	r7, 4095
    result = ((float)adc_sum)/size;
1fff2714:	b803      	st.w      	r0, (r14, 0xc)
	if((adc_cal_postive != 0xfff) && (adc_cal_negtive != 0xfff))
1fff2716:	0c4b      	bf      	0x1fff27ac	// 1fff27ac <hal_adc_value_cal+0xd4>
1fff2718:	eb440fff 	cmpnei      	r4, 4095
1fff271c:	0c48      	bf      	0x1fff27ac	// 1fff27ac <hal_adc_value_cal+0xd4>
    {
        float delta = ((int)(adc_cal_postive-adc_cal_negtive))/2.0;
1fff271e:	5f11      	subu      	r0, r7, r4
1fff2720:	e3fff8c0 	bsr      	0x1fff18a0	// 1fff18a0 <__floatsidf>
1fff2724:	3200      	movi      	r2, 0
1fff2726:	ea233fe0 	movih      	r3, 16352
1fff272a:	611c      	addu      	r4, r7
1fff272c:	e3fff6f8 	bsr      	0x1fff151c	// 1fff151c <__muldf3>
1fff2730:	e3fff900 	bsr      	0x1fff1930	// 1fff1930 <__truncdfsf2>

        if(ch&0x01)
1fff2734:	9860      	ld.w      	r3, (r14, 0x0)
1fff2736:	e4432001 	andi      	r2, r3, 1
        float delta = ((int)(adc_cal_postive-adc_cal_negtive))/2.0;
1fff273a:	6d43      	mov      	r5, r0
        if(ch&0x01)
1fff273c:	3a40      	cmpnei      	r2, 0
1fff273e:	0c31      	bf      	0x1fff27a0	// 1fff27a0 <hal_adc_value_cal+0xc8>
        {
            result = (diff_mode) ? ((result-2048-delta)*2/(adc_cal_postive+adc_cal_negtive))
                     : ((result-delta) /(adc_cal_postive+adc_cal_negtive));
1fff2740:	3e40      	cmpnei      	r6, 0
            result = (diff_mode) ? ((result-2048-delta)*2/(adc_cal_postive+adc_cal_negtive))
1fff2742:	9803      	ld.w      	r0, (r14, 0xc)
                     : ((result-delta) /(adc_cal_postive+adc_cal_negtive));
1fff2744:	0c12      	bf      	0x1fff2768	// 1fff2768 <hal_adc_value_cal+0x90>
        }
        else
        {
            result = (diff_mode) ? ((result-2048-delta)*2/(adc_cal_postive+adc_cal_negtive))
1fff2746:	318a      	movi      	r1, 138
1fff2748:	4137      	lsli      	r1, r1, 23
1fff274a:	e3fff557 	bsr      	0x1fff11f8	// 1fff11f8 <__subsf3>
1fff274e:	6c57      	mov      	r1, r5
1fff2750:	e3fff554 	bsr      	0x1fff11f8	// 1fff11f8 <__subsf3>
1fff2754:	6c43      	mov      	r1, r0
                     : ((result+delta) /(adc_cal_postive+adc_cal_negtive));
1fff2756:	e3fff53b 	bsr      	0x1fff11cc	// 1fff11cc <__addsf3>
1fff275a:	040a      	br      	0x1fff276e	// 1fff276e <hal_adc_value_cal+0x96>
        adc_sum += (buf[i]&0xfff);
1fff275c:	8960      	ld.h      	r3, (r1, 0x0)
1fff275e:	e4632fff 	andi      	r3, r3, 4095
1fff2762:	2101      	addi      	r1, 2
1fff2764:	600c      	addu      	r0, r3
1fff2766:	07c7      	br      	0x1fff26f4	// 1fff26f4 <hal_adc_value_cal+0x1c>
                     : ((result-delta) /(adc_cal_postive+adc_cal_negtive));
1fff2768:	6c57      	mov      	r1, r5
1fff276a:	e3fff547 	bsr      	0x1fff11f8	// 1fff11f8 <__subsf3>
                     : ((result+delta) /(adc_cal_postive+adc_cal_negtive));
1fff276e:	6d83      	mov      	r6, r0
1fff2770:	6c13      	mov      	r0, r4
1fff2772:	e3fff641 	bsr      	0x1fff13f4	// 1fff13f4 <__floatsisf>
1fff2776:	6c43      	mov      	r1, r0
1fff2778:	6c1b      	mov      	r0, r6
1fff277a:	e3fff5df 	bsr      	0x1fff1338	// 1fff1338 <__divsf3>
    else
    {
        result = (diff_mode) ? (float)(result / 2048 -1) : (float)(result /4096);
    }

    if(high_resol == TRUE)
1fff277e:	9861      	ld.w      	r3, (r14, 0x4)
        result = (diff_mode) ? (float)(result / 2048 -1) : (float)(result /4096);
1fff2780:	b803      	st.w      	r0, (r14, 0xc)
    if(high_resol == TRUE)
1fff2782:	3b41      	cmpnei      	r3, 1
1fff2784:	0825      	bt      	0x1fff27ce	// 1fff27ce <hal_adc_value_cal+0xf6>
    {
        result *= 0.8;
1fff2786:	9803      	ld.w      	r0, (r14, 0xc)
1fff2788:	e3fff688 	bsr      	0x1fff1498	// 1fff1498 <__extendsfdf2>
1fff278c:	105d      	lrw      	r2, 0x9999999a	// 1fff2800 <hal_adc_value_cal+0x128>
1fff278e:	107e      	lrw      	r3, 0x3fe99999	// 1fff2804 <hal_adc_value_cal+0x12c>
1fff2790:	e3fff6c6 	bsr      	0x1fff151c	// 1fff151c <__muldf3>
    }
    else
    {
        result = (float)result *(float)adc_Lambda[ch-2]*0.8/1000000;
1fff2794:	e3fff8ce 	bsr      	0x1fff1930	// 1fff1930 <__truncdfsf2>
1fff2798:	b803      	st.w      	r0, (r14, 0xc)
    }

    return result;
1fff279a:	9803      	ld.w      	r0, (r14, 0xc)
}
1fff279c:	1404      	addi      	r14, r14, 16
1fff279e:	1494      	pop      	r4-r7, r15
                     : ((result+delta) /(adc_cal_postive+adc_cal_negtive));
1fff27a0:	3e40      	cmpnei      	r6, 0
1fff27a2:	0c03      	bf      	0x1fff27a8	// 1fff27a8 <hal_adc_value_cal+0xd0>
            result = (diff_mode) ? ((result-2048-delta)*2/(adc_cal_postive+adc_cal_negtive))
1fff27a4:	9803      	ld.w      	r0, (r14, 0xc)
1fff27a6:	07d0      	br      	0x1fff2746	// 1fff2746 <hal_adc_value_cal+0x6e>
                     : ((result+delta) /(adc_cal_postive+adc_cal_negtive));
1fff27a8:	9823      	ld.w      	r1, (r14, 0xc)
1fff27aa:	07d6      	br      	0x1fff2756	// 1fff2756 <hal_adc_value_cal+0x7e>
        result = (diff_mode) ? (float)(result / 2048 -1) : (float)(result /4096);
1fff27ac:	3e40      	cmpnei      	r6, 0
1fff27ae:	9803      	ld.w      	r0, (r14, 0xc)
1fff27b0:	0c0a      	bf      	0x1fff27c4	// 1fff27c4 <hal_adc_value_cal+0xec>
1fff27b2:	31e8      	movi      	r1, 232
1fff27b4:	4136      	lsli      	r1, r1, 22
1fff27b6:	e3fff53b 	bsr      	0x1fff122c	// 1fff122c <__mulsf3>
1fff27ba:	31fe      	movi      	r1, 254
1fff27bc:	4136      	lsli      	r1, r1, 22
1fff27be:	e3fff51d 	bsr      	0x1fff11f8	// 1fff11f8 <__subsf3>
1fff27c2:	07de      	br      	0x1fff277e	// 1fff277e <hal_adc_value_cal+0xa6>
1fff27c4:	31e6      	movi      	r1, 230
1fff27c6:	4136      	lsli      	r1, r1, 22
1fff27c8:	e3fff532 	bsr      	0x1fff122c	// 1fff122c <__mulsf3>
1fff27cc:	07d9      	br      	0x1fff277e	// 1fff277e <hal_adc_value_cal+0xa6>
        result = (float)result *(float)adc_Lambda[ch-2]*0.8/1000000;
1fff27ce:	9860      	ld.w      	r3, (r14, 0x0)
1fff27d0:	43a2      	lsli      	r5, r3, 2
1fff27d2:	106e      	lrw      	r3, 0x1fff348c	// 1fff2808 <hal_adc_value_cal+0x130>
1fff27d4:	614c      	addu      	r5, r3
1fff27d6:	9500      	ld.w      	r0, (r5, 0x0)
1fff27d8:	9883      	ld.w      	r4, (r14, 0xc)
1fff27da:	e3fff671 	bsr      	0x1fff14bc	// 1fff14bc <__floatunsisf>
1fff27de:	6c53      	mov      	r1, r4
1fff27e0:	e3fff526 	bsr      	0x1fff122c	// 1fff122c <__mulsf3>
1fff27e4:	e3fff65a 	bsr      	0x1fff1498	// 1fff1498 <__extendsfdf2>
1fff27e8:	1046      	lrw      	r2, 0x9999999a	// 1fff2800 <hal_adc_value_cal+0x128>
1fff27ea:	1067      	lrw      	r3, 0x3fe99999	// 1fff2804 <hal_adc_value_cal+0x12c>
1fff27ec:	e3fff698 	bsr      	0x1fff151c	// 1fff151c <__muldf3>
1fff27f0:	3200      	movi      	r2, 0
1fff27f2:	1067      	lrw      	r3, 0x412e8480	// 1fff280c <hal_adc_value_cal+0x134>
1fff27f4:	e3fff7aa 	bsr      	0x1fff1748	// 1fff1748 <__divdf3>
1fff27f8:	07ce      	br      	0x1fff2794	// 1fff2794 <hal_adc_value_cal+0xbc>
1fff27fa:	0000      	bkpt
1fff27fc:	1fff3600 	.long	0x1fff3600
1fff2800:	9999999a 	.long	0x9999999a
1fff2804:	3fe99999 	.long	0x3fe99999
1fff2808:	1fff348c 	.long	0x1fff348c
1fff280c:	412e8480 	.long	0x412e8480

1fff2810 <hw_otp_spif_config>:
extern uint8_t  g_bootFlag ;
extern bool otp_go_read(void);
extern int pwrmgr_register(MODULE_e mod, pwrmgr_Hdl_t sleepHandle, pwrmgr_Hdl_t wakeupHandle);

static void hw_otp_spif_config(void)
{
1fff2810:	14d0      	push      	r15
	if(g_bootFlag)
1fff2812:	106e      	lrw      	r3, 0x1fff0ad8	// 1fff2848 <hw_otp_spif_config+0x38>
1fff2814:	8360      	ld.b      	r3, (r3, 0x0)
1fff2816:	3b40      	cmpnei      	r3, 0
1fff2818:	0c04      	bf      	0x1fff2820	// 1fff2820 <hw_otp_spif_config+0x10>
	{
	  	otp_go_read();
1fff281a:	e000053d 	bsr      	0x1fff3294	// 1fff3294 <rf_phy_ini1+0x26c>
	  	gpio_fmux_set(P37,FMUX_CSN); 
	  	gpio_fmux_set(P38,FMUX_MISO_1);    
	  	init_spif();
	}

}
1fff281e:	1490      	pop      	r15
	    gpio_fmux_set(P35,FMUX_MISO_0);
1fff2820:	3126      	movi      	r1, 38
1fff2822:	3017      	movi      	r0, 23
1fff2824:	e00004c0 	bsr      	0x1fff31a4	// 1fff31a4 <rf_phy_ini1+0x17c>
	    gpio_fmux_set(P36,FMUX_CLK);
1fff2828:	3127      	movi      	r1, 39
1fff282a:	3018      	movi      	r0, 24
1fff282c:	e00004bc 	bsr      	0x1fff31a4	// 1fff31a4 <rf_phy_ini1+0x17c>
	  	gpio_fmux_set(P37,FMUX_CSN); 
1fff2830:	3128      	movi      	r1, 40
1fff2832:	3019      	movi      	r0, 25
1fff2834:	e00004b8 	bsr      	0x1fff31a4	// 1fff31a4 <rf_phy_ini1+0x17c>
	  	gpio_fmux_set(P38,FMUX_MISO_1);    
1fff2838:	3129      	movi      	r1, 41
1fff283a:	301a      	movi      	r0, 26
1fff283c:	e00004b4 	bsr      	0x1fff31a4	// 1fff31a4 <rf_phy_ini1+0x17c>
	  	init_spif();
1fff2840:	e000045e 	bsr      	0x1fff30fc	// 1fff30fc <rf_phy_ini1+0xd4>
}
1fff2844:	07ed      	br      	0x1fff281e	// 1fff281e <hw_otp_spif_config+0xe>
1fff2846:	0000      	bkpt
1fff2848:	1fff0ad8 	.long	0x1fff0ad8

1fff284c <hal_otp_flash_init>:
int hal_otp_flash_init(void)
{
1fff284c:	14d0      	push      	r15
	if(g_system_clk == SYS_CLK_XTAL_16M)
1fff284e:	106a      	lrw      	r3, 0x1fff0388	// 1fff2874 <hal_otp_flash_init+0x28>
1fff2850:	9360      	ld.w      	r3, (r3, 0x0)
1fff2852:	3b42      	cmpnei      	r3, 2
1fff2854:	3380      	movi      	r3, 128
1fff2856:	4377      	lsli      	r3, r3, 23
		*(volatile int*)0x40000028 |= 0x10; //bypass bridge
1fff2858:	934a      	ld.w      	r2, (r3, 0x28)
	if(g_system_clk == SYS_CLK_XTAL_16M)
1fff285a:	080a      	bt      	0x1fff286e	// 1fff286e <hal_otp_flash_init+0x22>
		*(volatile int*)0x40000028 |= 0x10; //bypass bridge
1fff285c:	ec420010 	ori      	r2, r2, 16
	else
		*(volatile int*)0x40000028 &= 0xFFFFFFEF;
1fff2860:	b34a      	st.w      	r2, (r3, 0x28)
    return pwrmgr_register(MOD_SPIF, NULL,  hw_otp_spif_config);
1fff2862:	3100      	movi      	r1, 0
1fff2864:	1045      	lrw      	r2, 0x1fff2810	// 1fff2878 <hal_otp_flash_init+0x2c>
1fff2866:	3013      	movi      	r0, 19
1fff2868:	e0000414 	bsr      	0x1fff3090	// 1fff3090 <rf_phy_ini1+0x68>
1fff286c:	1490      	pop      	r15
		*(volatile int*)0x40000028 &= 0xFFFFFFEF;
1fff286e:	3a84      	bclri      	r2, 4
1fff2870:	07f8      	br      	0x1fff2860	// 1fff2860 <hal_otp_flash_init+0x14>
1fff2872:	0000      	bkpt
1fff2874:	1fff0388 	.long	0x1fff0388
1fff2878:	1fff2810 	.long	0x1fff2810

1fff287c <main>:
	gpio_init();
	hal_adc_init();
}

int  main(void)  
{     
1fff287c:	14d4      	push      	r4-r7, r15
1fff287e:	1530      	subi      	r14, r14, 192
    osal_mem_set_heap((osalMemHdr_t*)g_largeHeap, LARGE_HEAP_SIZE);
1fff2880:	3180      	movi      	r1, 128
1fff2882:	4124      	lsli      	r1, r1, 4
1fff2884:	1212      	lrw      	r0, 0x1fff4a60	// 1fff29cc <main+0x150>
    //ble memory init and config
    ble_mem_init_config();
    hal_watchdog_config(WDG_2S);
    g_system_clk = SYS_CLK_XTAL_16M;//SYS_CLK_DBL_32M,SYS_CLK_XTAL_16M;
1fff2886:	12b3      	lrw      	r5, 0x1fff0388	// 1fff29d0 <main+0x154>
    osal_mem_set_heap((osalMemHdr_t*)g_largeHeap, LARGE_HEAP_SIZE);
1fff2888:	e0000512 	bsr      	0x1fff32ac	// 1fff32ac <rf_phy_ini1+0x284>
    LL_InitConnectContext(pConnContext,
1fff288c:	3300      	movi      	r3, 0
1fff288e:	3201      	movi      	r2, 1
1fff2890:	b861      	st.w      	r3, (r14, 0x4)
1fff2892:	3302      	movi      	r3, 2
1fff2894:	1230      	lrw      	r1, 0x1fff4648	// 1fff29d4 <main+0x158>
1fff2896:	1211      	lrw      	r0, 0x1fff4798	// 1fff29d8 <main+0x15c>
    g_clk32K_config = CLK_32K_RCOSC;//CLK_32K_XTAL,CLK_32K_RCOSC
1fff2898:	12d1      	lrw      	r6, 0x1fff4a5c	// 1fff29dc <main+0x160>
    LL_InitConnectContext(pConnContext,
1fff289a:	b860      	st.w      	r3, (r14, 0x0)
1fff289c:	e00004ea 	bsr      	0x1fff3270	// 1fff3270 <rf_phy_ini1+0x248>
    hal_watchdog_config(WDG_2S);
1fff28a0:	3000      	movi      	r0, 0
1fff28a2:	e3fffbef 	bsr      	0x1fff2080	// 1fff2080 <hal_watchdog_config>
    g_system_clk = SYS_CLK_XTAL_16M;//SYS_CLK_DBL_32M,SYS_CLK_XTAL_16M;
1fff28a6:	3302      	movi      	r3, 2
1fff28a8:	b560      	st.w      	r3, (r5, 0x0)
    g_clk32K_config = CLK_32K_RCOSC;//CLK_32K_XTAL,CLK_32K_RCOSC
1fff28aa:	3301      	movi      	r3, 1
1fff28ac:	a660      	st.b      	r3, (r6, 0x0)

    drv_irq_init();
1fff28ae:	e00004d5 	bsr      	0x1fff3258	// 1fff3258 <rf_phy_ini1+0x230>
    init_config();
1fff28b2:	e00002a1 	bsr      	0x1fff2df4	// 1fff2df4 <init_config>
    g_rfPhyTxPower  = RF_PHY_TX_POWER_0DBM ;
1fff28b6:	126b      	lrw      	r3, 0x1fff038c	// 1fff29e0 <main+0x164>
1fff28b8:	320a      	movi      	r2, 10
    XTAL16M_CAP_SETTING(0x09);
1fff28ba:	3100      	movi      	r1, 0
    g_rfPhyTxPower  = RF_PHY_TX_POWER_0DBM ;
1fff28bc:	a340      	st.b      	r2, (r3, 0x0)
    g_rfPhyPktFmt   = PKT_FMT_BLE1M;
1fff28be:	3201      	movi      	r2, 1
1fff28c0:	1269      	lrw      	r3, 0x1fff038e	// 1fff29e4 <main+0x168>
    XTAL16M_CAP_SETTING(0x09);
1fff28c2:	291f      	subi      	r1, 32
    g_rfPhyPktFmt   = PKT_FMT_BLE1M;
1fff28c4:	a340      	st.b      	r2, (r3, 0x0)
    g_rfPhyFreqOffSet   =RF_PHY_FREQ_FOFF_00KHZ;
1fff28c6:	3200      	movi      	r2, 0
1fff28c8:	1268      	lrw      	r3, 0x1fff0abe	// 1fff29e8 <main+0x16c>
1fff28ca:	a340      	st.b      	r2, (r3, 0x0)
    XTAL16M_CAP_SETTING(0x09);
1fff28cc:	1248      	lrw      	r2, 0x4000f080	// 1fff29ec <main+0x170>
1fff28ce:	926f      	ld.w      	r3, (r2, 0x3c)
1fff28d0:	68c4      	and      	r3, r1
1fff28d2:	ec630009 	ori      	r3, r3, 9
1fff28d6:	b26f      	st.w      	r3, (r2, 0x3c)
1fff28d8:	6c03      	mov      	r0, r0
    XTAL16M_CURRENT_SETTING(0x01);
1fff28da:	926f      	ld.w      	r3, (r2, 0x3c)
1fff28dc:	3b85      	bclri      	r3, 5
1fff28de:	3b86      	bclri      	r3, 6
1fff28e0:	ec630020 	ori      	r3, r3, 32
1fff28e4:	b26f      	st.w      	r3, (r2, 0x3c)
1fff28e6:	6c03      	mov      	r0, r0
    hal_rom_boot_init();
1fff28e8:	e0000384 	bsr      	0x1fff2ff0	// 1fff2ff0 <hal_rom_boot_init>
    VIC->IPR[_IP_IDX(IRQn)] = ((uint32_t)(VIC->IPR[_IP_IDX(IRQn)]  & ~(0xFFUL << _BIT_SHIFT(IRQn))) |
1fff28ec:	1261      	lrw      	r3, 0xe000e100	// 1fff29f0 <main+0x174>
1fff28ee:	3100      	movi      	r1, 0
1fff28f0:	d84320c1 	ld.w      	r2, (r3, 0x304)
1fff28f4:	29ff      	subi      	r1, 256
1fff28f6:	6884      	and      	r2, r1
1fff28f8:	dc4320c1 	st.w      	r2, (r3, 0x304)
    ioinit_cfg_t ioInit[]=
1fff28fc:	1802      	addi      	r0, r14, 8
1fff28fe:	d84320c5 	ld.w      	r2, (r3, 0x314)
1fff2902:	6884      	and      	r2, r1
1fff2904:	ec420040 	ori      	r2, r2, 64
1fff2908:	dc4320c5 	st.w      	r2, (r3, 0x314)
1fff290c:	113a      	lrw      	r1, 0xffff00ff	// 1fff29f4 <main+0x178>
1fff290e:	d84320c5 	ld.w      	r2, (r3, 0x314)
1fff2912:	6884      	and      	r2, r1
1fff2914:	ec424000 	ori      	r2, r2, 16384
1fff2918:	dc4320c5 	st.w      	r2, (r3, 0x314)
1fff291c:	32b8      	movi      	r2, 184
1fff291e:	1137      	lrw      	r1, 0x1fff3380	// 1fff29f8 <main+0x17c>
1fff2920:	1c02      	addi      	r4, r14, 8
1fff2922:	e3fffa79 	bsr      	0x1fff1e14	// 1fff1e14 <__memcpy_fast>
1fff2926:	1f30      	addi      	r7, r14, 192
        gpio_pull_set(ioInit[i].pin,ioInit[i].type);
1fff2928:	9421      	ld.w      	r1, (r4, 0x4)
1fff292a:	9400      	ld.w      	r0, (r4, 0x0)
1fff292c:	2407      	addi      	r4, 8
1fff292e:	e00003cf 	bsr      	0x1fff30cc	// 1fff30cc <rf_phy_ini1+0xa4>
    for(uint8_t i=0; i<sizeof(ioInit)/sizeof(ioinit_cfg_t); i++)
1fff2932:	651e      	cmpne      	r7, r4
1fff2934:	0bfa      	bt      	0x1fff2928	// 1fff2928 <main+0xac>
    DIG_LDO_CURRENT_SETTING(0x01);
1fff2936:	1152      	lrw      	r2, 0x4000f000	// 1fff29fc <main+0x180>
1fff2938:	9265      	ld.w      	r3, (r2, 0x14)
1fff293a:	3b95      	bclri      	r3, 21
1fff293c:	3b96      	bclri      	r3, 22
1fff293e:	3bb5      	bseti      	r3, 21
1fff2940:	b265      	st.w      	r3, (r2, 0x14)
1fff2942:	6c03      	mov      	r0, r0
    pwrmgr_RAM_retention_set();
1fff2944:	e00004ae 	bsr      	0x1fff32a0	// 1fff32a0 <rf_phy_ini1+0x278>
	{
        //rf_phy_direct_test();
	}
	
    LOG("SDK Version ID %08x \n",SDK_VER_RELEASE_ID);
    LOG("rfClk %d rcClk %d sysClk %d tpCap[%02x %02x]\n",g_rfPhyClkSel,g_clk32K_config,g_system_clk,g_rfPhyTpCal0,g_rfPhyTpCal1);
1fff2948:	118e      	lrw      	r4, 0x1fff038f	// 1fff2a00 <main+0x184>
    pwrmgr_LowCurrentLdo_enable();
1fff294a:	e00003c7 	bsr      	0x1fff30d8	// 1fff30d8 <rf_phy_ini1+0xb0>
    clk_init(g_system_clk); //system init
1fff294e:	9500      	ld.w      	r0, (r5, 0x0)
1fff2950:	e00003fa 	bsr      	0x1fff3144	// 1fff3144 <rf_phy_ini1+0x11c>
    hal_rtc_clock_config((CLK32K_e)g_clk32K_config);
1fff2954:	8600      	ld.b      	r0, (r6, 0x0)
1fff2956:	7400      	zextb      	r0, r0
1fff2958:	e3fffaf2 	bsr      	0x1fff1f3c	// 1fff1f3c <hal_rtc_clock_config>
    hal_pwrmgr_init();
1fff295c:	e3fffb7c 	bsr      	0x1fff2054	// 1fff2054 <hal_pwrmgr_init>
    hal_otp_flash_init();
1fff2960:	e3ffff76 	bsr      	0x1fff284c	// 1fff284c <hal_otp_flash_init>
    LOG_INIT();
1fff2964:	e3fffb4e 	bsr      	0x1fff2000	// 1fff2000 <dbg_printf_init>
	gpio_init();
1fff2968:	e000047e 	bsr      	0x1fff3264	// 1fff3264 <rf_phy_ini1+0x23c>
	hal_adc_init();
1fff296c:	e3fffba4 	bsr      	0x1fff20b4	// 1fff20b4 <hal_adc_init>
    if(gpio_read(P20)==1)
1fff2970:	300d      	movi      	r0, 13
1fff2972:	e00003d7 	bsr      	0x1fff3120	// 1fff3120 <rf_phy_ini1+0xf8>
    LOG("SDK Version ID %08x \n",SDK_VER_RELEASE_ID);
1fff2976:	31a0      	movi      	r1, 160
1fff2978:	412b      	lsli      	r1, r1, 11
1fff297a:	1103      	lrw      	r0, 0x1fff34d0	// 1fff2a04 <main+0x188>
1fff297c:	e3fffb30 	bsr      	0x1fff1fdc	// 1fff1fdc <dbg_printf>
    LOG("rfClk %d rcClk %d sysClk %d tpCap[%02x %02x]\n",g_rfPhyClkSel,g_clk32K_config,g_system_clk,g_rfPhyTpCal0,g_rfPhyTpCal1);
1fff2980:	1162      	lrw      	r3, 0x1fff0a94	// 1fff2a08 <main+0x18c>
1fff2982:	1103      	lrw      	r0, 0x1fff038d	// 1fff2a0c <main+0x190>
1fff2984:	9320      	ld.w      	r1, (r3, 0x0)
1fff2986:	8640      	ld.b      	r2, (r6, 0x0)
1fff2988:	9560      	ld.w      	r3, (r5, 0x0)
1fff298a:	8000      	ld.b      	r0, (r0, 0x0)
1fff298c:	8480      	ld.b      	r4, (r4, 0x0)
1fff298e:	7488      	zextb      	r2, r2
1fff2990:	b800      	st.w      	r0, (r14, 0x0)
1fff2992:	b881      	st.w      	r4, (r14, 0x4)
1fff2994:	101f      	lrw      	r0, 0x1fff34e6	// 1fff2a10 <main+0x194>
1fff2996:	e3fffb23 	bsr      	0x1fff1fdc	// 1fff1fdc <dbg_printf>
    LOG("sizeof(struct ll_pkt_desc) = %d, buf size = %d\n", sizeof(struct ll_pkt_desc), BLE_CONN_BUF_SIZE);
1fff299a:	32a8      	movi      	r2, 168
1fff299c:	4241      	lsli      	r2, r2, 1
1fff299e:	3108      	movi      	r1, 8
1fff29a0:	101d      	lrw      	r0, 0x1fff3514	// 1fff2a14 <main+0x198>
1fff29a2:	e3fffb1d 	bsr      	0x1fff1fdc	// 1fff1fdc <dbg_printf>
    LOG("sizeof(g_pConnectionBuffer) = %d, sizeof(pConnContext) = %d, sizeof(largeHeap)=%d \n",\
1fff29a6:	3380      	movi      	r3, 128
1fff29a8:	32b1      	movi      	r2, 177
1fff29aa:	31a8      	movi      	r1, 168
1fff29ac:	4242      	lsli      	r2, r2, 2
1fff29ae:	4364      	lsli      	r3, r3, 4
1fff29b0:	4121      	lsli      	r1, r1, 1
1fff29b2:	101a      	lrw      	r0, 0x1fff3544	// 1fff2a18 <main+0x19c>
1fff29b4:	e3fffb14 	bsr      	0x1fff1fdc	// 1fff1fdc <dbg_printf>
        sizeof(g_pConnectionBuffer), sizeof(pConnContext),sizeof(g_largeHeap));
    LOG("[REST CAUSE] %d\n ",g_system_reset_cause);
1fff29b8:	1079      	lrw      	r3, 0x1fff0430	// 1fff2a1c <main+0x1a0>
1fff29ba:	101a      	lrw      	r0, 0x1fff3598	// 1fff2a20 <main+0x1a4>
1fff29bc:	9320      	ld.w      	r1, (r3, 0x0)
1fff29be:	e3fffb0f 	bsr      	0x1fff1fdc	// 1fff1fdc <dbg_printf>
    app_main();
1fff29c2:	e00000f5 	bsr      	0x1fff2bac	// 1fff2bac <app_main>
}
1fff29c6:	3000      	movi      	r0, 0
1fff29c8:	1510      	addi      	r14, r14, 192
1fff29ca:	1494      	pop      	r4-r7, r15
1fff29cc:	1fff4a60 	.long	0x1fff4a60
1fff29d0:	1fff0388 	.long	0x1fff0388
1fff29d4:	1fff4648 	.long	0x1fff4648
1fff29d8:	1fff4798 	.long	0x1fff4798
1fff29dc:	1fff4a5c 	.long	0x1fff4a5c
1fff29e0:	1fff038c 	.long	0x1fff038c
1fff29e4:	1fff038e 	.long	0x1fff038e
1fff29e8:	1fff0abe 	.long	0x1fff0abe
1fff29ec:	4000f080 	.long	0x4000f080
1fff29f0:	e000e100 	.long	0xe000e100
1fff29f4:	ffff00ff 	.long	0xffff00ff
1fff29f8:	1fff3380 	.long	0x1fff3380
1fff29fc:	4000f000 	.long	0x4000f000
1fff2a00:	1fff038f 	.long	0x1fff038f
1fff2a04:	1fff34d0 	.long	0x1fff34d0
1fff2a08:	1fff0a94 	.long	0x1fff0a94
1fff2a0c:	1fff038d 	.long	0x1fff038d
1fff2a10:	1fff34e6 	.long	0x1fff34e6
1fff2a14:	1fff3514 	.long	0x1fff3514
1fff2a18:	1fff3544 	.long	0x1fff3544
1fff2a1c:	1fff0430 	.long	0x1fff0430
1fff2a20:	1fff3598 	.long	0x1fff3598

1fff2a24 <adc_evt>:
static void adc_ProcessOSALMsg( osal_event_hdr_t* pMsg )
{
}

static void adc_evt(adc_Evt_t* pev)
{
1fff2a24:	14d1      	push      	r4, r15
1fff2a26:	1421      	subi      	r14, r14, 4
	bool is_high_resolution = FALSE;
	bool is_differential_mode = FALSE;
	uint8_t ch = 0;
	static uint8_t coutner = 0;
	
	is_high_resolution = (adc_cfg.is_high_resolution & BIT(pev->ch))?TRUE:FALSE;
1fff2a28:	103c      	lrw      	r1, 0x1fff3630	// 1fff2a98 <adc_evt+0x74>
{
1fff2a2a:	6d03      	mov      	r4, r0
	is_high_resolution = (adc_cfg.is_high_resolution & BIT(pev->ch))?TRUE:FALSE;
1fff2a2c:	8163      	ld.b      	r3, (r1, 0x3)
1fff2a2e:	9001      	ld.w      	r0, (r0, 0x4)
	is_differential_mode = (adc_cfg.is_differential_mode & BIT(pev->ch))?TRUE:FALSE;
1fff2a30:	8122      	ld.b      	r1, (r1, 0x2)
1fff2a32:	7041      	lsr      	r1, r0
	value = hal_adc_value_cal(pev->ch,pev->data, pev->size, is_high_resolution,is_differential_mode);
1fff2a34:	e4212001 	andi      	r1, r1, 1
1fff2a38:	844c      	ld.b      	r2, (r4, 0xc)
1fff2a3a:	b820      	st.w      	r1, (r14, 0x0)
	is_high_resolution = (adc_cfg.is_high_resolution & BIT(pev->ch))?TRUE:FALSE;
1fff2a3c:	70c1      	lsr      	r3, r0
	value = hal_adc_value_cal(pev->ch,pev->data, pev->size, is_high_resolution,is_differential_mode);
1fff2a3e:	e4632001 	andi      	r3, r3, 1
1fff2a42:	9422      	ld.w      	r1, (r4, 0x8)
1fff2a44:	e3fffe4a 	bsr      	0x1fff26d8	// 1fff26d8 <hal_adc_value_cal>
1fff2a48:	9461      	ld.w      	r3, (r4, 0x4)
1fff2a4a:	2b01      	subi      	r3, 2
1fff2a4c:	3b05      	cmphsi      	r3, 6
1fff2a4e:	081a      	bt      	0x1fff2a82	// 1fff2a82 <adc_evt+0x5e>
1fff2a50:	1053      	lrw      	r2, 0x1fff35aa	// 1fff2a9c <adc_evt+0x78>
1fff2a52:	60c8      	addu      	r3, r2
1fff2a54:	8380      	ld.b      	r4, (r3, 0x0)

		default:
		break;
	}

	if(ch!=0)
1fff2a56:	3c40      	cmpnei      	r4, 0
1fff2a58:	0c15      	bf      	0x1fff2a82	// 1fff2a82 <adc_evt+0x5e>
	{
		LOG("P%d %d mv ",ch,(int)(value*1000));
1fff2a5a:	ea21447a 	movih      	r1, 17530
1fff2a5e:	e3fff3e7 	bsr      	0x1fff122c	// 1fff122c <__mulsf3>
1fff2a62:	e3fff4f3 	bsr      	0x1fff1448	// 1fff1448 <__fixsfsi>
1fff2a66:	6c83      	mov      	r2, r0
1fff2a68:	6c53      	mov      	r1, r4
1fff2a6a:	100e      	lrw      	r0, 0x1fff35e4	// 1fff2aa0 <adc_evt+0x7c>
1fff2a6c:	e3fffab8 	bsr      	0x1fff1fdc	// 1fff1fdc <dbg_printf>
	}
	else
	{
		LOG("invalid channel\n");
	}
	coutner++;
1fff2a70:	104d      	lrw      	r2, 0x1fff4641	// 1fff2aa4 <adc_evt+0x80>
1fff2a72:	8260      	ld.b      	r3, (r2, 0x0)
1fff2a74:	2300      	addi      	r3, 1
1fff2a76:	74cc      	zextb      	r3, r3
	if(coutner>=6)//adc channel enable number
1fff2a78:	3b05      	cmphsi      	r3, 6
1fff2a7a:	0808      	bt      	0x1fff2a8a	// 1fff2a8a <adc_evt+0x66>
	coutner++;
1fff2a7c:	a260      	st.b      	r3, (r2, 0x0)
	{
		coutner = 0;
		LOG("\n");
	}
	//LOG(" mode:%d \n",adc_cfg.is_continue_mode);
}
1fff2a7e:	1401      	addi      	r14, r14, 4
1fff2a80:	1491      	pop      	r4, r15
		LOG("invalid channel\n");
1fff2a82:	100a      	lrw      	r0, 0x1fff35ef	// 1fff2aa8 <adc_evt+0x84>
1fff2a84:	e3fffaac 	bsr      	0x1fff1fdc	// 1fff1fdc <dbg_printf>
1fff2a88:	07f4      	br      	0x1fff2a70	// 1fff2a70 <adc_evt+0x4c>
		coutner = 0;
1fff2a8a:	3300      	movi      	r3, 0
		LOG("\n");
1fff2a8c:	1008      	lrw      	r0, 0x1fff3596	// 1fff2aac <adc_evt+0x88>
		coutner = 0;
1fff2a8e:	a260      	st.b      	r3, (r2, 0x0)
		LOG("\n");
1fff2a90:	e3fffaa6 	bsr      	0x1fff1fdc	// 1fff1fdc <dbg_printf>
}
1fff2a94:	07f5      	br      	0x1fff2a7e	// 1fff2a7e <adc_evt+0x5a>
1fff2a96:	0000      	bkpt
1fff2a98:	1fff3630 	.long	0x1fff3630
1fff2a9c:	1fff35aa 	.long	0x1fff35aa
1fff2aa0:	1fff35e4 	.long	0x1fff35e4
1fff2aa4:	1fff4641 	.long	0x1fff4641
1fff2aa8:	1fff35ef 	.long	0x1fff35ef
1fff2aac:	1fff3596 	.long	0x1fff3596

1fff2ab0 <adcMeasureTask>:

static void adcMeasureTask( void )
{
1fff2ab0:	14d3      	push      	r4-r6, r15
	int ret;
	bool batt_mode = TRUE;//FALSE;//TRUE;
	uint8_t batt_ch = ADC_CH3P_P20;
	GPIO_Pin_e pin;

	LOG("\nadcMeasureTask\n");
1fff2ab2:	1100      	lrw      	r0, 0x1fff35b0	// 1fff2b30 <adcMeasureTask+0x80>
	{
		ret = hal_adc_config_channel(adc_cfg, adc_evt);
	}
	else
	{
		if(((BIT(batt_ch) & adc_cfg.channel) == 0) || adc_cfg.is_differential_mode)
1fff2ab4:	1180      	lrw      	r4, 0x1fff3630	// 1fff2b34 <adcMeasureTask+0x84>
	LOG("\nadcMeasureTask\n");
1fff2ab6:	e3fffa93 	bsr      	0x1fff1fdc	// 1fff1fdc <dbg_printf>
		if(((BIT(batt_ch) & adc_cfg.channel) == 0) || adc_cfg.is_differential_mode)
1fff2aba:	8460      	ld.b      	r3, (r4, 0x0)
1fff2abc:	4b67      	lsri      	r3, r3, 7
1fff2abe:	3b40      	cmpnei      	r3, 0
1fff2ac0:	0c04      	bf      	0x1fff2ac8	// 1fff2ac8 <adcMeasureTask+0x18>
1fff2ac2:	8462      	ld.b      	r3, (r4, 0x2)
1fff2ac4:	3b40      	cmpnei      	r3, 0
1fff2ac6:	0c05      	bf      	0x1fff2ad0	// 1fff2ad0 <adcMeasureTask+0x20>
		{
			LOG("Error config parameter!\n");
1fff2ac8:	101c      	lrw      	r0, 0x1fff35c1	// 1fff2b38 <adcMeasureTask+0x88>
1fff2aca:	e3fffa89 	bsr      	0x1fff1fdc	// 1fff1fdc <dbg_printf>
	hal_adc_start();
	if(adc_cfg.is_continue_mode == FALSE)
	{
		osal_start_timerEx(adcDemo_TaskID, adcMeasureTask_EVT,1000);
	}
}
1fff2ace:	1493      	pop      	r4-r6, r15
		pin = s_pinmap[batt_ch];
1fff2ad0:	107b      	lrw      	r3, 0x1fff360c	// 1fff2b3c <adcMeasureTask+0x8c>
		gpio_cfg_analog_io(pin,Bit_DISABLE);
1fff2ad2:	3100      	movi      	r1, 0
		pin = s_pinmap[batt_ch];
1fff2ad4:	93a7      	ld.w      	r5, (r3, 0x1c)
		gpio_cfg_analog_io(pin,Bit_DISABLE);
1fff2ad6:	6c17      	mov      	r0, r5
1fff2ad8:	e0000372 	bsr      	0x1fff31bc	// 1fff31bc <rf_phy_ini1+0x194>
		gpio_write(pin, 1);
1fff2adc:	3101      	movi      	r1, 1
1fff2ade:	6c17      	mov      	r0, r5
1fff2ae0:	e0000326 	bsr      	0x1fff312c	// 1fff312c <rf_phy_ini1+0x104>
		ret = hal_adc_config_channel(adc_cfg, adc_evt);
1fff2ae4:	8461      	ld.b      	r3, (r4, 0x1)
1fff2ae6:	8400      	ld.b      	r0, (r4, 0x0)
1fff2ae8:	4368      	lsli      	r3, r3, 8
1fff2aea:	6cc0      	or      	r3, r0
1fff2aec:	8402      	ld.b      	r0, (r4, 0x2)
1fff2aee:	4010      	lsli      	r0, r0, 16
1fff2af0:	6cc0      	or      	r3, r0
1fff2af2:	8403      	ld.b      	r0, (r4, 0x3)
1fff2af4:	4018      	lsli      	r0, r0, 24
1fff2af6:	6c0c      	or      	r0, r3
1fff2af8:	1032      	lrw      	r1, 0x1fff2a24	// 1fff2b40 <adcMeasureTask+0x90>
1fff2afa:	e3fffb85 	bsr      	0x1fff2204	// 1fff2204 <hal_adc_config_channel>
1fff2afe:	6d83      	mov      	r6, r0
		gpio_cfg_analog_io(pin,Bit_DISABLE);
1fff2b00:	3100      	movi      	r1, 0
1fff2b02:	6c17      	mov      	r0, r5
1fff2b04:	e000035c 	bsr      	0x1fff31bc	// 1fff31bc <rf_phy_ini1+0x194>
	if(ret != PPlus_SUCCESS)
1fff2b08:	3e40      	cmpnei      	r6, 0
1fff2b0a:	0c06      	bf      	0x1fff2b16	// 1fff2b16 <adcMeasureTask+0x66>
		LOG("ret = %d\n",ret);
1fff2b0c:	6c5b      	mov      	r1, r6
1fff2b0e:	100e      	lrw      	r0, 0x1fff35da	// 1fff2b44 <adcMeasureTask+0x94>
1fff2b10:	e3fffa66 	bsr      	0x1fff1fdc	// 1fff1fdc <dbg_printf>
		return;
1fff2b14:	07dd      	br      	0x1fff2ace	// 1fff2ace <adcMeasureTask+0x1e>
	hal_adc_start();
1fff2b16:	e3fffb09 	bsr      	0x1fff2128	// 1fff2128 <hal_adc_start>
	if(adc_cfg.is_continue_mode == FALSE)
1fff2b1a:	8461      	ld.b      	r3, (r4, 0x1)
1fff2b1c:	3b40      	cmpnei      	r3, 0
1fff2b1e:	0bd8      	bt      	0x1fff2ace	// 1fff2ace <adcMeasureTask+0x1e>
		osal_start_timerEx(adcDemo_TaskID, adcMeasureTask_EVT,1000);
1fff2b20:	106a      	lrw      	r3, 0x1fff4640	// 1fff2b48 <adcMeasureTask+0x98>
1fff2b22:	32fa      	movi      	r2, 250
1fff2b24:	8300      	ld.b      	r0, (r3, 0x0)
1fff2b26:	4242      	lsli      	r2, r2, 2
1fff2b28:	3180      	movi      	r1, 128
1fff2b2a:	e0000337 	bsr      	0x1fff3198	// 1fff3198 <rf_phy_ini1+0x170>
1fff2b2e:	07d0      	br      	0x1fff2ace	// 1fff2ace <adcMeasureTask+0x1e>
1fff2b30:	1fff35b0 	.long	0x1fff35b0
1fff2b34:	1fff3630 	.long	0x1fff3630
1fff2b38:	1fff35c1 	.long	0x1fff35c1
1fff2b3c:	1fff360c 	.long	0x1fff360c
1fff2b40:	1fff2a24 	.long	0x1fff2a24
1fff2b44:	1fff35da 	.long	0x1fff35da
1fff2b48:	1fff4640 	.long	0x1fff4640

1fff2b4c <adc_Init>:
{
1fff2b4c:	14d0      	push      	r15
    adcDemo_TaskID = task_id;	
1fff2b4e:	1063      	lrw      	r3, 0x1fff4640	// 1fff2b58 <adc_Init+0xc>
1fff2b50:	a300      	st.b      	r0, (r3, 0x0)
    adcMeasureTask();
1fff2b52:	e3ffffaf 	bsr      	0x1fff2ab0	// 1fff2ab0 <adcMeasureTask>
}
1fff2b56:	1490      	pop      	r15
1fff2b58:	1fff4640 	.long	0x1fff4640

1fff2b5c <adc_ProcessEvent>:
{
1fff2b5c:	14d2      	push      	r4-r5, r15
    if ( events & SYS_EVENT_MSG )
1fff2b5e:	74c7      	sexth      	r3, r1
{
1fff2b60:	6d07      	mov      	r4, r1
    if ( events & SYS_EVENT_MSG )
1fff2b62:	3bdf      	btsti      	r3, 31
1fff2b64:	0c0e      	bf      	0x1fff2b80	// 1fff2b80 <adc_ProcessEvent+0x24>
        if ( (pMsg = osal_msg_receive( adcDemo_TaskID )) != NULL )
1fff2b66:	1071      	lrw      	r3, 0x1fff4640	// 1fff2ba8 <adc_ProcessEvent+0x4c>
1fff2b68:	8300      	ld.b      	r0, (r3, 0x0)
1fff2b6a:	e0000365 	bsr      	0x1fff3234	// 1fff3234 <rf_phy_ini1+0x20c>
1fff2b6e:	3840      	cmpnei      	r0, 0
1fff2b70:	0c03      	bf      	0x1fff2b76	// 1fff2b76 <adc_ProcessEvent+0x1a>
            VOID osal_msg_deallocate( pMsg );
1fff2b72:	e000036d 	bsr      	0x1fff324c	// 1fff324c <rf_phy_ini1+0x224>
        return (events ^ SYS_EVENT_MSG);
1fff2b76:	3380      	movi      	r3, 128
1fff2b78:	4368      	lsli      	r3, r3, 8
1fff2b7a:	c4642440 	xor      	r0, r4, r3
}
1fff2b7e:	1492      	pop      	r4-r5, r15
    if ( events & 0x20 )
1fff2b80:	3020      	movi      	r0, 32
1fff2b82:	c4012023 	and      	r3, r1, r0
1fff2b86:	3b40      	cmpnei      	r3, 0
1fff2b88:	0c04      	bf      	0x1fff2b90	// 1fff2b90 <adc_ProcessEvent+0x34>
        return (events ^ 0x20);
1fff2b8a:	6c05      	xor      	r0, r1
1fff2b8c:	7401      	zexth      	r0, r0
1fff2b8e:	07f8      	br      	0x1fff2b7e	// 1fff2b7e <adc_ProcessEvent+0x22>
    if ( events & adcMeasureTask_EVT )
1fff2b90:	3580      	movi      	r5, 128
1fff2b92:	c4a12023 	and      	r3, r1, r5
1fff2b96:	3b40      	cmpnei      	r3, 0
1fff2b98:	0c06      	bf      	0x1fff2ba4	// 1fff2ba4 <adc_ProcessEvent+0x48>
        return (events ^ adcMeasureTask_EVT);
1fff2b9a:	6d15      	xor      	r4, r5
        adcMeasureTask();
1fff2b9c:	e3ffff8a 	bsr      	0x1fff2ab0	// 1fff2ab0 <adcMeasureTask>
        return (events ^ adcMeasureTask_EVT);
1fff2ba0:	7411      	zexth      	r0, r4
1fff2ba2:	07ee      	br      	0x1fff2b7e	// 1fff2b7e <adc_ProcessEvent+0x22>
    return 0;
1fff2ba4:	3000      	movi      	r0, 0
1fff2ba6:	07ec      	br      	0x1fff2b7e	// 1fff2b7e <adc_ProcessEvent+0x22>
1fff2ba8:	1fff4640 	.long	0x1fff4640

1fff2bac <app_main>:
 *
 * @return      none
 **************************************************************************************************
 */
int app_main(void)
{
1fff2bac:	14d0      	push      	r15

  /* Initialize the operating system */
  osal_init_system();
1fff2bae:	e000031f 	bsr      	0x1fff31ec	// 1fff31ec <rf_phy_ini1+0x1c4>

  osal_pwrmgr_device( PWRMGR_BATTERY );
1fff2bb2:	3001      	movi      	r0, 1
1fff2bb4:	e0000274 	bsr      	0x1fff309c	// 1fff309c <rf_phy_ini1+0x74>

  /* Start OSAL */
  osal_start_system(); // No Return from here
1fff2bb8:	e0000308 	bsr      	0x1fff31c8	// 1fff31c8 <rf_phy_ini1+0x1a0>

  return 0;
}
1fff2bbc:	3000      	movi      	r0, 0
1fff2bbe:	1490      	pop      	r15

1fff2bc0 <osalInitTasks>:
 * @param   void
 *
 * @return  none
 */
void osalInitTasks( void )
{
1fff2bc0:	14d1      	push      	r4, r15
	uint8 taskID = 0;
	tasksEvents = (uint16*)osal_mem_alloc( sizeof( uint16 ) * tasksCnt);
1fff2bc2:	108b      	lrw      	r4, 0x1fff363c	// 1fff2bec <osalInitTasks+0x2c>
1fff2bc4:	8c00      	ld.h      	r0, (r4, 0x0)
1fff2bc6:	4001      	lsli      	r0, r0, 1
1fff2bc8:	7401      	zexth      	r0, r0
1fff2bca:	e0000317 	bsr      	0x1fff31f8	// 1fff31f8 <rf_phy_ini1+0x1d0>
	osal_memset( tasksEvents, 0, (sizeof( uint16 ) * tasksCnt));
1fff2bce:	8c40      	ld.h      	r2, (r4, 0x0)
	tasksEvents = (uint16*)osal_mem_alloc( sizeof( uint16 ) * tasksCnt);
1fff2bd0:	1068      	lrw      	r3, 0x1fff5260	// 1fff2bf0 <osalInitTasks+0x30>
	osal_memset( tasksEvents, 0, (sizeof( uint16 ) * tasksCnt));
1fff2bd2:	4241      	lsli      	r2, r2, 1
1fff2bd4:	3100      	movi      	r1, 0
	tasksEvents = (uint16*)osal_mem_alloc( sizeof( uint16 ) * tasksCnt);
1fff2bd6:	b300      	st.w      	r0, (r3, 0x0)
	osal_memset( tasksEvents, 0, (sizeof( uint16 ) * tasksCnt));
1fff2bd8:	e0000358 	bsr      	0x1fff3288	// 1fff3288 <rf_phy_ini1+0x260>
	LL_Init( taskID++);
1fff2bdc:	3000      	movi      	r0, 0
1fff2bde:	e0000331 	bsr      	0x1fff3240	// 1fff3240 <rf_phy_ini1+0x218>
	adc_Init( taskID );
1fff2be2:	3001      	movi      	r0, 1
1fff2be4:	e3ffffb4 	bsr      	0x1fff2b4c	// 1fff2b4c <adc_Init>
}
1fff2be8:	1491      	pop      	r4, r15
1fff2bea:	0000      	bkpt
1fff2bec:	1fff363c 	.long	0x1fff363c
1fff2bf0:	1fff5260 	.long	0x1fff5260

1fff2bf4 <__wdt_init>:
/*********************************************************************
 * LOCAL FUNCTIONS
 */

void __wdt_init(void)
{
1fff2bf4:	14d0      	push      	r15
    typedef void (*my_function)(void );
    my_function pFunc = NULL;
    pFunc = (my_function)(JUMP_FUNCTION_GET(HAL_WATCHDOG_INIT));
1fff2bf6:	1065      	lrw      	r3, 0x1fff00c0	// 1fff2c08 <__wdt_init+0x14>

    if (pFunc != ((my_function)SRAM_BASE_ADDR))
1fff2bf8:	ea221fff 	movih      	r2, 8191
    pFunc = (my_function)(JUMP_FUNCTION_GET(HAL_WATCHDOG_INIT));
1fff2bfc:	8b7f      	ld.h      	r3, (r3, 0x3e)
    if (pFunc != ((my_function)SRAM_BASE_ADDR))
1fff2bfe:	608c      	addu      	r2, r3
1fff2c00:	3b40      	cmpnei      	r3, 0
1fff2c02:	0c02      	bf      	0x1fff2c06	// 1fff2c06 <__wdt_init+0x12>
        pFunc();
1fff2c04:	7bc9      	jsr      	r2
}
1fff2c06:	1490      	pop      	r15
1fff2c08:	1fff00c0 	.long	0x1fff00c0

1fff2c0c <wakeup_init1>:

void wakeup_init1()
{
1fff2c0c:	14d0      	push      	r15
    __wdt_init();
1fff2c0e:	e3fffff3 	bsr      	0x1fff2bf4	// 1fff2bf4 <__wdt_init>
    wakeup_init0();
1fff2c12:	e00002bd 	bsr      	0x1fff318c	// 1fff318c <rf_phy_ini1+0x164>
}
1fff2c16:	1490      	pop      	r15

1fff2c18 <ll_hw_write_tfifo1>:
	gpio_write(P23, 0);
}

#define LL_HW_FIFO_MARGIN_SMALL (10)
uint8_t  ll_hw_write_tfifo1(uint8_t* txPkt, uint16_t pktLen)
{
1fff2c18:	14d3      	push      	r4-r6, r15
1fff2c1a:	1423      	subi      	r14, r14, 12
1fff2c1c:	6d07      	mov      	r4, r1
1fff2c1e:	6d43      	mov      	r5, r0
	int rdPtr,wrPtr,wrDepth,wlen;
	uint32_t *p_txPkt=(uint32_t *)txPkt;

	ll_hw_get_tfifo_info(&rdPtr,&wrPtr,&wrDepth);
1fff2c20:	6c3b      	mov      	r0, r14
1fff2c22:	1a02      	addi      	r2, r14, 8
1fff2c24:	1901      	addi      	r1, r14, 4
1fff2c26:	e000029b 	bsr      	0x1fff315c	// 1fff315c <rf_phy_ini1+0x134>
	uint16_t tfifoSpace  = 0x07ff & (*(uint32_t *) (LL_HW_BASE + 0x74)); 

    //LL_FIFO_SPACE is 512B for tx, need adjust the LL_HW_FIFO_MARGIN
	if((pktLen>0) && (wrDepth+(pktLen>>2)<tfifoSpace-LL_HW_FIFO_MARGIN_SMALL)){	// make sure write the longest pkt will not overflow
1fff2c2a:	3c40      	cmpnei      	r4, 0
1fff2c2c:	0c38      	bf      	0x1fff2c9c	// 1fff2c9c <ll_hw_write_tfifo1+0x84>
1fff2c2e:	9862      	ld.w      	r3, (r14, 0x8)
1fff2c30:	4c42      	lsri      	r2, r4, 2
1fff2c32:	608c      	addu      	r2, r3
	uint16_t tfifoSpace  = 0x07ff & (*(uint32_t *) (LL_HW_BASE + 0x74)); 
1fff2c34:	107b      	lrw      	r3, 0x40031000	// 1fff2ca0 <ll_hw_write_tfifo1+0x88>
1fff2c36:	937d      	ld.w      	r3, (r3, 0x74)
	if((pktLen>0) && (wrDepth+(pktLen>>2)<tfifoSpace-LL_HW_FIFO_MARGIN_SMALL)){	// make sure write the longest pkt will not overflow
1fff2c38:	e46327ff 	andi      	r3, r3, 2047
1fff2c3c:	2b09      	subi      	r3, 10
1fff2c3e:	64c9      	cmplt      	r2, r3
1fff2c40:	0c2e      	bf      	0x1fff2c9c	// 1fff2c9c <ll_hw_write_tfifo1+0x84>
1fff2c42:	6c97      	mov      	r2, r5
		wlen = 1+((pktLen-1)>>2);						// calc the write tfifo count 

		//--------------------------------------------------------------
		//write tfifo wlen-1 firstly
		while(p_txPkt<((uint32_t *)txPkt+wlen-1)){
			*(volatile uint32_t *)(LL_HW_TFIFO) = *p_txPkt++;
1fff2c44:	1038      	lrw      	r1, 0x40031400	// 1fff2ca4 <ll_hw_write_tfifo1+0x8c>
		wlen = 1+((pktLen-1)>>2);						// calc the write tfifo count 
1fff2c46:	5c63      	subi      	r3, r4, 1
1fff2c48:	5362      	asri      	r3, r3, 2
1fff2c4a:	5b02      	addi      	r0, r3, 1
		while(p_txPkt<((uint32_t *)txPkt+wlen-1)){
1fff2c4c:	4362      	lsli      	r3, r3, 2
1fff2c4e:	60d4      	addu      	r3, r5
1fff2c50:	64c8      	cmphs      	r2, r3
1fff2c52:	0c11      	bf      	0x1fff2c74	// 1fff2c74 <ll_hw_write_tfifo1+0x5c>
1fff2c54:	e4242003 	andi      	r1, r4, 3
		//--------------------------------------------------------------
		//calc the residue txPkt length
		//write tfifo last time 
		int rduLen = pktLen&0x03;//pktLen%4
		
		if(			rduLen==3){
1fff2c58:	3943      	cmpnei      	r1, 3
1fff2c5a:	0811      	bt      	0x1fff2c7c	// 1fff2c7c <ll_hw_write_tfifo1+0x64>
			*(volatile uint32_t *)(LL_HW_TFIFO) = *(uint16_t *)(txPkt+pktLen-3) | (txPkt[pktLen-1]<<16) ;
1fff2c5c:	6114      	addu      	r4, r5
1fff2c5e:	5c63      	subi      	r3, r4, 1
1fff2c60:	8360      	ld.b      	r3, (r3, 0x0)
1fff2c62:	2c02      	subi      	r4, 3
1fff2c64:	8c40      	ld.h      	r2, (r4, 0x0)
1fff2c66:	4370      	lsli      	r3, r3, 16
1fff2c68:	6cc8      	or      	r3, r2
1fff2c6a:	104f      	lrw      	r2, 0x40031400	// 1fff2ca4 <ll_hw_write_tfifo1+0x8c>
1fff2c6c:	b260      	st.w      	r3, (r2, 0x0)
		}else{
			*(volatile uint32_t *)(LL_HW_TFIFO) = *p_txPkt;	
		}
		
		
		return wlen;
1fff2c6e:	7400      	zextb      	r0, r0

	}else{

		return 0;
	}
}
1fff2c70:	1403      	addi      	r14, r14, 12
1fff2c72:	1493      	pop      	r4-r6, r15
			*(volatile uint32_t *)(LL_HW_TFIFO) = *p_txPkt++;
1fff2c74:	92c0      	ld.w      	r6, (r2, 0x0)
1fff2c76:	2203      	addi      	r2, 4
1fff2c78:	b1c0      	st.w      	r6, (r1, 0x0)
1fff2c7a:	07eb      	br      	0x1fff2c50	// 1fff2c50 <ll_hw_write_tfifo1+0x38>
		}else if(	rduLen==2){
1fff2c7c:	3942      	cmpnei      	r1, 2
1fff2c7e:	106a      	lrw      	r3, 0x40031400	// 1fff2ca4 <ll_hw_write_tfifo1+0x8c>
1fff2c80:	0806      	bt      	0x1fff2c8c	// 1fff2c8c <ll_hw_write_tfifo1+0x74>
			*(volatile uint32_t *)(LL_HW_TFIFO) = *(uint16_t *)(txPkt+pktLen-2);
1fff2c82:	6114      	addu      	r4, r5
1fff2c84:	2c01      	subi      	r4, 2
1fff2c86:	8c40      	ld.h      	r2, (r4, 0x0)
			*(volatile uint32_t *)(LL_HW_TFIFO) = *p_txPkt;	
1fff2c88:	b340      	st.w      	r2, (r3, 0x0)
1fff2c8a:	07f2      	br      	0x1fff2c6e	// 1fff2c6e <ll_hw_write_tfifo1+0x56>
		}else if(	rduLen==1){
1fff2c8c:	3941      	cmpnei      	r1, 1
1fff2c8e:	0805      	bt      	0x1fff2c98	// 1fff2c98 <ll_hw_write_tfifo1+0x80>
			*(volatile uint32_t *)(LL_HW_TFIFO) = *(txPkt+pktLen-1);
1fff2c90:	6114      	addu      	r4, r5
1fff2c92:	2c00      	subi      	r4, 1
1fff2c94:	8440      	ld.b      	r2, (r4, 0x0)
1fff2c96:	07f9      	br      	0x1fff2c88	// 1fff2c88 <ll_hw_write_tfifo1+0x70>
			*(volatile uint32_t *)(LL_HW_TFIFO) = *p_txPkt;	
1fff2c98:	9240      	ld.w      	r2, (r2, 0x0)
1fff2c9a:	07f7      	br      	0x1fff2c88	// 1fff2c88 <ll_hw_write_tfifo1+0x70>
		return 0;
1fff2c9c:	3000      	movi      	r0, 0
1fff2c9e:	07e9      	br      	0x1fff2c70	// 1fff2c70 <ll_hw_write_tfifo1+0x58>
1fff2ca0:	40031000 	.long	0x40031000
1fff2ca4:	40031400 	.long	0x40031400

1fff2ca8 <ll_generateTxBuffer1>:

uint16 ll_generateTxBuffer1(int txFifo_vacancy, uint16 *pSave_ptr)
{
1fff2ca8:	14d4      	push      	r4-r7, r15
1fff2caa:	1421      	subi      	r14, r14, 4
    int i, new_pkts_num, tx_num = 0;
	llConnState_t *connPtr;

    connPtr = &conn_param[0];        
1fff2cac:	126f      	lrw      	r3, 0x1fff0a08	// 1fff2de8 <ll_generateTxBuffer1+0x140>
{
1fff2cae:	6d83      	mov      	r6, r0
    connPtr = &conn_param[0];        
1fff2cb0:	9380      	ld.w      	r4, (r3, 0x0)
{
1fff2cb2:	6dc7      	mov      	r7, r1
        
    // 0. write empty packet 
    if(connPtr->llMode == LL_HW_RTLP_EMPT
      || connPtr->llMode == LL_HW_TRLP_EMPT)     //  TRLP case, to be confirmed/test
1fff2cb4:	d8640135 	ld.b      	r3, (r4, 0x135)
1fff2cb8:	e46320ef 	andi      	r3, r3, 239
1fff2cbc:	d804207b 	ld.w      	r0, (r4, 0x1ec)
1fff2cc0:	eb430022 	cmpnei      	r3, 34
1fff2cc4:	084d      	bt      	0x1fff2d5e	// 1fff2d5e <ll_generateTxBuffer1+0xb6>
    {
        LL_HW_WRT_EMPTY_PKT;
1fff2cc6:	126a      	lrw      	r3, 0x40031400	// 1fff2dec <ll_generateTxBuffer1+0x144>
1fff2cc8:	3201      	movi      	r2, 1
1fff2cca:	b340      	st.w      	r2, (r3, 0x0)
        
        connPtr->ll_buf.tx_not_ack_pkt->valid = 0;                    // empty mode, tx_not_ack buffer null or empty packet
1fff2ccc:	3300      	movi      	r3, 0
1fff2cce:	b060      	st.w      	r3, (r0, 0x0)
    else if (connPtr->ll_buf.tx_not_ack_pkt->valid != 0)            // TODO: if the valid field could omit, move the not-ACK flag to buf.    
    {   
        ll_hw_write_tfifo1((uint8 *)&(connPtr->ll_buf.tx_not_ack_pkt->header), ((connPtr->ll_buf.tx_not_ack_pkt->header & 0xff00) >> 8) + 2);  
        //txFifo_vacancy --;     

        tx_num ++;        
1fff2cd0:	3501      	movi      	r5, 1
                           
        connPtr->ll_buf.tx_not_ack_pkt->valid = 0; 
    }   
    // 1st RTLP event, no porcess 0/1, it should be 0 because we have reset the TFIFO
    // other case, it is 1st not transmit packet/new packet
    *pSave_ptr = ll_hw_get_tfifo_wrptr();   
1fff2cd2:	e000029f 	bsr      	0x1fff3210	// 1fff3210 <rf_phy_ini1+0x1e8>
1fff2cd6:	af00      	st.h      	r0, (r7, 0x0)
    
	// 3. write last not transmit packets		 
	if (connPtr->ll_buf.ntrm_cnt > 0
1fff2cd8:	d8640230 	ld.b      	r3, (r4, 0x230)
1fff2cdc:	3b40      	cmpnei      	r3, 0
1fff2cde:	0c0f      	bf      	0x1fff2cfc	// 1fff2cfc <ll_generateTxBuffer1+0x54>
		&& txFifo_vacancy >= connPtr->ll_buf.ntrm_cnt)	 
1fff2ce0:	64d9      	cmplt      	r6, r3
1fff2ce2:	080d      	bt      	0x1fff2cfc	// 1fff2cfc <ll_generateTxBuffer1+0x54>
1fff2ce4:	3700      	movi      	r7, 0
1fff2ce6:	e46401ef 	addi      	r3, r4, 496
	{
		for (i = 0; i < connPtr->ll_buf.ntrm_cnt ; i++)
1fff2cea:	d8440230 	ld.b      	r2, (r4, 0x230)
1fff2cee:	649d      	cmplt      	r7, r2
1fff2cf0:	0847      	bt      	0x1fff2d7e	// 1fff2d7e <ll_generateTxBuffer1+0xd6>
			ll_hw_write_tfifo1((uint8 *)&(connPtr->ll_buf.tx_ntrm_pkts[i]->header), ((connPtr->ll_buf.tx_ntrm_pkts[i]->header & 0xff00) >> 8) + 2);						
		}			
		txFifo_vacancy -= connPtr->ll_buf.ntrm_cnt;  
		tx_num += connPtr->ll_buf.ntrm_cnt; 	   
		
		connPtr->ll_buf.ntrm_cnt = 0;
1fff2cf2:	3300      	movi      	r3, 0
		txFifo_vacancy -= connPtr->ll_buf.ntrm_cnt;  
1fff2cf4:	618a      	subu      	r6, r2
		connPtr->ll_buf.ntrm_cnt = 0;
1fff2cf6:	dc640230 	st.b      	r3, (r4, 0x230)
		tx_num += connPtr->ll_buf.ntrm_cnt; 	   
1fff2cfa:	6148      	addu      	r5, r2
	}
    rfCounters.numTxCtrl = 0;    // add on 2017-11-15, set tx control packet number 0
1fff2cfc:	3300      	movi      	r3, 0
1fff2cfe:	11fd      	lrw      	r7, 0x1fff0d26	// 1fff2df0 <ll_generateTxBuffer1+0x148>
1fff2d00:	a763      	st.b      	r3, (r7, 0x3)
        
    // 2. write control packet   
    if ((connPtr->ll_buf.tx_not_ack_pkt->valid == 0 ||                 // no tx not_ack packet, add on 2017-11-15
1fff2d02:	d864207b 	ld.w      	r3, (r4, 0x1ec)
1fff2d06:	9340      	ld.w      	r2, (r3, 0x0)
1fff2d08:	3a40      	cmpnei      	r2, 0
1fff2d0a:	0c06      	bf      	0x1fff2d16	// 1fff2d16 <ll_generateTxBuffer1+0x6e>
1fff2d0c:	8b62      	ld.h      	r3, (r3, 0x4)
1fff2d0e:	e4632003 	andi      	r3, r3, 3
1fff2d12:	3b43      	cmpnei      	r3, 3
1fff2d14:	0c1e      	bf      	0x1fff2d50	// 1fff2d50 <ll_generateTxBuffer1+0xa8>
        (connPtr->ll_buf.tx_not_ack_pkt->header & 0x3) != LL_DATA_PDU_HDR_LLID_CONTROL_PKT)    // last nack packet is not a control packet
         && connPtr->ctrlDataIsPending                                               // we only support 1 control procedure per connection
1fff2d16:	d8640137 	ld.b      	r3, (r4, 0x137)
1fff2d1a:	3b40      	cmpnei      	r3, 0
1fff2d1c:	0c1a      	bf      	0x1fff2d50	// 1fff2d50 <ll_generateTxBuffer1+0xa8>
         && !connPtr->ctrlDataIsProcess
1fff2d1e:	d8640136 	ld.b      	r3, (r4, 0x136)
1fff2d22:	3b40      	cmpnei      	r3, 0
1fff2d24:	0816      	bt      	0x1fff2d50	// 1fff2d50 <ll_generateTxBuffer1+0xa8>
         && txFifo_vacancy > connPtr->ll_buf.ntrm_cnt)    // tricky here:  if the Tx FIFO is full and nothing is sent in last event, then it can't fill new packet(include ctrl pkt) in new event
1fff2d26:	d8640230 	ld.b      	r3, (r4, 0x230)
1fff2d2a:	658d      	cmplt      	r3, r6
1fff2d2c:	0c12      	bf      	0x1fff2d50	// 1fff2d50 <ll_generateTxBuffer1+0xa8>
    {   // not in a control procedure, and there is control packet pending
        // fill ctrl packet
        ll_hw_write_tfifo1((uint8 *)&(connPtr->ctrlData .header), ((connPtr->ctrlData .header & 0xff00) >> 8) + 2);   
1fff2d2e:	d82410a4 	ld.h      	r1, (r4, 0x148)
1fff2d32:	4928      	lsri      	r1, r1, 8
1fff2d34:	e4040147 	addi      	r0, r4, 328
1fff2d38:	2101      	addi      	r1, 2
1fff2d3a:	e3ffff6f 	bsr      	0x1fff2c18	// 1fff2c18 <ll_hw_write_tfifo1>
        txFifo_vacancy --;

        tx_num ++;
       
       // put Ctrl packet in TFIFO, change the control procedure status
        connPtr->ctrlDataIsPending = 0;
1fff2d3e:	3300      	movi      	r3, 0
        txFifo_vacancy --;
1fff2d40:	2e00      	subi      	r6, 1
        connPtr->ctrlDataIsPending = 0;
1fff2d42:	dc640137 	st.b      	r3, (r4, 0x137)
        connPtr->ctrlDataIsProcess = 1;
1fff2d46:	3301      	movi      	r3, 1
        tx_num ++;
1fff2d48:	2500      	addi      	r5, 1
        connPtr->ctrlDataIsProcess = 1;
1fff2d4a:	dc640136 	st.b      	r3, (r4, 0x136)
                
        rfCounters.numTxCtrl = 1;     // add 2017-11-15, if put new ctrl packet in FIFO, add the counter
1fff2d4e:	a763      	st.b      	r3, (r7, 0x3)
    }
    

    if (connPtr->ll_buf.ntrm_cnt != 0)
1fff2d50:	d8640230 	ld.b      	r3, (r4, 0x230)
1fff2d54:	3b40      	cmpnei      	r3, 0
1fff2d56:	0c20      	bf      	0x1fff2d96	// 1fff2d96 <ll_generateTxBuffer1+0xee>
            // update PM counter, add A1 ROM metal change
            connPtr->pmCounter.ll_send_data_pkt_cnt ++;
        }        
    }   
	
    return tx_num;
1fff2d58:	7415      	zexth      	r0, r5
}
1fff2d5a:	1401      	addi      	r14, r14, 4
1fff2d5c:	1494      	pop      	r4-r7, r15
    else if (connPtr->ll_buf.tx_not_ack_pkt->valid != 0)            // TODO: if the valid field could omit, move the not-ACK flag to buf.    
1fff2d5e:	9060      	ld.w      	r3, (r0, 0x0)
1fff2d60:	3b40      	cmpnei      	r3, 0
1fff2d62:	0c0c      	bf      	0x1fff2d7a	// 1fff2d7a <ll_generateTxBuffer1+0xd2>
        ll_hw_write_tfifo1((uint8 *)&(connPtr->ll_buf.tx_not_ack_pkt->header), ((connPtr->ll_buf.tx_not_ack_pkt->header & 0xff00) >> 8) + 2);  
1fff2d64:	8822      	ld.h      	r1, (r0, 0x4)
1fff2d66:	4928      	lsri      	r1, r1, 8
1fff2d68:	2003      	addi      	r0, 4
1fff2d6a:	2101      	addi      	r1, 2
1fff2d6c:	e3ffff56 	bsr      	0x1fff2c18	// 1fff2c18 <ll_hw_write_tfifo1>
        connPtr->ll_buf.tx_not_ack_pkt->valid = 0; 
1fff2d70:	d864207b 	ld.w      	r3, (r4, 0x1ec)
1fff2d74:	3200      	movi      	r2, 0
1fff2d76:	b340      	st.w      	r2, (r3, 0x0)
1fff2d78:	07ac      	br      	0x1fff2cd0	// 1fff2cd0 <ll_generateTxBuffer1+0x28>
    int i, new_pkts_num, tx_num = 0;
1fff2d7a:	3500      	movi      	r5, 0
1fff2d7c:	07ab      	br      	0x1fff2cd2	// 1fff2cd2 <ll_generateTxBuffer1+0x2a>
			ll_hw_write_tfifo1((uint8 *)&(connPtr->ll_buf.tx_ntrm_pkts[i]->header), ((connPtr->ll_buf.tx_ntrm_pkts[i]->header & 0xff00) >> 8) + 2);						
1fff2d7e:	9300      	ld.w      	r0, (r3, 0x0)
1fff2d80:	b860      	st.w      	r3, (r14, 0x0)
1fff2d82:	8822      	ld.h      	r1, (r0, 0x4)
1fff2d84:	4928      	lsri      	r1, r1, 8
1fff2d86:	2003      	addi      	r0, 4
1fff2d88:	2101      	addi      	r1, 2
		for (i = 0; i < connPtr->ll_buf.ntrm_cnt ; i++)
1fff2d8a:	2700      	addi      	r7, 1
			ll_hw_write_tfifo1((uint8 *)&(connPtr->ll_buf.tx_ntrm_pkts[i]->header), ((connPtr->ll_buf.tx_ntrm_pkts[i]->header & 0xff00) >> 8) + 2);						
1fff2d8c:	e3ffff46 	bsr      	0x1fff2c18	// 1fff2c18 <ll_hw_write_tfifo1>
1fff2d90:	9860      	ld.w      	r3, (r14, 0x0)
1fff2d92:	2303      	addi      	r3, 4
1fff2d94:	07ab      	br      	0x1fff2cea	// 1fff2cea <ll_generateTxBuffer1+0x42>
    new_pkts_num = getTxBufferSize(connPtr);
1fff2d96:	6c13      	mov      	r0, r4
1fff2d98:	e00001a6 	bsr      	0x1fff30e4	// 1fff30e4 <rf_phy_ini1+0xbc>
1fff2d9c:	6dc3      	mov      	r7, r0
    if ((new_pkts_num > 0)     
1fff2d9e:	3840      	cmpnei      	r0, 0
1fff2da0:	0fdc      	bf      	0x1fff2d58	// 1fff2d58 <ll_generateTxBuffer1+0xb0>
        && txFifo_vacancy > 0)       
1fff2da2:	3e20      	cmplti      	r6, 1
1fff2da4:	0bda      	bt      	0x1fff2d58	// 1fff2d58 <ll_generateTxBuffer1+0xb0>
1fff2da6:	6cd7      	mov      	r3, r5
1fff2da8:	6194      	addu      	r6, r5
            uint8_t idx = get_tx_read_ptr(connPtr);
1fff2daa:	6c13      	mov      	r0, r4
1fff2dac:	b860      	st.w      	r3, (r14, 0x0)
1fff2dae:	e0000183 	bsr      	0x1fff30b4	// 1fff30b4 <rf_phy_ini1+0x8c>
            ll_hw_write_tfifo1((uint8 *)&(connPtr->ll_buf.tx_conn_desc[idx]->header), ((connPtr->ll_buf.tx_conn_desc[idx]->header & 0xff00) >> 8) + 2); 
1fff2db2:	205a      	addi      	r0, 91
1fff2db4:	4002      	lsli      	r0, r0, 2
1fff2db6:	6010      	addu      	r0, r4
1fff2db8:	9000      	ld.w      	r0, (r0, 0x0)
1fff2dba:	2003      	addi      	r0, 4
1fff2dbc:	8820      	ld.h      	r1, (r0, 0x0)
1fff2dbe:	4928      	lsri      	r1, r1, 8
1fff2dc0:	2101      	addi      	r1, 2
1fff2dc2:	e3ffff2b 	bsr      	0x1fff2c18	// 1fff2c18 <ll_hw_write_tfifo1>
            update_tx_read_ptr(connPtr);  
1fff2dc6:	6c13      	mov      	r0, r4
            tx_num++;            
1fff2dc8:	2500      	addi      	r5, 1
            update_tx_read_ptr(connPtr);  
1fff2dca:	e00001f3 	bsr      	0x1fff31b0	// 1fff31b0 <rf_phy_ini1+0x188>
            connPtr->pmCounter.ll_send_data_pkt_cnt ++;
1fff2dce:	d84420a0 	ld.w      	r2, (r4, 0x280)
1fff2dd2:	2200      	addi      	r2, 1
1fff2dd4:	dc4420a0 	st.w      	r2, (r4, 0x280)
        for (i = 0; i < new_pkts_num && i < txFifo_vacancy; i++)
1fff2dd8:	9860      	ld.w      	r3, (r14, 0x0)
1fff2dda:	5d4d      	subu      	r2, r5, r3
1fff2ddc:	65c9      	cmplt      	r2, r7
1fff2dde:	0fbd      	bf      	0x1fff2d58	// 1fff2d58 <ll_generateTxBuffer1+0xb0>
1fff2de0:	6596      	cmpne      	r5, r6
1fff2de2:	0be4      	bt      	0x1fff2daa	// 1fff2daa <ll_generateTxBuffer1+0x102>
1fff2de4:	07ba      	br      	0x1fff2d58	// 1fff2d58 <ll_generateTxBuffer1+0xb0>
1fff2de6:	0000      	bkpt
1fff2de8:	1fff0a08 	.long	0x1fff0a08
1fff2dec:	40031400 	.long	0x40031400
1fff2df0:	1fff0d26 	.long	0x1fff0d26

1fff2df4 <init_config>:
 * @brief   initiliaztion configuration 
 *
 * for osal scheduler and Bluetooth Controller
 */
void init_config(void)
{
1fff2df4:	14d1      	push      	r4, r15
	int i;

	pGlobal_config = global_config;
1fff2df6:	1350      	lrw      	r2, 0x1fff5268	// 1fff2fb4 <init_config+0x1c0>
1fff2df8:	1370      	lrw      	r3, 0x1fff0100	// 1fff2fb8 <init_config+0x1c4>
1fff2dfa:	b260      	st.w      	r3, (r2, 0x0)
1fff2dfc:	3200      	movi      	r2, 0

	for (i = 0; i < SOFT_PARAMETER_NUM; i ++)
		pGlobal_config[i] = 0;
1fff2dfe:	132f      	lrw      	r1, 0x1fff0100	// 1fff2fb8 <init_config+0x1c4>
1fff2e00:	3000      	movi      	r0, 0
1fff2e02:	6048      	addu      	r1, r2
1fff2e04:	2203      	addi      	r2, 4
	for (i = 0; i < SOFT_PARAMETER_NUM; i ++)
1fff2e06:	eb420100 	cmpnei      	r2, 256
		pGlobal_config[i] = 0;
1fff2e0a:	b100      	st.w      	r0, (r1, 0x0)
	for (i = 0; i < SOFT_PARAMETER_NUM; i ++)
1fff2e0c:	0bf9      	bt      	0x1fff2dfe	// 1fff2dfe <init_config+0xa>

	//save the app initial_sp  which will be used in wakeupProcess 20180706 by ZQ
	pGlobal_config[INITIAL_STACK_PTR] = (uint32_t)&__initial_sp;
1fff2e0e:	134c      	lrw      	r2, 0x1fff4640	// 1fff2fbc <init_config+0x1c8>
1fff2e10:	b35a      	st.w      	r2, (r3, 0x68)

	// LL switch setting
	pGlobal_config[LL_SWITCH] =  LL_DEBUG_ALLOW | SLAVE_LATENCY_ALLOW | RC32_TRACKINK_ALLOW
1fff2e12:	ea020167 	movi      	r2, 359
1fff2e16:	b34b      	st.w      	r2, (r3, 0x2c)
												| GAP_DUP_RPT_FILTER_DISALLOW;



	// sleep delay
	pGlobal_config[MIN_TIME_TO_STABLE_32KHZ_XOSC] = 10;      // 10ms, temporary set
1fff2e18:	320a      	movi      	r2, 10
1fff2e1a:	b354      	st.w      	r2, (r3, 0x50)

	// system clock setting
	pGlobal_config[CLOCK_SETTING] = g_system_clk;//CLOCK_32MHZ;
1fff2e1c:	1349      	lrw      	r2, 0x1fff0388	// 1fff2fc0 <init_config+0x1cc>
1fff2e1e:	9220      	ld.w      	r1, (r2, 0x0)
1fff2e20:	b32e      	st.w      	r1, (r3, 0x38)
	// t4. sw prepare cal sleep tick initial rf_ini about 300us @16M this part depends on HCLK
	// WAKEUP_ADVANCE should be larger than t1+t2+t3+t4 
	//------------------------------------------------------------------------
	// wakeup advance time, in us

	pGlobal_config[WAKEUP_ADVANCE] = 1850;//650;//600;//310;
1fff2e22:	ea01073a 	movi      	r1, 1850
1fff2e26:	b327      	st.w      	r1, (r3, 0x1c)

	if(g_system_clk==SYS_CLK_XTAL_16M)
1fff2e28:	9220      	ld.w      	r1, (r2, 0x0)
1fff2e2a:	3942      	cmpnei      	r1, 2
1fff2e2c:	089c      	bt      	0x1fff2f64	// 1fff2f64 <init_config+0x170>
	{
		pGlobal_config[WAKEUP_DELAY] = 16;
1fff2e2e:	3110      	movi      	r1, 16
	{
		pGlobal_config[WAKEUP_DELAY] = 20;
	}
	else if(g_system_clk==SYS_CLK_DLL_64M)
	{
		pGlobal_config[WAKEUP_DELAY] = 24;
1fff2e30:	b328      	st.w      	r1, (r3, 0x20)
	}

	// sleep time, in us
	pGlobal_config[MAX_SLEEP_TIME] = 1500000;    
1fff2e32:	1325      	lrw      	r1, 0x16e360	// 1fff2fc4 <init_config+0x1d0>
1fff2e34:	b325      	st.w      	r1, (r3, 0x14)
	pGlobal_config[MIN_SLEEP_TIME] = 1500;
1fff2e36:	ea0105dc 	movi      	r1, 1500
1fff2e3a:	b326      	st.w      	r1, (r3, 0x18)

	pGlobal_config[ALLOW_TO_SLEEP_TICK_RC32K] = 60;// 30.5 per tick
1fff2e3c:	313c      	movi      	r1, 60
1fff2e3e:	b33b      	st.w      	r1, (r3, 0x6c)

	// LL engine settle time
	pGlobal_config[LL_HW_BB_DELAY] = 54;//54-8;
1fff2e40:	3136      	movi      	r1, 54
1fff2e42:	b32f      	st.w      	r1, (r3, 0x3c)
	pGlobal_config[LL_HW_AFE_DELAY] = 8;
1fff2e44:	3108      	movi      	r1, 8
1fff2e46:	b330      	st.w      	r1, (r3, 0x40)
	pGlobal_config[LL_HW_PLL_DELAY] = 40;
1fff2e48:	3128      	movi      	r1, 40
1fff2e4a:	b331      	st.w      	r1, (r3, 0x44)

	// Tx2Rx and Rx2Tx interval
	//Tx2Rx could be advanced a little
	//Rx2Tx should be ensure T_IFS within150us+-2us
	pGlobal_config[LL_HW_Rx_TO_TX_INTV] = 58;//57;			// 2019/3/20 A2: 57 --> 58
1fff2e4c:	313a      	movi      	r1, 58
1fff2e4e:	b339      	st.w      	r1, (r3, 0x64)
	pGlobal_config[LL_HW_Tx_TO_RX_INTV] = 49;//50; //65		// 2019/3/20 A2: 50 --> 49
1fff2e50:	3131      	movi      	r1, 49
1fff2e52:	b338      	st.w      	r1, (r3, 0x60)

	//------------------------------------------------2MPHY
	// LL engine settle time 
	pGlobal_config[LL_HW_BB_DELAY_2MPHY] = 59;
1fff2e54:	313b      	movi      	r1, 59
1fff2e56:	dc232020 	st.w      	r1, (r3, 0x80)
	pGlobal_config[LL_HW_AFE_DELAY_2MPHY] = 8;
1fff2e5a:	3108      	movi      	r1, 8
1fff2e5c:	dc232021 	st.w      	r1, (r3, 0x84)
	pGlobal_config[LL_HW_PLL_DELAY_2MPHY] = 40;
1fff2e60:	3128      	movi      	r1, 40
1fff2e62:	dc232022 	st.w      	r1, (r3, 0x88)
	// Tx2Rx and Rx2Tx interval
	//Tx2Rx could be advanced a little
	//Rx2Tx should be ensure T_IFS within150us+-2us
	pGlobal_config[LL_HW_Rx_TO_TX_INTV_2MPHY] = 70;//72
1fff2e66:	3146      	movi      	r1, 70
1fff2e68:	dc232024 	st.w      	r1, (r3, 0x90)
	pGlobal_config[LL_HW_Tx_TO_RX_INTV_2MPHY] = 57;//72   
1fff2e6c:	3139      	movi      	r1, 57
1fff2e6e:	dc232023 	st.w      	r1, (r3, 0x8c)


	// LL engine settle time, for advertisement
	pGlobal_config[LL_HW_BB_DELAY_ADV] = 90;
1fff2e72:	315a      	movi      	r1, 90
1fff2e74:	b33c      	st.w      	r1, (r3, 0x70)
	pGlobal_config[LL_HW_AFE_DELAY_ADV] = 8;
1fff2e76:	3108      	movi      	r1, 8
1fff2e78:	b33d      	st.w      	r1, (r3, 0x74)
	pGlobal_config[LL_HW_PLL_DELAY_ADV] = 60;    
1fff2e7a:	313c      	movi      	r1, 60
1fff2e7c:	b33e      	st.w      	r1, (r3, 0x78)

	// adv channel interval
	pGlobal_config[ADV_CHANNEL_INTERVAL] = 1400;//6250;
1fff2e7e:	31af      	movi      	r1, 175
1fff2e80:	4123      	lsli      	r1, r1, 3
1fff2e82:	b320      	st.w      	r1, (r3, 0x0)
	pGlobal_config[NON_ADV_CHANNEL_INTERVAL] = 1400;
1fff2e84:	b32c      	st.w      	r1, (r3, 0x30)

	if(g_system_clk==SYS_CLK_XTAL_16M)
1fff2e86:	9220      	ld.w      	r1, (r2, 0x0)
1fff2e88:	3942      	cmpnei      	r1, 2
1fff2e8a:	087c      	bt      	0x1fff2f82	// 1fff2f82 <init_config+0x18e>
	{
		// scan req -> scan rsp timing
		pGlobal_config[SCAN_RSP_DELAY] = 16;//23;        //  2019/3/19 A2: 23 --> 16
1fff2e8c:	3110      	movi      	r1, 16
		// scan req -> scan rsp timing
		pGlobal_config[SCAN_RSP_DELAY] = 9;        // 12	//  2019/3/19 A2: 12 --> 9
	}                                      
	else if(g_system_clk == SYS_CLK_DLL_64M)		//  2019/3/26 add
	{
		pGlobal_config[SCAN_RSP_DELAY] = 8;
1fff2e8e:	b321      	st.w      	r1, (r3, 0x4)
	pGlobal_config[SLAVE_CONN_DELAY] = 143;//0;//1500;//0;//3000;//0;          ---> update 11-20
	pGlobal_config[SLAVE_CONN_DELAY_BEFORE_SYNC] = 160;

	// RTLP timeout
	pGlobal_config[LL_HW_RTLP_LOOP_TIMEOUT] = 50000;
	pGlobal_config[LL_HW_RTLP_TO_GAP]       = 1000;
1fff2e90:	30fa      	movi      	r0, 250
1fff2e92:	4002      	lsli      	r0, r0, 2
1fff2e94:	dc032025 	st.w      	r0, (r3, 0x94)
	pGlobal_config[LL_HW_RTLP_1ST_TIMEOUT]  = 2000;
	pGlobal_config[LL_FIRST_WINDOW]         = 5000; //jack rom add for slave first connet evt


	// direct adv interval configuration
	pGlobal_config[HDC_DIRECT_ADV_INTERVAL] = 1000;
1fff2e98:	b309      	st.w      	r0, (r3, 0x24)
	pGlobal_config[CONN_REQ_TO_SLAVE_DELAY] = 300;//192;//500;//192;
1fff2e9a:	3196      	movi      	r1, 150
	pGlobal_config[LDC_DIRECT_ADV_INTERVAL] = 6250;
1fff2e9c:	ea00186a 	movi      	r0, 6250
	pGlobal_config[CONN_REQ_TO_SLAVE_DELAY] = 300;//192;//500;//192;
1fff2ea0:	4121      	lsli      	r1, r1, 1
1fff2ea2:	b322      	st.w      	r1, (r3, 0x8)
	pGlobal_config[LDC_DIRECT_ADV_INTERVAL] = 6250;
1fff2ea4:	b30a      	st.w      	r0, (r3, 0x28)
	pGlobal_config[SLAVE_CONN_DELAY] = 143;//0;//1500;//0;//3000;//0;          ---> update 11-20
1fff2ea6:	318f      	movi      	r1, 143

	// A1 ROM metal change for HDC direct adv, 
	pGlobal_config[DIR_ADV_DELAY] = 115;   // in us, consider both direct adv broadcast time & SW delay, ... etc.
1fff2ea8:	3073      	movi      	r0, 115
	pGlobal_config[SLAVE_CONN_DELAY] = 143;//0;//1500;//0;//3000;//0;          ---> update 11-20
1fff2eaa:	b323      	st.w      	r1, (r3, 0xc)
	pGlobal_config[DIR_ADV_DELAY] = 115;   // in us, consider both direct adv broadcast time & SW delay, ... etc.
1fff2eac:	b317      	st.w      	r0, (r3, 0x5c)
	pGlobal_config[SLAVE_CONN_DELAY_BEFORE_SYNC] = 160;
1fff2eae:	31a0      	movi      	r1, 160

	// A1 ROM metal change
	pGlobal_config[LL_TX_PKTS_PER_CONN_EVT] = 6;//8;
1fff2eb0:	3006      	movi      	r0, 6
	pGlobal_config[SLAVE_CONN_DELAY_BEFORE_SYNC] = 160;
1fff2eb2:	b324      	st.w      	r1, (r3, 0x10)
	pGlobal_config[LL_TX_PKTS_PER_CONN_EVT] = 6;//8;
1fff2eb4:	b315      	st.w      	r0, (r3, 0x54)
	pGlobal_config[LL_HW_RTLP_LOOP_TIMEOUT] = 50000;
1fff2eb6:	ea01c350 	movi      	r1, 50000
	pGlobal_config[LL_RX_PKTS_PER_CONN_EVT] = 6;//8;    
1fff2eba:	b316      	st.w      	r0, (r3, 0x58)

	pGlobal_config[LL_TRX_NUM_ADAPTIVE_CONFIG] = 8;     //0:        disable adaptive 
1fff2ebc:	3008      	movi      	r0, 8
	pGlobal_config[LL_HW_RTLP_LOOP_TIMEOUT] = 50000;
1fff2ebe:	b332      	st.w      	r1, (r3, 0x48)
	pGlobal_config[LL_TRX_NUM_ADAPTIVE_CONFIG] = 8;     //0:        disable adaptive 
1fff2ec0:	dc032026 	st.w      	r0, (r3, 0x98)
	pGlobal_config[LL_HW_RTLP_1ST_TIMEOUT]  = 2000;
1fff2ec4:	31fa      	movi      	r1, 250
	pGlobal_config[LL_FIRST_WINDOW]         = 5000; //jack rom add for slave first connet evt
1fff2ec6:	ea041388 	movi      	r4, 5000
	//other:    adaptive max limitation
	g_smartWindowSize = pGlobal_config[LL_HW_RTLP_1ST_TIMEOUT] ;    
1fff2eca:	1200      	lrw      	r0, 0x1fff0a54	// 1fff2fc8 <init_config+0x1d4>
	pGlobal_config[LL_HW_RTLP_1ST_TIMEOUT]  = 2000;
1fff2ecc:	4123      	lsli      	r1, r1, 3
1fff2ece:	b333      	st.w      	r1, (r3, 0x4c)
	pGlobal_config[LL_FIRST_WINDOW]         = 5000; //jack rom add for slave first connet evt
1fff2ed0:	dc83202d 	st.w      	r4, (r3, 0xb4)
	g_smartWindowSize = pGlobal_config[LL_HW_RTLP_1ST_TIMEOUT] ;    
1fff2ed4:	b020      	st.w      	r1, (r0, 0x0)

	//====== A2 metal change add, for scanner & initiator
	if(g_system_clk==SYS_CLK_XTAL_16M)
1fff2ed6:	9220      	ld.w      	r1, (r2, 0x0)
1fff2ed8:	3942      	cmpnei      	r1, 2
1fff2eda:	0863      	bt      	0x1fff2fa0	// 1fff2fa0 <init_config+0x1ac>
	{
		pGlobal_config[LL_ADV_TO_SCAN_REQ_DELAY] = 18;//20;		//  2019/3/19 A2: 20 --> 18
1fff2edc:	3212      	movi      	r2, 18
	{
		pGlobal_config[LL_ADV_TO_SCAN_REQ_DELAY] = 10;//12;		//  2019/3/19 A2: 12 --> 10
	}
	else if(g_system_clk==SYS_CLK_DLL_64M)
	{
		pGlobal_config[LL_ADV_TO_SCAN_REQ_DELAY] = 8;				//  2019/3/26 add
1fff2ede:	b35f      	st.w      	r2, (r3, 0x7c)
	}

	// TRLP timeout
	pGlobal_config[OSAL_SYS_TICK_WAKEUP_TRIM] = 56;  // 0.125us
1fff2ee0:	3238      	movi      	r2, 56

    pGlobal_config[MAC_ADDRESS_LOC] = 0x11004000;
	// for simultaneous conn & adv/scan
	pGlobal_config[LL_NOCONN_ADV_EST_TIME] = 1400*3;
	pGlobal_config[LL_NOCONN_ADV_MARGIN] = 600;
1fff2ee2:	3196      	movi      	r1, 150
	pGlobal_config[OSAL_SYS_TICK_WAKEUP_TRIM] = 56;  // 0.125us
1fff2ee4:	dc432027 	st.w      	r2, (r3, 0x9c)
    pGlobal_config[MAC_ADDRESS_LOC] = 0x11004000;
1fff2ee8:	1159      	lrw      	r2, 0x11004000	// 1fff2fcc <init_config+0x1d8>
	pGlobal_config[LL_NOCONN_ADV_MARGIN] = 600;
1fff2eea:	4122      	lsli      	r1, r1, 2
    pGlobal_config[MAC_ADDRESS_LOC] = 0x11004000;
1fff2eec:	dc43202c 	st.w      	r2, (r3, 0xb0)
	pGlobal_config[LL_NOCONN_ADV_EST_TIME] = 1400*3;
1fff2ef0:	ea021068 	movi      	r2, 4200
	pGlobal_config[LL_NOCONN_ADV_MARGIN] = 600;
1fff2ef4:	dc232029 	st.w      	r1, (r3, 0xa4)
	pGlobal_config[LL_NOCONN_ADV_EST_TIME] = 1400*3;
1fff2ef8:	dc432028 	st.w      	r2, (r3, 0xa0)

	pGlobal_config[LL_SEC_SCAN_MARGIN] = 1400*3;
1fff2efc:	dc43202a 	st.w      	r2, (r3, 0xa8)
	pGlobal_config[LL_MIN_SCAN_TIME] = 2000;
1fff2f00:	32fa      	movi      	r2, 250
1fff2f02:	4243      	lsli      	r2, r2, 3
1fff2f04:	dc43202b 	st.w      	r2, (r3, 0xac)

	pGlobal_config[TIMER_ISR_ENTRY_TIME] = 30;
1fff2f08:	321e      	movi      	r2, 30

	extern void osalInitTasks( void );
	extern pTaskEventHandlerFn tasksArr[];
	extern uint16 tasksCnt;
	extern uint16 *tasksEvents;
	JUMP_FUNCTION_SET(OSAL_INIT_TASKS,(uint32_t)&osalInitTasks);
1fff2f0a:	1132      	lrw      	r1, 0x1fff2bc0	// 1fff2fd0 <init_config+0x1dc>
1fff2f0c:	3001      	movi      	r0, 1
	pGlobal_config[TIMER_ISR_ENTRY_TIME] = 30;
1fff2f0e:	b34d      	st.w      	r2, (r3, 0x34)
	pGlobal_config[NEXT_TIMER1_CONSIDER_DELAY] = 300;
1fff2f10:	3296      	movi      	r2, 150
1fff2f12:	4241      	lsli      	r2, r2, 1
1fff2f14:	dc43202e 	st.w      	r2, (r3, 0xb8)
	pGlobal_config[LL_WRITE_RE_TX_FIFO] = 50;
1fff2f18:	3232      	movi      	r2, 50
1fff2f1a:	dc43202f 	st.w      	r2, (r3, 0xbc)
	JUMP_FUNCTION_SET(OSAL_INIT_TASKS,(uint32_t)&osalInitTasks);
1fff2f1e:	e000010d 	bsr      	0x1fff3138	// 1fff3138 <rf_phy_ini1+0x110>
	JUMP_FUNCTION_SET(TASKS_ARRAY,(uint32_t)&tasksArr);
1fff2f22:	112d      	lrw      	r1, 0x1fff3634	// 1fff2fd4 <init_config+0x1e0>
1fff2f24:	3002      	movi      	r0, 2
1fff2f26:	e0000109 	bsr      	0x1fff3138	// 1fff3138 <rf_phy_ini1+0x110>
	JUMP_FUNCTION_SET(TASK_COUNT ,(uint32_t)&tasksCnt);
1fff2f2a:	112c      	lrw      	r1, 0x1fff363c	// 1fff2fd8 <init_config+0x1e4>
1fff2f2c:	3003      	movi      	r0, 3
1fff2f2e:	e0000105 	bsr      	0x1fff3138	// 1fff3138 <rf_phy_ini1+0x110>
	JUMP_FUNCTION_SET(TASK_EVENTS,(uint32_t)&tasksEvents);
1fff2f32:	112b      	lrw      	r1, 0x1fff5260	// 1fff2fdc <init_config+0x1e8>
1fff2f34:	3004      	movi      	r0, 4
1fff2f36:	e0000101 	bsr      	0x1fff3138	// 1fff3138 <rf_phy_ini1+0x110>

	//JUMP_FUNCTION_SET(LL_HW_GO , (uint32_t)&ll_hw_go1);
	extern void rf_phy_ini1(void);
    	extern void rf_phy_change_cfg1(uint8_t pktFmt);
    	extern uint16 ll_generateTxBuffer1(int txFifo_vacancy, uint16 *pSave_ptr);
	JUMP_FUNCTION_SET(RF_INIT , (uint32_t)&rf_phy_ini1);
1fff2f3a:	112a      	lrw      	r1, 0x1fff3028	// 1fff2fe0 <init_config+0x1ec>
1fff2f3c:	3045      	movi      	r0, 69
1fff2f3e:	e00000fd 	bsr      	0x1fff3138	// 1fff3138 <rf_phy_ini1+0x110>
	JUMP_FUNCTION_SET(RF_PHY_CHANGE , (uint32_t)&rf_phy_change_cfg1);
1fff2f42:	1129      	lrw      	r1, 0x1fff2ff8	// 1fff2fe4 <init_config+0x1f0>
1fff2f44:	3049      	movi      	r0, 73
1fff2f46:	e00000f9 	bsr      	0x1fff3138	// 1fff3138 <rf_phy_ini1+0x110>
	JUMP_FUNCTION_SET(LL_GENERATE_TX_BUFFER , (uint32_t)&ll_generateTxBuffer1);
1fff2f4a:	1128      	lrw      	r1, 0x1fff2ca8	// 1fff2fe8 <init_config+0x1f4>
1fff2f4c:	3021      	movi      	r0, 33
1fff2f4e:	e00000f5 	bsr      	0x1fff3138	// 1fff3138 <rf_phy_ini1+0x110>

	JUMP_FUNCTION_SET(LL_GENERATE_TX_BUFFER , (uint32_t)&ll_generateTxBuffer1);
1fff2f52:	1126      	lrw      	r1, 0x1fff2ca8	// 1fff2fe8 <init_config+0x1f4>
1fff2f54:	3021      	movi      	r0, 33
1fff2f56:	e00000f1 	bsr      	0x1fff3138	// 1fff3138 <rf_phy_ini1+0x110>

    	JUMP_FUNCTION_SET(WAKEUP_INIT , (uint32_t)&wakeup_init1);
1fff2f5a:	1125      	lrw      	r1, 0x1fff2c0c	// 1fff2fec <init_config+0x1f8>
1fff2f5c:	3046      	movi      	r0, 70
1fff2f5e:	e00000ed 	bsr      	0x1fff3138	// 1fff3138 <rf_phy_ini1+0x110>

	//__set_MSP(pGlobal_config[INITIAL_STACK_PTR]);
	
}
1fff2f62:	1491      	pop      	r4, r15
	else if(g_system_clk==SYS_CLK_DBL_32M)
1fff2f64:	9220      	ld.w      	r1, (r2, 0x0)
1fff2f66:	3941      	cmpnei      	r1, 1
1fff2f68:	0803      	bt      	0x1fff2f6e	// 1fff2f6e <init_config+0x17a>
		pGlobal_config[WAKEUP_DELAY] = 18;
1fff2f6a:	3112      	movi      	r1, 18
1fff2f6c:	0762      	br      	0x1fff2e30	// 1fff2e30 <init_config+0x3c>
	else if(g_system_clk==SYS_CLK_DLL_48M)
1fff2f6e:	9220      	ld.w      	r1, (r2, 0x0)
1fff2f70:	3943      	cmpnei      	r1, 3
1fff2f72:	0803      	bt      	0x1fff2f78	// 1fff2f78 <init_config+0x184>
		pGlobal_config[WAKEUP_DELAY] = 20;
1fff2f74:	3114      	movi      	r1, 20
1fff2f76:	075d      	br      	0x1fff2e30	// 1fff2e30 <init_config+0x3c>
	else if(g_system_clk==SYS_CLK_DLL_64M)
1fff2f78:	9220      	ld.w      	r1, (r2, 0x0)
1fff2f7a:	3944      	cmpnei      	r1, 4
1fff2f7c:	0b5b      	bt      	0x1fff2e32	// 1fff2e32 <init_config+0x3e>
		pGlobal_config[WAKEUP_DELAY] = 24;
1fff2f7e:	3118      	movi      	r1, 24
1fff2f80:	0758      	br      	0x1fff2e30	// 1fff2e30 <init_config+0x3c>
	else if(g_system_clk==SYS_CLK_DBL_32M)
1fff2f82:	9220      	ld.w      	r1, (r2, 0x0)
1fff2f84:	3941      	cmpnei      	r1, 1
1fff2f86:	0803      	bt      	0x1fff2f8c	// 1fff2f8c <init_config+0x198>
		pGlobal_config[SCAN_RSP_DELAY] = 12;        // 12	//  2019/3/19 A2: 12 --> 9
1fff2f88:	310c      	movi      	r1, 12
1fff2f8a:	0782      	br      	0x1fff2e8e	// 1fff2e8e <init_config+0x9a>
	else if(g_system_clk==SYS_CLK_DLL_48M)
1fff2f8c:	9220      	ld.w      	r1, (r2, 0x0)
1fff2f8e:	3943      	cmpnei      	r1, 3
1fff2f90:	0803      	bt      	0x1fff2f96	// 1fff2f96 <init_config+0x1a2>
		pGlobal_config[SCAN_RSP_DELAY] = 9;        // 12	//  2019/3/19 A2: 12 --> 9
1fff2f92:	3109      	movi      	r1, 9
1fff2f94:	077d      	br      	0x1fff2e8e	// 1fff2e8e <init_config+0x9a>
	else if(g_system_clk == SYS_CLK_DLL_64M)		//  2019/3/26 add
1fff2f96:	9220      	ld.w      	r1, (r2, 0x0)
1fff2f98:	3944      	cmpnei      	r1, 4
1fff2f9a:	0b7b      	bt      	0x1fff2e90	// 1fff2e90 <init_config+0x9c>
		pGlobal_config[SCAN_RSP_DELAY] = 8;
1fff2f9c:	3108      	movi      	r1, 8
1fff2f9e:	0778      	br      	0x1fff2e8e	// 1fff2e8e <init_config+0x9a>
	else if(g_system_clk==SYS_CLK_DLL_48M)
1fff2fa0:	9220      	ld.w      	r1, (r2, 0x0)
1fff2fa2:	3943      	cmpnei      	r1, 3
1fff2fa4:	0803      	bt      	0x1fff2faa	// 1fff2faa <init_config+0x1b6>
		pGlobal_config[LL_ADV_TO_SCAN_REQ_DELAY] = 10;//12;		//  2019/3/19 A2: 12 --> 10
1fff2fa6:	320a      	movi      	r2, 10
1fff2fa8:	079b      	br      	0x1fff2ede	// 1fff2ede <init_config+0xea>
	else if(g_system_clk==SYS_CLK_DLL_64M)
1fff2faa:	9240      	ld.w      	r2, (r2, 0x0)
1fff2fac:	3a44      	cmpnei      	r2, 4
1fff2fae:	0b99      	bt      	0x1fff2ee0	// 1fff2ee0 <init_config+0xec>
		pGlobal_config[LL_ADV_TO_SCAN_REQ_DELAY] = 8;				//  2019/3/26 add
1fff2fb0:	3208      	movi      	r2, 8
1fff2fb2:	0796      	br      	0x1fff2ede	// 1fff2ede <init_config+0xea>
1fff2fb4:	1fff5268 	.long	0x1fff5268
1fff2fb8:	1fff0100 	.long	0x1fff0100
1fff2fbc:	1fff4640 	.long	0x1fff4640
1fff2fc0:	1fff0388 	.long	0x1fff0388
1fff2fc4:	0016e360 	.long	0x0016e360
1fff2fc8:	1fff0a54 	.long	0x1fff0a54
1fff2fcc:	11004000 	.long	0x11004000
1fff2fd0:	1fff2bc0 	.long	0x1fff2bc0
1fff2fd4:	1fff3634 	.long	0x1fff3634
1fff2fd8:	1fff363c 	.long	0x1fff363c
1fff2fdc:	1fff5260 	.long	0x1fff5260
1fff2fe0:	1fff3028 	.long	0x1fff3028
1fff2fe4:	1fff2ff8 	.long	0x1fff2ff8
1fff2fe8:	1fff2ca8 	.long	0x1fff2ca8
1fff2fec:	1fff2c0c 	.long	0x1fff2c0c

1fff2ff0 <hal_rom_boot_init>:
    pGlobal_config[MAC_ADDRESS_LOC] = macAddr;
}

extern void ble_main(void);
void hal_rom_boot_init(void )
{
1fff2ff0:	14d0      	push      	r15
	ble_main();
1fff2ff2:	e000005b 	bsr      	0x1fff30a8	// 1fff30a8 <rf_phy_ini1+0x80>

}
1fff2ff6:	1490      	pop      	r15

1fff2ff8 <rf_phy_change_cfg1>:
volatile uint16_t g_rfPhy_ct_moniter_word_arry[CT_MONT_BUFF_SIZE] = {0};
#endif


void rf_phy_change_cfg1(uint8_t pktFmt)
{
1fff2ff8:	14d1      	push      	r4, r15
1fff2ffa:	6d03      	mov      	r4, r0
    rf_phy_change_cfg0(pktFmt);
1fff2ffc:	e0000086 	bsr      	0x1fff3108	// 1fff3108 <rf_phy_ini1+0xe0>
    PHY_REG_WT(0x400300d8,0x04890000);  // i_pll_ctrl3 vco/tp varactor
1fff3000:	1049      	lrw      	r2, 0x40030080	// 1fff3024 <rf_phy_change_cfg1+0x2c>
1fff3002:	ea230489 	movih      	r3, 1161
1fff3006:	b276      	st.w      	r3, (r2, 0x58)
1fff3008:	6c03      	mov      	r0, r0
1fff300a:	33e0      	movi      	r3, 224
    if(pktFmt==PKT_FMT_BLE1M)
1fff300c:	3c41      	cmpnei      	r4, 1
1fff300e:	436d      	lsli      	r3, r3, 13
    {
        subWriteReg( 0x400300d8,20,18,0x01);   // tpm dac var
1fff3010:	9236      	ld.w      	r1, (r2, 0x58)
1fff3012:	c4612043 	andn      	r3, r1, r3
    if(pktFmt==PKT_FMT_BLE1M)
1fff3016:	0805      	bt      	0x1fff3020	// 1fff3020 <rf_phy_change_cfg1+0x28>
        subWriteReg( 0x400300d8,20,18,0x01);   // tpm dac var
1fff3018:	3bb2      	bseti      	r3, 18
    }
    else
    {
        subWriteReg( 0x400300d8,20,18,0x02);   // tpm dac var
1fff301a:	b276      	st.w      	r3, (r2, 0x58)
1fff301c:	6c03      	mov      	r0, r0
    
    }

}
1fff301e:	1491      	pop      	r4, r15
        subWriteReg( 0x400300d8,20,18,0x02);   // tpm dac var
1fff3020:	3bb3      	bseti      	r3, 19
1fff3022:	07fc      	br      	0x1fff301a	// 1fff301a <rf_phy_change_cfg1+0x22>
1fff3024:	40030080 	.long	0x40030080

1fff3028 <rf_phy_ini1>:
    }

    PHY_REG_WT(0x400300b8,(PHY_REG_RD(0x400300b8)&0x0fff) | ((txPower&0x1f)<<12));
}
void rf_phy_ini1(void)
{
1fff3028:	14d0      	push      	r15
    rf_phy_ini();
1fff302a:	e00000a5 	bsr      	0x1fff3174	// 1fff3174 <rf_phy_ini1+0x14c>
    
    PHY_REG_WT(0x400300d8,0x04890000);  // i_pll_ctrl3 vco/tp varactor
1fff302e:	1053      	lrw      	r2, 0x40030080	// 1fff3078 <rf_phy_ini1+0x50>
1fff3030:	ea230489 	movih      	r3, 1161
1fff3034:	b276      	st.w      	r3, (r2, 0x58)
1fff3036:	6c03      	mov      	r0, r0
    if(g_rfPhyPktFmt==PKT_FMT_BLE1M)
1fff3038:	1071      	lrw      	r3, 0x1fff038e	// 1fff307c <rf_phy_ini1+0x54>
1fff303a:	8360      	ld.b      	r3, (r3, 0x0)
    {
        subWriteReg( 0x400300d8,20,18,0x01);   // tpm dac var
1fff303c:	9236      	ld.w      	r1, (r2, 0x58)
    if(g_rfPhyPktFmt==PKT_FMT_BLE1M)
1fff303e:	3b41      	cmpnei      	r3, 1
1fff3040:	33e0      	movi      	r3, 224
1fff3042:	436d      	lsli      	r3, r3, 13
        subWriteReg( 0x400300d8,20,18,0x01);   // tpm dac var
1fff3044:	c4612043 	andn      	r3, r1, r3
    if(g_rfPhyPktFmt==PKT_FMT_BLE1M)
1fff3048:	0815      	bt      	0x1fff3072	// 1fff3072 <rf_phy_ini1+0x4a>
        subWriteReg( 0x400300d8,20,18,0x01);   // tpm dac var
1fff304a:	3bb2      	bseti      	r3, 18
    }
    else
    {
        subWriteReg( 0x400300d8,20,18,0x02);   // tpm dac var
1fff304c:	b276      	st.w      	r3, (r2, 0x58)
1fff304e:	6c03      	mov      	r0, r0
    
    }
    PHY_REG_WT(0x40031074,0x00800080);
1fff3050:	106c      	lrw      	r3, 0x40031000	// 1fff3080 <rf_phy_ini1+0x58>
1fff3052:	104d      	lrw      	r2, 0x800080	// 1fff3084 <rf_phy_ini1+0x5c>
1fff3054:	b35d      	st.w      	r2, (r3, 0x74)
1fff3056:	6c03      	mov      	r0, r0

    subWriteReg(0x400300dc, 6,3,0);//highest ldo_lna_out_tune_1p2v ldo_ana_bb_out_tune_1p2v
1fff3058:	1068      	lrw      	r3, 0x40030080	// 1fff3078 <rf_phy_ini1+0x50>
1fff305a:	3100      	movi      	r1, 0
1fff305c:	9357      	ld.w      	r2, (r3, 0x5c)
1fff305e:	2978      	subi      	r1, 121
1fff3060:	6884      	and      	r2, r1
1fff3062:	b357      	st.w      	r2, (r3, 0x5c)
1fff3064:	6c03      	mov      	r0, r0
    subWriteReg(0x400300cc,11,6,0);//highest vout_ctrl_ldo_lo vout_ctrl_ldo_pll vout_ctrl_ldo_vco
1fff3066:	1029      	lrw      	r1, 0xfffff03f	// 1fff3088 <rf_phy_ini1+0x60>
1fff3068:	9353      	ld.w      	r2, (r3, 0x4c)
1fff306a:	6884      	and      	r2, r1
1fff306c:	b353      	st.w      	r2, (r3, 0x4c)
1fff306e:	6c03      	mov      	r0, r0
}
1fff3070:	1490      	pop      	r15
        subWriteReg( 0x400300d8,20,18,0x02);   // tpm dac var
1fff3072:	3bb3      	bseti      	r3, 19
1fff3074:	07ec      	br      	0x1fff304c	// 1fff304c <rf_phy_ini1+0x24>
1fff3076:	0000      	bkpt
1fff3078:	40030080 	.long	0x40030080
1fff307c:	1fff038e 	.long	0x1fff038e
1fff3080:	40031000 	.long	0x40031000
1fff3084:	00800080 	.long	0x00800080
1fff3088:	fffff03f 	.long	0xfffff03f
1fff308c:	00000000 	.long	0x00000000
1fff3090:	0002ea8d 	.long	0x0002ea8d
1fff3094:	6c037834 	.long	0x6c037834
1fff3098:	000067a0 	.long	0x000067a0
1fff309c:	0002ea8d 	.long	0x0002ea8d
1fff30a0:	6c037834 	.long	0x6c037834
1fff30a4:	0000789c 	.long	0x0000789c
1fff30a8:	0002ea8d 	.long	0x0002ea8d
1fff30ac:	6c037834 	.long	0x6c037834
1fff30b0:	00000632 	.long	0x00000632
1fff30b4:	0002ea8d 	.long	0x0002ea8d
1fff30b8:	6c037834 	.long	0x6c037834
1fff30bc:	000102f8 	.long	0x000102f8
1fff30c0:	0002ea8d 	.long	0x0002ea8d
1fff30c4:	6c037834 	.long	0x6c037834
1fff30c8:	00002ac8 	.long	0x00002ac8
1fff30cc:	0002ea8d 	.long	0x0002ea8d
1fff30d0:	6c037834 	.long	0x6c037834
1fff30d4:	000029b2 	.long	0x000029b2
1fff30d8:	0002ea8d 	.long	0x0002ea8d
1fff30dc:	6c037834 	.long	0x6c037834
1fff30e0:	000068c2 	.long	0x000068c2
1fff30e4:	0002ea8d 	.long	0x0002ea8d
1fff30e8:	6c037834 	.long	0x6c037834
1fff30ec:	0001015c 	.long	0x0001015c
1fff30f0:	0002ea8d 	.long	0x0002ea8d
1fff30f4:	6c037834 	.long	0x6c037834
1fff30f8:	00006660 	.long	0x00006660
1fff30fc:	0002ea8d 	.long	0x0002ea8d
1fff3100:	6c037834 	.long	0x6c037834
1fff3104:	000043fe 	.long	0x000043fe
1fff3108:	0002ea8d 	.long	0x0002ea8d
1fff310c:	6c037834 	.long	0x6c037834
1fff3110:	0001401a 	.long	0x0001401a
1fff3114:	0002ea8d 	.long	0x0002ea8d
1fff3118:	6c037834 	.long	0x6c037834
1fff311c:	000023b4 	.long	0x000023b4
1fff3120:	0002ea8d 	.long	0x0002ea8d
1fff3124:	6c037834 	.long	0x6c037834
1fff3128:	00002994 	.long	0x00002994
1fff312c:	0002ea8d 	.long	0x0002ea8d
1fff3130:	6c037834 	.long	0x6c037834
1fff3134:	00002ce8 	.long	0x00002ce8
1fff3138:	0002ea8d 	.long	0x0002ea8d
1fff313c:	6c037834 	.long	0x6c037834
1fff3140:	00003e94 	.long	0x00003e94
1fff3144:	0002ea8d 	.long	0x0002ea8d
1fff3148:	6c037834 	.long	0x6c037834
1fff314c:	000025ca 	.long	0x000025ca
1fff3150:	0002ea8d 	.long	0x0002ea8d
1fff3154:	6c037834 	.long	0x6c037834
1fff3158:	000040b4 	.long	0x000040b4
1fff315c:	0002ea8d 	.long	0x0002ea8d
1fff3160:	6c037834 	.long	0x6c037834
1fff3164:	00010f6c 	.long	0x00010f6c
1fff3168:	0002ea8d 	.long	0x0002ea8d
1fff316c:	6c037834 	.long	0x6c037834
1fff3170:	00002b50 	.long	0x00002b50
1fff3174:	0002ea8d 	.long	0x0002ea8d
1fff3178:	6c037834 	.long	0x6c037834
1fff317c:	00014548 	.long	0x00014548
1fff3180:	0002ea8d 	.long	0x0002ea8d
1fff3184:	6c037834 	.long	0x6c037834
1fff3188:	00006746 	.long	0x00006746
1fff318c:	0002ea8d 	.long	0x0002ea8d
1fff3190:	6c037834 	.long	0x6c037834
1fff3194:	0000052e 	.long	0x0000052e
1fff3198:	0002ea8d 	.long	0x0002ea8d
1fff319c:	6c037834 	.long	0x6c037834
1fff31a0:	00007a58 	.long	0x00007a58
1fff31a4:	0002ea8d 	.long	0x0002ea8d
1fff31a8:	6c037834 	.long	0x6c037834
1fff31ac:	00002bfa 	.long	0x00002bfa
1fff31b0:	0002ea8d 	.long	0x0002ea8d
1fff31b4:	6c037834 	.long	0x6c037834
1fff31b8:	0001012e 	.long	0x0001012e
1fff31bc:	0002ea8d 	.long	0x0002ea8d
1fff31c0:	6c037834 	.long	0x6c037834
1fff31c4:	00002b02 	.long	0x00002b02
1fff31c8:	0002ea8d 	.long	0x0002ea8d
1fff31cc:	6c037834 	.long	0x6c037834
1fff31d0:	00007120 	.long	0x00007120
1fff31d4:	0002ea8d 	.long	0x0002ea8d
1fff31d8:	6c037834 	.long	0x6c037834
1fff31dc:	000053a2 	.long	0x000053a2
1fff31e0:	0002ea8d 	.long	0x0002ea8d
1fff31e4:	6c037834 	.long	0x6c037834
1fff31e8:	00002416 	.long	0x00002416
1fff31ec:	0002ea8d 	.long	0x0002ea8d
1fff31f0:	6c037834 	.long	0x6c037834
1fff31f4:	00007072 	.long	0x00007072
1fff31f8:	0002ea8d 	.long	0x0002ea8d
1fff31fc:	6c037834 	.long	0x6c037834
1fff3200:	00007778 	.long	0x00007778
1fff3204:	0002ea8d 	.long	0x0002ea8d
1fff3208:	6c037834 	.long	0x6c037834
1fff320c:	000066f8 	.long	0x000066f8
1fff3210:	0002ea8d 	.long	0x0002ea8d
1fff3214:	6c037834 	.long	0x6c037834
1fff3218:	0001165a 	.long	0x0001165a
1fff321c:	0002ea8d 	.long	0x0002ea8d
1fff3220:	6c037834 	.long	0x6c037834
1fff3224:	0000532e 	.long	0x0000532e
1fff3228:	0002ea8d 	.long	0x0002ea8d
1fff322c:	6c037834 	.long	0x6c037834
1fff3230:	00002384 	.long	0x00002384
1fff3234:	0002ea8d 	.long	0x0002ea8d
1fff3238:	6c037834 	.long	0x6c037834
1fff323c:	00007014 	.long	0x00007014
1fff3240:	0002ea8d 	.long	0x0002ea8d
1fff3244:	6c037834 	.long	0x6c037834
1fff3248:	000037aa 	.long	0x000037aa
1fff324c:	0002ea8d 	.long	0x0002ea8d
1fff3250:	6c037834 	.long	0x6c037834
1fff3254:	00006e18 	.long	0x00006e18
1fff3258:	0002ea8d 	.long	0x0002ea8d
1fff325c:	6c037834 	.long	0x6c037834
1fff3260:	00003e46 	.long	0x00003e46
1fff3264:	0002ea8d 	.long	0x0002ea8d
1fff3268:	6c037834 	.long	0x6c037834
1fff326c:	0000302a 	.long	0x0000302a
1fff3270:	0002ea8d 	.long	0x0002ea8d
1fff3274:	6c037834 	.long	0x6c037834
1fff3278:	0000f44e 	.long	0x0000f44e
1fff327c:	0002ea8d 	.long	0x0002ea8d
1fff3280:	6c037834 	.long	0x6c037834
1fff3284:	00006644 	.long	0x00006644
1fff3288:	0002ea8d 	.long	0x0002ea8d
1fff328c:	6c037834 	.long	0x6c037834
1fff3290:	00006d84 	.long	0x00006d84
1fff3294:	0002ea8d 	.long	0x0002ea8d
1fff3298:	6c037834 	.long	0x6c037834
1fff329c:	00005f9e 	.long	0x00005f9e
1fff32a0:	0002ea8d 	.long	0x0002ea8d
1fff32a4:	6c037834 	.long	0x6c037834
1fff32a8:	00006890 	.long	0x00006890
1fff32ac:	0002ea8d 	.long	0x0002ea8d
1fff32b0:	6c037834 	.long	0x6c037834
1fff32b4:	0000775c 	.long	0x0000775c
1fff32b8:	0002ea8d 	.long	0x0002ea8d
1fff32bc:	6c037834 	.long	0x6c037834
1fff32c0:	000054ec 	.long	0x000054ec
	...

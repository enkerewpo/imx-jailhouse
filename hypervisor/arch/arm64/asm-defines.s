	.arch armv8-a+nofp+nosimd
	.file	"asm-defines.c"
// GNU C17 (GCC) version 9.2.0 (aarch64-poky-linux)
//	compiled by GNU C version 9.2.0, GMP version 6.1.2, MPFR version 4.0.2, MPC version 1.1.0, isl version none
// GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
// options passed:  -nostdinc
// -I /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/include
// -I /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/include/generated
// -I /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/include
// -I /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/../include/arch/arm64
// -I /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/../include
// -I /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm-common/include
// -D __KERNEL__ -D KASAN_SHADOW_SCALE_SHIFT=3 -D __LINUX_COMPILER_TYPES_H
// -D KBUILD_BASENAME="asm_defines" -D KBUILD_MODNAME="asm_defines"
// -isystem /opt/fsl-imx-xwayland/5.4-zeus/sysroots/x86_64-pokysdk-linux/usr/lib/aarch64-poky-linux/gcc/aarch64-poky-linux/9.2.0/include
// -include ./include/linux/compiler_types.h
// -MD /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/.asm-defines.s.d
// /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c
// -mlittle-endian -march=armv8-a+nofp -mabi=lp64
// -auxbase-strip /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.s
// -Os -Wall -Wstrict-prototypes -Wtype-limits -Wmissing-declarations
// -Wmissing-prototypes -fno-strict-aliasing -fno-pic -fno-common
// -fno-stack-protector -fno-builtin-ffsl -fverbose-asm
// options enabled:  -faggressive-loop-optimizations -fassume-phsa
// -fasynchronous-unwind-tables -fauto-inc-dec -fbranch-count-reg
// -fcaller-saves -fcode-hoisting -fcombine-stack-adjustments
// -fcompare-elim -fcprop-registers -fcrossjumping -fcse-follow-jumps
// -fdefer-pop -fdelete-null-pointer-checks -fdevirtualize
// -fdevirtualize-speculatively -fdwarf2-cfi-asm -fearly-inlining
// -feliminate-unused-debug-types -fexpensive-optimizations
// -fforward-propagate -ffp-int-builtin-inexact -ffunction-cse -fgcse
// -fgcse-lm -fgnu-runtime -fgnu-unique -fguess-branch-probability
// -fhoist-adjacent-loads -fident -fif-conversion -fif-conversion2
// -findirect-inlining -finline -finline-atomics -finline-functions
// -finline-functions-called-once -finline-small-functions -fipa-bit-cp
// -fipa-cp -fipa-icf -fipa-icf-functions -fipa-icf-variables -fipa-profile
// -fipa-pure-const -fipa-ra -fipa-reference -fipa-reference-addressable
// -fipa-sra -fipa-stack-alignment -fipa-vrp -fira-hoist-pressure
// -fira-share-save-slots -fira-share-spill-slots
// -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
// -fleading-underscore -flifetime-dse -flra-remat -flto-odr-type-merging
// -fmath-errno -fmerge-constants -fmerge-debug-strings
// -fmove-loop-invariants -fomit-frame-pointer -foptimize-sibling-calls
// -fpartial-inlining -fpeephole -fpeephole2 -fplt -fprefetch-loop-arrays
// -free -freg-struct-return -freorder-blocks -freorder-functions
// -frerun-cse-after-loop -fsched-critical-path-heuristic
// -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
// -fsched-last-insn-heuristic -fsched-pressure -fsched-rank-heuristic
// -fsched-spec -fsched-spec-insn-heuristic -fsched-stalled-insns-dep
// -fschedule-fusion -fschedule-insns2 -fsection-anchors
// -fsemantic-interposition -fshow-column -fshrink-wrap
// -fshrink-wrap-separate -fsigned-zeros -fsplit-ivs-in-unroller
// -fsplit-wide-types -fssa-backprop -fssa-phiopt -fstdarg-opt
// -fstore-merging -fstrict-volatile-bitfields -fsync-libcalls
// -fthread-jumps -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp
// -ftree-builtin-call-dce -ftree-ccp -ftree-ch -ftree-coalesce-vars
// -ftree-copy-prop -ftree-cselim -ftree-dce -ftree-dominator-opts
// -ftree-dse -ftree-forwprop -ftree-fre -ftree-loop-if-convert
// -ftree-loop-im -ftree-loop-ivcanon -ftree-loop-optimize
// -ftree-parallelize-loops= -ftree-phiprop -ftree-pre -ftree-pta
// -ftree-reassoc -ftree-scev-cprop -ftree-sink -ftree-slsr -ftree-sra
// -ftree-switch-conversion -ftree-tail-merge -ftree-ter -ftree-vrp
// -funit-at-a-time -funwind-tables -fverbose-asm -fzero-initialized-in-bss
// -mfix-cortex-a53-835769 -mfix-cortex-a53-843419 -mglibc -mlittle-endian
// -momit-leaf-frame-pointer -mpc-relative-literal-loads

	.text
	.align	2
	.global	common
	.type	common, %function
common:
.LFB44:
	.cfi_startproc
// /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c:23: 	OFFSET(HEADER_MAX_CPUS, jailhouse_header, max_cpus);
#APP
// 23 "/opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c" 1
	
=>HEADER_MAX_CPUS 48 __builtin_offsetof(struct jailhouse_header, max_cpus)	//
// 0 "" 2
// /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c:24: 	OFFSET(HEADER_CORE_SIZE, jailhouse_header, core_size);
// 24 "/opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c" 1
	
=>HEADER_CORE_SIZE 8 __builtin_offsetof(struct jailhouse_header, core_size)	//
// 0 "" 2
// /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c:25: 	OFFSET(HEADER_DEBUG_CONSOLE_VIRT, jailhouse_header, debug_console_base);
// 25 "/opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c" 1
	
=>HEADER_DEBUG_CONSOLE_VIRT 56 __builtin_offsetof(struct jailhouse_header, debug_console_base)	//
// 0 "" 2
// /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c:26: 	OFFSET(HEADER_HYP_STUB_VERSION, jailhouse_header, arm_linux_hyp_abi);
// 26 "/opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c" 1
	
=>HEADER_HYP_STUB_VERSION 72 __builtin_offsetof(struct jailhouse_header, arm_linux_hyp_abi)	//
// 0 "" 2
// /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c:27: 	OFFSET(SYSCONFIG_DEBUG_CONSOLE_PHYS, jailhouse_system,
// 27 "/opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c" 1
	
=>SYSCONFIG_DEBUG_CONSOLE_PHYS 44 __builtin_offsetof(struct jailhouse_system, debug_console.address)	//
// 0 "" 2
// /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c:29: 	OFFSET(SYSCONFIG_HYPERVISOR_PHYS, jailhouse_system,
// 29 "/opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c" 1
	
=>SYSCONFIG_HYPERVISOR_PHYS 12 __builtin_offsetof(struct jailhouse_system, hypervisor_memory.phys_start)	//
// 0 "" 2
// /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c:31: 	OFFSET(PERCPU_ID_AA64MMFR0, per_cpu, id_aa64mmfr0);
// 31 "/opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c" 1
	
=>PERCPU_ID_AA64MMFR0 4128 __builtin_offsetof(struct per_cpu, id_aa64mmfr0)	//
// 0 "" 2
// /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c:32: 	BLANK();
// 32 "/opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c" 1
	
=>	
// 0 "" 2
// /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c:34: 	DEFINE(PERCPU_STACK_END,
// 34 "/opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c" 1
	
=>PERCPU_STACK_END 4096 __builtin_offsetof(struct per_cpu, stack) + FIELD_SIZEOF(struct per_cpu, stack)	//
// 0 "" 2
// /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c:37: 	DEFINE(PERCPU_SIZE_ASM, sizeof(struct per_cpu));
// 37 "/opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c" 1
	
=>PERCPU_SIZE_ASM 16384 sizeof(struct per_cpu)	//
// 0 "" 2
// /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c:38: 	DEFINE(CPU_STAT_VMEXITS_TOTAL, LOCAL_CPU_BASE +
// 38 "/opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c" 1
	
=>CPU_STAT_VMEXITS_TOTAL 280375465160720 LOCAL_CPU_BASE + __builtin_offsetof(struct per_cpu, public.stats[JAILHOUSE_CPU_STAT_VMEXITS_TOTAL])	//
// 0 "" 2
// /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c:41: 	DEFINE(CPU_STAT_VMEXITS_SMCCC, LOCAL_CPU_BASE +
// 41 "/opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c" 1
	
=>CPU_STAT_VMEXITS_SMCCC 280375465160752 LOCAL_CPU_BASE + __builtin_offsetof(struct per_cpu, public.stats[JAILHOUSE_CPU_STAT_VMEXITS_SMCCC])	//
// 0 "" 2
// /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c:44: 	BLANK();
// 44 "/opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c" 1
	
=>	
// 0 "" 2
// /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c:46: 	DEFINE(DCACHE_CLEAN_ASM, DCACHE_CLEAN);
// 46 "/opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c" 1
	
=>DCACHE_CLEAN_ASM 0 DCACHE_CLEAN	//
// 0 "" 2
// /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c:47: 	DEFINE(DCACHE_INVALIDATE_ASM, DCACHE_INVALIDATE);
// 47 "/opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c" 1
	
=>DCACHE_INVALIDATE_ASM 1 DCACHE_INVALIDATE	//
// 0 "" 2
// /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c:48: 	DEFINE(DCACHE_CLEAN_AND_INVALIDATE_ASM, DCACHE_CLEAN_AND_INVALIDATE);
// 48 "/opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c" 1
	
=>DCACHE_CLEAN_AND_INVALIDATE_ASM 2 DCACHE_CLEAN_AND_INVALIDATE	//
// 0 "" 2
// /opt/nxp/OK8MP-linux-sdk/OK8MP-linux-kernel/extra/jailhouse/hypervisor/arch/arm64/asm-defines.c:49: }
#NO_APP
	ret	
	.cfi_endproc
.LFE44:
	.size	common, .-common
	.ident	"GCC: (GNU) 9.2.0"
	.section	.note.GNU-stack,"",@progbits

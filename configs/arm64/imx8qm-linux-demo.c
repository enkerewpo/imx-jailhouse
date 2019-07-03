/*
 * iMX8QM target - linux-demo
 *
 * Copyright 2018 NXP
 *
 * Authors:
 *  Peng Fan <peng.fan@nxp.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

#define ARRAY_SIZE(a) sizeof(a) / sizeof(a[0])

struct {
	struct jailhouse_cell_desc cell;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[10];
	struct jailhouse_irqchip irqchips[4];
	struct jailhouse_pci_device pci_devices[1];
	struct jailhouse_smmu_sid smmu_sids[1];
} __attribute__((packed)) config = {
	.cell = {
		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.name = "imx8qm-linux-demo",
		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,

		.cpu_set_size = sizeof(config.cpus),
		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
		.num_smmu_sids = ARRAY_SIZE(config.smmu_sids),
		.num_irqchips = ARRAY_SIZE(config.irqchips),
		.num_pci_devices = ARRAY_SIZE(config.pci_devices),
		.vpci_irq_base = 90, /* Not include 32 base */
		.pio_bitmap_size = 0,

		.pci_cfg_base = 0xff700000,
		.pci_cfg_size = 0x100000,
		.ivshmem_irq = 90 + 32,
	},

	.cpus = {
		0xc,
	},

	.mem_regions = {
		/* UART0 earlycon */ {
			.phys_start = 0x5a060000,
			.virt_start = 0x5a060000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
		},
		/* UART2*/ {
			.phys_start = 0x5a080000,
			.virt_start = 0x5a080000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* UART2_LPCG*/ {
			.phys_start = 0x5a480000,
			.virt_start = 0x5a480000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* SHDC0 */ {
			.phys_start = 0x5b010000,
			.virt_start = 0x5b010000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* SHDC0_LPCG */ {
			.phys_start = 0x5b200000,
			.virt_start = 0x5b200000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* MU2 */ {
			.phys_start = 0x5d1d0000,
			.virt_start = 0x5d1d0000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO,
		},
		/* RAM: Top at 4GB Space */ {
			.phys_start = 0xdf700000,
			.virt_start = 0xdf700000,
			.size = 0x1e000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
				JAILHOUSE_MEM_LOADABLE,
		},
		/* IVHSMEM shared memory region for 00:00.0 */ {
			.phys_start = 0xfd900000,
			.virt_start = 0xfd900000,
			.size = 0x200000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_ROOTSHARED,
		},
		/* RAM: Bottom at 4GB Space */ {
			.phys_start = 0xfdb00000,
			.virt_start = 0,
			.size = 0x10000, /* 64KB */
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
		},
		/* communication region */ {
			.virt_start = 0x80000000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_COMM_REGION,
		},
	},

	.irqchips = {
		/* IVSHMEM */ {
			.address = 0x51a00000,
			.pin_base = 96,
			.pin_bitmap = {
				0x1 << (90 + 32 - 96)
			},
		},
		/* MU2_A */ {
			.address = 0x51a00000,
			.pin_base = 192,
			.pin_bitmap = {
				(1 << (178 + 32 - 192))
			},
		},
		/* sdhc1 */ {
			.address = 0x51a00000,
			.pin_base = 256,
			.pin_bitmap = {
				(1 << (232 + 32 - 256))
			},
		},
		/* lpuart2 */ {
			.address = 0x51a00000,
			.pin_base = 352,
			.pin_bitmap = {
				(1 << (347 + 32 - 352))
			},
		},
	},

	.pci_devices = {
		{
			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
			.bdf = 0x0 << 3,
			.bar_mask = {
				0xffffff00, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},

			/*num_msix_vectors needs to be 0 for INTx operation*/
			.num_msix_vectors = 0,
			.shmem_region = 7,
			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
			.domain = 0x0,
		},
	},

	.smmu_sids = {
		{
			.sid = 0x10,
			.sid_mask = 0x7f80,
		},
	},
};
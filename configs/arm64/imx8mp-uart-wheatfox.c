// wheatfox 2024.1
#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_cell_desc cell;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[5];
	struct jailhouse_irqchip irqchips[1];
} __attribute__((packed)) config = {
	.cell = {
		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.name = "uart-wheatfox",
		.flags = JAILHOUSE_CELL_PASSIVE_COMMREG,

		.cpu_set_size = sizeof(config.cpus),
		.num_memory_regions = ARRAY_SIZE(config.mem_regions),
		// .num_irqchips = ARRAY_SIZE(config.irqchips),
		.num_pci_devices = 0,

		.console = {
			.address = 0x30890000,
			.type = JAILHOUSE_CON_TYPE_IMX,
			.flags = JAILHOUSE_CON_ACCESS_MMIO |
				 JAILHOUSE_CON_REGDIST_4,
		},
	},

	.cpus = {
		0x8,
	},

	.mem_regions = {
		/* UART2 */ {
			.phys_start = 0x30890000,
			.virt_start = 0x30890000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
		},
		/* UART4 */ {
			.phys_start = 0x30a60000,
			.virt_start = 0x30a60000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_IO | JAILHOUSE_MEM_ROOTSHARED,
		},
		/* RAM */ {
			.phys_start = 0x64000000,
			// .virt_start = 0x64000000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
				JAILHOUSE_MEM_LOADABLE,
		},
		{
			.phys_start = 0x70000000,
			.virt_start = 0x70000000,
			.size = 0x10000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* communication region */ {
			.virt_start = 0x80000000,
			.size = 0x00001000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_COMM_REGION,
		},
	},

	.irqchips = {
	// 	// /* uart2/sdhc1 */ {
	// 	// 	.address = 0x38800000,
	// 	// 	.pin_base = 32,
	// 	// 	.pin_bitmap = {
	// 	// 		(1 << (24 + 32 - 32)) | (1 << (29 + 32 - 32))
	// 	// 	},
	// 	// },

	// 	/*
	// 		NXP manual page 988
	// 		irq 24 : USDHC3
	// 		irq 26 : UART1(irq=28)
	// 		irq 27 : UART2(irq=29)
	// 		irq 28 : UART3(irq=30)
	// 		irq 29 : UART4(irq=38)
	// 	*/

		/* uart4 */ {
			.address = 0x38800000,
			.pin_base = 40,
			.pin_bitmap = {
				(0x1 << (38 + 32 - 40))
			},
		},
	},
};

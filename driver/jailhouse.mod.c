#include <linux/build-salt.h>
#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

BUILD_SALT;

MODULE_INFO(vermagic, VERMAGIC_STRING);
MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__section(.gnu.linkonce.this_module) = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

#ifdef CONFIG_RETPOLINE
MODULE_INFO(retpoline, "Y");
#endif

static const struct modversion_info ____versions[]
__used __section(__versions) = {
	{ 0x6ffbe3ff, "module_layout" },
	{ 0x7cb1ae69, "cpu_down" },
	{ 0x5af8e426, "kobject_put" },
	{ 0x1ba7c500, "physvirt_offset" },
	{ 0x85bd1608, "__request_region" },
	{ 0x97b3ea4, "kmalloc_caches" },
	{ 0xeb233a45, "__kmalloc" },
	{ 0x7b1eb81f, "of_find_matching_node_and_match" },
	{ 0xbd404daf, "sysfs_remove_bin_file" },
	{ 0x3c2b68f7, "of_changeset_apply" },
	{ 0x301fa007, "_raw_spin_unlock" },
	{ 0xd6ee688f, "vmalloc" },
	{ 0x7fae5ca5, "of_find_node_opts_by_path" },
	{ 0xc56a41e6, "vabits_actual" },
	{ 0x77358855, "iomem_resource" },
	{ 0x151f4898, "schedule_timeout_uninterruptible" },
	{ 0xdc882522, "device_release_driver" },
	{ 0x696f2b63, "of_changeset_init" },
	{ 0x84a8d0eb, "of_changeset_revert" },
	{ 0xee8ede36, "pci_stop_and_remove_bus_device_locked" },
	{ 0x5986e90a, "pci_get_slot" },
	{ 0x9ddb3eb4, "pci_add_dynid" },
	{ 0x505a1048, "kobject_uevent" },
	{ 0x12a4e128, "__arch_copy_from_user" },
	{ 0x56470118, "__warn_printk" },
	{ 0x5790e7a0, "pci_unlock_rescan_remove" },
	{ 0x409bcb62, "mutex_unlock" },
	{ 0x999e8297, "vfree" },
	{ 0x2026bf47, "pci_bus_assign_resources" },
	{ 0x7a2af7b4, "cpu_number" },
	{ 0x3c3ff9fd, "sprintf" },
	{ 0xd8f49aa4, "sysfs_remove_group" },
	{ 0x2d39b0a7, "kstrdup" },
	{ 0xe2d5255a, "strcmp" },
	{ 0xd0abfece, "kobject_create_and_add" },
	{ 0x3feea40, "cpumask_next" },
	{ 0x17de3d5, "nr_cpu_ids" },
	{ 0x1e9a2b94, "misc_register" },
	{ 0x4c170082, "_dev_warn" },
	{ 0xdcb764ad, "memset" },
	{ 0x75dd4ebe, "of_overlay_remove" },
	{ 0x5610897, "of_changeset_destroy" },
	{ 0xb5136dc7, "mutex_lock_interruptible" },
	{ 0xc5850110, "printk" },
	{ 0x8f2c44f3, "sysfs_create_group" },
	{ 0x449ad0a7, "memcmp" },
	{ 0x5e3240a0, "__cpu_online_mask" },
	{ 0x3004c66f, "kobject_init_and_add" },
	{ 0x56d697ce, "cpu_up" },
	{ 0xd61eeee, "__bitmap_subset" },
	{ 0x65e0d6d7, "memory_read_from_buffer" },
	{ 0xcee88e7a, "of_overlay_fdt_apply" },
	{ 0xe4bbc1dd, "kimage_voffset" },
	{ 0x580eef2e, "pci_get_domain_bus_and_slot" },
	{ 0x69651913, "pci_bus_add_devices" },
	{ 0xf270c3c8, "of_changeset_action" },
	{ 0xf6a2000c, "noop_llseek" },
	{ 0xb7333a48, "kobj_sysfs_ops" },
	{ 0xb25d9319, "pci_find_bus" },
	{ 0x90378721, "__root_device_register" },
	{ 0xe007de41, "kallsyms_lookup_name" },
	{ 0x43b0c9c3, "preempt_schedule" },
	{ 0x6b4b2933, "__ioremap" },
	{ 0xe2e0c7c6, "__flush_icache_range" },
	{ 0x53887df6, "pci_scan_slot" },
	{ 0x6157814e, "kobject_move" },
	{ 0xac1a55be, "unregister_reboot_notifier" },
	{ 0xca5bb02, "module_put" },
	{ 0x35268a77, "_dev_info" },
	{ 0x19e44eb1, "kmem_cache_alloc" },
	{ 0xd3318f66, "root_device_unregister" },
	{ 0x3517383e, "register_reboot_notifier" },
	{ 0x6cbbfc54, "__arch_copy_to_user" },
	{ 0xdecd0b29, "__stack_chk_fail" },
	{ 0x3d8560e4, "cpu_hwcaps" },
	{ 0x4b50cb71, "cpu_hwcap_keys" },
	{ 0x1035c7c2, "__release_region" },
	{ 0xe738d7d8, "pci_unregister_driver" },
	{ 0xdbf17652, "_raw_spin_lock" },
	{ 0xddbeeecc, "pci_lock_rescan_remove" },
	{ 0x7b4ba9f5, "__get_vm_area" },
	{ 0x37a0cba, "kfree" },
	{ 0x94961283, "vunmap" },
	{ 0x4829a47e, "memcpy" },
	{ 0xedc03953, "iounmap" },
	{ 0xfc8b258f, "sysfs_create_bin_file" },
	{ 0x707a340a, "__pci_register_driver" },
	{ 0x96848186, "scnprintf" },
	{ 0x9b4d62ec, "request_firmware" },
	{ 0x63c4d61f, "__bitmap_weight" },
	{ 0xe148616c, "pci_dev_put" },
	{ 0x656e4a6e, "snprintf" },
	{ 0xc60d0620, "__num_online_cpus" },
	{ 0x4793dc32, "of_property_read_variable_u32_array" },
	{ 0x294b9ea1, "on_each_cpu" },
	{ 0xc60c2d7d, "of_node_put" },
	{ 0xb2ead97c, "kimage_vaddr" },
	{ 0x14b89635, "arm64_const_caps_ready" },
	{ 0xa6e1a69d, "kick_all_cpus_sync" },
	{ 0x8969b8d8, "misc_deregister" },
	{ 0x41d62b20, "release_firmware" },
	{ 0x1002cc7b, "try_module_get" },
};

MODULE_INFO(depends, "");


MODULE_INFO(srcversion, "85E6D1C685198113C104FBB");

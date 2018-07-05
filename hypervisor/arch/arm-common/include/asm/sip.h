/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Authors:
 *  Peng Fang <peng.fan@nxp.com>
 *  Claudio Scordino <claudio@evidence.eu.com>
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 */

#define IS_SIP_32(hvc)			(((hvc) >> 24) == 0x82)
#define IS_SIP_64(hvc)			(((hvc) >> 24) == 0xc2)

#define SIP_NOT_SUPPORTED		(-1)

struct trap_context;

long sip_dispatch(struct trap_context *ctx);
unsigned long call_smcc64(unsigned long fid, unsigned long a0,
			  unsigned long a1, unsigned long a2, unsigned long a3,
			  unsigned long a4, unsigned long a5,
			  unsigned long *ret);

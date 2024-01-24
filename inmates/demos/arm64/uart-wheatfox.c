// wheatfox 2024.1.24
#include "uart-wheatfox.h"
#include <inmate.h>

// NXP i.MX8M Plus page 7337
// bits width are 32
const u64 UART4_BASE = 0x30a60000;         // ttymxc3/serial3 on UART4
const u64 UART4_URXD = UART4_BASE + 0x00;  // Receive Register
const u64 UART4_UTXD = UART4_BASE + 0x40;  // Transmit Register
const u64 UART4_UCR1 = UART4_BASE + 0x80;  // Control Register 1
const u64 UART4_UCR2 = UART4_BASE + 0x84;  // Control Register 2
const u64 UART4_UCR3 = UART4_BASE + 0x88;  // Control Register 3
const u64 UART4_UCR4 = UART4_BASE + 0x8c;  // Control Register 4
const u64 UART4_UFCR = UART4_BASE + 0x90;  // FIFO Control Register
const u64 UART4_USR1 = UART4_BASE + 0x94;  // Status Register 1
const u64 UART4_USR2 = UART4_BASE + 0x98;  // Status Register 2
const u64 UART4_UESC = UART4_BASE + 0x9c;  // Escape Character Register
const u64 UART4_UTIM = UART4_BASE + 0xa0;  // Escape Timer Register
const u64 UART4_UBIR = UART4_BASE + 0xa4;  // BRM Incremental Register
const u64 UART4_UBMR = UART4_BASE + 0xa8;  // BRM Modulator Register
const u64 UART4_UBRC = UART4_BASE + 0xac;  // Baud Rate Count Register
const u64 UART4_ONEMS = UART4_BASE + 0xb0; // One Millisecond Register
const u64 UART4_UTS = UART4_BASE + 0xb4;   // Test Register
const u64 UART4_UMCR = UART4_BASE + 0xb8;  // RS-485 Mode Control Register

#define ADDR(x) (void *)(x)

static void uart_init(void) {
  // use UART4 in RS232 mode
  // clock = 100 MHz
  // baud rate = 115200
  // data bits = 8
  // stop bits = 1
  // parity = none
  // flow control = none
  // divisor = 100 MHz / (16 * 115200) = 54.25347222222222

  // enable UART4
  // UART4_UCR1[0](UARTEN) = 1
  mmio_write32(ADDR(UART4_UCR1), 0x1);

  // set RXDMUXSEL to 1. should always be 1
  // UART4_UCR3[2](RXDMUXSEL) = 1
  mmio_write32(ADDR(UART4_UCR3), 0x4);

  // set UFCR
  // UART4_UFCR = 0x89e
  mmio_write32(ADDR(UART4_UFCR), 0x89e);
  mmio_write32(ADDR(UART4_UCR1), 0x2201);
  mmio_write32(ADDR(UART4_UMCR), 0x0); // stay at default value
}

static void uart_print(const char *s) {
  while (*s) {
    // wait until UART4_USR2[3](TXFE) = 1, which means TX FIFO is empty
    while ((mmio_read32(ADDR(UART4_USR2)) & 0x8) == 0)
      ;
    // write to UART4_UTXD
    mmio_write32(ADDR(UART4_UTXD), *s++);
  }
}

void inmate_main(void) {

  printk("[wheatfox] (inmate_main) trying to init uart...\n");
  uart_init();
  printk("[wheatfox] (inmate_main) uart init done.\n");
  printk("[wheatfox] (inmate_main) trying to print...\n");
  uart_print("Hello from uart-wheatfox inmate baremetal demo!\n");
  printk("[wheatfox] (inmate_main) print done.\n");
  halt();
}
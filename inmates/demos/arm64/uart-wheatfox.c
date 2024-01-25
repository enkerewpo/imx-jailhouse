// wheatfox 2024.1.24
#include "uart-wheatfox.h"
#include <inmate.h>

static void *UARTx_BASE;
static void *UARTx_URXD;
static void *UARTx_UTXD;
static void *UARTx_UCR1;
static void *UARTx_UCR2;
static void *UARTx_UCR3;
static void *UARTx_UCR4;
static void *UARTx_UFCR;
static void *UARTx_USR1;
static void *UARTx_USR2;
static void *UARTx_UESC;
static void *UARTx_UTIM;
static void *UARTx_UBIR;
static void *UARTx_UBMR;
static void *UARTx_UBRC;
static void *UARTx_ONEMS;
static void *UARTx_UTS;
static void *UARTx_UMCR;

#define UART_FULL_INIT 1
#define UART_NO_INIT 0

static void uart_init(void *uart_base, int init_flag) {
  printk("[INFO] (uart_init) in uart_init start, uart_base = %p\n", uart_base);
  if (uart_base == NULL) {
    printk("[ERROR] (uart_init) uart_base is NULL!\n");
    return;
  }
  if (init_flag != UART_FULL_INIT && init_flag != UART_NO_INIT) {
    printk("[ERROR] (uart_init) init_flag is invalid!\n");
    return;
  }
  if (init_flag == UART_FULL_INIT) {
    printk("[INFO] (uart_init) init_flag is UART_FULL_INIT\n");
  } else {
    printk("[INFO] (uart_init) init_flag is UART_NO_INIT\n");
  }
  // NXP i.MX8M Plus page 7337
  // bits width are 32
  UARTx_BASE = uart_base;
  UARTx_URXD = UARTx_BASE + 0x00;  // Receive Register
  UARTx_UTXD = UARTx_BASE + 0x40;  // Transmit Register
  UARTx_UCR1 = UARTx_BASE + 0x80;  // Control Register 1
  UARTx_UCR2 = UARTx_BASE + 0x84;  // Control Register 2
  UARTx_UCR3 = UARTx_BASE + 0x88;  // Control Register 3
  UARTx_UCR4 = UARTx_BASE + 0x8c;  // Control Register 4
  UARTx_UFCR = UARTx_BASE + 0x90;  // FIFO Control Register
  UARTx_USR1 = UARTx_BASE + 0x94;  // Status Register 1
  UARTx_USR2 = UARTx_BASE + 0x98;  // Status Register 2
  UARTx_UESC = UARTx_BASE + 0x9c;  // Escape Character Register
  UARTx_UTIM = UARTx_BASE + 0xa0;  // Escape Timer Register
  UARTx_UBIR = UARTx_BASE + 0xa4;  // BRM Incremental Register
  UARTx_UBMR = UARTx_BASE + 0xa8;  // BRM Modulator Register
  UARTx_UBRC = UARTx_BASE + 0xac;  // Baud Rate Count Register
  UARTx_ONEMS = UARTx_BASE + 0xb0; // One Millisecond Register
  UARTx_UTS = UARTx_BASE + 0xb4;   // Test Register
  UARTx_UMCR = UARTx_BASE + 0xb8;  // RS-485 Mode Control Register

  if (init_flag == UART_NO_INIT) {
    printk("[INFO] (uart_init) uart_init on %p done!\n", uart_base);
    return;
  }

  // use UART4 in RS232 mode
  // clock = 100 MHz
  // baud rate = 115200
  // data bits = 8
  // stop bits = 1
  // parity = none
  // flow control = none
  // divisor = 100 MHz / (16 * 115200) = 54.25347222222222

  // enable UART4
  // UARTx_UCR1[0](UARTEN) = 1
  mmio_write32(UARTx_UCR1, 0x1);

  printk("[INFO] (uart_init) in uart_init, enabled UART\n");

  // set RXDMUXSEL to 1. should always be 1
  // UARTx_UCR3[2](RXDMUXSEL) = 1
  mmio_write32(UARTx_UCR3, 0x4);

  printk("[INFO] (uart_init) in uart_init, set RXDMUXSEL done\n");

  // set UFCR
  // UARTx_UFCR = 0x89e
  mmio_write32(UARTx_UFCR, 0x89e);
  mmio_write32(UARTx_UCR1, 0x2201);
  mmio_write32(UARTx_UMCR, 0x0); // stay at default value

  printk("[INFO] (uart_init) in uart_init, set UFCR done\n");
  printk("[INFO] (uart_init) uart_init on %p done!\n", uart_base);
}

static void dump() {
  // print content of all MMIO uart registers
  printk("[INFO] (dump) in dump start\n");
  printk("[INFO] (dump) UARTx_URXD = %x\n", mmio_read32(UARTx_URXD));
  printk("[INFO] (dump) UARTx_UTXD = %x\n", mmio_read32(UARTx_UTXD));
  printk("[INFO] (dump) UARTx_UCR1 = %x\n", mmio_read32(UARTx_UCR1));
  printk("[INFO] (dump) UARTx_UCR2 = %x\n", mmio_read32(UARTx_UCR2));
  printk("[INFO] (dump) UARTx_UCR3 = %x\n", mmio_read32(UARTx_UCR3));
  printk("[INFO] (dump) UARTx_UCR4 = %x\n", mmio_read32(UARTx_UCR4));
  printk("[INFO] (dump) UARTx_UFCR = %x\n", mmio_read32(UARTx_UFCR));
  printk("[INFO] (dump) UARTx_USR1 = %x\n", mmio_read32(UARTx_USR1));
  printk("[INFO] (dump) UARTx_USR2 = %x\n", mmio_read32(UARTx_USR2));
  printk("[INFO] (dump) dump done!\n");
}

static void uart_print(const char *s) {
  printk("[INFO] (uart_print) in uart_print start, s length = %ld\n",
         strlen(s));
  dump();
  while (*s) {
    // wait until UARTx_USR2[3](TXFE) = 1, which means TX FIFO is empty
    while ((mmio_read32(UARTx_USR2) & 0x8) == 0) {
      ;
    }
    // write to UARTx_UTXD
    mmio_write32(UARTx_UTXD, *s++);
  }
  printk("[INFO] (uart_print) uart_print done!\n");
}

void inmate_main(void) {
  printk("[INFO] (inmate_main) in uart-wheatfox inmate baremetal demo!\n");

  void *UART1_BASE = (void *)0x30860000;
  void *UART3_BASE = (void *)0x30880000;
  void *UART2_BASE = (void *)0x30890000;
  void *UART4_BASE = (void *)0x30a60000;

  void *selected = UART2_BASE;

  printk("[INFO] (inmate_main) trying to init uart on %p...\n", selected);
  uart_init(selected, UART_NO_INIT);
  printk("[INFO] (inmate_main) uart init done!\n");

  printk("[INFO] (inmate_main) trying to print...\n");
  uart_print("Hello from uart-wheatfox inmate baremetal demo!");
  printk("[INFO] (inmate_main) print done!\n");

  printk("[INFO] (inmate_main) going halt...\n");
  halt();
}
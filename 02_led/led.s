/* 全局标号 */
/* 表示全局从_start函数开始 */
.global _start

_start:
/* 1、所有使能时钟 */
ldr r0, =0X020C4068  @寄存器CCGR0
ldr r1, =0XFFFFFFFF  
str r1, [r0]         @[]表示取值，[r0]相当于读取寄存器r0里面的数值

ldr r0, =0X020C406C  @寄存器CCGR1
str r1, [r0]

ldr r0, =0X020C4070  @寄存器CCGR2
str r1, [r0]

ldr r0, =0X020C4074  @寄存器CCGR3
str r1, [r0]

ldr r0, =0X020C4078  @寄存器CCGR4
str r1, [r0]

ldr r0, =0X020C407C  @寄存器CCGR5
str r1, [r0]

ldr r0, =0X020C4080  @寄存器CCGR6
str r1, [r0]

/* 2、将GPIO1_03复用为GPIO1_03 */
ldr r0, =0X020E0068  @复用寄存器 SW_MUX_GPIO1_IO03_BASE
ldr r1, =0X05  
str r1, [r0]

/* 3、配置GPIO1_03的属性 */
ldr r0, =0X020E02F4  @配置寄存器 SW_PAD_GPIO1_IO03_BASE
ldr r1, =0X10B0
str r1, [r0]

/* 4、配置GPIO1_03的输出 */
ldr r0, =0X0209C004  @配置DIR寄存器 GPIO1_DR
ldr r1, =0X08
str r1, [r0]

/* 5、GPIO1_03输出低电平 */
ldr r0, =0X0209C000  @配置DR寄存器
ldr r1, =0X08
str r1, [r0]

/* 循环 */
loop:
    b loop

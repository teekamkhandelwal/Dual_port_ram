# Dual_port_ram
dual clock dual port ram using verilog and system verilog
Specification:
The true port dual ram Contains of two independent port A and B.Data can be write and read by both port and single port.Read and write operation are synchronized.Each port has its own data_in, Wr_en,Rd_en,data_out,clock,address.
The following table shows pin descriptions for a dual-port RAM with synchronous read (read through) and two clocks.
IO pins	Description
clk1	Positive-Edge Write/Primary Read Clock
clk2	Positive-Edge Dual Read Clock
wea	Synchronous Write Enable (active High)
web	Synchronous Write Enable (active High)
add1	Write/Primary Read Address
add2	Dual Read Address
dia	Data Input
dib	Data Input
do1	Primary Output Port
do2	Dual Output Port

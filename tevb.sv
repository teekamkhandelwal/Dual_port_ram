// Code your testbench here
// or browse Examples


////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:Teekam chand khandelwal
//
// Create Date:   19:26:25 11/07/2020
// Design Name:   ram
// Module Name:   C:/Users/khand/Documents/Custom Office Templates/dual_port_ram/tb.v
// Project Name:  dual_port_ram
// Target Device:  
// Tool versions:  
// Description: 
//

//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

interface port(input bit clk);
  logic wea;
  logic web;
  logic  [7:0] addra;
  logic [7:0] addrb;
  logic  [7:0] dia;
  logic [7:0] dib;
  logic rea;
  logic reb;
	
// Outputs
  logic [7:0] doa;
  logic [7:0] dob;
clocking cb @(posedge clk);
    input dia,addra,wea,rea;
  output doa;
  endclocking
  clocking cb1@(negedge clk);
    input dib,addrb,web,reb;
    output dob;
  endclocking
  modport mem (clocking cb,input dia,addra,wea,rea,output doa);
    modport mem1 (clocking cb1,input dib,addrb,web,reb,output dob);
      endinterface
      
//generator + test +  environment  
/*class trans;
  rand bit [7:0] dia;
  rand bit [7:0] dib;
  rand bit [7:0] addra;
  rand bit [7:0] addrb;
  rand bit wea;
  rand bit rea;
  rand bit reb;
  rand bit web;
  bit [7:0] doa;
  bit [7:0] dob;
  
        function new();
        endfunction
endclass*/
      
        
class dr_driver;
 virtual port p4;
 
  task run;
    p4.wea=1;
    p4.web=0;
    p4.dia=$random;
    p4.dib=$random;
    p4.addra=$random;
    p4.addrb=p4.addra;
    p4.rea=0;
    p4.reb=1;
    $display("---------------------------------------------------------");
    $display("\t wea  = %0d",p4.wea);
    $display("\t rea  = %0d",p4.rea);
    $display("\t addra  = %0h",p4.addra);
    $display("\t port a data input = %0d",p4.dia);
    $display("---------------------------------------------------------");
     $display("---------------------------------------------------------");
    $display("\t web  = %0d",p4.web);
    $display("\t reb  = %0d",p4.reb);
    $display("\t addrb  = %0h",p4.addrb);
    #20 $display("\t port b data input = %0d",p4.dib);
    $display("---------------------------------------------------------");
  endtask
endclass
 
module top;
  logic clk;
  port tb(clk);
  dr_driver p3=new();
  
  initial begin 
    clk=0;
    forever #5 clk=~clk;
  end
  
  ram m3(.m1(tb.mem),.m2(tb.mem1),.clk(clk));
  
  initial begin
 
   p3.p4=tb;
   /* tb.clk1 = p3.clk1;
	tb.clk2 = p3.clk2;
    tb.wea=p3.wea;
    tb.web=p3.web;
    tb.dia=p3.dia;
    tb.dib=p3.dib;
    tb.rea=p3.rea;
    tb.reb=p3.reb;
    tb.addra=p3.addra;
    tb.addrb=p3.addrb;
    tb.doa=p3.doa;
    tb.dob=p3.dob;*/
	// Instantiate the Unit Under Test (UUT)
    repeat(5) begin
    p3.run();
    $display("\t addra  = %0h",tb.addra);
      $display("\t port data a out  = %0h",tb.doa);
      #20 $display("\t port data b out  = %0h",tb.dob);
    end
		/*forever begin
		#5 p3.clk1=~p3.clk1;
		#5 p3.clk2=~p3.clk2;
        end*/
    
   
   

     #1000 $finish;
     end
  
  
    /* initial begin 
    $dumpfile("top.vcd");
    $dumpvars(0,top);
     end*/
  
endmodule


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

interface port(input bit clk,clk1,clk2);
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
    input dia,addra,wea,clk1,rea;
  output doa;
  endclocking
  clocking cb1@(negedge clk);
    input dib,addrb,web,clk2,reb;
    output dob;
  endclocking
  modport mem (clocking cb,input dia,addra,wea,rea,clk1,output doa);
    modport mem1 (clocking cb1,input dib,addrb,web,reb,clk2,output dob);
      endinterface
      
//generator + test +  environment  
class trans;
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
endclass
      
        
class dr_driver;
  trans t2=new();
 virtual port p4;
 /* rand bit [7:0] dia;
  rand bit [7:0] dib;
  rand bit [7:0] addra;
  rand bit [7:0] addrb;
  rand bit wea;
  rand bit rea;
  rand bit reb;
  rand bit web;
  bit [7:0] doa;
  bit [7:0] dob;*/
	// Inputs
  function new ( virtual  port p4);
    this.p4=p4;
  endfunction

  task init(virtual port p4);
    @(posedge p4.clk);
    this.p4.wea<=t2.wea;
    this.p4.web<=t2.web;
    this.p4.dia<=t2.dia;
    this.p4.dib<=t2.dib;
    this.p4.addra<=t2.addra;
    this.p4.addrb<=t2.addrb;
    this.t2.doa=p4.doa;
    this.t2.dob=p4.dob;
  endtask
  
  function void display();
    $display("---------------------------------------------------------");
    $display("\t wea  = %0d",t2.wea);
    $display("\t port data a out  = %0h",t2.doa);
    $display("\t addra  = %0h",t2.addra);
    $display("\t port a data input = %0d",t2.dia);
    $display("---------------------------------------------------------");
     $display("---------------------------------------------------------");
    $display("\t web  = %0d",t2.web);
    $display("\t port data b out  = %0h",t2.dob);
    $display("\t addrb  = %0h",t2.addrb);
    $display("\t port b data input = %0d",t2.dib);
    $display("---------------------------------------------------------");
  endfunction
  endclass
      
module top;
  logic clk,clk1,clk2;
  port tb(clk,clk1,clk2);
  initial begin 
    clk=0;
    forever begin #5 clk=~clk;
      #15 clk1=~clk1;
      #25 clk2=~clk2;
  end
  end
  ram m3(.m1(tb.mem),.m2(tb.mem1));
  initial begin
   dr_driver p3;
    p3=new(tb);

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
    
   /* tb.cb.clk1=0;
    tb.cb1.clk2=0;
		forever begin
		#5 tb.cb.clk1=~tb.cb.clk1;
		#5 tb.cb1.clk2=~tb.cb1.clk2;
		end*/
   
    repeat(5) begin
      p3.randomize();
      p3.init(tb);
       #15 $display("%h",tb.doa);
      p3.display();
      
      
    end	// Add stimulus here

     #1000 $finish;
     end
  
  
    /* initial begin 
    $dumpfile("top.vcd");
    $dumpvars(0,top);
     end*/
  
endmodule


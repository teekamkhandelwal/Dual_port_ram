// Code your design here
// Code your design here

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:TEEKAM CHAND KHANDELWAL 
// 
// Create Date:    18:48:55 11/07/2020 
// Design Name: 
// Module Name:    dual_port 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module raminfr  
    (clk1,clk2, wea, addra, addrb, dia,dib,web, doa, dob);  
 
  input clk1;
 input clk2;   
  input wea; 
  input web;
  input [4:0] addra;  
  input [4:0] addrb;  
  input [3:0] dia;
  input [3:0] dib;
  output [3:0] doa;  
  output [3:0] dob;  
  reg [3:0] ram [31:0];  
  reg [4:0] read_addra;  
  reg [4:0] read_addrb;  
 always@(posedge clk1) begin
   if (wea) begin 
     ram[addra] <= dia; 
 end
read_addra <= addra;  
end
always @(posedge clk2) begin
  if (web) begin 
    ram[addrb] <= dib; 
 end
read_addrb <= addrb;  
end
assign dob = ram[read_addrb];
assign doa = ram[read_addra]; 
/*



  always @(posedge clk) begin  
      if (en)  
        begin  
          if (we)  
            ram[addra] <= di;  
            read_addra <= addra;  
            read_addrb <= addrb;  
        end  
  end  
  assign doa = ram[read_addra];  
  assign dob = ram[read_addrb];  */
endmodule 


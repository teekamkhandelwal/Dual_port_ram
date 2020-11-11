// Code your design here
module ram(port.mem m1, port.mem1 m2);
  logic [7:0] mam [0:255]; 
  always@(posedge m1.cb.clk1)
    begin
      if(m1.cb.wea && ! m1.cb.rea)
        mam[m1.cb.addra] <= m1.cb.dia;
      else if (m1.cb.rea && ! m1.cb.wea)
        m1.cb.doa<=mam[m1.cb.addra];
      else
        m1.cb.doa<=8'h00;
    end
  always@(posedge m2.cb1.clk2)
    begin
      if(m2.cb1.web && ! m2.cb1.reb)
        mam[m2.cb1.addrb] <= m2.cb1.dib;
      else if (m2.cb1.reb && ! m2.cb1.web)
        m2.cb1.dob<=mam[m2.cb1.addrb];
      else
        m2.cb1.dob<=8'h00;
    end
endmodule



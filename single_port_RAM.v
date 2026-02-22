`timescale 1ns / 1ps
module single_port_RAM#(
parameter depth=4, a_width=$clog2(depth),d_width=8)(
input clk,wr_en,rd_en,
input [d_width-1:0]data_in,
input [a_width-1:0]address,
output [d_width-1:0]data_out
);
reg [d_width-1:0] mem [0:depth-1];
reg [d_width-1:0] data_reg;
always @(posedge clk)
begin
if(wr_en)
   mem[address]<=data_in;
else if(rd_en)
   data_reg<=mem[address];
else
   data_reg<=data_reg;
end
assign data_out=data_reg;
endmodule

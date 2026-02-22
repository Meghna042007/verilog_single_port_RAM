`timescale 1ns / 1ps
module single_port_RAM_tsb();
reg clk,wr_en,rd_en;
reg [7:0]data_in;
reg [1:0]address;
wire [7:0]data_out;
single_port_RAM dut(.clk(clk),.wr_en(wr_en),.rd_en(rd_en),.data_in(data_in),.address(address),.data_out(data_out));
always #5 clk=~clk;
initial
begin
clk=0;wr_en=0;rd_en=0;data_in=0;address=0;
repeat(3)@(posedge clk);
wr_en=1;data_in=8'hAA;address=2'd2;//write to address 2
@(posedge clk);
@(posedge clk);
wr_en=1;data_in=8'hF0;address=2'd0;//write to address 0
@(posedge clk);
@(posedge clk);
wr_en=0;rd_en=1;address=2'd2;//read from address 2
@(posedge clk);
@(posedge clk);
wr_en=1;data_in=8'hA4;address=2'd1;//write to address 1
@(posedge clk);
@(posedge clk);
wr_en=0;address=2'd0;//read from address 0
@(posedge clk);
@(posedge clk);
wr_en=0;address=2'd1;//read from address 1
@(posedge clk);
@(posedge clk);
wr_en=1;rd_en=0;data_in=8'hC2;address=2'd1;//overwrite address 1
@(posedge clk);
@(posedge clk);
wr_en=0;rd_en=1;address=2'd3;//read address with no data 
@(posedge clk);
@(posedge clk);
wr_en=0;rd_en=1;address=2'd1;//read overwritten address
@(posedge clk);
@(posedge clk);
wr_en=0;rd_en=0;//idle
repeat(5)@(posedge clk);
$finish;
end
endmodule

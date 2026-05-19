`timescale 1ns/10ps
module counter_test;
reg clk, rst;
wire [7:0] count;
wire scan_out;
reg scan_in, SE;

counter counter1(clk,rst,count,SE,scan_in,scan_out);

initial
begin
 $sdf_annotate("delays.sdf",counter_test.counter1,,"sdf.log","MAXIMUM");
end

initial 
begin
clk=0;
rst=0;
#10 rst=1;
#10 rst=0;
#10 rst=1;
#1000 $stop;
end


always #5 clk=~clk;

endmodule

module tb_shift_register_load;
reg clk, rst, en, lrbar, lcbar, load; 
reg [3:0] P_in;
wire [3:0] P_out;


shift_register uut (.clk(clk), .rst(rst), .en(en),
                   .lrbar(lrbar), .lcbar(lcbar), .load(load),
                  .P_in(P_in), .P_out(P_out));
initial clk = 0;
always #5 clk = ~clk; // 100 MHz clock


always @(posedge clk)

$display("%0t : load=%b en=%b lrlc=%b P_out=%h",$time, load, en, {lrbar,lcbar}, P_out); 
initial begin
rst = 1; en = 0; load = 0; lrbar = 0; lcbar = 0; 
P_in = 4'b1011;
#12; rst = 0;
#8; load = 1;
#10; load = 0;
en = 1; lrbar = 0; lcbar = 0; #40; // rotate right 
lrbar = 0; lcbar = 1;	#40; // shift right 
lrbar = 1; lcbar = 0;	#40; // rotate left 
lrbar = 1; lcbar = 1;	#40; // shift left
$display("Final P_out = %h", P_out);
$finish; 
end
endmodule

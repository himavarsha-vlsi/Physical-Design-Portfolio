module Counter_test; 
reg clk, rst, m; 
wire [3:0] count; 
 
 
initial begin 
clk = 0; 
rst = 0; #100; 
rst = 1; 
end
initial begin 
m = 0; 
#600 m = 1; // switch to up-count at 600 ns 
#500 m = 0; // switch to down-count at 1100 ns 
end 
counter counter1 (clk, m, rst, count); 
always #5 clk = ~clk; // 100 MHz clock 
initial $monitor("Time=%t rst=%b clk=%b count=%b", $time, rst, clk, count); 
initial #1400 $finish; 
endmodule 

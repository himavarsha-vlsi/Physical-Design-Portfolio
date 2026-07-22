module shift_register(
input clk, rst, en, lrbar, lcbar, load, 
input [3:0] P_in,
output reg [3:0] P_out );


always @(posedge clk) begin 
if (rst)
P_out <= {4{1'b0}};
else if (load) 
P_out <= P_in;
else if (en) begin
case ({lrbar, lcbar})
2'b00: P_out <= {P_out[0], P_out[3:1]}; // rotate right
2'b01: P_out <= {1'b0,	P_out[3:1]}; // shift right 
2'b10: P_out <= {P_out[2:0], P_out[3]}; // rotate left 
2'b11: P_out <= {P_out[2:0], 1'b0};	// shift left 
default: P_out <= P_out;
endcase 
end
end 
endmodule

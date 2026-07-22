module mux(
input [3:0] i, // 4 data inputs 
input [1:0] s, // 2-bit select
output reg y // selected output
);
always @(*) begin case (s)
2'b00: y = i[0];
2'b01: y = i[1];
2'b10: y = i[2];
2'b11: y = i[3];

default: ; endcase
end endmodule

module accum( in, out, ena, clk, rst);
input clk,rst,ena;
input [7:0] in;
output reg [7:0] out;
always @(posedge clk or negedge rst) begin
if(!rst) out <= 8'd0;
else begin
if(ena) out <= in;
else out <= out;
end
end
endmodule

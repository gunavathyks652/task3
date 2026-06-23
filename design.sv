module adder_pipeline (
    input clk,
    input rst,
    input [7:0] a,
    input [7:0] b,
    output reg [8:0] sum
);

reg [8:0] temp;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        temp <= 0;
        sum <= 0;
    end
    else begin
        temp <= a + b;
        sum <= temp;
    end
end

endmodule
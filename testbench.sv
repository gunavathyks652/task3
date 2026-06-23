`timescale 1ns/1ps

module tb_adder_pipeline;

reg clk;
reg rst;
reg [7:0] a;
reg [7:0] b;
wire [8:0] sum;

adder_pipeline dut (
    .clk(clk),
    .rst(rst),
    .a(a),
    .b(b),
    .sum(sum)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb_adder_pipeline);

    clk = 0;
    rst = 1;
    a = 0;
    b = 0;

    #10 rst = 0;

    a = 8'd10; b = 8'd20;
    #10;

    a = 8'd15; b = 8'd25;
    #10;

    a = 8'd50; b = 8'd30;
    #10;

    a = 8'd100; b = 8'd50;
    #20;

    $finish;
end

initial begin
    $monitor("Time=%0t a=%d b=%d sum=%d",
              $time, a, b, sum);
end

endmodule
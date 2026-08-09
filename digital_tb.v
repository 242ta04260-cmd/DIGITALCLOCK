`timescale 1ns/1ps

module tb_digital_clock;

    reg clk;
    reg reset;

    wire [5:0] seconds;
    wire [5:0] minutes;
    wire [4:0] hours;

    // Small frequency for simulation
    digital_clock #(
        .CLK_FREQ(10)
    ) uut (
        .clk(clk),
        .reset(reset),
        .seconds(seconds),
        .minutes(minutes),
        .hours(hours)
    );

    // 10 ns clock period
    always #5 clk = ~clk;

    initial begin

        clk = 0;
        reset = 1;

        #20;
        reset = 0;

        // Run simulation
        #700;

        $finish;
    end

    // Display clock value
    always @(posedge clk) begin
        $display(
            "TIME = %02d:%02d:%02d",
            hours,
            minutes,
            seconds
        );
    end

endmodule

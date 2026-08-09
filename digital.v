`timescale 1ns/1ps

module digital_clock #(
    parameter CLK_FREQ = 50_000_000
)(
    input  wire clk,
    input  wire reset,

    output reg [5:0] seconds,
    output reg [5:0] minutes,
    output reg [4:0] hours
);

    // Counter for 1-second timing
    reg [31:0] counter;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 0;
            seconds <= 0;
            minutes <= 0;
            hours   <= 0;
        end
        else begin
            // Generate 1-second pulse
            if (counter == CLK_FREQ - 1) begin
                counter <= 0;

                // Seconds
                if (seconds == 59) begin
                    seconds <= 0;

                    // Minutes
                    if (minutes == 59) begin
                        minutes <= 0;

                        // Hours
                        if (hours == 23)
                            hours <= 0;
                        else
                            hours <= hours + 1;
                    end
                    else begin
                        minutes <= minutes + 1;
                    end
                end
                else begin
                    seconds <= seconds + 1;
                end
            end
            else begin
                counter <= counter + 1;
            end
        end
    end

endmodule

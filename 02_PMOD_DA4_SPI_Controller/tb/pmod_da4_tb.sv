`timescale 1ns / 1ps

module tb;

    reg clk100mhz = 0;
    wire cs;
    wire mosi;
    wire sclk;
    reg st_wrt = 0;
    reg [11:0] data_in = 0;
    wire done;

    reg [31:0] received_frame;
    reg [31:0] expected_frame;
    integer i;
    integer errors = 0;

    top dut (
        .clk100mhz(clk100mhz),
        .cs(cs),
        .mosi(mosi),
        .sclk(sclk),
        .st_wrt(st_wrt),
        .data_in(data_in),
        .done(done)
    );

    always #5 clk100mhz = ~clk100mhz;

    // Capture one 32-bit frame, MSB first

task check_frame;
    input [31:0] expected;
    begin
        received_frame = 32'b0;

        // CS falling marks the start of the frame.
        // Capture the first bit immediately after MOSI settles.
        @(negedge cs);
        #1;
        received_frame = {received_frame[30:0], mosi};

        // Capture the remaining 31 bits.
        repeat (31) begin
            @(posedge sclk);
            #1;
            received_frame = {received_frame[30:0], mosi};
        end

        if (received_frame !== expected) begin
            $display("FAIL: expected %08h, received %08h",
                     expected, received_frame);
            errors = errors + 1;
        end
        else begin
            $display("PASS: frame = %08h", received_frame);
        end
    end
endtask


    initial begin
        // Apply reset, then release it
        st_wrt = 0;
        data_in = 12'hAAA;

        repeat (5) @(posedge clk100mhz);
        @(negedge clk100mhz);
        st_wrt = 1;

        // Initialization frame
        check_frame(32'h08000001);

        // Wait for initialization to complete
        wait (cs == 1'b1);
        wait (dut.state == dut.dac_data);

        // First data frame
        data_in = 12'hAAA;
        check_frame({12'h030, 12'hAAA, 8'h00});

        wait (done == 1'b1);
        wait (done == 1'b0);

        // Second data frame
        data_in = 12'h5A3;
        check_frame({12'h030, 12'h5A3, 8'h00});

        wait (done == 1'b1);
        #2;

        if (errors == 0)
            $display("ALL FRAME CHECKS PASSED");
        else
            $display("TEST FAILED: %0d error(s)", errors);

        $finish;
    end

    initial begin
        #2000000;
        $display("TIMEOUT: check the FSM and waveform");
        $finish;
    end

endmodule

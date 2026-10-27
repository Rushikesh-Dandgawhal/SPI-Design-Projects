
`timescale 1ns / 1ps

module daisy_c_tb;

    reg clk = 0;
    reg newd = 0;
    reg [7:0] din = 0;
    wire [7:0] dout;

    daisy_c dut (
        .clk  (clk),
        .newd (newd),
        .din  (din),
        .dout (dout)
    );

    always #5 clk = ~clk;

    task automatic transfer(input [7:0] tx);
        begin
            @(negedge clk);
            din = tx;
            newd = 1'b1;

            @(negedge clk);
            newd = 1'b0;

            wait (dut.cs == 1'b0);
            wait (dut.cs == 1'b1);

            // Allow the received data to settle
            #20;
            $display("TX = %02h, RX = %02h, time = %0t",
                     tx, dout, $time);
        end
    endtask

    initial begin
        repeat (5) @(negedge clk);

        $display("Transaction 1");
        transfer(8'hA5);

        repeat (5) @(negedge clk);

        $display("Transaction 2");
        transfer(8'h3C);

        #100;
        $finish;
    end

    initial begin
        #20000;
        $fatal(1, "TIMEOUT: SPI transaction did not complete");
    end

endmodule

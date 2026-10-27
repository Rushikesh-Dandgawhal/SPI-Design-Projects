module top (
    input  logic        clk100mhz,
    output logic        cs,
    output logic        mosi,
    output logic        sclk,
    input  logic        st_wrt,
    input  logic [11:0] data_in,
    output logic        done
);

    typedef enum logic [1:0] {
        idle_dac = 2'd0,
        init_dac = 2'd1,
        dac_data = 2'd2,
        send_data = 2'd3
    } state_type;

    state_type state;

    // Narrow counters
    logic [5:0] count = 6'd0;
    logic [5:0] clkdiv = 6'd0;

    logic [31:0] data = 32'h00000000;
    logic [31:0] setup_dac = 32'h08000001;
    logic dac_init = 1'b0;

    logic clk1mhz = 1'b0;

    // Generate a 1 MHz clock from 100 MHz.
    // Toggle every 50 input clock cycles.
    always_ff @(posedge clk100mhz) begin
        if (clkdiv == 6'd49) begin
            clkdiv  <= 6'd0;
            clk1mhz <= ~clk1mhz;
        end
        else begin
            clkdiv <= clkdiv + 1'b1;
        end
    end

    // DAC controller
    always_ff @(posedge clk1mhz or negedge st_wrt) begin
        if (!st_wrt) begin
            state    <= idle_dac;
            cs       <= 1'b1;
            mosi     <= 1'b0;
            count    <= 6'd0;
            done     <= 1'b0;
            dac_init <= 1'b0;
        end
        else begin
            case (state)

                idle_dac: begin
                    cs    <= 1'b1;
                    mosi  <= 1'b0;
                    count <= 6'd0;
                    done  <= 1'b0;

                    if (!dac_init)
                        state <= init_dac;
                    else
                        state <= dac_data;
                end

                init_dac: begin
                    if (count < 6'd32) begin
                        cs    <= 1'b0;
                        count <= count + 1'b1;
                        mosi  <= setup_dac[31-count];
                    end
                    else begin
                        count    <= 6'd0;
                        dac_init <= 1'b1;
                        cs       <= 1'b1;
                        state    <= dac_data;
                    end
                end

                dac_data: begin
                    cs   <= 1'b1;
                    mosi <= 1'b0;
                    data <= {12'h030, data_in, 8'h00};
                    state <= send_data;
                end

                send_data: begin
                    if (count < 6'd32) begin
                        cs    <= 1'b0;
                        count <= count + 1'b1;
                        mosi  <= data[31-count];
                    end
                    else begin
                        count <= 6'd0;
                        done  <= 1'b1;
                        cs    <= 1'b1;
                        state <= idle_dac;
                    end
                end

                default: begin
                    state <= idle_dac;
                    cs    <= 1'b1;
                    mosi  <= 1'b0;
                    count <= 6'd0;
                end

            endcase
        end
    end

    // Output clock
    always_comb begin
        sclk = clk1mhz;
    end

endmodule

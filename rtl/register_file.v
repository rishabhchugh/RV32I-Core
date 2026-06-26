module register_file (
    input             clk,
    input             we,
    input      [4:0]  raddr1,
    input      [4:0]  raddr2,
    input      [4:0]  waddr,
    input      [31:0] wdata,
    output reg [31:0] rdata1,
    output reg [31:0] rdata2
);

    reg [31:0] registers [31:0];

    always @(posedge clk) begin
        if (we)
            registers[waddr] <= wdata;
    end

    always @(*) begin
        rdata1 = registers[raddr1];
        rdata2 = registers[raddr2];
    end

endmodule
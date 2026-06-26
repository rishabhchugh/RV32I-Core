module fetch (
    input             clk,
    input             reset,
    input      [31:0] pc_branch,
    input             branch_taken,
    output reg [31:0] pc
);

    always @(posedge clk) begin
        if (reset)
            pc <= 32'b0;
        else if (branch_taken)
            pc <= pc_branch;
        else
            pc <= pc + 4;
    end

endmodule
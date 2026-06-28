module decode(
    input clk,
    input [31:0] instruction,
    input [31:0] pc,
    output reg [4:0] rs1,
    output reg [4:0] rs2,
    output reg [4:0] rd,
    output reg [6:0] opcode,
    output reg [31:0] imm,
    output reg [2:0] funct3
);

always @(*) begin
    opcode = instruction[6:0];
    rd = instruction[11:7];
    rs1 = instruction[19:15];
    rs2 = instruction[24:20];
    funct3 = instruction[14:12];

    case (opcode)
        7'b0010011: imm = {{20{instruction[31]}}, instruction[31:20]}; // I-type ALU
        7'b0000011: imm = {{20{instruction[31]}}, instruction[31:20]}; // Load
        7'b0100011: imm = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};// S-type
        7'b1100011: imm = {{19{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0}; // B-type
        7'b1101111: imm = {{11{instruction[31]}}, instruction[31], instruction[19:12], instruction[20], instruction[30:21], 1'b0}; // J-type
        7'b1100111: imm = {{20{instruction[31]}}, instruction[31:20]}; // JALR
        default:    imm = 32'b0;
    endcase
end

endmodule
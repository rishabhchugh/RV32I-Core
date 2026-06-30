module execute(
    input [31:0] rs1_data,
    input [31:0] rs2_data,
    input [31:0] imm,
    input [2:0] alu_op,
    input [31:0] pc,
    input [6:0] opcode,
    input [2:0] funct3,
    output reg [31:0] alu_result,
    output reg branch_taken,
    output reg [31:0] pc_branch,
    output reg rd_write
);

always @(*) begin
    pc_branch = pc + imm;

    case (alu_op)
            3'b000: alu_result = rs1_data + rs2_data;
            3'b001: alu_result = rs1_data - rs2_data;
            3'b010: alu_result = rs1_data & rs2_data;
            3'b011: alu_result = rs1_data | rs2_data;
            3'b100: alu_result = rs1_data ^ rs2_data;
            default: alu_result = 32'b0;
        endcase

    
    case (opcode)
        7'b0110011: begin //R-type
            rd_write = 1;
            branch_taken = 0;
        end
        7'b1100011: begin //B-type
            rd_write = 0;
            case(funct3)
                3'b000: branch_taken = (rs1_data == rs2_data); // BEQ
                3'b001: branch_taken = (rs1_data != rs2_data); // BNE
                default: begin 
                    rd_write = 0;
                    branch_taken = 0;
                end
            endcase
        end
        default:    begin
            rd_write = 0;
            branch_taken = 0;
        end
    endcase
end
endmodule
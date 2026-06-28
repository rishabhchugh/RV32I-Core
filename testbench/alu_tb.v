module alu_tb;

reg [31:0] a;
reg [31:0] b;
reg [2:0] alu_op;
wire [31:0] result;

alu alu1(
    .a(a),
    .b(b),
    .alu_op(alu_op),
    .result(result)
);

initial begin
    // test add
    a = 32'd15;
    b = 32'd12;
    alu_op = 3'b000;
    #10;
    $display("ADD: %d + %d = %d", a, b, result);
    //27

    //test sub
    a = 32'd15;
    b = 32'd12;
    alu_op = 3'b001;
    #10;
    $display("SUB: %d - %d = %d", a, b, result);
    //3

    //test and
    a = 32'b1100;
    b = 32'b1010;
    alu_op = 3'b010;
    #10;
    $display("AND: %b & %b = %b", a, b, result);
    //1000

    //test or
    a = 32'b1100;
    b = 32'b1010;
    alu_op = 3'b011;
    #10;
    $display("OR: %b | %b = %b", a, b, result);
    //1110

    //test xor
    a = 32'b1100;
    b = 32'b1010;
    alu_op = 3'b100;
    #10;
    $display("XOR: %b ^ %b = %b", a, b, result);
    //0110
    
    $finish;
end
endmodule
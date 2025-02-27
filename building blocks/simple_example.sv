// Top module declaration
module simple_example (
    input  logic a, b, clk,
    output logic y
);

    // Internal signal
    logic and_out;

    // Combinational logic using 'assign'
    assign and_out = a & b; // AND operation

    // Sequential logic using 'always' (D Flip-Flop)
    always_ff @(posedge clk) begin
        y <= and_out; 
    end

endmodule


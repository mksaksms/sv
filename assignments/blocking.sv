module blocking_example;
    reg [1:0] a, b, c;

    initial begin
        a = 2'b01; // Assign 01 to a
        b = a;     // b gets the updated value of a
        c = a + b;     // c gets the updated value of b
        $display("Blocking Assignment: a=%b, b=%b, c=%b", a, b, c);
    end
endmodule

module nonblocking_example;
    reg [1:0] a, b, c;

    initial begin
        a <= 2'b01; // Assign 01 to a (scheduled)
        b <= a;     // b gets the old value of a (not updated yet)
        c <= a + b;     // c gets the old value of b (not updated yet)
        #1; // Small delay to allow execution
        $display("Nonblocking Assignment: a=%b, b=%b, c=%b", a, b, c);
    end
endmodule

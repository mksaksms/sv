module testbench;
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, testbench);
        #1;
        $finish;
    end

    blocking_example blk();
    nonblocking_example nblk();
endmodule

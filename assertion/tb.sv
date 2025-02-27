// Testbench module
module testbench;
    logic a, b, clk;
    logic y;

    // Instantiate the module
    simple_example uut (
        .a(a),
        .b(b),
        .clk(clk),
        .y(y)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test stimulus
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, testbench);

        // Initialize signals
        clk = 0;
        a = 0; b = 0;

        // Apply test cases
        #10 a = 1; b = 0;
        #10 a = 1; b = 1;
        #10 a = 0; b = 1;
      
      
      	
        #20 
      
      	#10 a = 1; b = 0;
        #10 a = 1; b = 1;
        #10 a = 0; b = 1;
      
      
      	#10 $finish;
    end
  
  
  
  always @ (posedge clk) begin 
    assert (a == b ) 
      $display("pass");
    else
      $display("fail");
        
  end
	
  not_ab: assert property (  @ ( posedge clk) not(a && b)
                           $display("inverted");
  			) ; 
         
endmodule

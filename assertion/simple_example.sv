// Code your testbench here
// or browse Examples
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
  
 
  
  // This is the simpliest assertion (Immediate) 
  always @ (posedge clk) begin 
    assert (a == b ) 
      $display("pass");
    else
      $display("fail");
        
  end

  // Concurrent assignment with property include in same line 
  not_ab: assert property (@(posedge clk) (a != b))
  
    begin
      $display("Assertion Passed: a && b is NOT equal at time %0t", $time);
  end 
  
  
  
  //Concurrent assignment with separate property . Second way of calling 
    y_a : assert property (yequala)
    begin 
      $display("Assertion Passed: Output:  y is equal to input : a at time %0t", $time);
    end
      
      
  property yequala;
    @ (posedge clk) ( a == y) ;
   
  endproperty
  
  
  
  // Implication operator 
   property p;
     // Example of non overlapping implication 
     //@(posedge clk) a |-> b; // same clock signal 
     
     
     // Uncomment this one for one overlapped implication 
     //@(posedge clk) a |-> b; // one clock after - 
     @(posedge clk) a |-> ##3 b ; // 3 clock cycle delay 
   endproperty
  
  //calling assert property
  	a_1: assert property(p)
     begin
       $display("Assertion Passed: B is HIGH on a same clock signal after A is HIGH at time %0t",$time);
  	end   
  
      
      
endmodule

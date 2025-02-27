// Code your testbench here
// or browse Examples
class parent_class;
  bit [31:0] addr; 

  // Virtual function to be overridden in child classes
  virtual function void display();
    $display("Inside parent class");
  endfunction
endclass



class child_class extends parent_class;
  bit [31:0] data;
endclass



class poly_class_1 extends parent_class;
  function void display();
    $display("Inside extended class 1");
  endfunction
endclass
 
class poly_class_2 extends parent_class;
  function void display();
    $display("Inside extended class 2");
  endfunction
endclass




module inheritence;
  
  
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars;
  end 
  
  // This is the example for child class inheritance 
  initial begin
    child_class c = new();
    c.addr = 10;
    c.data = 20;
    $display("Value of addr = %0d data = %0d",c.addr,c.data);
    
  end
  // Example for poly morphism 
  
  initial begin 
    poly_class_1  poly1	= new ();
    poly_class_2  poly2 = new (); 
    
    parent_class p [2] ; 
    
    p[0] = poly1;
    p[1] = poly2;
    
    p[0].display (); 
    p[1].display (); 
    
    
    
  end 
endmodule;

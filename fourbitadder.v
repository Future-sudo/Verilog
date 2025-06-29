 /**module tb_adder;
     reg [3:0] nfa, nfb;
     reg nfcin;
     wire [3:0] nfsum;
     wire nfcout;

  
     fourbitadd wasp (
         .fa(nfa), .fb(nfb), .fcin(nfcin),
         .fy(nfsum), .fcout(nfcout)
     );
     initial begin
         nfa = $random % 16;    
         nfb = $random % 16;    
         nfcin = 0;

         #10; 
         $display("Input A = %b, Input B = %b, Cin = %b --> Sum = %b, Cout = %b", 
                   nfa, nfb, nfcin, nfsum, nfcout);

         $finish;
     end
 endmodule*/
module tb_adder;
    reg [3:0] nfa, nfb;
    reg nfcin;
    wire [3:0] nfsum;
    wire nfcout;

    fourbitadd wasp (
        .fa(nfa), .fb(nfb), .fcin(nfcin),
        .fy(nfsum), .fcout(nfcout)
    );
    integer i;
    initial begin
        for (i = 0; i < 10; i = i + 1) begin
            nfa = $random % 16;
            nfb = $random % 16;
            nfcin = $random % 2;
            #10;
            $display("Test %0d: A = %b, B = %b, Cin = %b --> Sum = %b, Cout = %b", 
                      i, nfa, nfb, nfcin, nfsum, nfcout);
        end
        $finish;
    end
    initial begin
  $dumpfile("waves.vcd");  // Output waveform file
  $dumpvars;
  end
endmodule

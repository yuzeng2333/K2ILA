requires "x86-configuration.k"

module POPW-R16
  imports X86-CONFIGURATION

  rule <k> 
    execinstr (popw R1:R16, .Operands) =>
      incRSPInBytes(2) ~>
      setRegisterValue(
          loadFromMemory(getRegisterValue(%rsp, RSMap), 16), 
          R1) 
  ...</k>
  <regstate> RSMap </regstate>
endmodule

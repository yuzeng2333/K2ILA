// Autogenerated using stratification.
requires "x86-configuration.k"

module SETNZ-M8
  imports X86-CONFIGURATION

  context execinstr(setnz:Opcode HOLE:Mem,  .Operands) [result(MemOffset)]
  
  rule <k>
     execinstr (setnz:Opcode memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      
            storeToMemory(
              (#ifMInt (notBool eqMInt(getFlag("ZF", RSMap), mi(1,1))) #then mi(8, 1) #else mi(8, 0) #fi),
              MemOff,
              8
            )
          
  ...</k>
    <regstate> RSMap:Map </regstate>
endmodule

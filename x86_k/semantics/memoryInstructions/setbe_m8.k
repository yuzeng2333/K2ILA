// Autogenerated using stratification.
requires "x86-configuration.k"

module SETBE-M8
  imports X86-CONFIGURATION

  context execinstr(setbe:Opcode HOLE:Mem,  .Operands) [result(MemOffset)]
  
  rule <k>
     execinstr (setbe:Opcode memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      
            storeToMemory(
              (#ifMInt (eqMInt(getFlag("CF", RSMap), mi(1,1)) orBool eqMInt(getFlag("ZF", RSMap), mi(1,1))) #then mi(8, 1) #else mi(8, 0) #fi),
              MemOff,
              8
            )
          
  ...</k>
    <regstate> RSMap:Map </regstate>
endmodule

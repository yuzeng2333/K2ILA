// Autogenerated using stratification.
requires "x86-configuration.k"

module SETNGE-M8
  imports X86-CONFIGURATION

  context execinstr(setnge:Opcode HOLE:Mem,  .Operands) [result(MemOffset)]
  
  rule <k>
     execinstr (setnge:Opcode memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      
            storeToMemory(
              (#ifMInt (notBool (eqMInt(getFlag("SF", RSMap), mi(1,1)) ==Bool eqMInt(getFlag("OF", RSMap), mi(1,1)))) #then mi(8, 1) #else mi(8, 0) #fi),
              MemOff,
              8
            )
          
  ...</k>
    <regstate> RSMap:Map </regstate>
endmodule

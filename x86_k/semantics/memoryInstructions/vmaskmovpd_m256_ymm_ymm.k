// Autogenerated using stratification.
requires "x86-configuration.k"

module VMASKMOVPD-M256-YMM-YMM
  imports X86-CONFIGURATION

  context execinstr(vmaskmovpd:Opcode R1:Ymm, R2:Ymm, HOLE:Mem,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vmaskmovpd:Opcode R1:Ymm, R2:Ymm, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      loadFromMemory( MemOff, 256) ~>
      execinstr (vmaskmovpd R1:Ymm, R2:Ymm, memOffset( MemOff),  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem256:MInt):MemLoadValue ~> execinstr (vmaskmovpd:Opcode R1:Ymm, R2:Ymm, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      
            storeToMemory(
              concatenateMInt( (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 0, 1), mi(1, 1)) #then extractMInt( getParentValue(R1, RSMap), 0, 64) #else extractMInt( Mem256, 0, 64) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 64, 65), mi(1, 1)) #then extractMInt( getParentValue(R1, RSMap), 64, 128) #else extractMInt( Mem256, 64, 128) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 128, 129), mi(1, 1)) #then extractMInt( getParentValue(R1, RSMap), 128, 192) #else extractMInt( Mem256, 128, 192) #fi), (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 192, 193), mi(1, 1)) #then extractMInt( getParentValue(R1, RSMap), 192, 256) #else extractMInt( Mem256, 192, 256) #fi)))),
              MemOff,
              256
            )
          
  ...</k>
    <regstate> RSMap:Map </regstate>
endmodule

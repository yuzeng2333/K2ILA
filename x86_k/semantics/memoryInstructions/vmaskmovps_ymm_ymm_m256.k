// Autogenerated using stratification.
requires "x86-configuration.k"

module VMASKMOVPS-YMM-YMM-M256
  imports X86-CONFIGURATION

  context execinstr(vmaskmovps:Opcode HOLE:Mem, R2:Ymm, R3:Ymm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vmaskmovps:Opcode memOffset( MemOff:MInt):MemOffset, R2:Ymm, R3:Ymm,  .Operands) =>
      loadFromMemory( MemOff, 256) ~>
      execinstr (vmaskmovps memOffset( MemOff), R2:Ymm, R3:Ymm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem256:MInt):MemLoadValue ~> execinstr (vmaskmovps:Opcode memOffset( MemOff:MInt):MemOffset, R2:Ymm, R3:Ymm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 0, 1), mi(1, 1)) #then extractMInt( Mem256, 0, 32) #else mi(32, 0) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 32, 33), mi(1, 1)) #then extractMInt( Mem256, 32, 64) #else mi(32, 0) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 64, 65), mi(1, 1)) #then extractMInt( Mem256, 64, 96) #else mi(32, 0) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 96, 97), mi(1, 1)) #then extractMInt( Mem256, 96, 128) #else mi(32, 0) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 128, 129), mi(1, 1)) #then extractMInt( Mem256, 128, 160) #else mi(32, 0) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 160, 161), mi(1, 1)) #then extractMInt( Mem256, 160, 192) #else mi(32, 0) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 192, 193), mi(1, 1)) #then extractMInt( Mem256, 192, 224) #else mi(32, 0) #fi), (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 224, 225), mi(1, 1)) #then extractMInt( Mem256, 224, 256) #else mi(32, 0) #fi))))))))
      )
    </regstate>
endmodule

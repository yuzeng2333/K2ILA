// Autogenerated using stratification.
requires "x86-configuration.k"

module VMAXPD-YMM-YMM-M256
  imports X86-CONFIGURATION

  context execinstr(vmaxpd:Opcode HOLE:Mem, R2:Ymm, R3:Ymm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vmaxpd:Opcode memOffset( MemOff:MInt):MemOffset, R2:Ymm, R3:Ymm,  .Operands) =>
      loadFromMemory( MemOff, 256) ~>
      execinstr (vmaxpd memOffset( MemOff), R2:Ymm, R3:Ymm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem256:MInt):MemLoadValue ~> execinstr (vmaxpd:Opcode memOffset( MemOff:MInt):MemOffset, R2:Ymm, R3:Ymm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( (#ifMInt eqMInt( maxcmp_double(extractMInt( getParentValue(R2, RSMap), 0, 64), extractMInt( Mem256, 0, 64)), mi(1, 1)) #then extractMInt( getParentValue(R2, RSMap), 0, 64) #else extractMInt( Mem256, 0, 64) #fi), concatenateMInt( (#ifMInt eqMInt( maxcmp_double(extractMInt( getParentValue(R2, RSMap), 64, 128), extractMInt( Mem256, 64, 128)), mi(1, 1)) #then extractMInt( getParentValue(R2, RSMap), 64, 128) #else extractMInt( Mem256, 64, 128) #fi), concatenateMInt( (#ifMInt eqMInt( maxcmp_double(extractMInt( getParentValue(R2, RSMap), 128, 192), extractMInt( Mem256, 128, 192)), mi(1, 1)) #then extractMInt( getParentValue(R2, RSMap), 128, 192) #else extractMInt( Mem256, 128, 192) #fi), (#ifMInt eqMInt( maxcmp_double(extractMInt( getParentValue(R2, RSMap), 192, 256), extractMInt( Mem256, 192, 256)), mi(1, 1)) #then extractMInt( getParentValue(R2, RSMap), 192, 256) #else extractMInt( Mem256, 192, 256) #fi))))
      )
    </regstate>
endmodule

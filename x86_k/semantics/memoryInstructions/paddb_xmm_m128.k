// Autogenerated using stratification.
requires "x86-configuration.k"

module PADDB-XMM-M128
  imports X86-CONFIGURATION

  context execinstr(paddb:Opcode HOLE:Mem, R2:Xmm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (paddb:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm,  .Operands) =>
      loadFromMemory( MemOff, 128) ~>
      execinstr (paddb memOffset( MemOff), R2:Xmm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem128:MInt):MemLoadValue ~> execinstr (paddb:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 128), concatenateMInt( addMInt( extractMInt( getParentValue(R2, RSMap), 128, 136), extractMInt( Mem128, 0, 8)), concatenateMInt( addMInt( extractMInt( getParentValue(R2, RSMap), 136, 144), extractMInt( Mem128, 8, 16)), concatenateMInt( addMInt( extractMInt( getParentValue(R2, RSMap), 144, 152), extractMInt( Mem128, 16, 24)), concatenateMInt( addMInt( extractMInt( getParentValue(R2, RSMap), 152, 160), extractMInt( Mem128, 24, 32)), concatenateMInt( addMInt( extractMInt( getParentValue(R2, RSMap), 160, 168), extractMInt( Mem128, 32, 40)), concatenateMInt( addMInt( extractMInt( getParentValue(R2, RSMap), 168, 176), extractMInt( Mem128, 40, 48)), concatenateMInt( addMInt( extractMInt( getParentValue(R2, RSMap), 176, 184), extractMInt( Mem128, 48, 56)), concatenateMInt( addMInt( extractMInt( getParentValue(R2, RSMap), 184, 192), extractMInt( Mem128, 56, 64)), concatenateMInt( addMInt( extractMInt( getParentValue(R2, RSMap), 192, 200), extractMInt( Mem128, 64, 72)), concatenateMInt( addMInt( extractMInt( getParentValue(R2, RSMap), 200, 208), extractMInt( Mem128, 72, 80)), concatenateMInt( addMInt( extractMInt( getParentValue(R2, RSMap), 208, 216), extractMInt( Mem128, 80, 88)), concatenateMInt( addMInt( extractMInt( getParentValue(R2, RSMap), 216, 224), extractMInt( Mem128, 88, 96)), concatenateMInt( addMInt( extractMInt( getParentValue(R2, RSMap), 224, 232), extractMInt( Mem128, 96, 104)), concatenateMInt( addMInt( extractMInt( getParentValue(R2, RSMap), 232, 240), extractMInt( Mem128, 104, 112)), concatenateMInt( addMInt( extractMInt( getParentValue(R2, RSMap), 240, 248), extractMInt( Mem128, 112, 120)), addMInt( extractMInt( getParentValue(R2, RSMap), 248, 256), extractMInt( Mem128, 120, 128))))))))))))))))))
      )
    </regstate>
endmodule

// Autogenerated using stratification.
requires "x86-configuration.k"

module VPCMPGTD-XMM-XMM-M128
  imports X86-CONFIGURATION

  context execinstr(vpcmpgtd:Opcode HOLE:Mem, R2:Xmm, R3:Xmm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vpcmpgtd:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm, R3:Xmm,  .Operands) =>
      loadFromMemory( MemOff, 128) ~>
      execinstr (vpcmpgtd memOffset( MemOff), R2:Xmm, R3:Xmm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem128:MInt):MemLoadValue ~> execinstr (vpcmpgtd:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm, R3:Xmm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( mi(128, 0), concatenateMInt( (#ifMInt sgtMInt( extractMInt( getParentValue(R2, RSMap), 128, 160), extractMInt( Mem128, 0, 32)) #then mi(32, 4294967295) #else mi(32, 0) #fi), concatenateMInt( (#ifMInt sgtMInt( extractMInt( getParentValue(R2, RSMap), 160, 192), extractMInt( Mem128, 32, 64)) #then mi(32, 4294967295) #else mi(32, 0) #fi), concatenateMInt( (#ifMInt sgtMInt( extractMInt( getParentValue(R2, RSMap), 192, 224), extractMInt( Mem128, 64, 96)) #then mi(32, 4294967295) #else mi(32, 0) #fi), (#ifMInt sgtMInt( extractMInt( getParentValue(R2, RSMap), 224, 256), extractMInt( Mem128, 96, 128)) #then mi(32, 4294967295) #else mi(32, 0) #fi)))))
      )
    </regstate>
endmodule

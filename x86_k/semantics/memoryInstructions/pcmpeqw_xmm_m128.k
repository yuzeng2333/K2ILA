// Autogenerated using stratification.
requires "x86-configuration.k"

module PCMPEQW-XMM-M128
  imports X86-CONFIGURATION

  context execinstr(pcmpeqw:Opcode HOLE:Mem, R2:Xmm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (pcmpeqw:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm,  .Operands) =>
      loadFromMemory( MemOff, 128) ~>
      execinstr (pcmpeqw memOffset( MemOff), R2:Xmm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem128:MInt):MemLoadValue ~> execinstr (pcmpeqw:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 128), concatenateMInt( (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 128, 144), extractMInt( Mem128, 0, 16)) #then mi(16, 65535) #else mi(16, 0) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 144, 160), extractMInt( Mem128, 16, 32)) #then mi(16, 65535) #else mi(16, 0) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 160, 176), extractMInt( Mem128, 32, 48)) #then mi(16, 65535) #else mi(16, 0) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 176, 192), extractMInt( Mem128, 48, 64)) #then mi(16, 65535) #else mi(16, 0) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 192, 208), extractMInt( Mem128, 64, 80)) #then mi(16, 65535) #else mi(16, 0) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 208, 224), extractMInt( Mem128, 80, 96)) #then mi(16, 65535) #else mi(16, 0) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 224, 240), extractMInt( Mem128, 96, 112)) #then mi(16, 65535) #else mi(16, 0) #fi), (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 240, 256), extractMInt( Mem128, 112, 128)) #then mi(16, 65535) #else mi(16, 0) #fi)))))))))
      )
    </regstate>
endmodule

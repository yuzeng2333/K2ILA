// Autogenerated using stratification.
requires "x86-configuration.k"

module VTESTPS-XMM-M128
  imports X86-CONFIGURATION

  context execinstr(vtestps:Opcode HOLE:Mem, R2:Xmm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vtestps:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm,  .Operands) =>
      loadFromMemory( MemOff, 128) ~>
      execinstr (vtestps memOffset( MemOff), R2:Xmm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem128:MInt):MemLoadValue ~> execinstr (vtestps:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
"CF" |-> (#ifMInt (((eqMInt( andMInt( negMInt( extractMInt( getParentValue(R2, RSMap), 224, 225)), extractMInt( Mem128, 96, 97)), mi(1, 0)) andBool eqMInt( andMInt( negMInt( extractMInt( getParentValue(R2, RSMap), 192, 193)), extractMInt( Mem128, 64, 65)), mi(1, 0))) andBool eqMInt( andMInt( negMInt( extractMInt( getParentValue(R2, RSMap), 160, 161)), extractMInt( Mem128, 32, 33)), mi(1, 0))) andBool eqMInt( andMInt( negMInt( extractMInt( getParentValue(R2, RSMap), 128, 129)), extractMInt( Mem128, 0, 1)), mi(1, 0))) #then mi(1, 1) #else mi(1, 0) #fi)

"PF" |-> mi(1, 0)

"AF" |-> mi(1, 0)

"ZF" |-> (#ifMInt (((eqMInt( andMInt( extractMInt( getParentValue(R2, RSMap), 224, 225), extractMInt( Mem128, 96, 97)), mi(1, 0)) andBool eqMInt( andMInt( extractMInt( getParentValue(R2, RSMap), 192, 193), extractMInt( Mem128, 64, 65)), mi(1, 0))) andBool eqMInt( andMInt( extractMInt( getParentValue(R2, RSMap), 160, 161), extractMInt( Mem128, 32, 33)), mi(1, 0))) andBool eqMInt( andMInt( extractMInt( getParentValue(R2, RSMap), 128, 129), extractMInt( Mem128, 0, 1)), mi(1, 0))) #then mi(1, 1) #else mi(1, 0) #fi)

"SF" |-> mi(1, 0)

"OF" |-> mi(1, 0)
      )
    </regstate>
endmodule

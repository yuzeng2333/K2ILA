// Autogenerated using stratification.
requires "x86-configuration.k"

module BEXTRL-R32-M32-R32
  imports X86-CONFIGURATION

  context execinstr(bextrl:Opcode R1:R32, HOLE:Mem, R3:R32,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (bextrl:Opcode R1:R32, memOffset( MemOff:MInt):MemOffset, R3:R32,  .Operands) =>
      loadFromMemory( MemOff, 32) ~>
      execinstr (bextrl R1, memOffset( MemOff), R3,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem32:MInt):MemLoadValue ~> execinstr (bextrl:Opcode R1:R32, memOffset( MemOff:MInt):MemOffset, R3:R32,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( mi(32, 0), andMInt( extractMInt( lshrMInt( concatenateMInt( mi(480, 0), Mem32), uvalueMInt(concatenateMInt( mi(504, 0), extractMInt( getParentValue(R1, RSMap), 56, 64)))), 480, 512), negMInt( extractMInt( shiftLeftMInt( lshrMInt( mi(512, 18446744073709551615), uvalueMInt(concatenateMInt( mi(504, 0), extractMInt( getParentValue(R1, RSMap), 48, 56)))), uvalueMInt(concatenateMInt( mi(504, 0), extractMInt( getParentValue(R1, RSMap), 48, 56)))), 480, 512))))

"CF" |-> mi(1, 0)

"PF" |-> (undefMInt)

"AF" |-> (undefMInt)

"ZF" |-> (#ifMInt eqMInt( andMInt( extractMInt( lshrMInt( concatenateMInt( mi(480, 0), Mem32), uvalueMInt(concatenateMInt( mi(504, 0), extractMInt( getParentValue(R1, RSMap), 56, 64)))), 480, 512), negMInt( extractMInt( shiftLeftMInt( lshrMInt( mi(512, 18446744073709551615), uvalueMInt(concatenateMInt( mi(504, 0), extractMInt( getParentValue(R1, RSMap), 48, 56)))), uvalueMInt(concatenateMInt( mi(504, 0), extractMInt( getParentValue(R1, RSMap), 48, 56)))), 480, 512))), mi(32, 0)) #then mi(1, 1) #else mi(1, 0) #fi)

"SF" |-> (undefMInt)

"OF" |-> mi(1, 0)
      )
    </regstate>
endmodule

// Autogenerated using stratification.
requires "x86-configuration.k"

module CMPW-M16-R16
  imports X86-CONFIGURATION

  context execinstr(cmpw:Opcode R1:R16, HOLE:Mem,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (cmpw:Opcode R1:R16, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      loadFromMemory( MemOff, 16) ~>
      execinstr (cmpw R1, memOffset( MemOff),  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem16:MInt):MemLoadValue ~> execinstr (cmpw:Opcode R1:R16, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
"CF" |-> (#ifMInt (notBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16)), 0, 1), mi(1, 1))) #then mi(1, 1) #else mi(1, 0) #fi)

"PF" |-> (#ifMInt (notBool (((((((eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16)), 16, 17), mi(1, 1)) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16)), 15, 16), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16)), 14, 15), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16)), 13, 14), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16)), 12, 13), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16)), 11, 12), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16)), 10, 11), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16)), 9, 10), mi(1, 1)))) #then mi(1, 1) #else mi(1, 0) #fi)

"AF" |-> xorMInt( xorMInt( extractMInt( getParentValue(R1, RSMap), 59, 60), extractMInt( Mem16, 11, 12)), extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16)), 12, 13))

"ZF" |-> (#ifMInt eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16)), 1, 17), mi(16, 0)) #then mi(1, 1) #else mi(1, 0) #fi)

"SF" |-> extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16)), 1, 2)

"OF" |-> (#ifMInt ((eqMInt( negMInt( extractMInt( getParentValue(R1, RSMap), 48, 49)), mi(1, 1)) ==Bool eqMInt( extractMInt( Mem16, 0, 1), mi(1, 1))) andBool (notBool (eqMInt( negMInt( extractMInt( getParentValue(R1, RSMap), 48, 49)), mi(1, 1)) ==Bool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(17, 1)), concatenateMInt( mi(1, 0), Mem16)), 1, 2), mi(1, 1))))) #then mi(1, 1) #else mi(1, 0) #fi)
      )
    </regstate>
endmodule

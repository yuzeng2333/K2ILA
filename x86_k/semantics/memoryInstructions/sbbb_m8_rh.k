// Autogenerated using stratification.
requires "x86-configuration.k"

module SBBB-M8-RH
  imports X86-CONFIGURATION

  context execinstr(sbbb:Opcode R1:Rh, HOLE:Mem,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (sbbb:Opcode R1:Rh, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      loadFromMemory( MemOff, 8) ~>
      execinstr (sbbb R1:Rh, memOffset( MemOff),  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem8:MInt):MemLoadValue ~> execinstr (sbbb:Opcode R1:Rh, memOffset( MemOff:MInt):MemOffset,  .Operands) =>
      
            storeToMemory(
              extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))), mi(9, 1)) #fi), concatenateMInt( mi(1, 0), Mem8)), 1, 9),
              MemOff,
              8
            )
          
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
"CF" |-> (#ifMInt (notBool eqMInt( extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))), mi(9, 1)) #fi), concatenateMInt( mi(1, 0), Mem8)), 0, 1), mi(1, 1))) #then mi(1, 1) #else mi(1, 0) #fi)

"PF" |-> (#ifMInt (notBool (((((((eqMInt( extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))), mi(9, 1)) #fi), concatenateMInt( mi(1, 0), Mem8)), 8, 9), mi(1, 1)) xorBool eqMInt( extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))), mi(9, 1)) #fi), concatenateMInt( mi(1, 0), Mem8)), 7, 8), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))), mi(9, 1)) #fi), concatenateMInt( mi(1, 0), Mem8)), 6, 7), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))), mi(9, 1)) #fi), concatenateMInt( mi(1, 0), Mem8)), 5, 6), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))), mi(9, 1)) #fi), concatenateMInt( mi(1, 0), Mem8)), 4, 5), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))), mi(9, 1)) #fi), concatenateMInt( mi(1, 0), Mem8)), 3, 4), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))), mi(9, 1)) #fi), concatenateMInt( mi(1, 0), Mem8)), 2, 3), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))), mi(9, 1)) #fi), concatenateMInt( mi(1, 0), Mem8)), 1, 2), mi(1, 1)))) #then mi(1, 1) #else mi(1, 0) #fi)

"AF" |-> xorMInt( xorMInt( extractMInt( getParentValue(R1, RSMap), 51, 52), extractMInt( Mem8, 3, 4)), extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))), mi(9, 1)) #fi), concatenateMInt( mi(1, 0), Mem8)), 4, 5))

"ZF" |-> (#ifMInt eqMInt( extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))), mi(9, 1)) #fi), concatenateMInt( mi(1, 0), Mem8)), 1, 9), mi(8, 0)) #then mi(1, 1) #else mi(1, 0) #fi)

"SF" |-> extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))), mi(9, 1)) #fi), concatenateMInt( mi(1, 0), Mem8)), 1, 2)

"OF" |-> (#ifMInt ((eqMInt( negMInt( extractMInt( getParentValue(R1, RSMap), 48, 49)), mi(1, 1)) ==Bool eqMInt( extractMInt( Mem8, 0, 1), mi(1, 1))) andBool (notBool (eqMInt( negMInt( extractMInt( getParentValue(R1, RSMap), 48, 49)), mi(1, 1)) ==Bool eqMInt( extractMInt( addMInt( (#ifMInt eqMInt(getFlag("CF", RSMap), mi(1,1)) #then concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))) #else addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 56))), mi(9, 1)) #fi), concatenateMInt( mi(1, 0), Mem8)), 1, 2), mi(1, 1))))) #then mi(1, 1) #else mi(1, 0) #fi)
      )
    </regstate>
endmodule

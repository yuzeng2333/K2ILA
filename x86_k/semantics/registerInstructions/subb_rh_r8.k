// Autogenerated using stratification.
requires "x86-configuration.k"

module SUBB-RH-R8
  imports X86-CONFIGURATION

  rule <k>
    execinstr (subb R1:R8, R2:Rh,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 48), extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 56, 64))), mi(9, 1)), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 56))), 1, 9)), extractMInt( getParentValue(R2, RSMap), 56, 64))

"CF" |-> (#ifMInt (notBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 56, 64))), mi(9, 1)), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 56))), 0, 1), mi(1, 1))) #then mi(1, 1) #else mi(1, 0) #fi)

"PF" |-> (#ifMInt (notBool (((((((eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 56, 64))), mi(9, 1)), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 56))), 8, 9), mi(1, 1)) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 56, 64))), mi(9, 1)), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 56))), 7, 8), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 56, 64))), mi(9, 1)), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 56))), 6, 7), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 56, 64))), mi(9, 1)), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 56))), 5, 6), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 56, 64))), mi(9, 1)), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 56))), 4, 5), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 56, 64))), mi(9, 1)), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 56))), 3, 4), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 56, 64))), mi(9, 1)), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 56))), 2, 3), mi(1, 1))) xorBool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 56, 64))), mi(9, 1)), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 56))), 1, 2), mi(1, 1)))) #then mi(1, 1) #else mi(1, 0) #fi)

"AF" |-> xorMInt( xorMInt( extractMInt( getParentValue(R1, RSMap), 59, 60), extractMInt( getParentValue(R2, RSMap), 51, 52)), extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 56, 64))), mi(9, 1)), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 56))), 4, 5))

"ZF" |-> (#ifMInt eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 56, 64))), mi(9, 1)), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 56))), 1, 9), mi(8, 0)) #then mi(1, 1) #else mi(1, 0) #fi)

"SF" |-> extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 56, 64))), mi(9, 1)), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 56))), 1, 2)

"OF" |-> (#ifMInt ((eqMInt( negMInt( extractMInt( getParentValue(R1, RSMap), 56, 57)), mi(1, 1)) ==Bool eqMInt( extractMInt( getParentValue(R2, RSMap), 48, 49), mi(1, 1))) andBool (notBool (eqMInt( negMInt( extractMInt( getParentValue(R1, RSMap), 56, 57)), mi(1, 1)) ==Bool eqMInt( extractMInt( addMInt( addMInt( concatenateMInt( mi(1, 0), negMInt( extractMInt( getParentValue(R1, RSMap), 56, 64))), mi(9, 1)), concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 48, 56))), 1, 2), mi(1, 1))))) #then mi(1, 1) #else mi(1, 0) #fi)
)

    </regstate>
    
endmodule

module SUBB-RH-R8-SEMANTICS
  imports SUBB-RH-R8
endmodule

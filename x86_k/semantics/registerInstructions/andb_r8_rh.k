// Autogenerated using stratification.
requires "x86-configuration.k"

module ANDB-R8-RH
  imports X86-CONFIGURATION

  rule <k>
    execinstr (andb R1:Rh, R2:R8,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 56), andMInt( extractMInt( getParentValue(R2, RSMap), 56, 64), extractMInt( getParentValue(R1, RSMap), 48, 56)))

"CF" |-> mi(1, 0)

"PF" |-> (#ifMInt (notBool (((((((eqMInt( andMInt( extractMInt( getParentValue(R2, RSMap), 63, 64), extractMInt( getParentValue(R1, RSMap), 55, 56)), mi(1, 1)) xorBool eqMInt( andMInt( extractMInt( getParentValue(R2, RSMap), 62, 63), extractMInt( getParentValue(R1, RSMap), 54, 55)), mi(1, 1))) xorBool eqMInt( andMInt( extractMInt( getParentValue(R2, RSMap), 61, 62), extractMInt( getParentValue(R1, RSMap), 53, 54)), mi(1, 1))) xorBool eqMInt( andMInt( extractMInt( getParentValue(R2, RSMap), 60, 61), extractMInt( getParentValue(R1, RSMap), 52, 53)), mi(1, 1))) xorBool eqMInt( andMInt( extractMInt( getParentValue(R2, RSMap), 59, 60), extractMInt( getParentValue(R1, RSMap), 51, 52)), mi(1, 1))) xorBool eqMInt( andMInt( extractMInt( getParentValue(R2, RSMap), 58, 59), extractMInt( getParentValue(R1, RSMap), 50, 51)), mi(1, 1))) xorBool eqMInt( andMInt( extractMInt( getParentValue(R2, RSMap), 57, 58), extractMInt( getParentValue(R1, RSMap), 49, 50)), mi(1, 1))) xorBool eqMInt( andMInt( extractMInt( getParentValue(R2, RSMap), 56, 57), extractMInt( getParentValue(R1, RSMap), 48, 49)), mi(1, 1)))) #then mi(1, 1) #else mi(1, 0) #fi)

"AF" |-> (undefMInt)

"ZF" |-> (#ifMInt eqMInt( andMInt( extractMInt( getParentValue(R2, RSMap), 56, 64), extractMInt( getParentValue(R1, RSMap), 48, 56)), mi(8, 0)) #then mi(1, 1) #else mi(1, 0) #fi)

"SF" |-> andMInt( extractMInt( getParentValue(R2, RSMap), 56, 57), extractMInt( getParentValue(R1, RSMap), 48, 49))

"OF" |-> mi(1, 0)
)

    </regstate>
    
endmodule

module ANDB-R8-RH-SEMANTICS
  imports ANDB-R8-RH
endmodule



// Autogenerated using stratification.
requires "x86-configuration.k"

module SHLB-R8-ONE
  imports X86-CONFIGURATION

  rule <k>
    execinstr (shlb $0x1, R2:R8,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 56), extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 56, 64)), uvalueMInt(mi(9, 1))), 1, 9))

"CF" |-> extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 56, 64)), uvalueMInt(mi(9, 1))), 0, 1)

"PF" |-> (#ifMInt (notBool (((((((eqMInt( extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 56, 64)), uvalueMInt(mi(9, 1))), 8, 9), mi(1, 1)) xorBool eqMInt( extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 56, 64)), uvalueMInt(mi(9, 1))), 7, 8), mi(1, 1))) xorBool eqMInt( extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 56, 64)), uvalueMInt(mi(9, 1))), 6, 7), mi(1, 1))) xorBool eqMInt( extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 56, 64)), uvalueMInt(mi(9, 1))), 5, 6), mi(1, 1))) xorBool eqMInt( extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 56, 64)), uvalueMInt(mi(9, 1))), 4, 5), mi(1, 1))) xorBool eqMInt( extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 56, 64)), uvalueMInt(mi(9, 1))), 3, 4), mi(1, 1))) xorBool eqMInt( extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 56, 64)), uvalueMInt(mi(9, 1))), 2, 3), mi(1, 1))) xorBool eqMInt( extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 56, 64)), uvalueMInt(mi(9, 1))), 1, 2), mi(1, 1)))) #then mi(1, 1) #else mi(1, 0) #fi)

"AF" |-> (undefMInt)

"ZF" |-> (#ifMInt eqMInt( extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 56, 64)), uvalueMInt(mi(9, 1))), 1, 9), mi(8, 0)) #then mi(1, 1) #else mi(1, 0) #fi)

"SF" |-> extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 56, 64)), uvalueMInt(mi(9, 1))), 1, 2)

"OF" |-> (#ifMInt (eqMInt( extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 56, 64)), uvalueMInt(mi(9, 1))), 0, 1), mi(1, 1)) xorBool eqMInt( extractMInt( shiftLeftMInt( concatenateMInt( mi(1, 0), extractMInt( getParentValue(R2, RSMap), 56, 64)), uvalueMInt(mi(9, 1))), 1, 2), mi(1, 1))) #then mi(1, 1) #else mi(1, 0) #fi)
)

    </regstate>
    
endmodule

module SHLB-R8-ONE-SEMANTICS
  imports SHLB-R8-ONE
endmodule

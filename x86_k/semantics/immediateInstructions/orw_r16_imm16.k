// Autogenerated using stratification.
requires "x86-configuration.k"

module ORW-R16-IMM16
  imports X86-CONFIGURATION

  rule <k>
    execinstr (orw Imm16:Imm, R2:R16,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 48), orMInt( extractMInt( getParentValue(R2, RSMap), 48, 64), handleImmediateWithSignExtend(Imm16, 16, 16)))

"CF" |-> mi(1, 0)

"PF" |-> (#ifMInt (notBool (((((((eqMInt( orMInt( extractMInt( getParentValue(R2, RSMap), 63, 64), extractMInt( handleImmediateWithSignExtend(Imm16, 16, 16), 15, 16)), mi(1, 1)) xorBool eqMInt( orMInt( extractMInt( getParentValue(R2, RSMap), 62, 63), extractMInt( handleImmediateWithSignExtend(Imm16, 16, 16), 14, 15)), mi(1, 1))) xorBool eqMInt( orMInt( extractMInt( getParentValue(R2, RSMap), 61, 62), extractMInt( handleImmediateWithSignExtend(Imm16, 16, 16), 13, 14)), mi(1, 1))) xorBool eqMInt( orMInt( extractMInt( getParentValue(R2, RSMap), 60, 61), extractMInt( handleImmediateWithSignExtend(Imm16, 16, 16), 12, 13)), mi(1, 1))) xorBool eqMInt( orMInt( extractMInt( getParentValue(R2, RSMap), 59, 60), extractMInt( handleImmediateWithSignExtend(Imm16, 16, 16), 11, 12)), mi(1, 1))) xorBool eqMInt( orMInt( extractMInt( getParentValue(R2, RSMap), 58, 59), extractMInt( handleImmediateWithSignExtend(Imm16, 16, 16), 10, 11)), mi(1, 1))) xorBool eqMInt( orMInt( extractMInt( getParentValue(R2, RSMap), 57, 58), extractMInt( handleImmediateWithSignExtend(Imm16, 16, 16), 9, 10)), mi(1, 1))) xorBool eqMInt( orMInt( extractMInt( getParentValue(R2, RSMap), 56, 57), extractMInt( handleImmediateWithSignExtend(Imm16, 16, 16), 8, 9)), mi(1, 1)))) #then mi(1, 1) #else mi(1, 0) #fi)

"AF" |-> (undefMInt)

"ZF" |-> (#ifMInt eqMInt( orMInt( extractMInt( getParentValue(R2, RSMap), 48, 64), handleImmediateWithSignExtend(Imm16, 16, 16)), mi(16, 0)) #then mi(1, 1) #else mi(1, 0) #fi)

"SF" |-> orMInt( extractMInt( getParentValue(R2, RSMap), 48, 49), extractMInt( handleImmediateWithSignExtend(Imm16, 16, 16), 0, 1))

"OF" |-> mi(1, 0)
)

    </regstate>
    
endmodule

module ORW-R16-IMM16-SEMANTICS
  imports ORW-R16-IMM16
endmodule

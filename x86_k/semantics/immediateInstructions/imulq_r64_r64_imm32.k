// Autogenerated using stratification.
requires "x86-configuration.k"

module IMULQ-R64-R64-IMM32
  imports X86-CONFIGURATION

  rule <k>
    execinstr (imulq Imm32:Imm, R2:R64, R3:R64,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> extractMInt( mulMInt( mi(128, svalueMInt(getParentValue(R2, RSMap))), mi(128, svalueMInt(handleImmediateWithSignExtend(Imm32, 32, 32)))), 64, 128)

"CF" |-> (#ifMInt (notBool eqMInt( mulMInt( mi(128, svalueMInt(getParentValue(R2, RSMap))), mi(128, svalueMInt(handleImmediateWithSignExtend(Imm32, 32, 32)))), mi(128, svalueMInt(extractMInt( mulMInt( mi(128, svalueMInt(getParentValue(R2, RSMap))), mi(128, svalueMInt(handleImmediateWithSignExtend(Imm32, 32, 32)))), 64, 128))))) #then mi(1, 1) #else mi(1, 0) #fi)

"PF" |-> (undefMInt)

"AF" |-> (undefMInt)

"ZF" |-> (undefMInt)

"SF" |-> (undefMInt)

"OF" |-> (#ifMInt (notBool eqMInt( mulMInt( mi(128, svalueMInt(getParentValue(R2, RSMap))), mi(128, svalueMInt(handleImmediateWithSignExtend(Imm32, 32, 32)))), mi(128, svalueMInt(extractMInt( mulMInt( mi(128, svalueMInt(getParentValue(R2, RSMap))), mi(128, svalueMInt(handleImmediateWithSignExtend(Imm32, 32, 32)))), 64, 128))))) #then mi(1, 1) #else mi(1, 0) #fi)
)

    </regstate>
    
endmodule

module IMULQ-R64-R64-IMM32-SEMANTICS
  imports IMULQ-R64-R64-IMM32
endmodule

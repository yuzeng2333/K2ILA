// Autogenerated using stratification.
requires "x86-configuration.k"

module IMULW-R16
  imports X86-CONFIGURATION

  rule <k>
    execinstr (imulw R1:R16,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
"RAX" |-> concatenateMInt( extractMInt( getParentValue(%rax, RSMap), 0, 48), extractMInt( mulMInt( mi(32, svalueMInt(extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(32, svalueMInt(extractMInt( getParentValue(%rax, RSMap), 48, 64)))), 16, 32))

"RDX" |-> concatenateMInt( extractMInt( getParentValue(%rdx, RSMap), 0, 48), extractMInt( mulMInt( mi(32, svalueMInt(extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(32, svalueMInt(extractMInt( getParentValue(%rax, RSMap), 48, 64)))), 0, 16))

"CF" |-> (#ifMInt (notBool eqMInt( mulMInt( mi(32, svalueMInt(extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(32, svalueMInt(extractMInt( getParentValue(%rax, RSMap), 48, 64)))), mi(32, svalueMInt(extractMInt( mulMInt( mi(32, svalueMInt(extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(32, svalueMInt(extractMInt( getParentValue(%rax, RSMap), 48, 64)))), 16, 32))))) #then mi(1, 1) #else mi(1, 0) #fi)

"PF" |-> (undefMInt)

"AF" |-> (undefMInt)

"ZF" |-> (undefMInt)

"SF" |-> (undefMInt)

"OF" |-> (#ifMInt (notBool eqMInt( mulMInt( mi(32, svalueMInt(extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(32, svalueMInt(extractMInt( getParentValue(%rax, RSMap), 48, 64)))), mi(32, svalueMInt(extractMInt( mulMInt( mi(32, svalueMInt(extractMInt( getParentValue(R1, RSMap), 48, 64))), mi(32, svalueMInt(extractMInt( getParentValue(%rax, RSMap), 48, 64)))), 16, 32))))) #then mi(1, 1) #else mi(1, 0) #fi)
)

    </regstate>
    
endmodule

module IMULW-R16-SEMANTICS
  imports IMULW-R16
endmodule

// Autogenerated using stratification.
requires "x86-configuration.k"

module IDIVL-R32
  imports X86-CONFIGURATION

  rule <k>
    execinstr (idivl R1:R32,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
"RAX" |-> concatenateMInt( mi(32, 0), idiv_quotient_int32(concatenateMInt( extractMInt( getParentValue(%rdx, RSMap), 32, 64), extractMInt( getParentValue(%rax, RSMap), 32, 64)), extractMInt( getParentValue(R1, RSMap), 32, 64)))

"RDX" |-> concatenateMInt( mi(32, 0), idiv_remainder_int32(concatenateMInt( extractMInt( getParentValue(%rdx, RSMap), 32, 64), extractMInt( getParentValue(%rax, RSMap), 32, 64)), extractMInt( getParentValue(R1, RSMap), 32, 64)))

"CF" |-> (undefMInt)

"PF" |-> (undefMInt)

"AF" |-> (undefMInt)

"ZF" |-> (undefMInt)

"SF" |-> (undefMInt)

"OF" |-> (undefMInt)
)

    </regstate>
    
endmodule

module IDIVL-R32-SEMANTICS
  imports IDIVL-R32
endmodule

// Autogenerated using stratification.
requires "x86-configuration.k"

module IDIVW-R16
  imports X86-CONFIGURATION

  rule <k>
    execinstr (idivw R1:R16,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
"RAX" |-> concatenateMInt( extractMInt( getParentValue(%rax, RSMap), 0, 48), idiv_quotient_int16(concatenateMInt( extractMInt( getParentValue(%rdx, RSMap), 48, 64), extractMInt( getParentValue(%rax, RSMap), 48, 64)), extractMInt( getParentValue(R1, RSMap), 48, 64)))

"RDX" |-> concatenateMInt( extractMInt( getParentValue(%rdx, RSMap), 0, 48), idiv_remainder_int16(concatenateMInt( extractMInt( getParentValue(%rdx, RSMap), 48, 64), extractMInt( getParentValue(%rax, RSMap), 48, 64)), extractMInt( getParentValue(R1, RSMap), 48, 64)))

"CF" |-> (undefMInt)

"PF" |-> (undefMInt)

"AF" |-> (undefMInt)

"ZF" |-> (undefMInt)

"SF" |-> (undefMInt)

"OF" |-> (undefMInt)
)

    </regstate>
    
endmodule

module IDIVW-R16-SEMANTICS
  imports IDIVW-R16
endmodule

// Autogenerated using stratification.
requires "x86-configuration.k"

module DIVB-R8
  imports X86-CONFIGURATION

  rule <k>
    execinstr (divb R1:R8,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
"RAX" |-> concatenateMInt( concatenateMInt( extractMInt( getParentValue(%rax, RSMap), 0, 48), div_remainder_int8(extractMInt( getParentValue(%rax, RSMap), 48, 64), extractMInt( getParentValue(R1, RSMap), 56, 64))), div_quotient_int8(extractMInt( getParentValue(%rax, RSMap), 48, 64), extractMInt( getParentValue(R1, RSMap), 56, 64)))

"CF" |-> (undefMInt)

"PF" |-> (undefMInt)

"AF" |-> (undefMInt)

"ZF" |-> (undefMInt)

"SF" |-> (undefMInt)

"OF" |-> (undefMInt)
)

    </regstate>
    
endmodule

module DIVB-R8-SEMANTICS
  imports DIVB-R8
endmodule

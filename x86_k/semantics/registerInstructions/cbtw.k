// Autogenerated using stratification.
requires "x86-configuration.k"

module CBTW
  imports X86-CONFIGURATION

  rule <k>
    execinstr (cbtw  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
"RAX" |-> concatenateMInt( extractMInt( getParentValue(%rax, RSMap), 0, 48), mi(16, svalueMInt(extractMInt( getParentValue(%rax, RSMap), 56, 64))))
)

    </regstate>
    
endmodule

module CBTW-SEMANTICS
  imports CBTW
endmodule

// Autogenerated using stratification.
requires "x86-configuration.k"

module PUNPCKHQDQ-XMM-XMM
  imports X86-CONFIGURATION

  rule <k>
    execinstr (punpckhqdq R1:Xmm, R2:Xmm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 128), concatenateMInt( extractMInt( getParentValue(R1, RSMap), 128, 192), extractMInt( getParentValue(R2, RSMap), 128, 192)))
)

    </regstate>
    
endmodule

module PUNPCKHQDQ-XMM-XMM-SEMANTICS
  imports PUNPCKHQDQ-XMM-XMM
endmodule

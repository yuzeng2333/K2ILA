// Autogenerated using stratification.
requires "x86-configuration.k"

module MOVZWL-R32-R16
  imports X86-CONFIGURATION

  rule <k>
    execinstr (movzwl R1:R16, R2:R32,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( mi(48, 0), extractMInt( getParentValue(R1, RSMap), 48, 64))
)

    </regstate>
    
endmodule

module MOVZWL-R32-R16-SEMANTICS
  imports MOVZWL-R32-R16
endmodule

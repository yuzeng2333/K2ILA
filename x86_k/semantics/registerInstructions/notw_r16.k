// Autogenerated using stratification.
requires "x86-configuration.k"

module NOTW-R16
  imports X86-CONFIGURATION

  rule <k>
    execinstr (notw R1:R16,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R1) |-> concatenateMInt( extractMInt( getParentValue(R1, RSMap), 0, 48), negMInt( extractMInt( getParentValue(R1, RSMap), 48, 64)))
)

    </regstate>
    
endmodule

module NOTW-R16-SEMANTICS
  imports NOTW-R16
endmodule

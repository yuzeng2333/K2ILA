// Autogenerated using stratification.
requires "x86-configuration.k"

module PHADDD-XMM-XMM
  imports X86-CONFIGURATION

  rule <k>
    execinstr (phaddd R1:Xmm, R2:Xmm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 128), concatenateMInt( concatenateMInt( concatenateMInt( addMInt( extractMInt( getParentValue(R1, RSMap), 128, 160), extractMInt( getParentValue(R1, RSMap), 160, 192)), addMInt( extractMInt( getParentValue(R1, RSMap), 192, 224), extractMInt( getParentValue(R1, RSMap), 224, 256))), addMInt( extractMInt( getParentValue(R2, RSMap), 128, 160), extractMInt( getParentValue(R2, RSMap), 160, 192))), addMInt( extractMInt( getParentValue(R2, RSMap), 192, 224), extractMInt( getParentValue(R2, RSMap), 224, 256))))
)

    </regstate>
    
endmodule

module PHADDD-XMM-XMM-SEMANTICS
  imports PHADDD-XMM-XMM
endmodule

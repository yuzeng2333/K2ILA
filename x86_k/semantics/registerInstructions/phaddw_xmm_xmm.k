// Autogenerated using stratification.
requires "x86-configuration.k"

module PHADDW-XMM-XMM
  imports X86-CONFIGURATION

  rule <k>
    execinstr (phaddw R1:Xmm, R2:Xmm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 128), concatenateMInt( concatenateMInt( concatenateMInt( concatenateMInt( concatenateMInt( concatenateMInt( concatenateMInt( addMInt( extractMInt( getParentValue(R1, RSMap), 128, 144), extractMInt( getParentValue(R1, RSMap), 144, 160)), addMInt( extractMInt( getParentValue(R1, RSMap), 160, 176), extractMInt( getParentValue(R1, RSMap), 176, 192))), addMInt( extractMInt( getParentValue(R1, RSMap), 192, 208), extractMInt( getParentValue(R1, RSMap), 208, 224))), addMInt( extractMInt( getParentValue(R1, RSMap), 224, 240), extractMInt( getParentValue(R1, RSMap), 240, 256))), addMInt( extractMInt( getParentValue(R2, RSMap), 128, 144), extractMInt( getParentValue(R2, RSMap), 144, 160))), addMInt( extractMInt( getParentValue(R2, RSMap), 160, 176), extractMInt( getParentValue(R2, RSMap), 176, 192))), addMInt( extractMInt( getParentValue(R2, RSMap), 192, 208), extractMInt( getParentValue(R2, RSMap), 208, 224))), addMInt( extractMInt( getParentValue(R2, RSMap), 224, 240), extractMInt( getParentValue(R2, RSMap), 240, 256))))
)

    </regstate>
    
endmodule

module PHADDW-XMM-XMM-SEMANTICS
  imports PHADDW-XMM-XMM
endmodule

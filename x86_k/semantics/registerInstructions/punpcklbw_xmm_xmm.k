// Autogenerated using stratification.
requires "x86-configuration.k"

module PUNPCKLBW-XMM-XMM
  imports X86-CONFIGURATION

  rule <k>
    execinstr (punpcklbw R1:Xmm, R2:Xmm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 128), concatenateMInt( concatenateMInt( extractMInt( getParentValue(R1, RSMap), 192, 200), extractMInt( getParentValue(R2, RSMap), 192, 200)), concatenateMInt( concatenateMInt( extractMInt( getParentValue(R1, RSMap), 200, 208), extractMInt( getParentValue(R2, RSMap), 200, 208)), concatenateMInt( concatenateMInt( extractMInt( getParentValue(R1, RSMap), 208, 216), extractMInt( getParentValue(R2, RSMap), 208, 216)), concatenateMInt( concatenateMInt( extractMInt( getParentValue(R1, RSMap), 216, 224), extractMInt( getParentValue(R2, RSMap), 216, 224)), concatenateMInt( concatenateMInt( extractMInt( getParentValue(R1, RSMap), 224, 232), extractMInt( getParentValue(R2, RSMap), 224, 232)), concatenateMInt( concatenateMInt( extractMInt( getParentValue(R1, RSMap), 232, 240), extractMInt( getParentValue(R2, RSMap), 232, 240)), concatenateMInt( concatenateMInt( extractMInt( getParentValue(R1, RSMap), 240, 248), extractMInt( getParentValue(R2, RSMap), 240, 248)), concatenateMInt( extractMInt( getParentValue(R1, RSMap), 248, 256), extractMInt( getParentValue(R2, RSMap), 248, 256))))))))))
)

    </regstate>
    
endmodule

module PUNPCKLBW-XMM-XMM-SEMANTICS
  imports PUNPCKLBW-XMM-XMM
endmodule

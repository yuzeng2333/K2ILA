// Autogenerated using stratification.
requires "x86-configuration.k"

module VMOVMSKPS-R64-XMM
  imports X86-CONFIGURATION

  rule <k>
    execinstr (vmovmskps R1:Xmm, R2:R64,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( mi(60, 0), concatenateMInt( extractMInt( getParentValue(R1, RSMap), 128, 129), concatenateMInt( extractMInt( getParentValue(R1, RSMap), 160, 161), concatenateMInt( extractMInt( getParentValue(R1, RSMap), 192, 193), extractMInt( getParentValue(R1, RSMap), 224, 225)))))
)

    </regstate>
    
endmodule

module VMOVMSKPS-R64-XMM-SEMANTICS
  imports VMOVMSKPS-R64-XMM
endmodule

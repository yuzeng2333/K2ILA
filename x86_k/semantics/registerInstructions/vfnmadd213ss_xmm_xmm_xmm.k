// Autogenerated using stratification.
requires "x86-configuration.k"

module VFNMADD213SS-XMM-XMM-XMM
  imports X86-CONFIGURATION

  rule <k>
    execinstr (vfnmadd213ss R1:Xmm, R2:Xmm, R3:Xmm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( mi(128, 0), concatenateMInt( extractMInt( getParentValue(R3, RSMap), 128, 224), vfnmadd213_single(extractMInt( getParentValue(R3, RSMap), 224, 256), extractMInt( getParentValue(R2, RSMap), 224, 256), extractMInt( getParentValue(R1, RSMap), 224, 256))))
)

    </regstate>
    
endmodule

module VFNMADD213SS-XMM-XMM-XMM-SEMANTICS
  imports VFNMADD213SS-XMM-XMM-XMM
endmodule

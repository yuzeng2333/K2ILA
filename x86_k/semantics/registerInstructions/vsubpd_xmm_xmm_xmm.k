// Autogenerated using stratification.
requires "x86-configuration.k"

module VSUBPD-XMM-XMM-XMM
  imports X86-CONFIGURATION

  rule <k>
    execinstr (vsubpd R1:Xmm, R2:Xmm, R3:Xmm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( mi(128, 0), concatenateMInt( sub_double(extractMInt( getParentValue(R2, RSMap), 128, 192), extractMInt( getParentValue(R1, RSMap), 128, 192)), sub_double(extractMInt( getParentValue(R2, RSMap), 192, 256), extractMInt( getParentValue(R1, RSMap), 192, 256))))
)

    </regstate>
    
endmodule

module VSUBPD-XMM-XMM-XMM-SEMANTICS
  imports VSUBPD-XMM-XMM-XMM
endmodule

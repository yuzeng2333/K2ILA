// Autogenerated using stratification.
requires "x86-configuration.k"

module VUNPCKHPD-XMM-XMM-XMM
  imports X86-CONFIGURATION

  rule <k>
    execinstr (vunpckhpd R1:Xmm, R2:Xmm, R3:Xmm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( mi(128, 0), concatenateMInt( extractMInt( getParentValue(R1, RSMap), 128, 192), extractMInt( getParentValue(R2, RSMap), 128, 192)))
)

    </regstate>
    
endmodule

module VUNPCKHPD-XMM-XMM-XMM-SEMANTICS
  imports VUNPCKHPD-XMM-XMM-XMM
endmodule

// Autogenerated using stratification.
requires "x86-configuration.k"

module PCMPGTD-XMM-XMM
  imports X86-CONFIGURATION

  rule <k>
    execinstr (pcmpgtd R1:Xmm, R2:Xmm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 128), concatenateMInt( (#ifMInt sgtMInt( extractMInt( getParentValue(R2, RSMap), 128, 160), extractMInt( getParentValue(R1, RSMap), 128, 160)) #then mi(32, 4294967295) #else mi(32, 0) #fi), concatenateMInt( (#ifMInt sgtMInt( extractMInt( getParentValue(R2, RSMap), 160, 192), extractMInt( getParentValue(R1, RSMap), 160, 192)) #then mi(32, 4294967295) #else mi(32, 0) #fi), concatenateMInt( (#ifMInt sgtMInt( extractMInt( getParentValue(R2, RSMap), 192, 224), extractMInt( getParentValue(R1, RSMap), 192, 224)) #then mi(32, 4294967295) #else mi(32, 0) #fi), (#ifMInt sgtMInt( extractMInt( getParentValue(R2, RSMap), 224, 256), extractMInt( getParentValue(R1, RSMap), 224, 256)) #then mi(32, 4294967295) #else mi(32, 0) #fi)))))
)

    </regstate>
    
endmodule

module PCMPGTD-XMM-XMM-SEMANTICS
  imports PCMPGTD-XMM-XMM
endmodule

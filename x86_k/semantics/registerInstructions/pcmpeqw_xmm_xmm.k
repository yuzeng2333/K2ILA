// Autogenerated using stratification.
requires "x86-configuration.k"

module PCMPEQW-XMM-XMM
  imports X86-CONFIGURATION

  rule <k>
    execinstr (pcmpeqw R1:Xmm, R2:Xmm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 128), concatenateMInt( (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 128, 144), extractMInt( getParentValue(R1, RSMap), 128, 144)) #then mi(16, 65535) #else mi(16, 0) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 144, 160), extractMInt( getParentValue(R1, RSMap), 144, 160)) #then mi(16, 65535) #else mi(16, 0) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 160, 176), extractMInt( getParentValue(R1, RSMap), 160, 176)) #then mi(16, 65535) #else mi(16, 0) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 176, 192), extractMInt( getParentValue(R1, RSMap), 176, 192)) #then mi(16, 65535) #else mi(16, 0) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 192, 208), extractMInt( getParentValue(R1, RSMap), 192, 208)) #then mi(16, 65535) #else mi(16, 0) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 208, 224), extractMInt( getParentValue(R1, RSMap), 208, 224)) #then mi(16, 65535) #else mi(16, 0) #fi), concatenateMInt( (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 224, 240), extractMInt( getParentValue(R1, RSMap), 224, 240)) #then mi(16, 65535) #else mi(16, 0) #fi), (#ifMInt eqMInt( extractMInt( getParentValue(R2, RSMap), 240, 256), extractMInt( getParentValue(R1, RSMap), 240, 256)) #then mi(16, 65535) #else mi(16, 0) #fi)))))))))
)

    </regstate>
    
endmodule

module PCMPEQW-XMM-XMM-SEMANTICS
  imports PCMPEQW-XMM-XMM
endmodule

// Autogenerated using stratification.
requires "x86-configuration.k"

module VMAXPS-XMM-XMM-XMM
  imports X86-CONFIGURATION

  rule <k>
    execinstr (vmaxps R1:Xmm, R2:Xmm, R3:Xmm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( mi(128, 0), concatenateMInt( (#ifMInt eqMInt( maxcmp_single(extractMInt( getParentValue(R2, RSMap), 128, 160), extractMInt( getParentValue(R1, RSMap), 128, 160)), mi(1, 1)) #then extractMInt( getParentValue(R2, RSMap), 128, 160) #else extractMInt( getParentValue(R1, RSMap), 128, 160) #fi), concatenateMInt( (#ifMInt eqMInt( maxcmp_single(extractMInt( getParentValue(R2, RSMap), 160, 192), extractMInt( getParentValue(R1, RSMap), 160, 192)), mi(1, 1)) #then extractMInt( getParentValue(R2, RSMap), 160, 192) #else extractMInt( getParentValue(R1, RSMap), 160, 192) #fi), concatenateMInt( (#ifMInt eqMInt( maxcmp_single(extractMInt( getParentValue(R2, RSMap), 192, 224), extractMInt( getParentValue(R1, RSMap), 192, 224)), mi(1, 1)) #then extractMInt( getParentValue(R2, RSMap), 192, 224) #else extractMInt( getParentValue(R1, RSMap), 192, 224) #fi), (#ifMInt eqMInt( maxcmp_single(extractMInt( getParentValue(R2, RSMap), 224, 256), extractMInt( getParentValue(R1, RSMap), 224, 256)), mi(1, 1)) #then extractMInt( getParentValue(R2, RSMap), 224, 256) #else extractMInt( getParentValue(R1, RSMap), 224, 256) #fi)))))
)

    </regstate>
    
endmodule

module VMAXPS-XMM-XMM-XMM-SEMANTICS
  imports VMAXPS-XMM-XMM-XMM
endmodule

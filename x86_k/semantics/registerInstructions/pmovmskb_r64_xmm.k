// Autogenerated using stratification.
requires "x86-configuration.k"

module PMOVMSKB-R64-XMM
  imports X86-CONFIGURATION

  rule <k>
    execinstr (pmovmskb R1:Xmm, R2:R64,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( mi(48, 0), concatenateMInt( extractMInt( getParentValue(R1, RSMap), 128, 129), concatenateMInt( extractMInt( getParentValue(R1, RSMap), 136, 137), concatenateMInt( extractMInt( getParentValue(R1, RSMap), 144, 145), concatenateMInt( extractMInt( getParentValue(R1, RSMap), 152, 153), concatenateMInt( extractMInt( getParentValue(R1, RSMap), 160, 161), concatenateMInt( extractMInt( getParentValue(R1, RSMap), 168, 169), concatenateMInt( extractMInt( getParentValue(R1, RSMap), 176, 177), concatenateMInt( extractMInt( getParentValue(R1, RSMap), 184, 185), concatenateMInt( extractMInt( getParentValue(R1, RSMap), 192, 193), concatenateMInt( extractMInt( getParentValue(R1, RSMap), 200, 201), concatenateMInt( extractMInt( getParentValue(R1, RSMap), 208, 209), concatenateMInt( extractMInt( getParentValue(R1, RSMap), 216, 217), concatenateMInt( extractMInt( getParentValue(R1, RSMap), 224, 225), concatenateMInt( extractMInt( getParentValue(R1, RSMap), 232, 233), concatenateMInt( extractMInt( getParentValue(R1, RSMap), 240, 241), extractMInt( getParentValue(R1, RSMap), 248, 249)))))))))))))))))
)

    </regstate>
    
endmodule

module PMOVMSKB-R64-XMM-SEMANTICS
  imports PMOVMSKB-R64-XMM
endmodule

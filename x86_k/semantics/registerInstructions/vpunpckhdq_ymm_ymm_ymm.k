// Autogenerated using stratification.
requires "x86-configuration.k"

module VPUNPCKHDQ-YMM-YMM-YMM
  imports X86-CONFIGURATION

  rule <k>
    execinstr (vpunpckhdq R1:Ymm, R2:Ymm, R3:Ymm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( concatenateMInt( extractMInt( getParentValue(R1, RSMap), 0, 32), extractMInt( getParentValue(R2, RSMap), 0, 32)), concatenateMInt( concatenateMInt( extractMInt( getParentValue(R1, RSMap), 32, 64), extractMInt( getParentValue(R2, RSMap), 32, 64)), concatenateMInt( concatenateMInt( extractMInt( getParentValue(R1, RSMap), 128, 160), extractMInt( getParentValue(R2, RSMap), 128, 160)), concatenateMInt( extractMInt( getParentValue(R1, RSMap), 160, 192), extractMInt( getParentValue(R2, RSMap), 160, 192)))))
)

    </regstate>
    
endmodule

module VPUNPCKHDQ-YMM-YMM-YMM-SEMANTICS
  imports VPUNPCKHDQ-YMM-YMM-YMM
endmodule

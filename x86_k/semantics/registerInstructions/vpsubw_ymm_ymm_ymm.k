// Autogenerated using stratification.
requires "x86-configuration.k"

module VPSUBW-YMM-YMM-YMM
  imports X86-CONFIGURATION

  rule <k>
    execinstr (vpsubw R1:Ymm, R2:Ymm, R3:Ymm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( subMInt( extractMInt( getParentValue(R2, RSMap), 0, 16), extractMInt( getParentValue(R1, RSMap), 0, 16)), concatenateMInt( subMInt( extractMInt( getParentValue(R2, RSMap), 16, 32), extractMInt( getParentValue(R1, RSMap), 16, 32)), concatenateMInt( subMInt( extractMInt( getParentValue(R2, RSMap), 32, 48), extractMInt( getParentValue(R1, RSMap), 32, 48)), concatenateMInt( subMInt( extractMInt( getParentValue(R2, RSMap), 48, 64), extractMInt( getParentValue(R1, RSMap), 48, 64)), concatenateMInt( subMInt( extractMInt( getParentValue(R2, RSMap), 64, 80), extractMInt( getParentValue(R1, RSMap), 64, 80)), concatenateMInt( subMInt( extractMInt( getParentValue(R2, RSMap), 80, 96), extractMInt( getParentValue(R1, RSMap), 80, 96)), concatenateMInt( subMInt( extractMInt( getParentValue(R2, RSMap), 96, 112), extractMInt( getParentValue(R1, RSMap), 96, 112)), concatenateMInt( subMInt( extractMInt( getParentValue(R2, RSMap), 112, 128), extractMInt( getParentValue(R1, RSMap), 112, 128)), concatenateMInt( subMInt( extractMInt( getParentValue(R2, RSMap), 128, 144), extractMInt( getParentValue(R1, RSMap), 128, 144)), concatenateMInt( subMInt( extractMInt( getParentValue(R2, RSMap), 144, 160), extractMInt( getParentValue(R1, RSMap), 144, 160)), concatenateMInt( subMInt( extractMInt( getParentValue(R2, RSMap), 160, 176), extractMInt( getParentValue(R1, RSMap), 160, 176)), concatenateMInt( subMInt( extractMInt( getParentValue(R2, RSMap), 176, 192), extractMInt( getParentValue(R1, RSMap), 176, 192)), concatenateMInt( subMInt( extractMInt( getParentValue(R2, RSMap), 192, 208), extractMInt( getParentValue(R1, RSMap), 192, 208)), concatenateMInt( subMInt( extractMInt( getParentValue(R2, RSMap), 208, 224), extractMInt( getParentValue(R1, RSMap), 208, 224)), concatenateMInt( subMInt( extractMInt( getParentValue(R2, RSMap), 224, 240), extractMInt( getParentValue(R1, RSMap), 224, 240)), subMInt( extractMInt( getParentValue(R2, RSMap), 240, 256), extractMInt( getParentValue(R1, RSMap), 240, 256)))))))))))))))))
)

    </regstate>
    
endmodule

module VPSUBW-YMM-YMM-YMM-SEMANTICS
  imports VPSUBW-YMM-YMM-YMM
endmodule

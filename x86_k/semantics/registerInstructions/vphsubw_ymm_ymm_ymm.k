// Autogenerated using stratification.
requires "x86-configuration.k"

module VPHSUBW-YMM-YMM-YMM
  imports X86-CONFIGURATION

  rule <k>
    execinstr (vphsubw R1:Ymm, R2:Ymm, R3:Ymm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( concatenateMInt( concatenateMInt( concatenateMInt( concatenateMInt( concatenateMInt( concatenateMInt( concatenateMInt( subMInt( extractMInt( getParentValue(R1, RSMap), 16, 32), extractMInt( getParentValue(R1, RSMap), 0, 16)), subMInt( extractMInt( getParentValue(R1, RSMap), 48, 64), extractMInt( getParentValue(R1, RSMap), 32, 48))), subMInt( extractMInt( getParentValue(R1, RSMap), 80, 96), extractMInt( getParentValue(R1, RSMap), 64, 80))), subMInt( extractMInt( getParentValue(R1, RSMap), 112, 128), extractMInt( getParentValue(R1, RSMap), 96, 112))), subMInt( extractMInt( getParentValue(R2, RSMap), 16, 32), extractMInt( getParentValue(R2, RSMap), 0, 16))), subMInt( extractMInt( getParentValue(R2, RSMap), 48, 64), extractMInt( getParentValue(R2, RSMap), 32, 48))), subMInt( extractMInt( getParentValue(R2, RSMap), 80, 96), extractMInt( getParentValue(R2, RSMap), 64, 80))), subMInt( extractMInt( getParentValue(R2, RSMap), 112, 128), extractMInt( getParentValue(R2, RSMap), 96, 112))), concatenateMInt( concatenateMInt( concatenateMInt( concatenateMInt( concatenateMInt( concatenateMInt( concatenateMInt( subMInt( extractMInt( getParentValue(R1, RSMap), 144, 160), extractMInt( getParentValue(R1, RSMap), 128, 144)), subMInt( extractMInt( getParentValue(R1, RSMap), 176, 192), extractMInt( getParentValue(R1, RSMap), 160, 176))), subMInt( extractMInt( getParentValue(R1, RSMap), 208, 224), extractMInt( getParentValue(R1, RSMap), 192, 208))), subMInt( extractMInt( getParentValue(R1, RSMap), 240, 256), extractMInt( getParentValue(R1, RSMap), 224, 240))), subMInt( extractMInt( getParentValue(R2, RSMap), 144, 160), extractMInt( getParentValue(R2, RSMap), 128, 144))), subMInt( extractMInt( getParentValue(R2, RSMap), 176, 192), extractMInt( getParentValue(R2, RSMap), 160, 176))), subMInt( extractMInt( getParentValue(R2, RSMap), 208, 224), extractMInt( getParentValue(R2, RSMap), 192, 208))), subMInt( extractMInt( getParentValue(R2, RSMap), 240, 256), extractMInt( getParentValue(R2, RSMap), 224, 240))))
)

    </regstate>
    
endmodule

module VPHSUBW-YMM-YMM-YMM-SEMANTICS
  imports VPHSUBW-YMM-YMM-YMM
endmodule

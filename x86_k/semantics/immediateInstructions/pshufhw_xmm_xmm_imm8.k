// Autogenerated using stratification.
requires "x86-configuration.k"

module PSHUFHW-XMM-XMM-IMM8
  imports X86-CONFIGURATION

  rule <k>
    execinstr (pshufhw Imm8:Imm, R2:Xmm, R3:Xmm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( extractMInt( getParentValue(R3, RSMap), 0, 128), concatenateMInt( extractMInt( lshrMInt( extractMInt( getParentValue(R2, RSMap), 128, 256), uvalueMInt(shiftLeftMInt( concatenateMInt( mi(126, 0), extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 0, 2)), uvalueMInt(mi(128, 4))))), 48, 64), concatenateMInt( extractMInt( lshrMInt( extractMInt( getParentValue(R2, RSMap), 128, 256), uvalueMInt(shiftLeftMInt( concatenateMInt( mi(126, 0), extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 2, 4)), uvalueMInt(mi(128, 4))))), 48, 64), concatenateMInt( extractMInt( lshrMInt( extractMInt( getParentValue(R2, RSMap), 128, 256), uvalueMInt(shiftLeftMInt( concatenateMInt( mi(126, 0), extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 4, 6)), uvalueMInt(mi(128, 4))))), 48, 64), concatenateMInt( extractMInt( lshrMInt( extractMInt( getParentValue(R2, RSMap), 128, 256), uvalueMInt(shiftLeftMInt( concatenateMInt( mi(126, 0), extractMInt( handleImmediateWithSignExtend(Imm8, 8, 8), 6, 8)), uvalueMInt(mi(128, 4))))), 48, 64), extractMInt( getParentValue(R2, RSMap), 192, 256))))))
)

    </regstate>
    
endmodule

module PSHUFHW-XMM-XMM-IMM8-SEMANTICS
  imports PSHUFHW-XMM-XMM-IMM8
endmodule

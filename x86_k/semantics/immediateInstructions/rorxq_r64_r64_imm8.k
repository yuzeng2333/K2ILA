// Autogenerated using stratification.
requires "x86-configuration.k"

module RORXQ-R64-R64-IMM8
  imports X86-CONFIGURATION

  rule <k>
    execinstr (rorx Imm8:Imm, R2:R64, R3:R64,  .Operands) =>   execinstr (rorxq Imm8:Imm, R2:R64, R3:R64,  .Operands) 
  ...</k>

  rule <k>
    execinstr (rorxq Imm8:Imm, R2:R64, R3:R64,  .Operands) =>  .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> orMInt( lshrMInt( getParentValue(R2, RSMap), uvalueMInt(andMInt( concatenateMInt( mi(56, 0), handleImmediateWithSignExtend(Imm8, 8, 8)), mi(64, 63)))), shiftLeftMInt( getParentValue(R2, RSMap), uvalueMInt(subMInt( mi(64, 64), andMInt( concatenateMInt( mi(56, 0), handleImmediateWithSignExtend(Imm8, 8, 8)), mi(64, 63))))))
)

    </regstate>
    
endmodule

module RORXQ-R64-R64-IMM8-SEMANTICS
  imports RORXQ-R64-R64-IMM8
endmodule

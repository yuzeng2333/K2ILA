// Autogenerated using stratification.
requires "x86-configuration.k"

module BTCQ-R64-IMM8
  imports X86-CONFIGURATION

  rule <k>
    execinstr (btcq Imm8:Imm, R2:R64,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> xorMInt( getParentValue(R2, RSMap), shiftLeftMInt( mi(64, 1), uvalueMInt(mi(64, svalueMInt(andMInt( handleImmediateWithSignExtend(Imm8, 8, 8), mi(8, 63)))))))

"CF" |-> extractMInt( lshrMInt( getParentValue(R2, RSMap), uvalueMInt(mi(64, svalueMInt(andMInt( handleImmediateWithSignExtend(Imm8, 8, 8), mi(8, 63)))))), 63, 64)

"PF" |-> (undefMInt)

"AF" |-> (undefMInt)

"SF" |-> (undefMInt)

"OF" |-> (undefMInt)
)

    </regstate>
    
endmodule

module BTCQ-R64-IMM8-SEMANTICS
  imports BTCQ-R64-IMM8
endmodule

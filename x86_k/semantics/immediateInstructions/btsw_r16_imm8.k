// Autogenerated using stratification.
requires "x86-configuration.k"

module BTSW-R16-IMM8
  imports X86-CONFIGURATION

  rule <k>
    execinstr (btsw Imm8:Imm, R2:R16,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 48), orMInt( extractMInt( getParentValue(R2, RSMap), 48, 64), shiftLeftMInt( mi(16, 1), uvalueMInt(mi(16, svalueMInt(andMInt( handleImmediateWithSignExtend(Imm8, 8, 8), mi(8, 15))))))))

"CF" |-> extractMInt( lshrMInt( extractMInt( getParentValue(R2, RSMap), 48, 64), uvalueMInt(mi(16, svalueMInt(andMInt( handleImmediateWithSignExtend(Imm8, 8, 8), mi(8, 15)))))), 15, 16)

"PF" |-> (undefMInt)

"AF" |-> (undefMInt)

"SF" |-> (undefMInt)

"OF" |-> (undefMInt)
)

    </regstate>
    
endmodule

module BTSW-R16-IMM8-SEMANTICS
  imports BTSW-R16-IMM8
endmodule

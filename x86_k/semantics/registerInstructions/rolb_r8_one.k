// Autogenerated using stratification.
requires "x86-configuration.k"

module ROLB-R8-ONE
  imports X86-CONFIGURATION

  rule <k>
    execinstr (rolb $0x1, R2:R8,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 56), rol( extractMInt( getParentValue(R2, RSMap), 56, 64), mi(8, 1)))

"CF" |-> extractMInt( rol( extractMInt( getParentValue(R2, RSMap), 56, 64), mi(8, 1)), 7, 8)

"OF" |-> (#ifMInt (eqMInt( extractMInt( rol( extractMInt( getParentValue(R2, RSMap), 56, 64), mi(8, 1)), 0, 1), mi(1, 1)) xorBool eqMInt( extractMInt( rol( extractMInt( getParentValue(R2, RSMap), 56, 64), mi(8, 1)), 7, 8), mi(1, 1))) #then mi(1, 1) #else mi(1, 0) #fi)
)

    </regstate>
    
endmodule

module ROLB-R8-ONE-SEMANTICS
  imports ROLB-R8-ONE
endmodule

// Autogenerated using stratification.
requires "x86-configuration.k"

module VPSRAW-XMM-XMM-XMM
  imports X86-CONFIGURATION

  rule <k>
    execinstr (vpsraw R1:Xmm, R2:Xmm, R3:Xmm,  .Operands) => .
  ...</k>
    <regstate>
RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( mi(128, 0), concatenateMInt( aShiftRightMInt( extractMInt( getParentValue(R2, RSMap), 128, 144), uvalueMInt((#ifMInt ugtMInt( extractMInt( getParentValue(R1, RSMap), 192, 256), mi(64, 15)) #then mi(16, 16) #else extractMInt( getParentValue(R1, RSMap), 240, 256) #fi))), concatenateMInt( aShiftRightMInt( extractMInt( getParentValue(R2, RSMap), 144, 160), uvalueMInt((#ifMInt ugtMInt( extractMInt( getParentValue(R1, RSMap), 192, 256), mi(64, 15)) #then mi(16, 16) #else extractMInt( getParentValue(R1, RSMap), 240, 256) #fi))), concatenateMInt( aShiftRightMInt( extractMInt( getParentValue(R2, RSMap), 160, 176), uvalueMInt((#ifMInt ugtMInt( extractMInt( getParentValue(R1, RSMap), 192, 256), mi(64, 15)) #then mi(16, 16) #else extractMInt( getParentValue(R1, RSMap), 240, 256) #fi))), concatenateMInt( aShiftRightMInt( extractMInt( getParentValue(R2, RSMap), 176, 192), uvalueMInt((#ifMInt ugtMInt( extractMInt( getParentValue(R1, RSMap), 192, 256), mi(64, 15)) #then mi(16, 16) #else extractMInt( getParentValue(R1, RSMap), 240, 256) #fi))), concatenateMInt( aShiftRightMInt( extractMInt( getParentValue(R2, RSMap), 192, 208), uvalueMInt((#ifMInt ugtMInt( extractMInt( getParentValue(R1, RSMap), 192, 256), mi(64, 15)) #then mi(16, 16) #else extractMInt( getParentValue(R1, RSMap), 240, 256) #fi))), concatenateMInt( aShiftRightMInt( extractMInt( getParentValue(R2, RSMap), 208, 224), uvalueMInt((#ifMInt ugtMInt( extractMInt( getParentValue(R1, RSMap), 192, 256), mi(64, 15)) #then mi(16, 16) #else extractMInt( getParentValue(R1, RSMap), 240, 256) #fi))), concatenateMInt( aShiftRightMInt( extractMInt( getParentValue(R2, RSMap), 224, 240), uvalueMInt((#ifMInt ugtMInt( extractMInt( getParentValue(R1, RSMap), 192, 256), mi(64, 15)) #then mi(16, 16) #else extractMInt( getParentValue(R1, RSMap), 240, 256) #fi))), aShiftRightMInt( extractMInt( getParentValue(R2, RSMap), 240, 256), uvalueMInt((#ifMInt ugtMInt( extractMInt( getParentValue(R1, RSMap), 192, 256), mi(64, 15)) #then mi(16, 16) #else extractMInt( getParentValue(R1, RSMap), 240, 256) #fi)))))))))))
)

    </regstate>
    
endmodule

module VPSRAW-XMM-XMM-XMM-SEMANTICS
  imports VPSRAW-XMM-XMM-XMM
endmodule

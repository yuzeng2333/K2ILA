// Autogenerated using stratification.
requires "x86-configuration.k"

module VPSRAW-YMM-YMM-M128
  imports X86-CONFIGURATION

  context execinstr(vpsraw:Opcode HOLE:Mem, R2:Ymm, R3:Ymm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vpsraw:Opcode memOffset( MemOff:MInt):MemOffset, R2:Ymm, R3:Ymm,  .Operands) =>
      loadFromMemory( MemOff, 128) ~>
      execinstr (vpsraw memOffset( MemOff), R2:Ymm, R3:Ymm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem128:MInt):MemLoadValue ~> execinstr (vpsraw:Opcode memOffset( MemOff:MInt):MemOffset, R2:Ymm, R3:Ymm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( aShiftRightMInt( extractMInt( getParentValue(R2, RSMap), 0, 16), uvalueMInt((#ifMInt ugtMInt( extractMInt( Mem128, 64, 128), mi(64, 15)) #then mi(16, 16) #else extractMInt( Mem128, 112, 128) #fi))), concatenateMInt( aShiftRightMInt( extractMInt( getParentValue(R2, RSMap), 16, 32), uvalueMInt((#ifMInt ugtMInt( extractMInt( Mem128, 64, 128), mi(64, 15)) #then mi(16, 16) #else extractMInt( Mem128, 112, 128) #fi))), concatenateMInt( aShiftRightMInt( extractMInt( getParentValue(R2, RSMap), 32, 48), uvalueMInt((#ifMInt ugtMInt( extractMInt( Mem128, 64, 128), mi(64, 15)) #then mi(16, 16) #else extractMInt( Mem128, 112, 128) #fi))), concatenateMInt( aShiftRightMInt( extractMInt( getParentValue(R2, RSMap), 48, 64), uvalueMInt((#ifMInt ugtMInt( extractMInt( Mem128, 64, 128), mi(64, 15)) #then mi(16, 16) #else extractMInt( Mem128, 112, 128) #fi))), concatenateMInt( aShiftRightMInt( extractMInt( getParentValue(R2, RSMap), 64, 80), uvalueMInt((#ifMInt ugtMInt( extractMInt( Mem128, 64, 128), mi(64, 15)) #then mi(16, 16) #else extractMInt( Mem128, 112, 128) #fi))), concatenateMInt( aShiftRightMInt( extractMInt( getParentValue(R2, RSMap), 80, 96), uvalueMInt((#ifMInt ugtMInt( extractMInt( Mem128, 64, 128), mi(64, 15)) #then mi(16, 16) #else extractMInt( Mem128, 112, 128) #fi))), concatenateMInt( aShiftRightMInt( extractMInt( getParentValue(R2, RSMap), 96, 112), uvalueMInt((#ifMInt ugtMInt( extractMInt( Mem128, 64, 128), mi(64, 15)) #then mi(16, 16) #else extractMInt( Mem128, 112, 128) #fi))), concatenateMInt( aShiftRightMInt( extractMInt( getParentValue(R2, RSMap), 112, 128), uvalueMInt((#ifMInt ugtMInt( extractMInt( Mem128, 64, 128), mi(64, 15)) #then mi(16, 16) #else extractMInt( Mem128, 112, 128) #fi))), concatenateMInt( aShiftRightMInt( extractMInt( getParentValue(R2, RSMap), 128, 144), uvalueMInt((#ifMInt ugtMInt( extractMInt( Mem128, 64, 128), mi(64, 15)) #then mi(16, 16) #else extractMInt( Mem128, 112, 128) #fi))), concatenateMInt( aShiftRightMInt( extractMInt( getParentValue(R2, RSMap), 144, 160), uvalueMInt((#ifMInt ugtMInt( extractMInt( Mem128, 64, 128), mi(64, 15)) #then mi(16, 16) #else extractMInt( Mem128, 112, 128) #fi))), concatenateMInt( aShiftRightMInt( extractMInt( getParentValue(R2, RSMap), 160, 176), uvalueMInt((#ifMInt ugtMInt( extractMInt( Mem128, 64, 128), mi(64, 15)) #then mi(16, 16) #else extractMInt( Mem128, 112, 128) #fi))), concatenateMInt( aShiftRightMInt( extractMInt( getParentValue(R2, RSMap), 176, 192), uvalueMInt((#ifMInt ugtMInt( extractMInt( Mem128, 64, 128), mi(64, 15)) #then mi(16, 16) #else extractMInt( Mem128, 112, 128) #fi))), concatenateMInt( aShiftRightMInt( extractMInt( getParentValue(R2, RSMap), 192, 208), uvalueMInt((#ifMInt ugtMInt( extractMInt( Mem128, 64, 128), mi(64, 15)) #then mi(16, 16) #else extractMInt( Mem128, 112, 128) #fi))), concatenateMInt( aShiftRightMInt( extractMInt( getParentValue(R2, RSMap), 208, 224), uvalueMInt((#ifMInt ugtMInt( extractMInt( Mem128, 64, 128), mi(64, 15)) #then mi(16, 16) #else extractMInt( Mem128, 112, 128) #fi))), concatenateMInt( aShiftRightMInt( extractMInt( getParentValue(R2, RSMap), 224, 240), uvalueMInt((#ifMInt ugtMInt( extractMInt( Mem128, 64, 128), mi(64, 15)) #then mi(16, 16) #else extractMInt( Mem128, 112, 128) #fi))), aShiftRightMInt( extractMInt( getParentValue(R2, RSMap), 240, 256), uvalueMInt((#ifMInt ugtMInt( extractMInt( Mem128, 64, 128), mi(64, 15)) #then mi(16, 16) #else extractMInt( Mem128, 112, 128) #fi))))))))))))))))))
      )
    </regstate>
endmodule

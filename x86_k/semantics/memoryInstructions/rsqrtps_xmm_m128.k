// Autogenerated using stratification.
requires "x86-configuration.k"

module RSQRTPS-XMM-M128
  imports X86-CONFIGURATION

  context execinstr(rsqrtps:Opcode HOLE:Mem, R2:Xmm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (rsqrtps:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm,  .Operands) =>
      loadFromMemory( MemOff, 128) ~>
      execinstr (rsqrtps memOffset( MemOff), R2:Xmm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem128:MInt):MemLoadValue ~> execinstr (rsqrtps:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R2) |-> concatenateMInt( extractMInt( getParentValue(R2, RSMap), 0, 128), concatenateMInt( approx_reciprocal_sqrt_single(extractMInt( Mem128, 0, 32)), concatenateMInt( approx_reciprocal_sqrt_single(extractMInt( Mem128, 32, 64)), concatenateMInt( approx_reciprocal_sqrt_single(extractMInt( Mem128, 64, 96)), approx_reciprocal_sqrt_single(extractMInt( Mem128, 96, 128))))))
      )
    </regstate>
endmodule

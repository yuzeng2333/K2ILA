// Autogenerated using stratification.
requires "x86-configuration.k"

module VFMADDSUB132PD-XMM-XMM-M128
  imports X86-CONFIGURATION

  context execinstr(vfmaddsub132pd:Opcode HOLE:Mem, R2:Xmm, R3:Xmm,  .Operands) [result(MemOffset)]
  
  rule <k>
    execinstr (vfmaddsub132pd:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm, R3:Xmm,  .Operands) =>
      loadFromMemory( MemOff, 128) ~>
      execinstr (vfmaddsub132pd memOffset( MemOff), R2:Xmm, R3:Xmm,  .Operands)
  ...</k>
    <regstate> RSMap:Map </regstate>
          
  rule <k>
    memLoadValue(Mem128:MInt):MemLoadValue ~> execinstr (vfmaddsub132pd:Opcode memOffset( MemOff:MInt):MemOffset, R2:Xmm, R3:Xmm,  .Operands) =>
      .
  ...</k>
    <regstate>
      RSMap:Map => updateMap(RSMap,
convToRegKeys(R3) |-> concatenateMInt( mi(128, 0), concatenateMInt( vfmadd132_double(extractMInt( getParentValue(R3, RSMap), 128, 192), extractMInt( getParentValue(R2, RSMap), 128, 192), extractMInt( Mem128, 0, 64)), vfmsub132_double(extractMInt( getParentValue(R3, RSMap), 192, 256), extractMInt( getParentValue(R2, RSMap), 192, 256), extractMInt( Mem128, 64, 128))))
      )
    </regstate>
endmodule

// Autogenerated using stratification.
requires "x86-configuration.k"

module SHLDQ-M64-R64-CL
  imports X86-CONFIGURATION

  context execinstr (shldq Imm8:Imm, R2:R64, HOLE:Mem,  .Operands) [result(MemOffset)]

  rule <k>
    execinstr (shldq Imm8:Imm, R2:R64,  memOffset( MemOff:MInt):MemOffset,  .Operands)  =>
      loadFromMemory( MemOff, 64) ~>
      execinstr (shldq Imm8:Imm, R2,  memOffset( MemOff),  .Operands)
  ...</k>

  rule <k>
    memLoadValue(Mem64:MInt):MemLoadValue ~>  
        execinstr (shldq Imm8:Imm, R2:R64, memOffset( MemOff:MInt):MemOffset,  .Operands) =>  
      execinstr (shldq memOffset( MemOff), Mem64, getRegisterValue(R2, RSMap), 
          shiftCountMask(handleImmediateWithSignExtend(Imm8, 8, 8), 64),  .Operands)
  ...</k>
    <regstate> RSMap </regstate>

  rule <k>
    execinstr (shldq memOffset( MemOff), MIdest:MInt, MIsrc:MInt, MIcount:MInt, .Operands) => .
  ...</k> 
    requires eqMInt(MIcount, mi(bitwidthMInt(MIcount), 0))

  rule <k>
    execinstr (shldq memOffset( MemOff), MIdest:MInt, MIsrc:MInt, MIcount:MInt, .Operands) => storeToMemory(undefMInt64, MemOff, 64)
  ...</k> 
   <regstate>
  RSMap:Map => updateMap(RSMap,
    "ZF" |-> (undefMInt)
    "SF" |-> (undefMInt)
    "CF" |-> (undefMInt)
    "OF" |-> (undefMInt)
    "PF" |-> (undefMInt)
    "AF" |-> (undefMInt)
  )
   </regstate>
      requires ugtMInt(MIcount, mi(bitwidthMInt(MIcount), bitwidthMInt(MIdest)))


  rule <k>
    execinstr (shldq memOffset( MemOff), MIdest:MInt, MIsrc:MInt, MIcount:MInt, .Operands) => 
      execinstr (shldq memOffset( MemOff), MIdest:MInt, MIsrc:MInt, MIcount:MInt, 
          orMInt( shiftLeftMInt(MIdest, uvalueMInt(MIcount)),
          lshrMInt(MIsrc, bitwidthMInt(MIdest) -Int uvalueMInt(MIcount))),
          .Operands) 
  ...</k> 
      requires uleMInt(MIcount, mi(bitwidthMInt(MIcount), bitwidthMInt(MIdest)))
       andBool (notBool eqMInt(MIcount, mi(bitwidthMInt(MIcount), 0)))

  rule <k>
    execinstr (shldq memOffset( MemOff), MIdest:MInt, MIsrc:MInt, MIcount:MInt, MIresult:MInt, .Operands) => 
      setFlag(extractMInt(MIdest, uvalueMInt(MIcount) -Int 1, uvalueMInt(MIcount)), "CF") ~> 
      updateSignFlag(MIresult) ~> 
      updateZeroFlag(MIresult) ~> 
      updateParityFlag(MIresult) ~> 

      setFlag(xorMInt(extractMInt(MIdest, 0, 1), extractMInt(MIresult, 0, 1)), "OF") ~>
      setFlag(undefMInt, "AF") ~> 
      storeToMemory(MIresult, MemOff, 64)
  ...</k> 
      requires eqMInt(MIcount, mi(bitwidthMInt(MIcount), 1))
  
  rule <k>
    execinstr (shldq memOffset( MemOff), MIdest:MInt, MIsrc:MInt, MIcount:MInt, MIresult:MInt, .Operands) => 
      setFlag(extractMInt(MIdest, uvalueMInt(MIcount) -Int 1, uvalueMInt(MIcount)), "CF") ~> 
      updateSignFlag(MIresult) ~> 
      updateZeroFlag(MIresult) ~> 
      updateParityFlag(MIresult) ~> 

      setFlag(undefMInt, "OF") ~>
      setFlag(undefMInt, "AF") ~> 
      storeToMemory(MIresult, MemOff, 64)
  ...</k> 
      requires uleMInt(MIcount, mi(bitwidthMInt(MIcount), bitwidthMInt(MIdest)))
        andBool (notBool eqMInt(MIcount, mi(bitwidthMInt(MIcount), 1)))
       andBool (notBool eqMInt(MIcount, mi(bitwidthMInt(MIcount), 0)))
endmodule

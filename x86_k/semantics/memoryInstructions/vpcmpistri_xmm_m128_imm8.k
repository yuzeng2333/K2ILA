// Autogenerated using stratification.
requires "x86-configuration.k"

module VPCMPISTRI-XMM-M128-IMM8
  imports X86-CONFIGURATION

   context execinstr(vpcmpistri:Opcode Imm8:Imm, HOLE:Mem, Xmm1:Xmm, .Operands) [result(MemOffset)]
  rule <k>
    execinstr (vpcmpistri:Opcode Imm8:Imm, memOffset( MemOff:MInt):MemOffset, Xmm1:Xmm,  .Operands) =>
      loadFromMemory( MemOff, 128) ~>
      execinstr (vpcmpistri Imm8, memOffset( MemOff), Xmm1,  .Operands)
  ...</k>


  // Find Limit Index
  rule <k>
    memLoadValue(Mem128:MInt):MemLoadValue ~> 
              execinstr (vpcmpistri Imm8:Imm, Xmm2:Xmm, Xmm1:Xmm,  .Operands) => 
      execinstr (vpcmpistri 
          handleImmediateWithSignExtend(Imm8, 8, 8), 
          Mem128,
          getRegisterValue(Xmm1, RSMap),
          findLimitIndexI(Mem128, handleImmediateWithSignExtend(Imm8, 8, 8)),   
          findLimitIndexI(getRegisterValue(Xmm1, RSMap), handleImmediateWithSignExtend(Imm8, 8, 8)),   
          .Operands) 
  ...</k>
  <regstate> RSMap </regstate>

   // Find data size and interpretation
  rule <k>
    execinstr (vpcmpistri Imm8:MInt,  Value2:MInt, Value1:MInt, Limit2:MInt, Limit1:MInt, .Operands) => 
      execinstr (vpcmpistri Imm8,  Value2, Value1, Limit2, Limit1,
          #ifMInt eqMInt(extractMInt(Imm8, 7, 8), mi(1, 1)) #then mi(8,8) #else mi(8, 16) #fi, 
          extractMInt(Imm8, 6, 7),  .Operands)
  ...</k>


  // Aggregation operation
  rule <k>
    execinstr (vpcmpistri Imm8:MInt,  Value2:MInt, Value1:MInt, Limit2:MInt, Limit1:MInt, NumElems:MInt, SignedOrUnsigned:MInt, .Operands) => 
      execinstr (vpcmpistri Imm8,  Value2, Value1, Limit2, Limit1,  NumElems, SignedOrUnsigned, equalAnyImpl(Value2, Value1, Limit2, Limit1, uvalueMInt(NumElems), SignedOrUnsigned), .Operands)
  ...</k>
    requires eqMInt(extractMInt(Imm8, 4, 6), mi(2, 0))
    
  rule <k>
    execinstr (vpcmpistri Imm8:MInt,  Value2:MInt, Value1:MInt, Limit2:MInt, Limit1:MInt, NumElems:MInt, SignedOrUnsigned:MInt, .Operands) => 
      execinstr (vpcmpistri Imm8,  Value2, Value1, Limit2, Limit1,  NumElems, SignedOrUnsigned, rangeImpl(Value2, Value1, Limit2, Limit1, uvalueMInt(NumElems), SignedOrUnsigned), .Operands)
  ...</k>
    requires eqMInt(extractMInt(Imm8, 4, 6), mi(2, 1))

  rule <k>
    execinstr (vpcmpistri Imm8:MInt,  Value2:MInt, Value1:MInt, Limit2:MInt, Limit1:MInt, NumElems:MInt, SignedOrUnsigned:MInt, .Operands) => 
      execinstr (vpcmpistri Imm8,  Value2, Value1, Limit2, Limit1,  NumElems, SignedOrUnsigned, equalEachImpl(Value2, Value1, Limit2, Limit1, uvalueMInt(NumElems), SignedOrUnsigned), .Operands)
  ...</k>
    requires eqMInt(extractMInt(Imm8, 4, 6), mi(2, 2))

  rule <k>
    execinstr (vpcmpistri Imm8:MInt,  Value2:MInt, Value1:MInt, Limit2:MInt, Limit1:MInt, NumElems:MInt, SignedOrUnsigned:MInt, .Operands) => 
      execinstr (vpcmpistri Imm8,  Value2, Value1, Limit2, Limit1,  NumElems, SignedOrUnsigned, equalOrderedImpl(Value2, Value1, Limit2, Limit1, uvalueMInt(NumElems), SignedOrUnsigned), .Operands)
  ...</k>
    requires eqMInt(extractMInt(Imm8, 4, 6), mi(2, 3) )   

  // Polarity
  rule <k>
    execinstr (vpcmpistri Imm8:MInt,  Value2:MInt, Value1:MInt, Limit2:MInt, Limit1:MInt, NumElems:MInt, SignedOrUnsigned:MInt, IntRes1:MInt, .Operands) => 
      execinstr (vpcmpistri Imm8,  Value2, Value1, Limit2, Limit1,  NumElems, 
          SignedOrUnsigned, IntRes1, 
          polarityImpl(IntRes1, Imm8, uvalueMInt(NumElems), Limit2), .Operands)
  ...</k>
      
  // Output Selection

  // If no bit is set, 16 or 8 is returned.
  rule <k>
    execinstr (vpcmpistri Imm8:MInt,  Value2:MInt, Value1:MInt, Limit2:MInt, Limit1:MInt, NumElems:MInt, SignedOrUnsigned:MInt, IntRes1:MInt, IntRes2:MInt, .Operands) => 
      setRegisterValue(mi(64, uvalueMInt(NumElems)), %rcx) ~>
      setFlag(mi(1,0), "CF") ~>
      setFlag(#ifMInt ultMInt(Limit2, NumElems) #then mi(1,1) #else mi(1,0) #fi, "ZF") ~>
      setFlag(#ifMInt ultMInt(Limit1, NumElems) #then mi(1,1) #else mi(1,0) #fi, "SF") ~>
      setFlag(extractMask(IntRes2, 1, 0), "OF") ~>
      setFlag(mi(1,0), "AF") ~>
      setFlag(mi(1,0), "PF") 
  ...</k>
    requires  eqMInt(IntRes2, mi(bitwidthMInt(IntRes2), 0))

  // ELse
  rule <k>
    execinstr (vpcmpistri Imm8:MInt,  Value2:MInt, Value1:MInt, Limit2:MInt, Limit1:MInt, NumElems:MInt, SignedOrUnsigned:MInt, IntRes1:MInt, IntRes2:MInt, .Operands) => 
      setRegisterValue(mi(64, scanForward(IntRes2, uvalueMInt(NumElems) -Int 1, uvalueMInt(NumElems))), %rcx) ~>
      setFlag(mi(1,1), "CF") ~>
      setFlag(#ifMInt ultMInt(Limit2, NumElems) #then mi(1,1) #else mi(1,0) #fi, "ZF") ~>
      setFlag(#ifMInt ultMInt(Limit1, NumElems) #then mi(1,1) #else mi(1,0) #fi, "SF") ~>
      setFlag(extractMask(IntRes2, 1, 0), "OF") ~>
      setFlag(mi(1,0), "AF") ~>
      setFlag(mi(1,0), "PF") 
  ...</k>
    requires eqMInt(extractMInt(Imm8, 1, 2), mi(1, 0)) 
      andBool  notBool eqMInt(IntRes2, mi(bitwidthMInt(IntRes2), 0))

  rule <k>
    execinstr (vpcmpistri Imm8:MInt,  Value2:MInt, Value1:MInt, Limit2:MInt, Limit1:MInt, NumElems:MInt, SignedOrUnsigned:MInt, IntRes1:MInt, IntRes2:MInt, .Operands) => 
      setRegisterValue(mi(64, scanReverse(IntRes2, 0, uvalueMInt(NumElems))), %rcx) ~>
      setFlag(mi(1,1), "CF") ~>
      setFlag(#ifMInt ultMInt(Limit2, NumElems) #then mi(1,1) #else mi(1,0) #fi, "ZF") ~>
      setFlag(#ifMInt ultMInt(Limit1, NumElems) #then mi(1,1) #else mi(1,0) #fi, "SF") ~>
      setFlag(extractMask(IntRes2, 1, 0), "OF") ~>
      setFlag(mi(1,0), "AF") ~>
      setFlag(mi(1,0), "PF") 
  ...</k>
    requires eqMInt(extractMInt(Imm8, 1, 2), mi(1, 1) )
      andBool  notBool eqMInt(IntRes2, mi(bitwidthMInt(IntRes2), 0))
      
endmodule

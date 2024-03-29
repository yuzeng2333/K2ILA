// Autogenerated using stratification.
requires "x86-configuration.k"

module PCMPESTRM-XMM-XMM-IMM8
  imports X86-CONFIGURATION

  // Find Limit Index
  rule <k>
    execinstr (pcmpestrm Imm8:Imm, Xmm2:Xmm, Xmm1:Xmm,  .Operands) => 
      execinstr (pcmpestrm 
          handleImmediateWithSignExtend(Imm8, 8, 8), 
          getRegisterValue(Xmm2, RSMap), 
          getRegisterValue(Xmm1, RSMap),
          findLimitIndexE(getRegisterValue(Xmm2, RSMap), getRegisterValue(%rdx, RSMap), handleImmediateWithSignExtend(Imm8, 8, 8)),   
          findLimitIndexE(getRegisterValue(Xmm1, RSMap), getRegisterValue(%rax, RSMap), handleImmediateWithSignExtend(Imm8, 8, 8)),   
          .Operands) 
  ...</k>
  <regstate> RSMap </regstate>

   // Find data size and interpretation
  rule <k>
    execinstr (pcmpestrm Imm8:MInt,  Value2:MInt, Value1:MInt, Limit2:MInt, Limit1:MInt, .Operands) => 
      execinstr (pcmpestrm Imm8,  Value2, Value1, Limit2, Limit1,
          #ifMInt eqMInt(extractMInt(Imm8, 7, 8), mi(1, 1)) #then mi(8,8) #else mi(8, 16) #fi, 
          extractMInt(Imm8, 6, 7),  .Operands)
  ...</k>


  // Aggregation operation
  rule <k>
    execinstr (pcmpestrm Imm8:MInt,  Value2:MInt, Value1:MInt, Limit2:MInt, Limit1:MInt, NumElems:MInt, SignedOrUnsigned:MInt, .Operands) => 
      execinstr (pcmpestrm Imm8,  Value2, Value1, Limit2, Limit1,  NumElems, SignedOrUnsigned, equalAnyImpl(Value2, Value1, Limit2, Limit1, uvalueMInt(NumElems), SignedOrUnsigned), .Operands)
  ...</k>
    requires eqMInt(extractMInt(Imm8, 4, 6), mi(2, 0))
    
  rule <k>
    execinstr (pcmpestrm Imm8:MInt,  Value2:MInt, Value1:MInt, Limit2:MInt, Limit1:MInt, NumElems:MInt, SignedOrUnsigned:MInt, .Operands) => 
      execinstr (pcmpestrm Imm8,  Value2, Value1, Limit2, Limit1,  NumElems, SignedOrUnsigned, rangeImpl(Value2, Value1, Limit2, Limit1, uvalueMInt(NumElems), SignedOrUnsigned), .Operands)
  ...</k>
    requires eqMInt(extractMInt(Imm8, 4, 6), mi(2, 1))

  rule <k>
    execinstr (pcmpestrm Imm8:MInt,  Value2:MInt, Value1:MInt, Limit2:MInt, Limit1:MInt, NumElems:MInt, SignedOrUnsigned:MInt, .Operands) => 
      execinstr (pcmpestrm Imm8,  Value2, Value1, Limit2, Limit1,  NumElems, SignedOrUnsigned, equalEachImpl(Value2, Value1, Limit2, Limit1, uvalueMInt(NumElems), SignedOrUnsigned), .Operands)
  ...</k>
    requires eqMInt(extractMInt(Imm8, 4, 6), mi(2, 2))

  rule <k>
    execinstr (pcmpestrm Imm8:MInt,  Value2:MInt, Value1:MInt, Limit2:MInt, Limit1:MInt, NumElems:MInt, SignedOrUnsigned:MInt, .Operands) => 
      execinstr (pcmpestrm Imm8,  Value2, Value1, Limit2, Limit1,  NumElems, SignedOrUnsigned, equalOrderedImpl(Value2, Value1, Limit2, Limit1, uvalueMInt(NumElems), SignedOrUnsigned), .Operands)
  ...</k>
    requires eqMInt(extractMInt(Imm8, 4, 6), mi(2, 3) )   

  // Polarity
  rule <k>
    execinstr (pcmpestrm Imm8:MInt,  Value2:MInt, Value1:MInt, Limit2:MInt, Limit1:MInt, NumElems:MInt, SignedOrUnsigned:MInt, IntRes1:MInt, .Operands) => 
      execinstr (pcmpestrm Imm8,  Value2, Value1, Limit2, Limit1,  NumElems, 
          SignedOrUnsigned, IntRes1, 
          polarityImpl(IntRes1, Imm8, uvalueMInt(NumElems), Limit2), .Operands)
  ...</k>
      
  // Output Selection

  rule <k>
    execinstr (pcmpestrm Imm8:MInt,  Value2:MInt, Value1:MInt, Limit2:MInt, Limit1:MInt, NumElems:MInt, SignedOrUnsigned:MInt, IntRes1:MInt, IntRes2:MInt, .Operands) => 
      setRegisterValue(concatenateMInt(mi(128 -Int uvalueMInt(NumElems),  0), IntRes2), %xmm0) ~>
      setFlag(
          {#ifMInt eqMInt(IntRes2, mi(bitwidthMInt(IntRes2), 0)) #then mi(1,0) #else mi(1,1) #fi}:>MInt 
          , "CF") ~>
      setFlag(#ifMInt ultMInt(Limit2, NumElems) #then mi(1,1) #else mi(1,0) #fi, "ZF") ~>
      setFlag(#ifMInt ultMInt(Limit1, NumElems) #then mi(1,1) #else mi(1,0) #fi, "SF") ~>
      setFlag(extractMask(IntRes2, 1, 0), "OF") ~>
      setFlag(mi(1,0), "AF") ~>
      setFlag(mi(1,0), "PF") 
  ...</k>
    requires eqMInt(extractMInt(Imm8, 1, 2), mi(1, 0)) 

  rule <k>
    execinstr (pcmpestrm Imm8:MInt,  Value2:MInt, Value1:MInt, Limit2:MInt, Limit1:MInt, NumElems:MInt, SignedOrUnsigned:MInt, IntRes1:MInt, IntRes2:MInt, .Operands) => 
      setRegisterValue(expandMask(IntRes2), %xmm0) ~>
      setFlag(
          {#ifMInt eqMInt(IntRes2, mi(bitwidthMInt(IntRes2), 0)) #then mi(1,0) #else mi(1,1) #fi}:>MInt 
          , "CF") ~>
      setFlag(#ifMInt ultMInt(Limit2, NumElems) #then mi(1,1) #else mi(1,0) #fi, "ZF") ~>
      setFlag(#ifMInt ultMInt(Limit1, NumElems) #then mi(1,1) #else mi(1,0) #fi, "SF") ~>
      setFlag(extractMask(IntRes2, 1, 0), "OF") ~>
      setFlag(mi(1,0), "AF") ~>
      setFlag(mi(1,0), "PF") 
  ...</k>
    requires eqMInt(extractMInt(Imm8, 1, 2), mi(1, 1) )
      
endmodule

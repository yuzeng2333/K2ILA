// Autogenerated using stratification.
requires "x86-configuration.k"

module SHLDQ-R64-R64
  imports X86-CONFIGURATION

  rule <k>
    execinstr (shrdq %cl, R2:R64, R1:R64,  .Operands) =>  
      execinstr (shrdq R1, getRegisterValue(R1, RSMap), getRegisterValue(R2, RSMap), 
          shiftCountMask(getRegisterValue(%cl, RSMap), 64),  .Operands)
  ...</k>
    <regstate> RSMap </regstate>

  rule <k>
    execinstr (shrdq R, MIdest:MInt, MIsrc:MInt, MIcount:MInt, .Operands) => .
  ...</k> 
    requires eqMInt(MIcount, mi(bitwidthMInt(MIcount), 0))

  rule <k>
    execinstr (shrdq R, MIdest:MInt, MIsrc:MInt, MIcount:MInt, .Operands) => .
  ...</k> 
   <regstate>
  RSMap:Map => updateMap(RSMap,
  convToRegKeys(R) |-> (undefMInt)
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
    execinstr (shrdq R, MIdest:MInt, MIsrc:MInt, MIcount:MInt, .Operands) => 
      execinstr (shrdq R, MIdest:MInt, MIsrc:MInt, MIcount:MInt, 
          orMInt( lshrMInt(MIdest, uvalueMInt(MIcount)),
      shiftLeftMInt(MIsrc, bitwidthMInt(MIdest) -Int uvalueMInt(MIcount))),
          .Operands) 
  ...</k> 
      requires uleMInt(MIcount, mi(bitwidthMInt(MIcount), bitwidthMInt(MIdest)))
       andBool (notBool eqMInt(MIcount, mi(bitwidthMInt(MIcount), 0)))

  rule <k>
    execinstr (shrdq R, MIdest:MInt, MIsrc:MInt, MIcount:MInt, MIresult:MInt, .Operands) => 
      setFlag(extractMInt(MIdest, bitwidthMInt(MIdest) -Int uvalueMInt(MIcount), bitwidthMInt(MIdest) -Int uvalueMInt(MIcount) +Int 1), "CF") ~> 
      updateSignFlag(MIresult) ~> 
      updateZeroFlag(MIresult) ~> 
      updateParityFlag(MIresult) ~> 

      setFlag(xorMInt(extractMInt(MIdest, 0, 1), extractMInt(MIresult, 0, 1)), "OF") ~>
      setFlag(undefMInt, "AF") ~> 
      setRegisterValue(MIresult, R)
  ...</k> 
      requires eqMInt(MIcount, mi(bitwidthMInt(MIcount), 1))
  
  rule <k>
    execinstr (shrdq R, MIdest:MInt, MIsrc:MInt, MIcount:MInt, MIresult:MInt, .Operands) => 
      setFlag(extractMInt(MIdest, bitwidthMInt(MIdest) -Int uvalueMInt(MIcount), bitwidthMInt(MIdest) -Int uvalueMInt(MIcount) +Int 1), "CF") ~> 
      updateSignFlag(MIresult) ~> 
      updateZeroFlag(MIresult) ~> 
      updateParityFlag(MIresult) ~> 

      setFlag(undefMInt, "OF") ~>
      setFlag(undefMInt, "AF") ~> 
      setRegisterValue(MIresult, R)
  ...</k> 
      requires uleMInt(MIcount, mi(bitwidthMInt(MIcount), bitwidthMInt(MIdest)))
        andBool (notBool eqMInt(MIcount, mi(bitwidthMInt(MIcount), 1)))
       andBool (notBool eqMInt(MIcount, mi(bitwidthMInt(MIcount), 0)))
endmodule

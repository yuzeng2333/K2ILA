// Autogenerated using stratification.
requires "x86-configuration.k"

module REPNZCMPSQ
  imports X86-CONFIGURATION

  rule <k>
    execinstr (repnz cmpsq  .Operands) => execinstr (repnz cmpsq mi(1,1),  .Operands) 
    ...</k>

  rule <k>
    execinstr (repnz cmpsq First:MInt,  .Operands) => .
    ...</k>
    <regstate> RSMap:Map </regstate>
      requires  eqMInt(getRegisterValue(%rcx, RSMap), mi(64, 0)) andBool eqMInt(First, mi(1, 1)) 

  rule <k>
    execinstr (repnz cmpsq First:MInt,  .Operands) => .
    ...</k>
    <regstate> RSMap:Map </regstate>
      requires  eqMInt(First, mi(1, 0)) andBool
        ( 
         eqMInt(getRegisterValue(%rcx, RSMap), mi(64, 0)) orBool
         eqMInt(getFlag("ZF", RSMap), mi(1, 1)) 
        )

  rule <k>
    execinstr (repnz cmpsq First:MInt,  .Operands) => 
      execinstr ( cmpsq  .Operands) ~>  setRegisterValue(subMInt(getRegisterValue(%rcx, RSMap), mi(64,1)), %rcx) ~> 
      execinstr (repnz cmpsq mi(1,0),  .Operands)
    ...</k>
    <regstate> RSMap:Map </regstate>
      requires (notBool (eqMInt(getRegisterValue(%rcx, RSMap), mi(64, 0)) andBool eqMInt(First, mi(1, 1))))
        andBool
        (notBool 
          (eqMInt(First, mi(1, 0)) andBool
            ( 
              eqMInt(getRegisterValue(%rcx, RSMap), mi(64, 0)) orBool
              eqMInt(getFlag("ZF", RSMap), mi(1, 1)) 
            )
          )
        )



  endmodule

requires "x86-configuration.k"


module JNLE-LABEL
  imports X86-CONFIGURATION
  imports X86-FLAG-CHECS-SYNTAX

  rule <k> 
    execinstr (jnle LabelId:X86Id, .Operands) => .
  ...</k>
      <regstate> RSMap => updateMap(RSMap, ("RIP" |-> Target))
      </regstate>
      <functargets>... LabelId |-> Target  ...</functargets>
        requires eqMInt({RSMap["SF"]}:>MInt, mi(1, 0)) andBool eqMInt({RSMap["SF"]}:>MInt, {RSMap["OF"]}:>MInt) 

  rule <k> 
    execinstr (jnle LabelId:X86Id, .Operands) => .
  ...</k>
      <regstate> RSMap:Map </regstate> 
        requires notBool eqMInt({RSMap["SF"]}:>MInt, mi(1, 0)) orBool notBool eqMInt({RSMap["SF"]}:>MInt, {RSMap["OF"]}:>MInt) 
endmodule

require "x86-syntax.k"
require "x86-abstract-syntax.k"
require "common-memory.k"
require "x86-memory.k"
require "x86-env-init.k"
require "x86-mint-wrapper.k"

module X86-CONFIGURATION
  imports X86-SYNTAX
  imports X86-ABSTRACT-SYNTAX
  imports COMMON-MEMORY-CONFIGURATION
  imports X86-MEMORY-SYNTAX
  imports X86-INIT-SYNTAX
  imports MINT-WRAPPER-SYNTAX
  imports X86-LOADER-SYNTAX
  imports COMMON-C-LIBRARY-CONFIGURATION


  // configuration <T>
  configuration
//initEnvironment(ListItem("a.out") ListItem("HelloWorld!") .List) ~> 
    <k> 
	//initRegisters($REGV:RegValPairList) ~> 
	//initEnvironment($ARGV:List) ~> 
	initEnvironment(.List) ~> 
	$PGM:Instructions ~> 
        loadEntryPoint ~>
	inforegisters ~> 
	fetch 
    </k>

    <functargets> .Map </functargets> 
    <rotargets> .Map </rotargets> 
    <datatargets> .Map </datatargets> 
    <bsstargets> .Map </bsstargets> 
    <entrypoint> .K </entrypoint>
    <nextLocPc> mi(64, 0) </nextLocPc>
    <lastseenlabel> .K </lastseenlabel>
    <currentsection> "text" </currentsection>

    <memstate>
      <text> code( .Map ) </text>
      <stack>
        <memory/>
        <stackbase> stackBaseInfo(.K, .K) </stackbase>
        <robase> roBaseInfo(.K /* Alocation id*/, .K /*Base Pointer*/, .K /*Next Location*/ ) </robase>
        <database> dataBaseInfo(.K , .K , .K ) </database>
        <bssbase>   bssBaseInfo(.K , .K , .K ) </bssbase>
      </stack>
    </memstate>

    <environment>
      <argc> .K </argc>
      <argv> .K </argv>
    </environment>

    <regstate>
      //.Map
    ("RIP"    |-> mi(64, 0)) 
    ("RAX"    |-> mi(64, 0)) 
    ("RBX"    |-> mi(64, 0)) 
    ("RCX"    |-> mi(64, 0)) 
    ("RDX"    |-> mi(64, 0)) 
    ("RSI"    |-> mi(64, 0)) 
    ("RDI"    |-> mi(64, 0)) 
    ("RSP"    |-> mi(64, 0)) 
    ("RBP"    |-> mi(64, 0)) 
    ("R8"     |-> mi(64, 0)) 
    ("R9"     |-> mi(64, 0)) 
    ("R10"    |-> mi(64, 0)) 
    ("R11"    |-> mi(64, 0)) 
    ("R12"    |-> mi(64, 0)) 
    ("R13"    |-> mi(64, 0)) 
    ("R14"    |-> mi(64, 0)) 
    ("R15"    |-> mi(64, 0)) 
    ("CF"     |-> mi(1, 0)) 
    ("DF"     |-> mi(1, 0)) 
    ("PF"     |-> mi(1, 0)) 
    ("AF"     |-> mi(1, 0)) 
    ("ZF"     |-> mi(1, 0)) 
    ("SF"     |-> mi(1, 0)) 
    ("OF"     |-> mi(1, 0)) 
    ("YMM0"   |->  mi(256, 0)) 
    ("YMM1"   |->  mi(256, 0)) 
    ("YMM2"   |->  mi(256, 0)) 
    ("YMM3"   |->  mi(256, 0)) 
    ("YMM4"   |->  mi(256, 0)) 
    ("YMM5"   |->  mi(256, 0)) 
    ("YMM6"   |->  mi(256, 0)) 
    ("YMM7"   |->  mi(256, 0)) 
    ("YMM8"   |->  mi(256, 0)) 
    ("YMM9"   |->  mi(256, 0)) 
    ("YMM10"  |->  mi(256, 0)) 
    ("YMM11"  |->  mi(256, 0)) 
    ("YMM12"  |->  mi(256, 0)) 
    ("YMM13"  |->  mi(256, 0)) 
    ("YMM14"  |->  mi(256, 0)) 
    ("YMM15"  |->  mi(256, 0))
    </regstate>

    /*@
      The following configuration is used to store the intermediate
      regstate at instruction boundary. Used in debug/testing purposes.

      itracer: For debug purposes
      regstatequeue: For testing purposes
    */

    // <itracer> .List </itracer>
    <regstatequeue> .List </regstatequeue>

    <formatcountint> 0 </formatcountint>
    <formatcountfloat> 0 </formatcountfloat>
    <c-library/>
    <formatting/>
endmodule

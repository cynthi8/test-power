STIL 1.0 { Design 2005; }
Header {
   Title "  TetraMAX(R)  O-2018.06-SP1-i20180719_204316 STIL output";
   Date "Sat Feb 20 19:30:38 2021";
   Source "Minimal STIL for design `sqrt_Top'";
   History {
      Ann {*  Incoming_Date "Sat Feb 20 19:01:58 2021"  *}
      Ann {*  Incoming_Src "DFT Compiler O-2018.06-SP1"  *}
      Ann {*   Uncollapsed Transition Fault Summary Report *}
      Ann {* ----------------------------------------------- *}
      Ann {* fault class                     code   #faults *}
      Ann {* ------------------------------  ----  --------- *}
      Ann {* Detected                         DT        682 *}
      Ann {* Possibly detected                PT          0 *}
      Ann {* Undetectable                     UD         16 *}
      Ann {* ATPG untestable                  AU          6 *}
      Ann {* Not detected                     ND          0 *}
      Ann {* ----------------------------------------------- *}
      Ann {* total faults                               704 *}
      Ann {* test coverage                            99.13% *}
      Ann {* ----------------------------------------------- *}
      Ann {*  *}
      Ann {*            Pattern Summary Report *}
      Ann {* ----------------------------------------------- *}
      Ann {* #internal patterns                          84 *}
      Ann {*     #full_sequential patterns               84 *}
      Ann {* ----------------------------------------------- *}
      Ann {*  *}
      Ann {* rule  severity  #fails  description *}
      Ann {* ----  --------  ------  --------------------------------- *}
      Ann {* N21   warning        2  unsupported UDP entry *}
      Ann {* B7    warning        1  undriven module output pin *}
      Ann {* B8    warning        3  unconnected module input pin *}
      Ann {* C26   warning        7  clock as data different from capture clock for stable cell *}
      Ann {*  *}
      Ann {* clock_name        off  usage *}
      Ann {* ----------------  ---  -------------------------- *}
      Ann {* clk                0   master shift  *}
      Ann {* clear              0   master set reset  *}
      Ann {*  *}
      Ann {* There are no constraint ports *}
      Ann {* There are no equivalent pins *}
      Ann {* There are no net connections *}
      Ann {* top_module_name = sqrt_Top *}
      Ann {* Unified STIL Flow *}
      Ann {* serial_flag = 0 *}
   }
}
Signals {
   "start" In; "clk" In; "clear" In; "num[6]" In; "num[5]" In; "num[4]" In; "num[3]" In;
   "num[2]" In; "num[1]" In; "num[0]" In; "test_si" In { ScanIn; } "test_se" In; "result[3]" Out;
   "result[2]" Out; "result[1]" Out; "result[0]" Out; "ready" Out; "test_so" Out {
   ScanOut; }
}
SignalGroups {
   "_pi" = '"clear" + "clk" + "num[0]" + "num[1]" + "num[2]" + "num[3]" +
   "num[4]" + "num[5]" + "num[6]" + "start" + "test_si" + "test_se"'; // #signals=12
   "_in" = '"start" + "clk" + "clear" + "num[6]" + "num[5]" + "num[4]" +
   "num[3]" + "num[2]" + "num[1]" + "num[0]" + "test_si" + "test_se"'; // #signals=12
   "all_inputs" = '"clear" + "clk" + "num[0]" + "num[1]" + "num[2]" + "num[3]" +
   "num[4]" + "num[5]" + "num[6]" + "start" + "test_si" + "test_se"'; // #signals=12
   "_po" = '"ready" + "result[0]" + "result[1]" + "result[2]" + "result[3]" +
   "test_so"'; // #signals=6
   "_si" = '"test_si"' { ScanIn; } // #signals=1
   "all_outputs" = '"ready" + "result[0]" + "result[1]" + "result[2]" +
   "result[3]" + "test_so"'; // #signals=6
   "all_ports" = '"all_inputs" + "all_outputs"'; // #signals=18
   "_clk" = '"clear" + "clk"'; // #signals=2
   "_so" = '"test_so"' { ScanOut; } // #signals=1
   "_out" = '"result[3]" + "result[2]" + "result[1]" + "result[0]" + "ready" +
   "test_so"'; // #signals=6
}
Timing {
   WaveformTable "_allclock_launch_capture_WFT_" {
      Period '100ns';
      Waveforms {
         "all_inputs" { 0 { '0ns' D; } }
         "all_inputs" { 1 { '0ns' U; } }
         "all_inputs" { Z { '0ns' Z; } }
         "all_inputs" { N { '0ns' N; } }
         "all_outputs" { X { '0ns' X; '40ns' X; } }
         "all_outputs" { H { '0ns' X; '40ns' H; } }
         "all_outputs" { L { '0ns' X; '40ns' L; } }
         "all_outputs" { T { '0ns' X; '40ns' T; } }
         "clk" { P { '0ns' D; '45ns' U; '55ns' D; } }
         "clear" { P { '0ns' D; '45ns' U; '55ns' D; } }
      }
   }
   WaveformTable "_multiclock_capture_WFT_" {
      Period '100ns';
      Waveforms {
         "all_inputs" { 0 { '0ns' D; } }
         "all_inputs" { 1 { '0ns' U; } }
         "all_inputs" { Z { '0ns' Z; } }
         "all_inputs" { N { '0ns' N; } }
         "all_outputs" { X { '0ns' X; '40ns' X; } }
         "all_outputs" { H { '0ns' X; '40ns' H; } }
         "all_outputs" { L { '0ns' X; '40ns' L; } }
         "all_outputs" { T { '0ns' X; '40ns' T; } }
         "clk" { P { '0ns' D; '45ns' U; '55ns' D; } }
         "clear" { P { '0ns' D; '45ns' U; '55ns' D; } }
      }
   }
   WaveformTable "_allclock_launch_WFT_" {
      Period '100ns';
      Waveforms {
         "all_inputs" { 0 { '0ns' D; } }
         "all_inputs" { 1 { '0ns' U; } }
         "all_inputs" { Z { '0ns' Z; } }
         "all_inputs" { N { '0ns' N; } }
         "all_outputs" { X { '0ns' X; '40ns' X; } }
         "all_outputs" { H { '0ns' X; '40ns' H; } }
         "all_outputs" { L { '0ns' X; '40ns' L; } }
         "all_outputs" { T { '0ns' X; '40ns' T; } }
         "clk" { P { '0ns' D; '45ns' U; '55ns' D; } }
         "clear" { P { '0ns' D; '45ns' U; '55ns' D; } }
      }
   }
   WaveformTable "_allclock_capture_WFT_" {
      Period '100ns';
      Waveforms {
         "all_inputs" { 0 { '0ns' D; } }
         "all_inputs" { 1 { '0ns' U; } }
         "all_inputs" { Z { '0ns' Z; } }
         "all_inputs" { N { '0ns' N; } }
         "all_outputs" { X { '0ns' X; '40ns' X; } }
         "all_outputs" { H { '0ns' X; '40ns' H; } }
         "all_outputs" { L { '0ns' X; '40ns' L; } }
         "all_outputs" { T { '0ns' X; '40ns' T; } }
         "clk" { P { '0ns' D; '45ns' U; '55ns' D; } }
         "clear" { P { '0ns' D; '45ns' U; '55ns' D; } }
      }
   }
   WaveformTable "_default_WFT_" {
      Period '100ns';
      Waveforms {
         "all_inputs" { 0 { '0ns' D; } }
         "all_inputs" { 1 { '0ns' U; } }
         "all_inputs" { Z { '0ns' Z; } }
         "all_inputs" { N { '0ns' N; } }
         "all_outputs" { X { '0ns' X; '40ns' X; } }
         "all_outputs" { H { '0ns' X; '40ns' H; } }
         "all_outputs" { L { '0ns' X; '40ns' L; } }
         "all_outputs" { T { '0ns' X; '40ns' T; } }
         "clk" { P { '0ns' D; '45ns' U; '55ns' D; } }
         "clear" { P { '0ns' D; '45ns' U; '55ns' D; } }
      }
   }
}
ScanStructures {
   ScanChain "1" {
      ScanLength 21;
      ScanIn "test_si";
      ScanOut "test_so";
      ScanInversion 1;
      ScanCells "sqrt_Top.m1.state_reg_0_.SI" ! "sqrt_Top.m1.state_reg_1_.SI" ! 
      "sqrt_Top.m2.Rdata_reg_0_.SI" ! "sqrt_Top.m2.Rdata_reg_1_.SI" ! "sqrt_Top.m2.Rdata_reg_2_.SI" !
      "sqrt_Top.m2.Rdata_reg_3_.SI" ! "sqrt_Top.m2.Rdata_reg_4_.SI" ! "sqrt_Top.m2.Rdata_reg_5_.SI" !
      "sqrt_Top.m2.Rdata_reg_6_.SI" ! "sqrt_Top.m2.Rdelta_reg_1_.SI" ! 
      "sqrt_Top.m2.Rdelta_reg_2_.SI" ! "sqrt_Top.m2.Rdelta_reg_3_.SI" ! 
      "sqrt_Top.m2.Rdelta_reg_4_.SI" ! "sqrt_Top.m2.Rn_reg_0_.SI" ! "sqrt_Top.m2.Rn_reg_1_.SI" !
      "sqrt_Top.m2.Rn_reg_2_.SI" ! "sqrt_Top.m2.Rn_reg_3_.SI" ! "sqrt_Top.m2.Rn_reg_4_.SI" !
      "sqrt_Top.m2.Rn_reg_5_.SI" ! "sqrt_Top.m2.Rn_reg_6_.SI" ! "sqrt_Top.m2.finish_reg.SI" !
      ;
      ScanMasterClock "clk" ;
   }
}
PatternBurst "_burst_" {
   PatList { "_pattern_" {
   }
}}
PatternExec {
   PatternBurst "_burst_";
}
Procedures {
   "multiclock_capture" {
      W "_multiclock_capture_WFT_";
      C { "all_inputs"=00\r10 N ; "all_outputs"=XXXXXX; }
      V { "_pi"=\r12 # ; "_po"=######; }
   }
   "allclock_capture" {
      W "_allclock_capture_WFT_";
      C { "all_inputs"=00\r10 N ; "all_outputs"=XXXXXX; }
      V { "_pi"=\r12 # ; "_po"=######; }
   }
   "allclock_launch" {
      W "_allclock_launch_WFT_";
      C { "all_inputs"=00\r10 N ; "all_outputs"=XXXXXX; }
      V { "_pi"=\r12 # ; "_po"=######; }
   }
   "allclock_launch_capture" {
      W "_allclock_launch_capture_WFT_";
      C { "all_inputs"=00\r10 N ; "all_outputs"=XXXXXX; }
      V { "_pi"=\r12 # ; "_po"=######; }
   }
   "load_unload" {
      W "_default_WFT_";
      C { "all_inputs"=00\r10 N ; "all_outputs"=XXXXXX; }
      "Internal_scan_pre_shift": V { "test_se"=1; }
      Shift {          W "_default_WFT_";
         V { "_clk"=0P; "_si"=#; "_so"=#; }
      }
   }
}
MacroDefs {
   "test_setup" {
      W "_default_WFT_";
      C { "all_inputs"=\r12 N ; "all_outputs"=XXXXXX; }
      V { "clear"=0; "clk"=0; }
      V { }
   }
}
Pattern "_pattern_" {
   W "_multiclock_capture_WFT_";
   "precondition all Signals": C { "_pi"=\r12 0 ; "_po"=XXXXXX; }
   Macro "test_setup";
   Ann {* full_sequential *}
   "pattern 0": Call "load_unload" { 
      "test_si"=101000110100001101110; }
   Call "allclock_launch" { 
      "_pi"=0P0101101001; }
   Call "allclock_capture" { 
      "_pi"=0P1111000100; }
   Ann {* full_sequential *}
   "pattern 1": Call "load_unload" { 
      "test_so"=LLLLLHLLLHHHHLLHLLLHL; "test_si"=001001011101000101000; }
   Call "allclock_launch" { 
      "_pi"=0P0010011001; }
   Call "allclock_capture" { 
      "_pi"=0P0101110110; }
   Ann {* full_sequential *}
   "pattern 2": Call "load_unload" { 
      "test_so"=HLLHLHHHLHLHHHLHLHHHL; "test_si"=011101000110000110101; }
   Call "allclock_launch" { 
      "_pi"=0P1101011011; }
   Call "allclock_capture" { 
      "_pi"=0P0001110010; }
   Ann {* full_sequential *}
   "pattern 3": Call "load_unload" { 
      "test_so"=LLLHLHHHLLHHHHLLHLHHH; "test_si"=011011001001100111101; }
   Call "multiclock_capture" { 
      "_pi"=P01001001001; }
   Call "allclock_launch_capture" { 
      "_pi"=0P0001000100; }
   Ann {* full_sequential *}
   "pattern 4": Call "load_unload" { 
      "test_so"=HLHLHLHHHLHHHLHHHLHLL; "test_si"=101110011011110011110; }
   Call "allclock_launch" { 
      "_pi"=0P0101111001; }
   Call "allclock_capture" { 
      "_pi"=0P0100100100; }
   Ann {* full_sequential *}
   "pattern 5": Call "load_unload" { 
      "test_so"=HLLLLLLHHLLLLHHLLLLHL; "test_si"=101101000000101011100; }
   Call "allclock_launch" { 
      "_pi"=0P1011000011; }
   Call "allclock_capture" { 
      "_pi"=0P0000111110; }
   Ann {* full_sequential *}
   "pattern 6": Call "load_unload" { 
      "test_so"=LLLHLHHHHHHHHLHLLLHHH; "test_si"=001011010101111111100; }
   Call "multiclock_capture" { 
      "_pi"=P01101001101; }
   Call "allclock_launch_capture" { 
      "_pi"=0P0000100100; }
   Ann {* full_sequential *}
   "pattern 7": Call "load_unload" { 
      "test_so"=HLHLHLHHHLHHHLLLHLHLL; "test_si"=011110000000010001011; }
   Call "allclock_launch" { 
      "_pi"=P00001001011; }
   Call "allclock_capture" { 
      "_pi"=0P0101011010; }
   Ann {* full_sequential *}
   "pattern 8": Call "load_unload" { 
      "test_so"=HLHLHLHHHLHHHLHHHLHLH; "test_si"=000110101100110100000; }
   Call "allclock_launch" { 
      "_pi"=0P0001110111; }
   Call "allclock_capture" { 
      "_pi"=0P0010011010; }
   Ann {* full_sequential *}
   "pattern 9": Call "load_unload" { 
      "test_so"=HHLLHLHLLHHHLHLHHHHHH; "test_si"=001101000111100101010; }
   Call "allclock_launch" { 
      "_pi"=0P1111110111; }
   Call "allclock_capture" { 
      "_pi"=0P0101000000; }
   Ann {* full_sequential *}
   "pattern 10": Call "load_unload" { 
      "test_so"=HLLHLHHHLLLHHHLHLHLHH; "test_si"=001111010101011101011; }
   Call "allclock_launch" { 
      "_pi"=0P1111000000; }
   Call "allclock_capture" { 
      "_pi"=0P0101001110; }
   Ann {* full_sequential *}
   "pattern 11": Call "load_unload" { 
      "test_so"=LHLLLLHLHLHLHLLLHLHLH; "test_si"=111101011000000101010; }
   Call "allclock_launch" { 
      "_pi"=0P1011001011; }
   Call "allclock_capture" { 
      "_pi"=0P1000111100; }
   Ann {* full_sequential *}
   "pattern 12": Call "load_unload" { 
      "test_so"=HLLHLHLLHHLLHHLHLHLHH; "test_si"=001100110100111111111; }
   Call "multiclock_capture" { 
      "_pi"=P00010111010; }
   Call "allclock_launch_capture" { 
      "_pi"=0P0100000100; }
   Ann {* full_sequential *}
   "pattern 13": Call "load_unload" { 
      "test_so"=HLHLHLHHHLHHHLHLHHHLL; "test_si"=110101001010010010110; }
   Call "allclock_launch" { 
      "_pi"=0P0101001001; }
   Call "allclock_capture" { 
      "_pi"=0P0101010010; }
   Ann {* full_sequential *}
   "pattern 14": Call "load_unload" { 
      "test_so"=LHLHLHHLHLHHLHHLHLLLH; "test_si"=101000010011010010101; }
   Call "allclock_launch" { 
      "_pi"=P00010101010; }
   Call "allclock_capture" { 
      "_pi"=0P0100101010; }
   Ann {* full_sequential *}
   "pattern 15": Call "load_unload" { 
      "test_so"=HLHLHLHHHLHHHLHHLHLLH; "test_si"=111010110011100101110; }
   Call "multiclock_capture" { 
      "_pi"=000001001000; }
   Call "allclock_launch_capture" { 
      "_pi"=0P1111110100; }
   Ann {* full_sequential *}
   "pattern 16": Call "load_unload" { 
      "test_so"=HLLHLHLLHHLLHHLHLHLLL; "test_si"=101001101000110101100; }
   Call "allclock_launch" { 
      "_pi"=0P1101110101; }
   Call "allclock_capture" { 
      "_pi"=0P0101011110; }
   Ann {* full_sequential *}
   "pattern 17": Call "load_unload" { 
      "test_so"=HLLLHLHHHHHLLHLHLLHHL; "test_si"=001100101011000000111; }
   Call "allclock_launch" { 
      "_pi"=0P1010000111; }
   Call "allclock_capture" { 
      "_pi"=0P0000000010; }
   Ann {* full_sequential *}
   "pattern 18": Call "load_unload" { 
      "test_so"=LLLHHLHLHLLHHHHHHLLHH; "test_si"=001100111100100000010; }
   Call "allclock_launch" { 
      "_pi"=0P0011010111; }
   Call "allclock_capture" { 
      "_pi"=0P0000010110; }
   Ann {* full_sequential *}
   "pattern 19": Call "load_unload" { 
      "test_so"=LLLHHLLLLHHHHHHHHHLHH; "test_si"=101100001010000110110; }
   Call "allclock_launch" { 
      "_pi"=0P1100000111; }
   Call "allclock_capture" { 
      "_pi"=0P0001010000; }
   Ann {* full_sequential *}
   "pattern 20": Call "load_unload" { 
      "test_so"=LLLHHHHLHLLLHHLLHLLHH; "test_si"=010110111110001110001; }
   Call "multiclock_capture" { 
      "_pi"=P01110010111; }
   Call "allclock_launch_capture" { 
      "_pi"=0P1001010010; }
   Ann {* full_sequential *}
   "pattern 21": Call "load_unload" { 
      "test_so"=HLHLHLHHHLHHHHLLLHHLH; "test_si"=101001101111000100111; }
   Call "multiclock_capture" { 
      "_pi"=P01010010010; }
   Call "allclock_launch_capture" { 
      "_pi"=0P1000001100; }
   Ann {* full_sequential *}
   "pattern 22": Call "load_unload" { 
      "test_so"=HLHLHLHHHLHHLLHLHLLLL; "test_si"=111000101000011011101; }
   Call "multiclock_capture" { 
      "_pi"=P00010110110; }
   Call "allclock_launch_capture" { 
      "_pi"=0P1111100100; }
   Ann {* full_sequential *}
   "pattern 23": Call "load_unload" { 
      "test_so"=HLHLHLHHHLHHHLLHLHLLL; "test_si"=011101110100001101010; }
   Call "allclock_launch" { 
      "_pi"=0P1100000100; }
   Call "allclock_capture" { 
      "_pi"=0P1011111100; }
   Ann {* full_sequential *}
   "pattern 24": Call "load_unload" { 
      "test_so"=LLLLHLLLHLHHHLHLHHLHH; "test_si"=111001111110110101111; }
   Call "allclock_launch" { 
      "_pi"=P00111001101; }
   Call "allclock_capture" { 
      "_pi"=0P1100100100; }
   Ann {* full_sequential *}
   "pattern 25": Call "load_unload" { 
      "test_so"=HLHLHLHHHLHHHLLLHHLLL; "test_si"=001101100110001000000; }
   Call "allclock_launch" { 
      "_pi"=P00100100101; }
   Call "allclock_capture" { 
      "_pi"=0P0111101100; }
   Ann {* full_sequential *}
   "pattern 26": Call "load_unload" { 
      "test_so"=HLHLHLHHHLHHLLLHLHHLL; "test_si"=010111101110100011011; }
   Call "allclock_launch" { 
      "_pi"=0P1111001110; }
   Call "allclock_capture" { 
      "_pi"=0P1010001110; }
   Ann {* full_sequential *}
   "pattern 27": Call "load_unload" { 
      "test_so"=HLLLHLLLLLLHLHHHLLHHL; "test_si"=000100011111000100110; }
   Call "allclock_launch" { 
      "_pi"=0P1100101001; }
   Call "allclock_capture" { 
      "_pi"=0P0110011000; }
   Ann {* full_sequential *}
   "pattern 28": Call "load_unload" { 
      "test_so"=HLHLLHHHLLLHHHLHHLLHL; "test_si"=011100011110100101000; }
   Call "allclock_launch" { 
      "_pi"=0P0001001111; }
   Call "allclock_capture" { 
      "_pi"=0P1111110100; }
   Ann {* full_sequential *}
   "pattern 29": Call "load_unload" { 
      "test_so"=HLLHHHLLLLHHHHLHLHHHH; "test_si"=100001010111011100110; }
   Call "allclock_launch" { 
      "_pi"=0P0001111101; }
   Call "allclock_capture" { 
      "_pi"=0P1111001000; }
   Ann {* full_sequential *}
   "pattern 30": Call "load_unload" { 
      "test_so"=LHLHHHLLLLLHLLLHHLLHL; "test_si"=011001110111011111100; }
   Call "allclock_launch" { 
      "_pi"=0P1100000011; }
   Call "allclock_capture" { 
      "_pi"=0P0000010110; }
   Ann {* full_sequential *}
   "pattern 31": Call "load_unload" { 
      "test_so"=HLHHLLLHLHHLLLLLLLHHH; "test_si"=000011101000001001010; }
   Call "allclock_launch" { 
      "_pi"=0P1010010001; }
   Call "allclock_capture" { 
      "_pi"=0P0011001110; }
   Ann {* full_sequential *}
   "pattern 32": Call "load_unload" { 
      "test_so"=LHHHHLLHHHHHHLHHLHLHL; "test_si"=001111001101101010010; }
   Call "allclock_launch" { 
      "_pi"=0P1100011101; }
   Call "allclock_capture" { 
      "_pi"=0P1000101010; }
   Ann {* full_sequential *}
   "pattern 33": Call "load_unload" { 
      "test_so"=LHHLLLHHLHLLHLHLHHLHL; "test_si"=000000001011100001000; }
   Call "allclock_launch" { 
      "_pi"=0P1110000101; }
   Call "allclock_capture" { 
      "_pi"=0P1010101010; }
   Ann {* full_sequential *}
   "pattern 34": Call "load_unload" { 
      "test_so"=LHHHLLHHHLLLHHHHLHHHL; "test_si"=000101100001100001010; }
   Call "allclock_launch" { 
      "_pi"=0P1101111101; }
   Call "allclock_capture" { 
      "_pi"=0P1111100110; }
   Ann {* full_sequential *}
   "pattern 35": Call "load_unload" { 
      "test_so"=HLHLHHLLHHLLHHHHLHLHL; "test_si"=101010010111110100000; }
   Call "allclock_launch" { 
      "_pi"=0P0000111001; }
   Call "allclock_capture" { 
      "_pi"=0P0110010000; }
   Ann {* full_sequential *}
   "pattern 36": Call "load_unload" { 
      "test_so"=HLHHLHHLLLLLLHLHHHHHL; "test_si"=001110000101100101100; }
   Call "allclock_launch" { 
      "_pi"=0P0100100101; }
   Call "allclock_capture" { 
      "_pi"=0P1011110110; }
   Ann {* full_sequential *}
   "pattern 37": Call "load_unload" { 
      "test_so"=LHHLHLLLLHLLHHLHLLHHL; "test_si"=001110100000101001100; }
   Call "allclock_launch" { 
      "_pi"=0P0110110101; }
   Call "allclock_capture" { 
      "_pi"=0P0100001000; }
   Ann {* full_sequential *}
   "pattern 38": Call "load_unload" { 
      "test_so"=LLLLLLLLHHHLHLHHLLHHL; "test_si"=001011101010101011100; }
   Call "allclock_launch" { 
      "_pi"=0P1101000101; }
   Call "allclock_capture" { 
      "_pi"=0P1001110110; }
   Ann {* full_sequential *}
   "pattern 39": Call "load_unload" { 
      "test_so"=LLHLLLHHHLHLHLHLLLHHL; "test_si"=101100100001101011010; }
   Call "allclock_launch" { 
      "_pi"=0P0100100001; }
   Call "allclock_capture" { 
      "_pi"=0P0011110000; }
   Ann {* full_sequential *}
   "pattern 40": Call "load_unload" { 
      "test_so"=LLLHLHLLHHLLHLHLLHLHL; "test_si"=100101110011101101110; }
   Call "allclock_launch" { 
      "_pi"=0P1001100001; }
   Call "allclock_capture" { 
      "_pi"=0P1001001100; }
   Ann {* full_sequential *}
   "pattern 41": Call "load_unload" { 
      "test_so"=HLHLHLHLHLLLHLLHLLLHL; "test_si"=101101000010111011100; }
   Call "allclock_launch" { 
      "_pi"=0P0111001001; }
   Call "allclock_capture" { 
      "_pi"=0P0001001100; }
   Ann {* full_sequential *}
   "pattern 42": Call "load_unload" { 
      "test_so"=HLLHLHLLHLHLLLHLLLHHL; "test_si"=100111010110111100010; }
   Call "allclock_launch" { 
      "_pi"=0P1100100101; }
   Call "allclock_capture" { 
      "_pi"=0P1000001010; }
   Ann {* full_sequential *}
   "pattern 43": Call "load_unload" { 
      "test_so"=HLHLHLHLLLHLLLLHHHLHL; "test_si"=010011100101100001111; }
   Call "allclock_launch" { 
      "_pi"=0P0111010111; }
   Call "allclock_capture" { 
      "_pi"=0P1100011000; }
   Ann {* full_sequential *}
   "pattern 44": Call "load_unload" { 
      "test_so"=LHHLLLHHLHLLHHHHLLLHH; "test_si"=011101011001001011101; }
   Call "multiclock_capture" { 
      "_pi"=0P0100101001; }
   Call "allclock_launch_capture" { 
      "_pi"=0P0111110110; }
   Ann {* full_sequential *}
   "pattern 45": Call "load_unload" { 
      "test_so"=LLLHLHLLHHLHHHLHLHHLL; "test_si"=101101011001100101010; }
   Call "allclock_launch" { 
      "_pi"=0P1100010111; }
   Call "allclock_capture" { 
      "_pi"=0P0001111110; }
   Ann {* full_sequential *}
   "pattern 46": Call "load_unload" { 
      "test_so"=HLLHLHLLHHLHHHLHLHLHH; "test_si"=111101011010100100001; }
   Call "multiclock_capture" { 
      "_pi"=0P1001001001; }
   Call "allclock_launch_capture" { 
      "_pi"=0P0111110110; }
   Ann {* full_sequential *}
   "pattern 47": Call "load_unload" { 
      "test_so"=LLLHLHLLHLHLHHLHLHHLL; "test_si"=011101001101100101100; }
   Call "allclock_launch" { 
      "_pi"=0P0011110011; }
   Call "allclock_capture" { 
      "_pi"=0P1011000010; }
   Ann {* full_sequential *}
   "pattern 48": Call "load_unload" { 
      "test_so"=LLLHLHHLLHLHHHLHLLHHH; "test_si"=111010111101011000110; }
   Call "allclock_launch" { 
      "_pi"=0P0111110100; }
   Call "allclock_capture" { 
      "_pi"=0P1101100010; }
   Ann {* full_sequential *}
   "pattern 49": Call "load_unload" { 
      "test_so"=LLLHLHLLLLHLHHLHLHHHH; "test_si"=111101011001100111101; }
   Call "multiclock_capture" { 
      "_pi"=0P1100010001; }
   Call "allclock_launch_capture" { 
      "_pi"=0P1111110110; }
   Ann {* full_sequential *}
   "pattern 50": Call "load_unload" { 
      "test_so"=HLLHLHLLHHLLHHLHLHLLL; "test_si"=101101010111000101011; }
   Call "allclock_launch" { 
      "_pi"=0P1111010011; }
   Call "allclock_capture" { 
      "_pi"=0P0100100010; }
   Ann {* full_sequential *}
   "pattern 51": Call "load_unload" { 
      "test_so"=LLLHLHLHLLLHHHLHLHLHH; "test_si"=111101001100100101111; }
   Call "allclock_launch" { 
      "_pi"=0P0111111111; }
   Call "allclock_capture" { 
      "_pi"=0P1001010010; }
   Ann {* full_sequential *}
   "pattern 52": Call "load_unload" { 
      "test_so"=HLLHLHHLLHHLHHLHLLLHH; "test_si"=101101011011000101111; }
   Call "allclock_launch" { 
      "_pi"=0P1110000111; }
   Call "allclock_capture" { 
      "_pi"=0P1001111100; }
   Ann {* full_sequential *}
   "pattern 53": Call "load_unload" { 
      "test_so"=LLLHLHLLHLLHHHLHLLLHH; "test_si"=101101101110000100111; }
   Call "allclock_launch" { 
      "_pi"=0P0100111001; }
   Call "allclock_capture" { 
      "_pi"=0P1001000000; }
   Ann {* full_sequential *}
   "pattern 54": Call "load_unload" { 
      "test_so"=HLLHLLHLLLHHHHLHHLLLH; "test_si"=111010110011001011110; }
   Call "multiclock_capture" { 
      "_pi"=001100001101; }
   Call "allclock_launch_capture" { 
      "_pi"=0P1011000000; }
   Ann {* full_sequential *}
   "pattern 55": Call "load_unload" { 
      "test_so"=LLLHLHLLHHLLHHLHLLLLH; "test_si"=110010101101010111101; }
   Call "allclock_launch" { 
      "_pi"=P00000001100; }
   Call "allclock_capture" { 
      "_pi"=0P0100101000; }
   Ann {* full_sequential *}
   "pattern 56": Call "load_unload" { 
      "test_so"=HLHLHLHHHLHHHLHLLLLLH; "test_si"=111011111101001001010; }
   Call "multiclock_capture" { 
      "_pi"=000011111110; }
   Call "allclock_launch_capture" { 
      "_pi"=0P0010000010; }
   Ann {* full_sequential *}
   "pattern 57": Call "load_unload" { 
      "test_so"=LLLHLLLLLLHLHHLHHLHLH; "test_si"=110110101101010100011; }
   Call "allclock_launch" { 
      "_pi"=P01001001000; }
   Call "allclock_capture" { 
      "_pi"=0P0010001010; }
   Ann {* full_sequential *}
   "pattern 58": Call "load_unload" { 
      "test_so"=HLHLHLHHHLHHHLHLHHHLH; "test_si"=111010010001001011010; }
   Call "multiclock_capture" { 
      "_pi"=000111011100; }
   Call "allclock_launch_capture" { 
      "_pi"=0P1101101000; }
   Ann {* full_sequential *}
   "pattern 59": Call "load_unload" { 
      "test_so"=LLLHLHHLHHHLHHLHLLHLH; "test_si"=011101001110000100001; }
   Call "allclock_launch" { 
      "_pi"=0P0111100011; }
   Call "allclock_capture" { 
      "_pi"=0P0111000010; }
   Ann {* full_sequential *}
   "pattern 60": Call "load_unload" { 
      "test_so"=LLLHLHHLLLHHHHLHHHHHH; "test_si"=011010011010001000010; }
   Call "multiclock_capture" { 
      "_pi"=001011000110; }
   Call "allclock_launch_capture" { 
      "_pi"=0P0110011000; }
   Ann {* full_sequential *}
   "pattern 61": Call "load_unload" { 
      "test_so"=LLLHLHHLLHLHHHLHHHHLH; "test_si"=101101001001000111011; }
   Call "allclock_launch" { 
      "_pi"=0P0100111011; }
   Call "allclock_capture" { 
      "_pi"=0P0111000110; }
   Ann {* full_sequential *}
   "pattern 62": Call "load_unload" { 
      "test_so"=LLLHLHHLHHLHHHLLLHLHH; "test_si"=110000100011011101111; }
   Call "allclock_launch" { 
      "_pi"=P01111101010; }
   Call "allclock_capture" { 
      "_pi"=0P1111111010; }
   Ann {* full_sequential *}
   "pattern 63": Call "load_unload" { 
      "test_so"=HLHLHLHHHLHHHLLLHLLLH; "test_si"=011000011110001101110; }
   Call "multiclock_capture" { 
      "_pi"=001011111110; }
   Call "allclock_launch_capture" { 
      "_pi"=0P1101001000; }
   Ann {* full_sequential *}
   "pattern 64": Call "load_unload" { 
      "test_so"=LLLHHHHLLLLHHHLLHLLLH; "test_si"=011001110010000001110; }
   Call "multiclock_capture" { 
      "_pi"=000100101110; }
   Call "allclock_launch_capture" { 
      "_pi"=0P0110100000; }
   Ann {* full_sequential *}
   "pattern 65": Call "load_unload" { 
      "test_so"=LLLHHLLLHHLHHHHHHLLLH; "test_si"=110010101110000010110; }
   Call "multiclock_capture" { 
      "_pi"=000100100110; }
   Call "allclock_launch_capture" { 
      "_pi"=0P1100010000; }
   Ann {* full_sequential *}
   "pattern 66": Call "load_unload" { 
      "test_so"=HLHHLHLHLLLHHHHHLHLLH; "test_si"=011000100000000000011; }
   Call "allclock_launch" { 
      "_pi"=0P1110111101; }
   Call "allclock_capture" { 
      "_pi"=0P1111011000; }
   Ann {* full_sequential *}
   "pattern 67": Call "load_unload" { 
      "test_so"=HLHHHLHHHHHHHHHHHHLLH; "test_si"=000001101000011110110; }
   Call "multiclock_capture" { 
      "_pi"=001011111000; }
   Call "allclock_launch_capture" { 
      "_pi"=0P0111111100; }
   Ann {* full_sequential *}
   "pattern 68": Call "load_unload" { 
      "test_so"=HHHHHLLHLHHHLHLHLHHLL; "test_si"=001010011110011010011; }
   Call "multiclock_capture" { 
      "_pi"=P01100011011; }
   Call "allclock_launch_capture" { 
      "_pi"=0P0000000100; }
   Ann {* full_sequential *}
   "pattern 69": Call "load_unload" { 
      "test_so"=LLHLHLHHHLHHHLHLHLHLL; "test_si"=101101101100100100100; }
   Call "allclock_launch" { 
      "_pi"=0P1101010111; }
   Call "allclock_capture" { 
      "_pi"=0P0000101010; }
   Ann {* full_sequential *}
   "pattern 70": Call "load_unload" { 
      "test_so"=LLLHLLHLLHHHHHLHHLHHH; "test_si"=001001001101000001001; }
   Call "multiclock_capture" { 
      "_pi"=P01111001000; }
   Call "allclock_launch_capture" { 
      "_pi"=0P0000000100; }
   Ann {* full_sequential *}
   "pattern 71": Call "load_unload" { 
      "test_so"=LLHLHLHHHLHHHLHLHLHLL; "test_si"=001100000110000100110; }
   Call "allclock_launch" { 
      "_pi"=0P0011101111; }
   Call "allclock_capture" { 
      "_pi"=0P0100110000; }
   Ann {* full_sequential *}
   "pattern 72": Call "load_unload" { 
      "test_so"=HLLHHHHHLLLLHHLHHLLHH; "test_si"=100000110101101000000; }
   Call "multiclock_capture" { 
      "_pi"=P00011100011; }
   Call "allclock_launch_capture" { 
      "_pi"=0P0000000110; }
   Ann {* full_sequential *}
   "pattern 73": Call "load_unload" { 
      "test_so"=LLHLHLHHHLHHHLHLHLHLL; "test_si"=010010011101011000010; }
   Call "multiclock_capture" { 
      "_pi"=P00101111001; }
   Call "allclock_launch_capture" { 
      "_pi"=0P0000010110; }
   Ann {* full_sequential *}
   "pattern 74": Call "load_unload" { 
      "test_so"=HLHLHLHHHLHHHHHLHLHLL; "test_si"=000000000110110110110; }
   Call "allclock_launch" { 
      "_pi"=0P1000101111; }
   Call "allclock_capture" { 
      "_pi"=0P0010010000; }
   Ann {* full_sequential *}
   "pattern 75": Call "load_unload" { 
      "test_so"=HHHHHHHHLLHHLHLLHLLHH; "test_si"=101011010101000011000; }
   Call "allclock_launch" { 
      "_pi"=0P1111111011; }
   Call "allclock_capture" { 
      "_pi"=0P1001001000; }
   Ann {* full_sequential *}
   "pattern 76": Call "load_unload" { 
      "test_so"=HLHLLHLHHLHLHHHLLHHHH; "test_si"=011001110110100110101; }
   Call "allclock_launch" { 
      "_pi"=0P1011001100; }
   Call "allclock_capture" { 
      "_pi"=0P0101111110; }
   Ann {* full_sequential *}
   "pattern 77": Call "load_unload" { 
      "test_so"=HLLHLLLHHHHLLHHLLHLHL; "test_si"=010001010011010010110; }
   Call "allclock_launch" { 
      "_pi"=0P0100100111; }
   Call "allclock_capture" { 
      "_pi"=0P1011110000; }
   Ann {* full_sequential *}
   "pattern 78": Call "load_unload" { 
      "test_so"=HHHHLHLHHHHLLHHLHLLHH; "test_si"=110000010010010101101; }
   Call "allclock_launch" { 
      "_pi"=P01101001111; }
   Call "allclock_capture" { 
      "_pi"=0P0001001100; }
   Ann {* full_sequential *}
   "pattern 79": Call "load_unload" { 
      "test_so"=HLHLHLHHHLHHLLHHHLHLL; "test_si"=011001111011001000001; }
   Call "allclock_launch" { 
      "_pi"=0P0010111101; }
   Call "allclock_capture" { 
      "_pi"=0P1001001110; }
   Ann {* full_sequential *}
   "pattern 80": Call "load_unload" { 
      "test_so"=HLHHLLLLHLLHLLHHHLLLL; "test_si"=101000000101100101010; }
   Call "allclock_launch" { 
      "_pi"=0P0001101001; }
   Call "allclock_capture" { 
      "_pi"=001010010001; "_po"=LLHHHH; }
   Ann {* full_sequential *}
   "pattern 81": Call "load_unload" { 
      "test_so"=HLHHHHHHLHLLHHLHLHLHH; "test_si"=101100111111011101101; }
   Call "allclock_launch" { 
      "_pi"=P00011001101; }
   Call "allclock_capture" { 
      "_pi"=001110111010; "_po"=HHLLLH; }
   Ann {* full_sequential *}
   "pattern 82": Call "load_unload" { 
      "test_so"=HLHLHLHHHLHHHLLLHLLLH; "test_si"=100000100001110000100; }
   Call "allclock_launch" { 
      "_pi"=P00000101011; }
   Call "allclock_capture" { 
      "_pi"=000100010000; "_po"=HHLLLH; }
   Ann {* full_sequential *}
   "pattern 83": Call "load_unload" { 
      "test_so"=HLHLHLHHHLHHLLHHHHLLH; "test_si"=100001111110101010101; }
   Call "allclock_launch" { 
      "_pi"=0P1011111101; }
   Call "allclock_capture" { 
      "_pi"=000100001110; "_po"=HLLLHH; }
   Ann {* full_sequential *}
   "end 83 unload": Call "load_unload" { 
      "test_so"=HHHHLLLLLLHLHLHLHLHLH; }
}

// Patterns reference 340 V statements, generating 2040 test cycles

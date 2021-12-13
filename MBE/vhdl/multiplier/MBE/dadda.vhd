library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
use WORK.constants.all;
use WORK.all;

ENTITY dadda IS
   PORT( 
      P0  : IN    std_logic_vector (36 DOWNTO 0);
	  P1  : IN    std_logic_vector (36 DOWNTO 0);
	  P2  : IN    std_logic_vector (36 DOWNTO 0);
      P3  : IN    std_logic_vector (36 DOWNTO 0);
	  P4  : IN    std_logic_vector (36 DOWNTO 0);
	  P5  : IN    std_logic_vector (36 DOWNTO 0);
      P6  : IN    std_logic_vector (36 DOWNTO 0);
	  P7  : IN    std_logic_vector (36 DOWNTO 0);
	  P8  : IN    std_logic_vector (36 DOWNTO 0);
      P9  : IN    std_logic_vector (36 DOWNTO 0);
	  P10 : IN    std_logic_vector (36 DOWNTO 0);
	  P11 : IN    std_logic_vector (36 DOWNTO 0);
      P12 : IN    std_logic_vector (36 DOWNTO 0);
	  P13 : IN    std_logic_vector (36 DOWNTO 0);
	  P14 : IN    std_logic_vector (36 DOWNTO 0);
      P15 : IN    std_logic_vector (36 DOWNTO 0);
	  P16 : IN    std_logic_vector (36 DOWNTO 0);
	  OP1 : OUT   std_logic_vector (63 DOWNTO 0);
	  OP2 : OUT   std_logic_vector (63 DOWNTO 0)
   );

END dadda ;

architecture rtl of dadda is


  component HA
	Port (	A :	In	std_logic;
		    B :	In	std_logic;		
		    S :	Out	std_logic;
		    Co:	Out	std_logic);
  end component; 

  component FA
	Port (	A :	In	std_logic;
		      B :	In	std_logic;
		      Ci:	In	std_logic;
		      S :	Out	std_logic;
		      Co:	Out	std_logic);
  end component; 


type data_m0    is array (N/2 downto 0)	of std_logic_vector(63 downto 0) ;--type for matrix level0
type data_m1    is array (12 downto 0)  of std_logic_vector(63 downto 0);--type for matrix level1
type data_m2    is array (8 downto 0) of std_logic_vector(63 downto 0) ;--type for matrix level2
type data_m3    is array  (5 downto 0)	of std_logic_vector (63 downto 0);--type for matrix level3
type data_m4    is array  (3 downto 0)  of std_logic_vector(63 downto 0);--type for matrix level4
type data_m5    is array  (2 downto 0)	of std_logic_vector(63 downto 0) ;--type for matrix level5
type data_m6    is array (1 downto 0) 	of std_logic_vector(63 downto 0) ;--type for matrix level6

signal m0: data_m0;
signal m1: data_m1;
signal m2: data_m2;
signal m3: data_m3;
signal m4: data_m4;
signal m5: data_m5;
signal m6: data_m6;


	
begin
---------------------------------------------------------------------
m0(0)(63 downto 0)<=  P16(33 downto  6)&P0(35 downto 0);
m0(1)(63 downto 0)<=  P15(35 downto  9)&P1(36 downto 0);
m0(2)(62 downto 2)<=  P14(36 downto 13)&P2;
m0(3)(60 downto 4)<=  P13(36 downto 17)&P3;
m0(4)(58 downto 6)<=  P12(36 downto 21)&P4;
m0(5)(56 downto 8)<=  P11(36 downto 25)&P5;
m0(6)(54 downto 10)<=  P10(36 downto 29)&P6;
m0(7)(52 downto 12)<=  P9 (36 downto 33)&P7;
m0(8)(50 downto 14)<=  P8;
m0(9)(48 downto 16)<=  P9(32 downto 0);
m0(10)(46 downto 18)<= P10(28 downto 0);
m0(11)(44 downto 20)<= P11(24 downto 0);
m0(12)(42 downto 22)<= P12(20 downto 0);
m0(13)(40 downto 24)<= P13(16 downto 0);
m0(14)(38 downto 26)<= P14(12 downto 0);
m0(15)(36 downto 28)<= P15(8 downto 0);
m0(16)(35 downto 30)<= P16(5 downto 0);	
--------------------------------------------------------------------

-- first level
gen1:	for k in 0 to 3 generate
	
		HA1R_1:	HA port map (m0(k*3)(24 + k*2),m0(k*3+1)(24 + k*2),m1(k*2)(24 + k*2),m1(k)(25 + k*2));
		HA1L_1:	HA port map (m0(9 - k*3)(36 + k*2),m0(10 -k*3)(36 + k*2),m1(7- k*2)(36 + k*2),m1(3-k)(37 + k*2));



	gen10:	if (k = 0) generate
				gen100:	for i in 0 to 1 generate
					FA100:	FA port map (m0(0)(i+25),m0(1)(i+25),m0(2)(i+25),m1(1)(i+25),m1(0)(i+26));
						end generate gen100;
						
				gen101:	for i in 2 to 3 generate
					FA101:	FA port map (m0(0)(i+25),m0(1)(i+25),m0(2)(i+25),m1(2)(i+25),m1(0)(i+26));
						end generate gen101;
						
				gen102:	for i in 4 to 5 generate
					FA102:	FA port map (m0(0)(i+25),m0(1)(i+25),m0(2)(i+25),m1(3)(i+25),m1(0)(i+26));
						end generate gen102;
						
				gen103:	for i in 6 to 12 generate
					FA103:	FA port map (m0(0)(i+25),m0(1)(i+25),m0(2)(i+25),m1(4)(i+25),m1(0)(i+26));
						end generate gen103;
						
				gen104:	for i in 13 to 14 generate
					FA104:	FA port map (m0(0)(i+25),m0(1)(i+25),m0(2)(i+25),m1(3)(i+25),m1(0)(i+26));
						end generate gen104;
						
				gen105:	for i in 15 to 16 generate
					FA105:	FA port map (m0(0)(i+25),m0(1)(i+25),m0(2)(i+25),m1(2)(i+25),m1(0)(i+26));
						end generate gen105;
		
			end generate gen10;


	gen11:	if (k = 1) generate

				gen110:	for i in 0 to 1 generate
					FA110:	FA port map (m0(3)(i+27),m0(4)(i+27),m0(5)(i+27),m1(3)(i+27),m1(1)(i+28));
						end generate gen110;

				gen111:	for i in 2 to 3 generate
					FA111:	FA port map (m0(3)(i+27),m0(4)(i+27),m0(5)(i+27),m1(4)(i+27),m1(1)(i+28));
						end generate gen111;

				gen112:	for i in 4 to 10 generate
					FA112:	FA port map (m0(3)(i+27),m0(4)(i+27),m0(5)(i+27),m1(5)(i+27),m1(1)(i+28));
						end generate gen112;

				gen113:	for i in 11 to 12 generate
					FA113:	FA port map (m0(3)(i+27),m0(4)(i+27),m0(5)(i+27),m1(4)(i+27),m1(1)(i+28));
						end generate gen113;

			end generate gen11;
			
	gen12:	if (k = 2) generate
		
				gen120:	for i in 0 to 1 generate
					FA120:	FA port map (m0(6)(i+29),m0(7)(i+29),m0(8)(i+29),m1(5)(i+29),m1(2)(i+30));
						end generate gen120;
						
				gen121:	for i in 2 to 8 generate
					FA121:	FA port map (m0(6)(i+29),m0(7)(i+29),m0(8)(i+29),m1(6)(i+29),m1(2)(i+30));
						end generate gen121;
			end generate gen12;			

	gen13:	if (k = 3) generate
			gen130:		for i in 0 to 4 generate
					FA130:	FA port map (m0(9)(i+31),m0(10)(i+31),m0(11)(i+31),m1(7)(i+31),m1(3)(i+32));
						end generate gen130;
			end generate gen13;
	end generate gen1;

	
	copy1:	for i in 0 to 63 generate


			copy10:	if(i<24 or i>43) generate
						copy101: for j in 0 to 12 generate
							m1(j)(i) <= m0(j)(i);
						end generate copy101;	
					end generate copy10;
			end generate copy1;

	--level reduction
	
	--rise

levelr10: for j in 1 to 12 generate
			m1(j)(24) <= m0(j+1)(24);
		end generate levelr10;
levelr11: for j in 2 to 12 generate
			m1(j)(25) <= m0(j+1)(25);
		end generate levelr11;
levelr12: for j in 3 to 12 generate
			m1(j)(26) <= m0(j+2)(26);
		end generate levelr12;
levelr13: for j in 4 to 12 generate
			m1(j)(27) <= m0(j+2)(27);
		end generate levelr13;
levelr14: for j in 5 to 12 generate
			m1(j)(28) <= m0(j+3)(28);
		end generate levelr14;
levelr15: for j in 6 to 12 generate
			m1(j)(29) <= m0(j+3)(29);
		end generate levelr15;
levelr16: for j in 7 to 12 generate
			m1(j)(30) <= m0(j+4)(30);
		end generate levelr16;


	--middle

	middle1: for k in 0 to 4 generate
				middle11: for j in 8 to 12 generate
						m1(j)(31+k) <= m0(j+4)(31+k);
				end generate middle11;
			end generate middle1;

	--fall
levelf10: for j in 8 to 12 generate
			m1(j)(36) <= m0(j+3)(36);
		end generate levelf10;
levelf11: for j in 7 to 12 generate
			m1(j)(37) <= m0(j+2)(37);
		end generate levelf11;
levelf12: for j in 6 to 12 generate
			m1(j)(38) <= m0(j+2)(38);
		end generate levelf12;
levelf13: for j in 5 to 12 generate
			m1(j)(39) <= m0(j+1)(39);
		end generate levelf13;
levelf14: for j in 4 to 12 generate
			m1(j)(40) <= m0(j+1)(40);
		end generate levelf14;
levelf15: for j in 3 to 12 generate
			m1(j)(41) <= m0(j)(41);
		end generate levelf15;
levelf16: for j in 2 to 12 generate
			m1(j)(42) <= m0(j)(42);
		end generate levelf16;
levelf17: for j in 1 to 12 generate
			m1(j)(43) <= m0(j-1)(43);
		end generate levelf17;



-- second level
gen2:	for k in 0 to 3 generate
			HA2R_2:	HA port map (m1(k*3)(16 + k*2),m1(k*3+1)(16 + k*2),m2(k*2)(16 + k*2),m2(k)(17 + k*2));
			HA2L_2:	HA port map (m1(9 - k*3)(44 + k*2),m1(10 -k*3)(44 + k*2),m2(7- k*2)(44 + k*2),m2(3-k)(45 + k*2));



		gen20:	if (k = 0) generate

			gen200:	for i in 0 to 1 generate
				FA200:	FA port map (m1(0)(i+17),m1(1)(i+17),m1(2)(i+17),m2(1)(i+17),m2(0)(i+18));
					end generate gen200;
					
			gen201:	for i in 2 to 3 generate
				FA201:	FA port map (m1(0)(i+17),m1(1)(i+17),m1(2)(i+17),m2(2)(i+17),m2(0)(i+18));
					end generate gen201;
					
			gen202:	for i in 4 to 5 generate
				FA202:	FA port map (m1(0)(i+17),m1(1)(i+17),m1(2)(i+17),m2(3)(i+17),m2(0)(i+18));
					end generate gen202;
					
			gen203:	for i in 6 to 28 generate
				FA203:	FA port map (m1(0)(i+17),m1(1)(i+17),m1(2)(i+17),m2(4)(i+17),m2(0)(i+18));
					end generate gen203;
					
			gen204:	for i in 29 to 30 generate
				FA204:	FA port map (m1(0)(i+17),m1(1)(i+17),m1(2)(i+17),m2(3)(i+17),m2(0)(i+18));
					end generate gen204;
					
			gen205:	for i in 31 to 32 generate
				FA205:	FA port map (m1(0)(i+17),m1(1)(i+17),m1(2)(i+17),m2(2)(i+17),m2(0)(i+18));
					end generate gen205;
		end generate gen20;
		
		gen21:	if (k = 1) generate


			gen210:	for i in 0 to 1 generate
				FA210:	FA port map (m1(3)(i+19),m1(4)(i+19),m1(5)(i+19),m2(3)(i+19),m2(1)(i+20));
					end generate gen210;

			gen211:	for i in 2 to 3 generate
				FA211:	FA port map (m1(3)(i+19),m1(4)(i+19),m1(5)(i+19),m2(4)(i+19),m2(1)(i+20));
					end generate gen211;

			gen212:	for i in 4 to 26 generate
				FA212:	FA port map (m1(3)(i+19),m1(4)(i+19),m1(5)(i+19),m2(5)(i+19),m2(1)(i+20));
					end generate gen212;

			gen213:	for i in 27 to 28 generate
				FA213:	FA port map (m1(3)(i+19),m1(4)(i+19),m1(5)(i+19),m2(4)(i+19),m2(1)(i+20));
					end generate gen213;
				end generate gen21;
				
				
		gen22:	if (k = 2) generate

			gen220:	for i in 0 to 1 generate
				FA220:	FA port map (m1(6)(i+21),m1(7)(i+21),m1(8)(i+21),m2(5)(i+21),m2(2)(i+22));
					end generate gen220;
					
			gen221:	for i in 2 to 24 generate
				FA221:	FA port map (m1(6)(i+21),m1(7)(i+21),m1(8)(i+21),m2(6)(i+21),m2(2)(i+22));
					end generate gen221;
				end generate gen22;
				
		gen23:	if (k = 3) generate
			gen230:	for i in 0 to 20 generate
				FA223:	FA port map (m1(9)(i+23),m1(10)(i+23),m1(11)(i+23),m2(7)(i+23),m2(3)(i+24));
					end generate gen230;
				end generate gen23;
		end generate gen2;


	copy2:	for i in 0 to 63 generate
		copy20:	if(i<16 or i>51) generate
						copy201: for j in 0 to 8 generate
							m2(j)(i) <= m1(j)(i);
						end generate copy201;			
				end generate copy20;
		end generate copy2;
	


	-- level reduction
	--rise

levelr20: for j in 1 to 8 generate
			m2(j)(16) <= m1(j+1)(16);
		end generate levelr20;
levelr21: for j in 2 to 8 generate
			m2(j)(17) <= m1(j+1)(17);
		end generate levelr21;
levelr22: for j in 3 to 8 generate
			m2(j)(18) <= m1(j+2)(18);
		end generate levelr22;
levelr23: for j in 4 to 8 generate
			m2(j)(19) <= m1(j+2)(19);
		end generate levelr23;
levelr24: for j in 5 to 8 generate
			m2(j)(20) <= m1(j+3)(20);
		end generate levelr24;
levelr25: for j in 6 to 8 generate
			m2(j)(21) <= m1(j+3)(21);
		end generate levelr25;
levelr26: for j in 7 to 8 generate
			m2(j)(22) <= m1(j+4)(22);
		end generate levelr26;
	

	--middle


	middle2:	for k in 0 to 20 generate

					m2(8)(23 + k) <= m1(12)(23 + k);
				end generate middle2;

	--fall
	m2(8)(44) <= m1(11)(44);

levelf20: for j in 7 to 8 generate
			m2(j)(45) <= m1(j+2)(45);
		end generate levelf20;
levelf21: for j in 6 to 8 generate
			m2(j)(46) <= m1(j+2)(46);
		end generate levelf21;
levelf22: for j in 5 to 8 generate
			m2(j)(47) <= m1(j+1)(47);
		end generate levelf22;
levelf23: for j in 4 to 8 generate
			m2(j)(48) <= m1(j+1)(48);
		end generate levelf23;
levelf24: for j in 3 to 8 generate
			m2(j)(49) <= m1(j)(49);
		end generate levelf24;
levelf25: for j in 2 to 8 generate
			m2(j)(50) <= m1(j)(50);
		end generate levelf25;
levelf26: for j in 1 to 8 generate
			m2(j)(51) <= m1(j-1)(51);
		end generate levelf26;	



-- third level
gen3:	for k in 0 to 2 generate
		HA3R_3:	HA port map (m2(k*3)(10 + k*2),m2(k*3+1)(10 + k*2),m3(k*2)(10 + k*2),m3(k)(11 + k*2));
		HA3L_3:	HA port map (m2(6 - k*3)(52 + k*2),m2(7 -k*3)(52 + k*2),m3(5- k*2)(52 + k*2),m3(2-k)(53 + k*2));

	gen30:	if (k = 0) generate

		gen300:	for i in 0 to 1 generate
			FA300:	FA port map (m2(0)(i+11),m2(1)(i+11),m2(2)(i+11),m3(1)(i+11),m3(0)(i+12));
				end generate gen300;
				
		gen301:	for i in 2 to 3 generate
			FA301:	FA port map (m2(0)(i+11),m2(1)(i+11),m2(2)(i+11),m3(2)(i+11),m3(0)(i+12));
				end generate gen301;
				
		gen302:	for i in 4 to 42 generate
			FA302:	FA port map (m2(0)(i+11),m2(1)(i+11),m2(2)(i+11),m3(3)(i+11),m3(0)(i+12));
				end generate gen302;
				
		gen303:	for i in 43 to 44 generate
			FA303:	FA port map (m2(0)(i+11),m2(1)(i+11),m2(2)(i+11),m3(2)(i+11),m3(0)(i+12));
				end generate gen303;
			end generate gen30;

	gen31:	if (k = 1) generate
		gen310:	for i in 0 to 1 generate
			FA310:	FA port map (m2(3)(i+13),m2(4)(i+13),m2(5)(i+13),m3(3)(i+13),m3(1)(i+14));
				end generate gen310;

		gen311:	for i in 2 to 40 generate
			FA311:	FA port map (m2(3)(i+13),m2(4)(i+13),m2(5)(i+13),m3(4)(i+13),m3(1)(i+14));
				end generate gen311;
			end generate gen31;

	gen32:	if (k = 2) generate
		gen320:	for i in 0 to 36 generate
			FA320:	FA port map (m2(6)(i+15),m2(7)(i+15),m2(8)(i+15),m3(5)(i+15),m3(2)(i+16));
				end generate gen320;
			end generate gen32;
		end generate gen3;


	copy3:	for i in 0 to 63 generate
		copy30:	if(i<10 or i>57) generate
						copy301: for j in 0 to 5 generate
							m3(j)(i) <= m2(j)(i);
						end generate copy301;		
				end generate copy30;
			end generate copy3;


	--rise

levelr30: for j in 1 to 5 generate
			m3(j)(10) <= m2(j+1)(10);
		end generate levelr30;
levelr31: for j in 2 to 5 generate
			m3(j)(11) <= m2(j+1)(11);
		end generate levelr31;
levelr32: for j in 3 to 5 generate
			m3(j)(12) <= m2(j+2)(12);
		end generate levelr32;
levelr33: for j in 4 to 5 generate
			m3(j)(13) <= m2(j+2)(13);
		end generate levelr33;

	m3(5)(14) <= m2(8)(14);




	--middle


	--fall
	m3(5)(53) <= m2(6)(53);


levelf33: for j in 4 to 5 generate
			m3(j)(54) <= m2(j+1)(54);
		end generate levelf33;
levelf34: for j in 3 to 5 generate
			m3(j)(55) <= m2(j)(55);
		end generate levelf34;
levelf35: for j in 2 to 5 generate
			m3(j)(56) <= m2(j)(56);
		end generate levelf35;
levelf36: for j in 1 to 5 generate
			m3(j)(57) <= m2(j-1)(57);
		end generate levelf36;	

-- fourth level
	gen4:	for k in 0 to 1 generate
		HA4R_4:		HA port map (m3(k*3)(6 + k*2),m3(k*3+1)(6 + k*2),m4(k*2)(6 + k*2),m4(k)(7 + k*2));
		HA4L_4:		HA port map (m3(3 - k*3)(58 + k*2),m3(4 -k*3)(58 + k*2),m4(3- k*2)(58 + k*2),m4(1-k)(59 + k*2));
	end generate gen4;

			gen400:	for i in 0 to 1 generate
				FA400:	FA port map (m3(0)(i+7),m3(1)(i+7),m3(2)(i+7),m4(1)(i+7),m4(0)(i+8));
					end generate gen400;
					
			gen401:	for i in 2 to 52 generate
				FA401:	FA port map (m3(0)(i+7),m3(1)(i+7),m3(2)(i+7),m4(2)(i+7),m4(0)(i+8));
					end generate gen401;




			gen410:	for i in 0 to 48 generate
				FA410:	FA port map (m3(3)(i+9),m3(4)(i+9),m3(5)(i+9),m4(3)(i+9),m4(1)(i+10));
					end generate gen410;



	copy4:	for i in 0 to 63 generate
		copy40:	if(i<6 or i>61) generate
						copy401: for j in 0 to 3 generate
							m4(j)(i) <= m3(j)(i);
						end generate copy401;
				end generate copy40;			
			end generate copy4;



	--rise
levelr40: for j in 1 to 3 generate
			m4(j)(6) <= m3(j+1)(6);
		end generate levelr40;
levelr41: for j in 2 to 3 generate
			m4(j)(7) <= m3(j+1)(7);
		end generate levelr41;

	m4(3)(8) <= m3(5)(8);



	--middle

	--fall
	m4(3)(59) <= m3(3)(59);


levelf45: for j in 2 to 3 generate
			m4(j)(60) <= m3(j)(60);
		end generate levelf45;
levelf46: for j in 1 to 3 generate
			m4(j)(61) <= m3(j-1)(61);
		end generate levelf46;	




-- fifth level

	HA5R0: HA port map (m4(0)(4),m4(1)(4),m5(0)(4),m5(0)(5));
	HA5L0: HA port map (m4(0)(62),m4(1)(62),m5(1)(62),m5(0)(63));




gen5:	for i in 0 to 56 generate
	FA5_i:	FA port map (m4(0)(i+5),m4(1)(i+5),m4(2)(i+5),m5(1)(i+5),m5(0)(i+6));
		end generate gen5;

copy5:		for i in 0 to 3 generate
						copy501: for j in 0 to 2 generate
							m5(j)(i) <= m4(j)(i);
						end generate copy501;		
			end generate copy5;


	--rise
levelr50: for j in 1 to 2 generate
			m5(j)(4) <= m4(j+1)(4);
		end generate levelr50;



	--middle
middle5:	for k in 0 to 56 generate
				m5(2)(5 + k) <= m4(3)(5 + k);
			end generate;

	--fall
	m5(2)(62) <= m4(2)(62);

levelf55: for j in 1 to 2 generate
			m5(j)(63) <= m4(j-1)(63);
		end generate levelf55;




-- sixth level

	HA6R0: HA port map (m5(0)(2),m5(1)(2),m6(0)(2),m6(0)(3));



gen6:	for i in 0 to 59 generate
	FA60_i:	FA port map (m5(0)(i+3),m5(1)(i+3),m5(2)(i+3),m6(1)(i+3),m6(0)(i+4));
		end generate gen6;

	--overflow exception
	FA6060:	FA port map (m5(0)(63),m5(1)(63),m5(2)(63),m6(1)(63));

copy6:		for i in 0 to 1 generate
						copy601: for j in 0 to 1 generate
							m6(j)(i) <= m5(j)(i);
						end generate copy601;			
			end generate copy6;
		

	--rise
	m6(1)(2) <= m5(2)(2);

		
		
-- final assignment

			op1<=m6(0)(63 downto 0);	
			op2<=m6(1)(63 downto 0);

			
end rtl;




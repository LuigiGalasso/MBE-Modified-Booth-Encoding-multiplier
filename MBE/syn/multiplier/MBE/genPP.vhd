library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
use WORK.constants.all;
use WORK.all;

ENTITY genPP IS

   PORT( 
      A : IN     std_logic_vector (32-1 DOWNTO 0);
      B : IN     std_logic_vector (32-1 DOWNTO 0);

      P0  : OUT    std_logic_vector (36 DOWNTO 0);
	  P1  : OUT    std_logic_vector (36 DOWNTO 0);
	  P2  : OUT    std_logic_vector (36 DOWNTO 0);
      P3  : OUT    std_logic_vector (36 DOWNTO 0);
	  P4  : OUT    std_logic_vector (36 DOWNTO 0);
	  P5  : OUT    std_logic_vector (36 DOWNTO 0);
      P6  : OUT    std_logic_vector (36 DOWNTO 0);
	  P7  : OUT    std_logic_vector (36 DOWNTO 0);
	  P8  : OUT    std_logic_vector (36 DOWNTO 0);
      P9  : OUT    std_logic_vector (36 DOWNTO 0);
	  P10 : OUT    std_logic_vector (36 DOWNTO 0);
	  P11 : OUT    std_logic_vector (36 DOWNTO 0);
      P12 : OUT    std_logic_vector (36 DOWNTO 0);
	  P13 : OUT    std_logic_vector (36 DOWNTO 0);
	  P14 : OUT    std_logic_vector (36 DOWNTO 0);
      P15 : OUT    std_logic_vector (36 DOWNTO 0);
	  P16 : OUT    std_logic_vector (36 DOWNTO 0)
   );


END genPP ;



architecture rtl of genPP is

component PPMUX 
   PORT( 
      A : IN     std_logic_vector (31 DOWNTO 0);
      B : IN     std_logic_vector (32 DOWNTO 0);
	  C : IN     std_logic_vector (31 DOWNTO 0);
	  sel: IN    std_logic_vector (2  downto  0);
	  Q : OUT    std_logic_vector (32 DOWNTO 0)
   );
end component;



type data_product    is array (0 to 32/2) of std_logic_vector(32    downto 0);--type for data product
type data_out        is array (0 to 32/2) of std_logic_vector(36   downto 0);--type for data out
type data_s          is array (0 to 32/2 ) of std_logic;--type for data product
type data_sel    is array (0 to 32/2) of std_logic_vector(2  downto 0);

signal sel: data_sel;
signal s: data_s;
signal PP: data_out;
signal ptemp: data_product;
signal p: data_product;
signal q : data_product;

signal zeros: std_logic_vector(31 downto 0):=(others=>'0');
signal bPP: std_logic_vector(34 downto 0);
signal condition0,condition1,condition2:std_logic_vector(0 to 16);
signal twoTimesA: std_logic_vector(32 downto 0);

--modified algorithm, instead of usign 32 bits and (2*i +1, 2*i, 2*i -1) use 35 bits and (2*i +2, 2*i +1, 2*i) 
begin


			bPP<= "00" & B &'0';
			twoTimesA<= A &'0';


	
			forgen:for i in 0 to 16 generate
				condition0(i)<=((NOT(bpp(2*i +1)XOR bpp(2*i ))) AND (NOT(bpp(2*i +2)XOR bpp(2*i +1))));
				condition1(i)<=( (NOT(bpp(2*i +1)XOR bpp(2*i ))) AND (  (bpp(2*i +2)XOR bpp(2*i +1))));
				condition2(i)<=(bpp(2*i +1)XOR bpp(2*i )); 
			end generate forgen;

			forgen3:for i in 0 to 16 generate
				sel(i)<= condition2(i)&condition1(i)&condition0(i);
			end generate forgen3;




forgen2:for i in 0 to 16 generate
MUXES: PPMUX port map(zeros,twoTimesA,A,sel(i),q(i));
end generate forgen2;

forgen4:for i in 0 to 16 generate
ppgen:  for k in 0 to 32 generate
	ptemp(i)(k)<=(   bPP(2*i +2)  XOR  q(i)(k)  )  ;

end generate ppgen;	
p(i) <=  ptemp(i);
end generate forgen4;


	bloop: for i in 0 to 16 GENERATE
			s(i)<= bPP(2*i +2);

gen01:		if(i=0) generate		

			PP(i)<= "0" & NOT(s(i)) & s(i) & s(i) & p(i);
	
			end generate gen01;


gen11:		if(i=15) generate


			PP(i)<="0" & NOT(s(i)) & p(i) & '0' & s(i-1) ;

			end generate gen11;

gen21:		if(i=16) generate
			PP(i)<= "00" & p(i) & '0' & s(i-1);

			end generate gen21;

gen31:		if( (i/=0) AND (i/=15) AND (i/=16) ) generate


			PP(i)<= "1" & NOT(s(i)) & p(i) & '0' & s(i-1) ;

		end generate gen31;
end generate bloop;

P0<= PP(0);
P1<= PP(1);
P2<= PP(2);
P3<= PP(3);
P4<= PP(4);
P5<= PP(5);
P6<= PP(6);
P7<= PP(7);
P8<= PP(8);
P9<= PP(9);
P10<= PP(10);
P11<= PP(11);
P12<= PP(12);
P13<= PP(13);
P14<= PP(14);
P15<= PP(15);
P16<= PP(16);



		


end rtl;


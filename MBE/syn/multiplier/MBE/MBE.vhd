library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
use WORK.constants.all;
use WORK.all;

ENTITY MBE IS
   PORT( 
      A : IN     std_logic_vector (31 DOWNTO 0);
      B : IN     std_logic_vector (31 DOWNTO 0);
      S : OUT    std_logic_vector (63 DOWNTO 0)
   );

-- Declarations

END MBE ;

architecture STRUCTURAL of MBE is

  component RCA_GENERIC
	Port (	A :	In	std_logic_vector(2*N-1 downto 0);
		      B :	In	std_logic_vector(2*N-1 downto 0);
		      Ci:	In	std_logic;
		      S :	Out	std_logic_vector(2*N-1 downto 0);
		      Co:	Out	std_logic);
  end component; 

  component dadda
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
  end component; 

  component genPP
   PORT( 
      A : IN     std_logic_vector (N-1 DOWNTO 0);
      B : IN     std_logic_vector (N-1 DOWNTO 0);

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
  end component; 




 signal     P0  :      std_logic_vector (36 DOWNTO 0);
 signal     P1  :      std_logic_vector (36 DOWNTO 0);
 signal	  	P2  :      std_logic_vector (36 DOWNTO 0);
 signal     P3  :      std_logic_vector (36 DOWNTO 0);
 signal	  	P4  :      std_logic_vector (36 DOWNTO 0);
 signal	  	P5  :      std_logic_vector (36 DOWNTO 0);
 signal     P6  :      std_logic_vector (36 DOWNTO 0);
 signal	  	P7  :      std_logic_vector (36 DOWNTO 0);
 signal	  	P8  :      std_logic_vector (36 DOWNTO 0);
 signal     P9  :      std_logic_vector (36 DOWNTO 0);
 signal	  	P10 :      std_logic_vector (36 DOWNTO 0);
 signal	  	P11 :      std_logic_vector (36 DOWNTO 0);
 signal     P12 :      std_logic_vector (36 DOWNTO 0);
 signal	  	P13 :      std_logic_vector (36 DOWNTO 0);
 signal	  	P14 :      std_logic_vector (36 DOWNTO 0);
 signal     P15 :      std_logic_vector (36 DOWNTO 0);
 signal 	P16 :      std_logic_vector (36 DOWNTO 0);
 signal		OP1 :      std_logic_vector (63 DOWNTO 0);
 signal		OP2 : 	   std_logic_vector (63 DOWNTO 0);
 signal		Ci : 	   std_logic;
 signal		Co : 	   std_logic;
begin


  

   ADDER : RCA_GENERIC  Port Map 
		(	A  	=>	OP1,
		    B  	=>	OP2,
		    Ci 	=>	Ci,
		    S 	=>	S,
		    Co	=>  Co	); 

   DADDATREE: dadda  Port Map 
		(  	P0	=>	P0,
	 		P1	=>	P1,
	 		P2	=>	P2,
	 		P3	=>	P3,
	 		P4	=>	P4,
	 		P5	=>	P5,
   	 		P6	=>	P6,
		 	P7	=>	P7,
	 		P8	=>	P8,
	 		P9	=>	P9,
	 		P10	=>	P10,
	 		P11	=>	P11,
	 		P12	=>	P12,
	 		P13	=>	P13,
	 		P14	=>	P14,
	 		P15	=>	P15,
	 		P16 =>	P16,
	 		OP1 =>	OP1,
	 		OP2 =>	OP2
   );


   PP: genpp  Port Map 
		( 	A 	=> 	A,
	 		B  	=> 	B,
			P0	=>	P0,
	 		P1	=>	P1,
	 		P2	=>	P2,
	 		P3	=>	P3,
	 		P4	=>	P4,
	 		P5	=>	P5,
   	 		P6	=>	P6,
		 	P7	=>	P7,
	 		P8	=>	P8,
	 		P9	=>	P9,
	 		P10	=>	P10,
	 		P11	=>	P11,
	 		P12	=>	P12,
	 		P13	=>	P13,
	 		P14	=>	P14,
	 		P15	=>	P15,
	 		P16 =>	P16
   );




end STRUCTURAL;

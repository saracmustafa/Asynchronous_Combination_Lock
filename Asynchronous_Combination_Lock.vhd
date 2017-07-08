----------------------------------------------------------------------------------
-- IMPORTANT:
-- This project was developed for ELEC 204 (Digital Design, Koç University) course project. 
--
-- Create Date:    19:28:45 05/09/2016 
-- Student Name: 	Mustafa Sarac
-- Module Name:    Asynchronous_Combination_Lock - Behavioral 
-- Project Name:   Asynchronous_Combination_Lock
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Asynchronous_Combination_Lock is
    Port ( Clock : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           password_digit1 : in  STD_LOGIC;
           password_digit2 : in  STD_LOGIC;
           Stage1 : out  STD_LOGIC;
           Stage2 : out  STD_LOGIC;
           Stage3 : out  STD_LOGIC;
           Stage4 : out  STD_LOGIC;
           Unlocked : out  STD_LOGIC);
end Asynchronous_Combination_Lock;

architecture Behavioral of Asynchronous_Combination_Lock is

type stage_type is(state1, state2, state3, state4);
signal stage: stage_type;

begin
process(Clock, Reset)
begin

if Reset = '1' then
stage <= state1;
elsif Clock'event and Clock = '1' then

case stage is 

when state1 => if password_digit1 = '0' and password_digit2 = '0' then
stage <= state2;

elsif password_digit1 = '0' and password_digit2 = '1' then
stage <= state1;

elsif password_digit1 = '1' and password_digit2 = '0' then
stage <= state1;

elsif password_digit1 = '1' and password_digit2 = '1' then
stage <= state1;

end if;


when state2 => if password_digit1 = '0' and password_digit2 = '1' then
stage <= state3;

elsif password_digit1 = '0' and password_digit2 = '0' then
stage <= state1;

elsif password_digit1 = '1' and password_digit2 = '0' then
stage <= state1;

elsif password_digit1 = '1' and password_digit2 = '1' then
stage <= state1;

end if;


when state3 => if password_digit1 = '1' and password_digit2 = '0' then
stage <= state4;

elsif password_digit1 = '0' and password_digit2 = '0' then
stage <= state1;

elsif password_digit1 = '0' and password_digit2 = '1' then
stage <= state1;

elsif password_digit1 = '1' and password_digit2 = '1' then
stage <= state1;

end if;


when state4 => if password_digit1 = '1' and password_digit2 = '1' then
stage <= state1;

elsif password_digit1 = '0' and password_digit2 = '0' then
stage <= state1;

elsif password_digit1 = '0' and password_digit2 = '1' then
stage <= state1;

elsif password_digit1 = '1' and password_digit2 = '0' then
stage <= state1;

end if;

end case;

end if;

end process;

process(stage, password_digit1, password_digit2)
begin

case stage is 

when state1 => if password_digit1 = '0' and password_digit2 = '0' then
Stage1 <= '1';
Stage2 <= '0';
Stage3 <= '0';
Stage4 <= '0';
Unlocked <= '0';

else 

Stage1 <= '0';
Stage2 <= '0';
Stage3 <= '0';
Stage4 <= '0';
Unlocked <= '0';

end if;

when state2 => if password_digit1 = '0' and password_digit2 = '1' then
Stage1 <= '1';
Stage2 <= '1';
Stage3 <= '0';
Stage4 <= '0';
Unlocked <= '0';

else 

Stage1 <= '0';
Stage2 <= '0';
Stage3 <= '0';
Stage4 <= '0';
Unlocked <= '0';

end if;

when state3 => if password_digit1 = '1' and password_digit2 = '0' then
Stage1 <= '1';
Stage2 <= '1';
Stage3 <= '1';
Stage4 <= '0';
Unlocked <= '0';

else 

Stage1 <= '0';
Stage2 <= '0';
Stage3 <= '0';
Stage4 <= '0';
Unlocked <= '0';

end if;

when state4 => if password_digit1 = '1' and password_digit2 = '1' then
Stage1 <= '1';
Stage2 <= '1';
Stage3 <= '1';
Stage4 <= '1';
Unlocked <= '1';

else 

Stage1 <= '0';
Stage2 <= '0';
Stage3 <= '0';
Stage4 <= '0';
Unlocked <= '0';

end if;

end case;

end process;

end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_2way_3bit is
    Port (
        JumpFlag : in  STD_LOGIC;
        JumpAdd  : in  STD_LOGIC_VECTOR (2 downto 0);
        SeqAdd   : in  STD_LOGIC_VECTOR (2 downto 0);
        NextPC   : out STD_LOGIC_VECTOR (2 downto 0)
    );
end MUX_2way_3bit;

architecture Behavioral of MUX_2way_3bit is
begin
    NextPC <= JumpAdd when JumpFlag = '1' else SeqAdd;
end Behavioral;

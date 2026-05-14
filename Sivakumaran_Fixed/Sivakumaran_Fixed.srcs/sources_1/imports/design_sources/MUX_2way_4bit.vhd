library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_2way_4bit is
    Port (
        loadSel   : in  STD_LOGIC;
        ImmedVal  : in  STD_LOGIC_VECTOR (3 downto 0);
        ALUVal    : in  STD_LOGIC_VECTOR (3 downto 0);
        OutputVal : out STD_LOGIC_VECTOR (3 downto 0)
    );
end MUX_2way_4bit;

architecture Behavioral of MUX_2way_4bit is
begin
    OutputVal <= ALUVal when loadSel = '1' else ImmedVal;
end Behavioral;

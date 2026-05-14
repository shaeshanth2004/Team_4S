library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_8way_4bit is
    Port (
        R0, R1, R2, R3, R4, R5, R6, R7 : in  STD_LOGIC_VECTOR (3 downto 0);
        RegSel : in  STD_LOGIC_VECTOR (2 downto 0);
        RegVal : out STD_LOGIC_VECTOR (3 downto 0)
    );
end MUX_8way_4bit;

architecture Behavioral of MUX_8way_4bit is
begin
    process(RegSel, R0, R1, R2, R3, R4, R5, R6, R7)
    begin
        case RegSel is
            when "000" => RegVal <= R0;
            when "001" => RegVal <= R1;
            when "010" => RegVal <= R2;
            when "011" => RegVal <= R3;
            when "100" => RegVal <= R4;
            when "101" => RegVal <= R5;
            when "110" => RegVal <= R6;
            when others => RegVal <= R7;
        end case;
    end process;
end Behavioral;

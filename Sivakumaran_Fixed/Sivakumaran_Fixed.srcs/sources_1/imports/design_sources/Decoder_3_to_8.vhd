library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder_3_to_8 is
    Port (
        I : in  STD_LOGIC_VECTOR (2 downto 0);
        Y : out STD_LOGIC_VECTOR (7 downto 0)
    );
end Decoder_3_to_8;

architecture Behavioral of Decoder_3_to_8 is
begin
    process(I)
    begin
        Y <= "00000000";
        case I is
            when "000" => Y <= "00000001";
            when "001" => Y <= "00000010";
            when "010" => Y <= "00000100";
            when "011" => Y <= "00001000";
            when "100" => Y <= "00010000";
            when "101" => Y <= "00100000";
            when "110" => Y <= "01000000";
            when others => Y <= "10000000";
        end case;
    end process;
end Behavioral;

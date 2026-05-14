library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LUT_16_7 is
    Port (
        address : in  STD_LOGIC_VECTOR (3 downto 0);
        data    : out STD_LOGIC_VECTOR (6 downto 0)
    );
end LUT_16_7;

architecture Behavioral of LUT_16_7 is
begin
    -- Common anode Basys3 style: 0 lights segment.
    process(address)
    begin
        case address is
            when "0000" => data <= "1000000"; -- 0
            when "0001" => data <= "1111001"; -- 1
            when "0010" => data <= "0100100"; -- 2
            when "0011" => data <= "0110000"; -- 3
            when "0100" => data <= "0011001"; -- 4
            when "0101" => data <= "0010010"; -- 5
            when "0110" => data <= "0000010"; -- 6
            when "0111" => data <= "1111000"; -- 7
            when "1000" => data <= "0000000"; -- 8
            when "1001" => data <= "0010000"; -- 9
            when "1010" => data <= "0001000"; -- A
            when "1011" => data <= "0000011"; -- b
            when "1100" => data <= "1000110"; -- C
            when "1101" => data <= "0100001"; -- d
            when "1110" => data <= "0000110"; -- E
            when others => data <= "0001110"; -- F
        end case;
    end process;
end Behavioral;

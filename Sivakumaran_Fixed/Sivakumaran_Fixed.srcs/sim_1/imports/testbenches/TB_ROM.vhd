library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_ROM is
end TB_ROM;

architecture Behavioral of TB_ROM is
    component Program_Rom
        Port (address : in STD_LOGIC_VECTOR(2 downto 0); instruction : out STD_LOGIC_VECTOR(11 downto 0));
    end component;
    signal address : STD_LOGIC_VECTOR(2 downto 0);
    signal instruction : STD_LOGIC_VECTOR(11 downto 0);
begin
    UUT: Program_Rom port map(address, instruction);

    process
    begin
        address <= "000"; wait for 100 ns;
        address <= "001"; wait for 100 ns;
        address <= "010"; wait for 100 ns;
        address <= "011"; wait for 100 ns;
        address <= "100"; wait for 100 ns;
        address <= "101"; wait for 100 ns;
        wait;
    end process;
end Behavioral;

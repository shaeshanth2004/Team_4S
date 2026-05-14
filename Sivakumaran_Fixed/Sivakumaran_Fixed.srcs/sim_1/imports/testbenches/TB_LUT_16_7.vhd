library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_LUT_16_7 is
end TB_LUT_16_7;

architecture Behavioral of TB_LUT_16_7 is
    component LUT_16_7
        Port (address : in STD_LOGIC_VECTOR(3 downto 0); data : out STD_LOGIC_VECTOR(6 downto 0));
    end component;

    signal address : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal data : STD_LOGIC_VECTOR(6 downto 0);
begin
    UUT: LUT_16_7 port map(address => address, data => data);

    process
    begin
        address <= "0000"; wait for 20 ns; assert data = "1000000" report "7seg failed for 0" severity error;
        address <= "0001"; wait for 20 ns; assert data = "1111001" report "7seg failed for 1" severity error;
        address <= "0110"; wait for 20 ns; assert data = "0000010" report "7seg failed for 6" severity error;
        address <= "1010"; wait for 20 ns; assert data = "0001000" report "7seg failed for A" severity error;
        address <= "1111"; wait for 20 ns; assert data = "0001110" report "7seg failed for F" severity error;

        report "TB_LUT_16_7 completed successfully" severity note;
        wait;
    end process;
end Behavioral;

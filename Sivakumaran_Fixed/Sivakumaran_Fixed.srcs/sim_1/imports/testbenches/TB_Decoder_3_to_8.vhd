library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Decoder_3_to_8 is
end TB_Decoder_3_to_8;

architecture Behavioral of TB_Decoder_3_to_8 is
    component Decoder_3_to_8
        Port (I : in STD_LOGIC_VECTOR(2 downto 0); Y : out STD_LOGIC_VECTOR(7 downto 0));
    end component;

    signal I : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal Y : STD_LOGIC_VECTOR(7 downto 0);
begin
    UUT: Decoder_3_to_8 port map(I => I, Y => Y);

    process
    begin
        I <= "000"; wait for 20 ns; assert Y = "00000001" report "Decoder failed for 000" severity error;
        I <= "001"; wait for 20 ns; assert Y = "00000010" report "Decoder failed for 001" severity error;
        I <= "010"; wait for 20 ns; assert Y = "00000100" report "Decoder failed for 010" severity error;
        I <= "011"; wait for 20 ns; assert Y = "00001000" report "Decoder failed for 011" severity error;
        I <= "100"; wait for 20 ns; assert Y = "00010000" report "Decoder failed for 100" severity error;
        I <= "101"; wait for 20 ns; assert Y = "00100000" report "Decoder failed for 101" severity error;
        I <= "110"; wait for 20 ns; assert Y = "01000000" report "Decoder failed for 110" severity error;
        I <= "111"; wait for 20 ns; assert Y = "10000000" report "Decoder failed for 111" severity error;
        report "TB_Decoder_3_to_8 completed successfully" severity note;
        wait;
    end process;
end Behavioral;

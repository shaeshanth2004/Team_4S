library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA_4_tb is
end RCA_4_tb;

architecture Behavioral of RCA_4_tb is
    component RCA_4
        Port (A, B : in STD_LOGIC_VECTOR(3 downto 0); mode : in STD_LOGIC; S : out STD_LOGIC_VECTOR(3 downto 0); c_out, overflow : out STD_LOGIC);
    end component;
    signal A, B, S : STD_LOGIC_VECTOR(3 downto 0);
    signal mode, c_out, overflow : STD_LOGIC;
begin
    UUT: RCA_4 port map(A, B, mode, S, c_out, overflow);

    process
    begin
        A <= "0011"; B <= "0010"; mode <= '0'; wait for 100 ns; -- 3 + 2
        A <= "0111"; B <= "0101"; mode <= '1'; wait for 100 ns; -- 7 - 5
        A <= "0101"; B <= "0111"; mode <= '1'; wait for 100 ns; -- 5 - 7
        A <= "1000"; B <= "1000"; mode <= '0'; wait for 100 ns; -- overflow
        wait;
    end process;
end Behavioral;

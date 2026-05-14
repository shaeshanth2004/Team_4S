library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_nanoprocessor is
end TB_nanoprocessor;

architecture Behavioral of TB_nanoprocessor is
    component Nano_processor
        Port (
            Reset        : in  STD_LOGIC;
            clk          : in  STD_LOGIC;
            overflow_led : out STD_LOGIC;
            zero_led     : out STD_LOGIC;
            carry_led    : out STD_LOGIC;
            Reg7_led     : out STD_LOGIC_VECTOR (3 downto 0);
            Reg7_digit   : out STD_LOGIC_VECTOR (6 downto 0);
            Anode        : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    signal Reset, clk, overflow_led, zero_led, carry_led : STD_LOGIC := '0';
    signal Reg7_led : STD_LOGIC_VECTOR(3 downto 0);
    signal Reg7_digit : STD_LOGIC_VECTOR(6 downto 0);
    signal Anode : STD_LOGIC_VECTOR(3 downto 0);
begin
    UUT: Nano_processor port map(Reset, clk, overflow_led, zero_led, carry_led, Reg7_led, Reg7_digit, Anode);

    clk_process: process
    begin
        clk <= '0'; wait for 5 ns;
        clk <= '1'; wait for 5 ns;
    end process;

    stim: process
    begin
        Reset <= '1'; wait for 50 ns;
        Reset <= '0';
        wait for 2000 ns;
        wait;
    end process;
end Behavioral;

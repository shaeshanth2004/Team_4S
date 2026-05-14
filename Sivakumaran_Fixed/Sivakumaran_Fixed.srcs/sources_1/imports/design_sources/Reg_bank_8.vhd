library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_bank_8 is
    Port (
        RegSel : in  STD_LOGIC_VECTOR (2 downto 0);
        Clk    : in  STD_LOGIC;
        Reset  : in  STD_LOGIC;
        Input  : in  STD_LOGIC_VECTOR (3 downto 0);
        Out_0  : out STD_LOGIC_VECTOR (3 downto 0);
        Out_1  : out STD_LOGIC_VECTOR (3 downto 0);
        Out_2  : out STD_LOGIC_VECTOR (3 downto 0);
        Out_3  : out STD_LOGIC_VECTOR (3 downto 0);
        Out_4  : out STD_LOGIC_VECTOR (3 downto 0);
        Out_5  : out STD_LOGIC_VECTOR (3 downto 0);
        Out_6  : out STD_LOGIC_VECTOR (3 downto 0);
        Out_7  : out STD_LOGIC_VECTOR (3 downto 0)
    );
end Reg_bank_8;

architecture Behavioral of Reg_bank_8 is
    component Reg
        Port (D : in STD_LOGIC_VECTOR(3 downto 0); En, Clk, Reset : in STD_LOGIC; Q : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    component Decoder_3_to_8
        Port (I : in STD_LOGIC_VECTOR(2 downto 0); Y : out STD_LOGIC_VECTOR(7 downto 0));
    end component;
    signal En : STD_LOGIC_VECTOR(7 downto 0);
begin
    Dec0: Decoder_3_to_8 port map(RegSel, En);

    -- R0 is hardwired to 0000 for NEG/JZR logic.
    Out_0 <= "0000";
    R1: Reg port map(Input, En(1), Clk, Reset, Out_1);
    R2: Reg port map(Input, En(2), Clk, Reset, Out_2);
    R3: Reg port map(Input, En(3), Clk, Reset, Out_3);
    R4: Reg port map(Input, En(4), Clk, Reset, Out_4);
    R5: Reg port map(Input, En(5), Clk, Reset, Out_5);
    R6: Reg port map(Input, En(6), Clk, Reset, Out_6);
    R7: Reg port map(Input, En(7), Clk, Reset, Out_7);
end Behavioral;

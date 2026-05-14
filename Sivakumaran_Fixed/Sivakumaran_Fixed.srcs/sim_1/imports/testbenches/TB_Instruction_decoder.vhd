library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Instruction_decoder is
end TB_Instruction_decoder;

architecture Behavioral of TB_Instruction_decoder is
    component Instruction_decoder
        Port (
            instruction  : in  STD_LOGIC_VECTOR (11 downto 0);
            jump_check   : in  STD_LOGIC_VECTOR (3 downto 0);
            reg_en       : out STD_LOGIC_VECTOR (2 downto 0);
            load_sel     : out STD_LOGIC;
            value        : out STD_LOGIC_VECTOR (3 downto 0);
            reg_a        : out STD_LOGIC_VECTOR (2 downto 0);
            reg_b        : out STD_LOGIC_VECTOR (2 downto 0);
            addORsub     : out STD_LOGIC;
            jump_flag    : out STD_LOGIC;
            jump_address : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    signal instruction  : STD_LOGIC_VECTOR(11 downto 0);
    signal jump_check   : STD_LOGIC_VECTOR(3 downto 0);
    signal reg_en       : STD_LOGIC_VECTOR(2 downto 0);
    signal load_sel     : STD_LOGIC;
    signal value        : STD_LOGIC_VECTOR(3 downto 0);
    signal reg_a        : STD_LOGIC_VECTOR(2 downto 0);
    signal reg_b        : STD_LOGIC_VECTOR(2 downto 0);
    signal addORsub     : STD_LOGIC;
    signal jump_flag    : STD_LOGIC;
    signal jump_address : STD_LOGIC_VECTOR(2 downto 0);
begin
    UUT: Instruction_decoder port map(instruction, jump_check, reg_en, load_sel, value, reg_a, reg_b, addORsub, jump_flag, jump_address);

    process
    begin
        jump_check <= "0000";
        instruction <= "101110000001"; wait for 100 ns; -- MOVI R7,1
        instruction <= "001110100000"; wait for 100 ns; -- ADD R7,R2
        instruction <= "010100000000"; wait for 100 ns; -- NEG R2
        instruction <= "110000000101"; wait for 100 ns; -- JZR R0,5 jump
        jump_check <= "0010";
        instruction <= "110100000101"; wait for 100 ns; -- JZR R2,5 no jump
        wait;
    end process;
end Behavioral;

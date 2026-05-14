library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nano_processor is
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
end Nano_processor;

architecture Behavioral of Nano_processor is
    component Slow_Clk
        Port (Clk_in, Reset : in STD_LOGIC; Clk_out : out STD_LOGIC);
    end component;
    component Program_counter
        Port (Mux_out : in STD_LOGIC_VECTOR(2 downto 0); Clk, Res : in STD_LOGIC; Q : out STD_LOGIC_VECTOR(2 downto 0));
    end component;
    component Program_Rom
        Port (address : in STD_LOGIC_VECTOR(2 downto 0); instruction : out STD_LOGIC_VECTOR(11 downto 0));
    end component;
    component Instruction_decoder
        Port (
            instruction : in STD_LOGIC_VECTOR(11 downto 0); jump_check : in STD_LOGIC_VECTOR(3 downto 0);
            reg_en : out STD_LOGIC_VECTOR(2 downto 0); load_sel : out STD_LOGIC; value : out STD_LOGIC_VECTOR(3 downto 0);
            reg_a : out STD_LOGIC_VECTOR(2 downto 0); reg_b : out STD_LOGIC_VECTOR(2 downto 0);
            addORsub : out STD_LOGIC; jump_flag : out STD_LOGIC; jump_address : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;
    component RCA_3
        Port (A, B : in STD_LOGIC_VECTOR(2 downto 0); S : out STD_LOGIC_VECTOR(2 downto 0));
    end component;
    component MUX_2way_3bit
        Port (JumpFlag : in STD_LOGIC; JumpAdd, SeqAdd : in STD_LOGIC_VECTOR(2 downto 0); NextPC : out STD_LOGIC_VECTOR(2 downto 0));
    end component;
    component MUX_2way_4bit
        Port (loadSel : in STD_LOGIC; ImmedVal, ALUVal : in STD_LOGIC_VECTOR(3 downto 0); OutputVal : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    component RCA_4
        Port (A, B : in STD_LOGIC_VECTOR(3 downto 0); mode : in STD_LOGIC; S : out STD_LOGIC_VECTOR(3 downto 0); c_out, overflow : out STD_LOGIC);
    end component;
    component Reg_bank_8
        Port (
            RegSel : in STD_LOGIC_VECTOR(2 downto 0); Clk, Reset : in STD_LOGIC; Input : in STD_LOGIC_VECTOR(3 downto 0);
            Out_0, Out_1, Out_2, Out_3, Out_4, Out_5, Out_6, Out_7 : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;
    component MUX_8way_4bit
        Port (R0, R1, R2, R3, R4, R5, R6, R7 : in STD_LOGIC_VECTOR(3 downto 0); RegSel : in STD_LOGIC_VECTOR(2 downto 0); RegVal : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
    component LUT_16_7
        Port (address : in STD_LOGIC_VECTOR(3 downto 0); data : out STD_LOGIC_VECTOR(6 downto 0));
    end component;

    signal slow_clock : STD_LOGIC;
    signal pc, next_pc, seq_pc, jump_address : STD_LOGIC_VECTOR(2 downto 0);
    signal instruction : STD_LOGIC_VECTOR(11 downto 0);
    signal reg_en, reg_a, reg_b : STD_LOGIC_VECTOR(2 downto 0);
    signal load_sel, addORsub, jump_flag : STD_LOGIC;
    signal value, alu_value, output_value, regA_value, regB_value : STD_LOGIC_VECTOR(3 downto 0);
    signal r0, r1, r2, r3, r4, r5, r6, r7 : STD_LOGIC_VECTOR(3 downto 0);
begin
    U_Slow: Slow_Clk port map(clk, Reset, slow_clock);
    U_PC: Program_counter port map(next_pc, slow_clock, Reset, pc);
    U_ROM: Program_Rom port map(pc, instruction);

    U_Dec: Instruction_decoder port map(
        instruction, regA_value, reg_en, load_sel, value, reg_a, reg_b,
        addORsub, jump_flag, jump_address
    );

    U_PC_ADD: RCA_3 port map(pc, "001", seq_pc);
    U_PC_MUX: MUX_2way_3bit port map(jump_flag, jump_address, seq_pc, next_pc);

    U_REGS: Reg_bank_8 port map(
        reg_en, slow_clock, Reset, output_value,
        r0, r1, r2, r3, r4, r5, r6, r7
    );

    U_MUX_A: MUX_8way_4bit port map(r0, r1, r2, r3, r4, r5, r6, r7, reg_a, regA_value);
    U_MUX_B: MUX_8way_4bit port map(r0, r1, r2, r3, r4, r5, r6, r7, reg_b, regB_value);
    U_ALU: RCA_4 port map(regA_value, regB_value, addORsub, alu_value, carry_led, overflow_led);
    U_LOAD_MUX: MUX_2way_4bit port map(load_sel, value, alu_value, output_value);
    U_7SEG: LUT_16_7 port map(r7, Reg7_digit);

    zero_led <= '1' when alu_value = "0000" else '0';
    Reg7_led <= r7;
    Anode <= "1110";
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Instruction_decoder is
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
end Instruction_decoder;

architecture Behavioral of Instruction_decoder is
begin
    process(instruction, jump_check)
    begin
        reg_en       <= "000";
        load_sel     <= '0';
        value        <= "0000";
        reg_a        <= "000";
        reg_b        <= "000";
        addORsub     <= '0';
        jump_flag    <= '0';
        jump_address <= "000";

        case instruction(11 downto 10) is
            when "00" => -- ADD Ra, Rb
                reg_a    <= instruction(9 downto 7);
                reg_b    <= instruction(6 downto 4);
                reg_en   <= instruction(9 downto 7);
                load_sel <= '1';
                addORsub <= '0';

            when "01" => -- NEG R: R = R0 - R, R0 is always 0000
                reg_a    <= "000";
                reg_b    <= instruction(9 downto 7);
                reg_en   <= instruction(9 downto 7);
                load_sel <= '1';
                addORsub <= '1';

            when "10" => -- MOVI R, d
                reg_en   <= instruction(9 downto 7);
                value    <= instruction(3 downto 0);
                load_sel <= '0';

            when others => -- JZR R, d
                reg_a        <= instruction(9 downto 7);
                jump_address <= instruction(2 downto 0);
                if jump_check = "0000" then
                    jump_flag <= '1';
                else
                    jump_flag <= '0';
                end if;
        end case;
    end process;
end Behavioral;

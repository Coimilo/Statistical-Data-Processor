-- Input manager
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity input_manager is
    Port (

        clk        : in  STD_LOGIC;
        reset      : in  STD_LOGIC;
        load_pulse : in  STD_LOGIC;

        data_in    : in  UNSIGNED(3 downto 0);

        num1       : out UNSIGNED(3 downto 0);
        num2       : out UNSIGNED(3 downto 0);
        num3       : out UNSIGNED(3 downto 0);
        num4       : out UNSIGNED(3 downto 0);
        num5       : out UNSIGNED(3 downto 0);

        count      : out UNSIGNED(2 downto 0);

        error      : out STD_LOGIC

    );
end input_manager;

architecture Behavioral of input_manager is

    signal r_num1, r_num2, r_num3, r_num4, r_num5 : UNSIGNED(3 downto 0);

    signal r_count : UNSIGNED(2 downto 0);

    signal r_error : STD_LOGIC;

begin

    process(clk, reset)
    begin

        if reset = '1' then

            r_num1  <= (others => '0');
            r_num2  <= (others => '0');
            r_num3  <= (others => '0');
            r_num4  <= (others => '0');
            r_num5  <= (others => '0');

            r_count <= (others => '0');

            r_error <= '0';

        elsif rising_edge(clk) then

            if load_pulse = '1' then

                if r_count < 5 then

                    case r_count is

                        when "000" =>
                            r_num1 <= data_in;

                        when "001" =>
                            r_num2 <= data_in;

                        when "010" =>
                            r_num3 <= data_in;

                        when "011" =>
                            r_num4 <= data_in;

                        when "100" =>
                            r_num5 <= data_in;

                        when others =>
                            null;

                    end case;

                    r_count <= r_count + 1;

                    r_error <= '0';

                else

                    r_error <= '1';

                end if;

            end if;

        end if;

    end process;

    num1 <= r_num1;
    num2 <= r_num2;
    num3 <= r_num3;
    num4 <= r_num4;
    num5 <= r_num5;

    count <= r_count;

    error <= r_error;

end Behavioral;

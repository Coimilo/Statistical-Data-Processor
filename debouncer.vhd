-- Debouncer
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity debouncer is
    Port (
        clk          : in  STD_LOGIC;
        reset        : in  STD_LOGIC;
        button_in    : in  STD_LOGIC;
        button_clean : out STD_LOGIC
    );
end debouncer;

architecture Behavioral of debouncer is

    constant MAX_COUNT : unsigned(19 downto 0) := to_unsigned(1000000, 20);

    signal counter      : unsigned(19 downto 0);
    signal button_state : STD_LOGIC;
    signal button_prev  : STD_LOGIC;

begin

    process(clk, reset)
    begin

        if reset = '1' then

            counter      <= (others => '0');
            button_state <= '0';
            button_prev  <= '0';

        elsif rising_edge(clk) then

            if button_in /= button_prev then

                counter <= (others => '0');

            elsif counter < MAX_COUNT then

                counter <= counter + 1;

            else

                button_state <= button_in;

            end if;

            button_prev <= button_in;

        end if;

    end process;

    button_clean <= button_state;

end Behavioral;

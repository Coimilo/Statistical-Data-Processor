-- Edge detector
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity edge_detector is
    Port (
        clk        : in  STD_LOGIC;
        reset      : in  STD_LOGIC;
        signal_in  : in  STD_LOGIC;
        pulse_out  : out STD_LOGIC
    );
end edge_detector;

architecture Behavioral of edge_detector is

    signal signal_prev : STD_LOGIC;

begin

    process(clk, reset)
    begin

        if reset = '1' then

            signal_prev <= '0';
            pulse_out <= '0';

        elsif rising_edge(clk) then

            pulse_out <= signal_in and (not signal_prev);

            signal_prev <= signal_in;

        end if;

    end process;

end Behavioral;
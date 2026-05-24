-- Display_selector
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity display_selector is
    Port (

        sel : in UNSIGNED(2 downto 0);

        max_value      : in UNSIGNED(3 downto 0);
        min_value      : in UNSIGNED(3 downto 0);
        range_value    : in UNSIGNED(3 downto 0);
        average_value  : in UNSIGNED(3 downto 0);
        mode_value     : in UNSIGNED(3 downto 0);
        median_value   : in UNSIGNED(3 downto 0);
        
        sum_value      : in UNSIGNED(6 downto 0);
        variance_value : in UNSIGNED(15 downto 0);

        display_value  : out UNSIGNED(15 downto 0)

    );
end display_selector;

architecture Behavioral of display_selector is

begin

    process(
        sel,
        max_value,
        min_value,
        range_value,
        average_value,
        mode_value,
        median_value,
        sum_value,
        variance_value
    )

    begin

        case sel is

            when "000" =>

                display_value <= resize(max_value, 16);

            when "001" =>

                display_value <= resize(min_value, 16);

            when "010" =>

                display_value <= resize(range_value, 16);
                
            when "011" =>

                display_value <= resize(sum_value, 16);

            when "100" =>

                display_value <= resize(average_value, 16);

            when "101" =>

                display_value <= resize(mode_value, 16);

            when "110" =>

                display_value <= resize(median_value, 16);

            when "111" =>

                display_value <= variance_value;

            when others =>

                display_value <= (others => '0');

        end case;

    end process;

end Behavioral;
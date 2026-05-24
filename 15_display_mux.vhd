-- Display_mux
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity display_mux is
    Port (

        clk : in STD_LOGIC;

        hundreds : in UNSIGNED(3 downto 0);
        tens     : in UNSIGNED(3 downto 0);
        unit_s    : in UNSIGNED(3 downto 0);

        segments : out STD_LOGIC_VECTOR(6 downto 0);
        dp       : OUT STD_LOGIC;

        anodes   : out STD_LOGIC_VECTOR(3 downto 0)

    );
end display_mux;

architecture Behavioral of display_mux is

    -------------------------------------------------
    -- Señales internas
    -------------------------------------------------

    signal refresh_counter : UNSIGNED(15 downto 0);

    signal digit_select : UNSIGNED(1 downto 0);

    signal current_digit : UNSIGNED(3 downto 0);

begin

    -------------------------------------------------
    -- Contador de refresco
    -------------------------------------------------

    process(clk)
    begin

        if rising_edge(clk) then

            refresh_counter <= refresh_counter + 1;

        end if;

    end process;

    -------------------------------------------------
    -- Selector de dígito
    -------------------------------------------------

    digit_select <= refresh_counter(15 downto 14);

    -------------------------------------------------
    -- Multiplexación
    -------------------------------------------------

    process(digit_select, hundreds, tens, unit_s)

    begin

        case digit_select is

            -------------------------------------------------
            -- Unidades
            -------------------------------------------------

            when "00" =>

                current_digit <= unit_s;

                anodes <= "1110";

            -------------------------------------------------
            -- Decenas
            -------------------------------------------------

            when "01" =>

                current_digit <= tens;

                anodes <= "1101";

            -------------------------------------------------
            -- Centenas
            -------------------------------------------------

            when "10" =>

                current_digit <= hundreds;

                anodes <= "1011";

            -------------------------------------------------
            -- Default
            -------------------------------------------------

            when others =>

                current_digit <= (others => '0');

                anodes <= "1111";

        end case;

    end process;

    -------------------------------------------------
    -- Driver de 7 segmentos
    -------------------------------------------------

    seven_seg_inst : entity work.seven_segment_driver
        port map (

            bcd_in   => current_digit,

            segments => segments,
            
            dp => dp

        );

end Behavioral;

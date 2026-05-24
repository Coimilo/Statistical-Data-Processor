library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity variance_module is
    Port (

        num1           : in  UNSIGNED(3 downto 0);
        num2           : in  UNSIGNED(3 downto 0);
        num3           : in  UNSIGNED(3 downto 0);
        num4           : in  UNSIGNED(3 downto 0);
        num5           : in  UNSIGNED(3 downto 0);

        count          : in  UNSIGNED(2 downto 0);

        average_value  : in  UNSIGNED(3 downto 0);

        variance_value : out UNSIGNED(15 downto 0)

    );
end variance_module;

architecture Behavioral of variance_module is

begin

    process(num1, num2, num3, num4, num5, count, average_value)

        variable sum_sq : integer := 0;

        variable diff : integer;

        variable avg_int : integer;

    begin

        -------------------------------------------------
        -- Inicialización
        -------------------------------------------------

        sum_sq := 0;

        avg_int := to_integer(average_value);

        -------------------------------------------------
        -- num1
        -------------------------------------------------

        if count > 0 then

            diff := to_integer(num1) - avg_int;

            sum_sq := sum_sq + (diff * diff);

        end if;

        -------------------------------------------------
        -- num2
        -------------------------------------------------

        if count > 1 then

            diff := to_integer(num2) - avg_int;

            sum_sq := sum_sq + (diff * diff);

        end if;

        -------------------------------------------------
        -- num3
        -------------------------------------------------

        if count > 2 then

            diff := to_integer(num3) - avg_int;

            sum_sq := sum_sq + (diff * diff);

        end if;

        -------------------------------------------------
        -- num4
        -------------------------------------------------

        if count > 3 then

            diff := to_integer(num4) - avg_int;

            sum_sq := sum_sq + (diff * diff);

        end if;

        -------------------------------------------------
        -- num5
        -------------------------------------------------

        if count > 4 then

            diff := to_integer(num5) - avg_int;

            sum_sq := sum_sq + (diff * diff);

        end if;

        -------------------------------------------------
        -- División final
        -------------------------------------------------

        if count /= 0 then

            variance_value <=
                to_unsigned(
                    sum_sq / to_integer(count),
                    16
                );

        else

            variance_value <= (others => '0');

        end if;

    end process;

end Behavioral;
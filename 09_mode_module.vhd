-- Mode_module
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mode_module is
    Port (

        num1       : in  UNSIGNED(3 downto 0);
        num2       : in  UNSIGNED(3 downto 0);
        num3       : in  UNSIGNED(3 downto 0);
        num4       : in  UNSIGNED(3 downto 0);
        num5       : in  UNSIGNED(3 downto 0);

        count      : in  UNSIGNED(2 downto 0);

        mode_value : out UNSIGNED(3 downto 0)

    );
end mode_module;

architecture Behavioral of mode_module is

begin

    process(num1, num2, num3, num4, num5, count)

        variable c1, c2, c3, c4, c5 : integer range 0 to 5;

        variable max_count : integer range 0 to 5;

        variable temp_mode : UNSIGNED(3 downto 0);

    begin

        -------------------------------------------------
        -- Inicialización
        -------------------------------------------------

        c1 := 0;
        c2 := 0;
        c3 := 0;
        c4 := 0;
        c5 := 0;

        -------------------------------------------------
        -- Conteo de ocurrencias
        -------------------------------------------------

        if count > 0 then

            if num1 = num1 then c1 := c1 + 1; end if;
            if num1 = num2 then c1 := c1 + 1; end if;
            if num1 = num3 then c1 := c1 + 1; end if;
            if num1 = num4 then c1 := c1 + 1; end if;
            if num1 = num5 then c1 := c1 + 1; end if;

        end if;

        if count > 1 then

            if num2 = num1 then c2 := c2 + 1; end if;
            if num2 = num2 then c2 := c2 + 1; end if;
            if num2 = num3 then c2 := c2 + 1; end if;
            if num2 = num4 then c2 := c2 + 1; end if;
            if num2 = num5 then c2 := c2 + 1; end if;

        end if;

        if count > 2 then

            if num3 = num1 then c3 := c3 + 1; end if;
            if num3 = num2 then c3 := c3 + 1; end if;
            if num3 = num3 then c3 := c3 + 1; end if;
            if num3 = num4 then c3 := c3 + 1; end if;
            if num3 = num5 then c3 := c3 + 1; end if;

        end if;

        if count > 3 then

            if num4 = num1 then c4 := c4 + 1; end if;
            if num4 = num2 then c4 := c4 + 1; end if;
            if num4 = num3 then c4 := c4 + 1; end if;
            if num4 = num4 then c4 := c4 + 1; end if;
            if num4 = num5 then c4 := c4 + 1; end if;

        end if;

        if count > 4 then

            if num5 = num1 then c5 := c5 + 1; end if;
            if num5 = num2 then c5 := c5 + 1; end if;
            if num5 = num3 then c5 := c5 + 1; end if;
            if num5 = num4 then c5 := c5 + 1; end if;
            if num5 = num5 then c5 := c5 + 1; end if;

        end if;

        -------------------------------------------------
        -- Selección de la moda
        -------------------------------------------------

        max_count := c1;
        temp_mode := num1;

        if c2 > max_count then
            max_count := c2;
            temp_mode := num2;
        end if;

        if c3 > max_count then
            max_count := c3;
            temp_mode := num3;
        end if;

        if c4 > max_count then
            max_count := c4;
            temp_mode := num4;
        end if;

        if c5 > max_count then
            max_count := c5;
            temp_mode := num5;
        end if;
        
        if max_count = 1 then
        temp_mode := "0000";
        end if;

        mode_value <= temp_mode;

    end process;

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity median_module is
    Port (

        num1         : in  UNSIGNED(3 downto 0);
        num2         : in  UNSIGNED(3 downto 0);
        num3         : in  UNSIGNED(3 downto 0);
        num4         : in  UNSIGNED(3 downto 0);
        num5         : in  UNSIGNED(3 downto 0);

        count        : in  UNSIGNED(2 downto 0);

        median_value : out UNSIGNED(3 downto 0)

    );
end median_module;

architecture Behavioral of median_module is

begin

    process(num1, num2, num3, num4, num5, count)

        type data_array is array (0 to 4) of UNSIGNED(3 downto 0);

        variable arr  : data_array;

        variable temp : UNSIGNED(3 downto 0);

        variable med  : UNSIGNED(3 downto 0);

    begin

        -------------------------------------------------
        -- Inicializar todo en 15
        -------------------------------------------------

        for i in 0 to 4 loop
            arr(i) := "1111";
        end loop;

        -------------------------------------------------
        -- Cargar SOLO datos válidos
        -------------------------------------------------

        if count > 0 then
            arr(0) := num1;
        end if;

        if count > 1 then
            arr(1) := num2;
        end if;

        if count > 2 then
            arr(2) := num3;
        end if;

        if count > 3 then
            arr(3) := num4;
        end if;

        if count > 4 then
            arr(4) := num5;
        end if;

        -------------------------------------------------
        -- Bubble Sort
        -------------------------------------------------

        for i in 0 to 4 loop

            for j in 0 to 3 loop

                if arr(j) > arr(j + 1) then

                    temp := arr(j);

                    arr(j) := arr(j + 1);

                    arr(j + 1) := temp;

                end if;

            end loop;

        end loop;

        -------------------------------------------------
        -- Selección de mediana
        -------------------------------------------------

        case count is

            when "001" =>

                med := arr(0);

            when "010" =>

                med := resize((arr(0) + arr(1)) / 2, 4);

            when "011" =>

                med := arr(1);

            when "100" =>

                med := resize((arr(1) + arr(2)) / 2, 4);

            when "101" =>

                med := arr(2);

            when others =>

                med := (others => '0');

        end case;

        median_value <= med;

    end process;

end Behavioral;

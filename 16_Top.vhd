library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top_level is
    Port (

        -------------------------------------------------
        -- Entradas físicas
        -------------------------------------------------

        clk : in STD_LOGIC;

        reset : in STD_LOGIC;

        load_btn : in STD_LOGIC;

        data_switches : in UNSIGNED(3 downto 0);

        sel_switches : in UNSIGNED(2 downto 0);

        -------------------------------------------------
        -- Salidas físicas
        -------------------------------------------------

        segments : out STD_LOGIC_VECTOR(6 downto 0);
        
        dp       : out STD_LOGIC;

        anodes : out STD_LOGIC_VECTOR(3 downto 0);

        odd_led : out STD_LOGIC

    );
end top_level;

architecture Structural of top_level is

    -------------------------------------------------
    -- Señales de entrada
    -------------------------------------------------

    signal clean_btn  : STD_LOGIC;

    signal load_pulse : STD_LOGIC;

    -------------------------------------------------
    -- Datos almacenados
    -------------------------------------------------

    signal num1, num2, num3, num4, num5 :
        UNSIGNED(3 downto 0);

    signal count : UNSIGNED(2 downto 0);

    signal error : STD_LOGIC;

    -------------------------------------------------
    -- Resultados estadísticos
    -------------------------------------------------

    signal max_value      : UNSIGNED(3 downto 0);

    signal min_value      : UNSIGNED(3 downto 0);

    signal range_value    : UNSIGNED(3 downto 0);

    signal sum_value      : UNSIGNED(6 downto 0);

    signal average_value  : UNSIGNED(3 downto 0);

    signal mode_value     : UNSIGNED(3 downto 0);

    signal median_value   : UNSIGNED(3 downto 0);

    signal variance_value : UNSIGNED(5 downto 0);

    -------------------------------------------------
    -- Display
    -------------------------------------------------

    signal display_value : UNSIGNED(6 downto 0);

    signal hundreds : UNSIGNED(3 downto 0);

    signal tens : UNSIGNED(3 downto 0);

    signal unit_s : UNSIGNED(3 downto 0);

begin

    -------------------------------------------------
    -- Debouncer
    -------------------------------------------------

    debounce_inst : entity work.debouncer
        port map (

            clk => clk,

            reset => reset,

            button_in => load_btn,

            button_clean => clean_btn

        );

    -------------------------------------------------
    -- Edge Detector
    -------------------------------------------------

    edge_inst : entity work.edge_detector
        port map (

            clk => clk,

            reset => reset,

            signal_in => clean_btn,

            pulse_out => load_pulse

        );

    -------------------------------------------------
    -- Input Manager
    -------------------------------------------------

    input_inst : entity work.input_manager
        port map (

            clk => clk,

            reset => reset,

            load_pulse => load_pulse,

            data_in => data_switches,

            num1 => num1,
            num2 => num2,
            num3 => num3,
            num4 => num4,
            num5 => num5,

            count => count,

            error => error

        );

    -------------------------------------------------
    -- Max Module
    -------------------------------------------------

    max_inst : entity work.max_module
        port map (

            num1 => num1,
            num2 => num2,
            num3 => num3,
            num4 => num4,
            num5 => num5,

            count => count,

            max_value => max_value

        );

    -------------------------------------------------
    -- Min Module
    -------------------------------------------------

    min_inst : entity work.min_module
        port map (

            num1 => num1,
            num2 => num2,
            num3 => num3,
            num4 => num4,
            num5 => num5,

            count => count,

            min_value => min_value

        );

    -------------------------------------------------
    -- Range Module
    -------------------------------------------------

    range_inst : entity work.range_module
        port map (

            max_value => max_value,

            min_value => min_value,

            range_value => range_value

        );

    -------------------------------------------------
    -- Sum Module
    -------------------------------------------------

    sum_inst : entity work.sum_module
        port map (

            num1 => num1,
            num2 => num2,
            num3 => num3,
            num4 => num4,
            num5 => num5,

            count => count,

            sum_value => sum_value

        );

    -------------------------------------------------
    -- Average Module
    -------------------------------------------------

    average_inst : entity work.average_module
        port map (

            sum_value => sum_value,

            count => count,

            average_value => average_value

        );

    -------------------------------------------------
    -- Mode Module
    -------------------------------------------------

    mode_inst : entity work.mode_module
        port map (

            num1 => num1,
            num2 => num2,
            num3 => num3,
            num4 => num4,
            num5 => num5,

            count => count,

            mode_value => mode_value

        );

    -------------------------------------------------
    -- Median Module
    -------------------------------------------------

    median_inst : entity work.median_module
        port map (

            num1 => num1,
            num2 => num2,
            num3 => num3,
            num4 => num4,
            num5 => num5,

            count => count,

            median_value => median_value

        );

    -------------------------------------------------
    -- Variance Module
    -------------------------------------------------

    variance_inst : entity work.variance_module
        port map (

            num1 => num1,
            num2 => num2,
            num3 => num3,
            num4 => num4,
            num5 => num5,

            count => count,

            average_value => average_value,

            variance_value => variance_value

        );

    -------------------------------------------------
    -- Display Selector
    -------------------------------------------------

    display_sel_inst : entity work.display_selector
        port map (

            sel => sel_switches,

            max_value => max_value,

            min_value => min_value,

            range_value => range_value,
            
            sum_value => sum_value,

            average_value => average_value,

            mode_value => mode_value,

            median_value => median_value,

            variance_value => variance_value,

            display_value => display_value

        );

    -------------------------------------------------
    -- Binary to BCD
    -------------------------------------------------

    bcd_inst : entity work.binary_to_bcd
        port map (

            binary_value => display_value,
            
            error => error,

            hundreds => hundreds,

            tens => tens,

            unit_s => unit_s

        );

    -------------------------------------------------
    -- Display Multiplexor
    -------------------------------------------------

    display_mux_inst : entity work.display_mux
        port map (

            clk => clk,

            hundreds => hundreds,

            tens => tens,

            unit_s => unit_s,

            segments => segments,

            anodes => anodes,
            
            dp => dp

        );

    -------------------------------------------------
    -- Paridad impar
    -------------------------------------------------

    odd_led <= display_value(0);

end Structural;

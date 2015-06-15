-- A wrapper
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- PLL simulation
library UNISIM;
use UNISIM.vcomponents.all;

entity DelayedTop is
    port (
        clk50: in std_logic;
        reset: in std_logic;

        -- Sclk and cs are digital inputs -> AD1
        ja_cs : out std_logic_vector(0 downto 0);
        ja_sclk : out std_logic;
        ja_data : in std_logic_vector(1 downto 0);

        -- Jc is delayed word (a + b)
        jc_cs : out std_logic_vector(0 downto 0);  -- JC1
        jc_data : out std_logic_vector(0 downto 0);  -- JC2
        jc_sclk : out std_logic;  -- JC4

        -- Switches
        sw : in std_logic_vector(1 downto 0);
        debug_flag : in std_logic_vector(0 downto 0)
    );
end DelayedTop;

architecture Wrapper of DelayedTop is

component Proj is
  port(ja_data         : in std_logic_vector(1 downto 0);
       sw              : in std_logic_vector(1 downto 0);
       debug_flag      : in std_logic_vector(0 downto 0);
       -- clock
       SCLK1389        : in std_logic;
       -- asynchronous reset: active low
       SCLK1389_rstn   : in std_logic;
       -- clock
       SCLK2500        : in std_logic;
       -- asynchronous reset: active low
       SCLK2500_rstn   : in std_logic;
       -- clock
       system1000      : in std_logic;
       -- asynchronous reset: active low
       system1000_rstn : in std_logic;
       ja_cs           : out std_logic_vector(0 downto 0);
       jc_cs           : out std_logic_vector(0 downto 0);
       jc_data         : out std_logic_vector(0 downto 0));
end component;

signal feedback_clk : std_logic;
signal sclk20 : std_logic;
signal sclk36 : std_logic;
signal system1000 : std_logic;

begin
    PROJ1 : Proj
    port map
    (
        ja_data => ja_data,
        sw => sw,
        debug_flag => debug_flag,
        sclk1389 => sclk36,
        sclk1389_rstn => not reset,
        sclk2500 => sclk20,
        sclk2500_rstn => not reset,
        system1000 => system1000,
        system1000_rstn => not reset,
        ja_cs => ja_cs,
        jc_cs => jc_cs,
        jc_data => jc_data
    );

    ja_sclk <= sclk20;
    jc_sclk <= sclk36;

    -- PLLE2_BASE: Base Phase Locked Loop (PLL)
    --             Artix-7
    -- Xilinx HDL Language Template, version 2014.4

    PLLE2_BASE_inst : PLLE2_BASE
    generic map (
        BANDWIDTH => "OPTIMIZED",  -- OPTIMIZED, HIGH, LOW
        CLKFBOUT_MULT => 18,        -- Multiply value for all CLKOUT, (2-64)
        CLKFBOUT_PHASE => 0.0,     -- Phase offset in degrees of CLKFB, (-360.000-360.000).
        CLKIN1_PERIOD => 20.0,      -- Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
        -- CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for each CLKOUT (1-128)
        CLKOUT0_DIVIDE => 18,  -- 50 MHz
        CLKOUT1_DIVIDE => 25,  -- 36 MHz
        CLKOUT2_DIVIDE => 45,  -- 20 MHz
        CLKOUT3_DIVIDE => 1,
        CLKOUT4_DIVIDE => 1,
        CLKOUT5_DIVIDE => 1,
        -- CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for each CLKOUT (0.001-0.999).
        CLKOUT0_DUTY_CYCLE => 0.5,
        CLKOUT1_DUTY_CYCLE => 0.5,
        CLKOUT2_DUTY_CYCLE => 0.5,
        CLKOUT3_DUTY_CYCLE => 0.5,
        CLKOUT4_DUTY_CYCLE => 0.5,
        CLKOUT5_DUTY_CYCLE => 0.5,
        -- CLKOUT0_PHASE - CLKOUT5_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
        CLKOUT0_PHASE => 0.0,
        CLKOUT1_PHASE => 0.0,
        CLKOUT2_PHASE => 0.0,
        CLKOUT3_PHASE => 0.0,
        CLKOUT4_PHASE => 0.0,
        CLKOUT5_PHASE => 0.0,
        DIVCLK_DIVIDE => 1,        -- Master division value, (1-56)
        REF_JITTER1 => 0.0,        -- Reference input jitter in UI, (0.000-0.999).
        STARTUP_WAIT => "FALSE"    -- Delay DONE until PLL Locks, ("TRUE"/"FALSE")
    )
    port map (
        -- Clock Outputs: 1-bit (each) output: User configurable clock outputs
        CLKOUT0 => system1000,   -- 1-bit output: CLKOUT0
        CLKOUT1 => sclk36,   -- 1-bit output: CLKOUT1
        CLKOUT2 => sclk20,   -- 1-bit output: CLKOUT2
        CLKOUT3 => OPEN,   -- 1-bit output: CLKOUT3
        CLKOUT4 => OPEN,   -- 1-bit output: CLKOUT4
        CLKOUT5 => OPEN,   -- 1-bit output: CLKOUT5
        -- Feedback Clocks: 1-bit (each) output: Clock feedback ports
        CLKFBOUT => feedback_clk, -- 1-bit output: Feedback clock
        LOCKED => OPEN,     -- 1-bit output: LOCK
        CLKIN1 => clk50,     -- 1-bit input: Input clock
        -- Control Ports: 1-bit (each) input: PLL control ports
        PWRDWN => '0',     -- 1-bit input: Power-down
        RST => reset,           -- 1-bit input: Reset
        -- Feedback Clocks: 1-bit (each) input: Clock feedback ports
        CLKFBIN => feedback_clk    -- 1-bit input: Feedback clock
    );

    -- End of PLLE2_BASE_inst instantiation

end Wrapper;

-- vim: tw=80 expandtab shiftwidth=4 tabstop=4 smarttab

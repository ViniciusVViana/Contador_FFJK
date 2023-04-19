library ieee;
use ieee.std_logic_1164.all;

entity CONTADOR is
    port(
        clk, reset : in std_logic;
        z : out std_logic_vector(2 downto 0)
    );
end entity;

architecture CONTAR of CONTADOR is
    component CTRL is
        port(
            Q : in std_logic_vector(2 downto 0);
            J : out std_logic_vector(2 downto 0);
            K : out std_logic_vector(2 downto 0)
        );
    end component;
    component FFJK is
        port(
            j, k   : in std_logic;
            clock  : in std_logic;
            pr, cl : in std_logic;
            q, nq  : out std_logic
        );
    end component;

    signal sJ, sK, sQ, sNQ : std_logic_vector(2 downto 0);
    signal vcc : std_logic := '1';

begin
    u_CTRL: CTRL port map(sQ, sJ, sK);

    u_FFJK0 : FFJK port map(sJ(0), sK(0), clk, reset, vcc, sQ(0), sNQ(0));
    u_FFJK1 : FFJK port map(sJ(1), sK(1), clk, vcc, reset, sQ(1), sNQ(1));
    u_FFJK2 : FFJK port map(sJ(2), sK(2), clk, vcc, reset, sQ(2), sNQ(2));

    z <= sQ;
end architecture;
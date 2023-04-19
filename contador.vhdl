library ieee;
use ieee.std_logic_1164.all;

entity contador is 
    port(
        clk, reset: in std_logic;
        c: out std_logic_vector(2 downto 0)
    );  
end contador;

architecture contar of contador is
    component ctrl_jk is 
        port(
            Q: in std_logic_vector(2 downto 0);
            J: out std_logic_vector(2 downto 0);
            K: out std_logic_vector(2 downto 0)
        );
    end component;

    component ffjk is
       port(
        j, k   : in std_logic;
        clk    : in std_logic;
        pr, cl : in std_logic;
        q, nq  : out std_logic
    );
    end component;

    signal j_aux, k_aux, q_aux,nq_aux: std_logic_vector(2 downto 0);
    signal vcc: std_logic := '1';

    
    
begin
    
    u_ctrl: ctrl_jk port map(q_aux, j_aux, k_aux);
    nq_aux <= not(q_aux);
 
    u_ff0: ffjk port map(j_aux(0),k_aux(0),clk,reset,vcc,q_aux(0), nq_aux(0));
    u_ff1: ffjk port map(j_aux(1),k_aux(1),clk,vcc,reset,q_aux(1), nq_aux(1));
    u_ff2: ffjk port map(j_aux(2),k_aux(2),clk,vcc,reset,q_aux(2), nq_aux(2));
  
end architecture;

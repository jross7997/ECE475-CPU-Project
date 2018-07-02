--*************************************************************************--
--ALU
--For the ECE 475 final Project
-- This File takes in a 4 bit select code and will Add, Subtract, Left Shift
--Right Shift, Multiply, NOT either input, AND, OR, XOR, or pass data through.
--If the result is zero, a flag will be raised
--*************************************************************************--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.left_shift_package.ALL;
use work.right_shift_package.ALL;

entity ALU is
    Port ( sel : in STD_LOGIC_VECTOR (3 downto 0); --4 bit select line
           data1 : in STD_LOGIC_VECTOR (63 downto 0); --input #1
           data2 : in STD_LOGIC_VECTOR (63 downto 0);--input #2
           zero : out STD_LOGIC; --Zero Flag
           result : out STD_LOGIC_VECTOR (63 downto 0) --Result
           ); 
end ALU;

architecture Behavioral of ALU is

--Output Signal
Signal outRes :STD_LOGIC_VECTOR(63 downto 0);

--*************************************************************************--
--  A + B  
--*************************************************************************--
function a_plus_b (
        ain_int: STD_LOGIC_VECTOR(63 downto 0);
        bin_int: STD_LOGIC_VECTOR(63 downto 0)) 
return STD_LOGIC_VECTOR is
       variable sum_int : STD_LOGIC_VECTOR(63 downto 0) := x"0000000000000000"; 
begin
    sum_int := ain_int + bin_int;  
return sum_int;
end a_plus_b;

--*************************************************************************--
--  A - B outputs 2's complement 
--*************************************************************************--
function a_minus_b (
        ain_int: STD_LOGIC_VECTOR(63 downto 0);
        bin_int: STD_LOGIC_VECTOR(63 downto 0)) 
return STD_LOGIC_VECTOR is
       variable difference_int : STD_LOGIC_VECTOR(63 downto 0) := x"0000000000000000"; 
       variable bin_int_neg : STD_LOGIC_VECTOR(63 downto 0) := x"0000000000000000"; 
begin
    bin_int_neg := not(bin_int) + 1;
    difference_int := ain_int + bin_int_neg;  
return difference_int;
end a_minus_b;

--*************************************************************************--
--  A x B multu 
--*************************************************************************--
function a_x_b (
        ain_int: STD_LOGIC_VECTOR(63 downto 0);
        bin_int: STD_LOGIC_VECTOR(63 downto 0)) 
return STD_LOGIC_VECTOR is
       variable product_int : STD_LOGIC_VECTOR(127 downto 0) := x"00000000000000000000000000000000"; 
begin
    product_int :=  ain_int * bin_int;  
return product_int(63 downto 0);
end a_x_b;

--*************************************************************************--
--Logical Shift Left
--*************************************************************************--
Component LSL is
Port(a : in STD_LOGIC_VECTOR (63 downto 0);
           b : in STD_LOGIC_VECTOR (63 downto 0);
           shift : out STD_LOGIC_VECTOR (63 downto 0)
           );
End Component;
--*************************************************************************--
--Logical Shift Right
--*************************************************************************--
Component LSR is
Port(a : in STD_LOGIC_VECTOR (63 downto 0);
           b : in STD_LOGIC_VECTOR (63 downto 0);
           shift : out STD_LOGIC_VECTOR (63 downto 0)
            );
End Component;

--*************************************************************************--
--Normal Process
--*************************************************************************--

begin
    process(sel, data1, data2)
        begin
            case sel is
                when "0000"     =>  outRes <= (a_plus_b((data1),(data2)));  --  A + B (add)
                when "0001"     =>  outRes <= (a_plus_b((data1),(data2)));  --  A + B (addi)
                when "0010"     =>  outRes <= (a_minus_b((data1),(data2)));  --  A - B (sub)
                when "0011"     =>  outRes <=  (a_minus_b((data1),(data2)));  --  A - B (subi)
                when "0100"     =>  LSL(data1,data2,outRes);  --  Logical Shift Left
                when "0101"     =>  LSR(data1,data2,outRes);  --  Logical Shift Right
                when "0110"     =>  outRes <=  a_x_b(data1,data2);  --  A * B 
                when "0111"     =>  outRes <= not(data1);  -- NoT(A)
                when "1000"     =>  outRes <=  NOT(data2);  -- NOT(B)
                when "1001"     =>  outRes <= (data1 AND data2); -- A AND B
                when "1010"     =>  outRes <=  (data1 OR data2);  -- A OR B
                when "1011"     =>  outRes <= (data1 XOR data2);  -- A XOR B
                when "1100"     =>  outRes <= data1;
                when "1101"     =>  outRes <= data2;
                when others     =>  outRes <= x"0000000000000000";
   end case;

end process;

--ZeroFlag
process(outRes)
    begin
        if outRes = x"00000000000000000" then
            zero <= '1';
        else
            zero <= '0';
        end if;
end process;

    result <= outRes;

end Behavioral;
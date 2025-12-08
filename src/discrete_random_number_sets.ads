--  with Ada.Containers.Ordered_Sets;
with Lottery; use Lottery;

generic
   Number_Range_Start : Integer;
   Number_Range_End : Integer;
   Num_Elements : Positive;
   with function Validate (Num_Array : Num_Arrays) return Boolean;
   --  type Index is range <>;
   --  type Num_Array is array (Index range <>) of Number_Range'Base;
   --  with package Number_Sets is new
   --    Ada.Containers.Ordered_Sets (Number_Range);
   --  with function Validate (Set : Number_Sets.Set) return Boolean;

package Discrete_Random_Number_Sets is

   --  function Generate return Number_Sets.Set;
   function Generate return Num_Arrays;
end Discrete_Random_Number_Sets;

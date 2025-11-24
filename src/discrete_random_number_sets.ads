with Ada.Containers.Ordered_Sets;

generic
   type Number_Range is (<>);
   Num_Elements : Positive;
   with package Number_Sets is new
     Ada.Containers.Ordered_Sets (Number_Range);
   with function Validate (Set : Number_Sets.Set) return Boolean;

package Discrete_Random_Number_Sets is

   function Generate return Number_Sets.Set;

   procedure Put (Set   : Number_Sets.Set;
                  Width : Positive);
end Discrete_Random_Number_Sets;

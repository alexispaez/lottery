with Ada.Containers.Ordered_Sets;

generic
   type Number_Range is (<>);
   Num_Elements : Positive;

package Discrete_Random_Number_Sets is

   package Number_Sets is new
     Ada.Containers.Ordered_Sets
       (Element_Type =>  Number_Range);

   function Generate return Number_Sets.Set;

   procedure Put (Set   : Number_Sets.Set;
                  Width : Positive);

end Discrete_Random_Number_Sets;

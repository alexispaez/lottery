with Ada.Containers.Ordered_Sets;

generic
   type Number_Range is (<>);
   Num_Elements : Positive;
   --  with function Validate (

package Discrete_Random_Number_Sets is

   type Set is private;

   function Generate return Set;

   procedure Put (Number_Set : Set;
                  Width      : Positive);
private

   package Number_Sets is new
     Ada.Containers.Ordered_Sets
       (Element_Type =>  Number_Range);

   type Set is new Number_Sets.Set with null record;

end Discrete_Random_Number_Sets;

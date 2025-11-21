pragma Ada_2022;

with Ada.Numerics.Discrete_Random;
with Ada.Text_IO;

with Integer_Formatting;

package body Discrete_Random_Number_Sets is

   package Int_Fmt renames Integer_Formatting;

   function Generate return Set
     with Refined_Post => Generate'Result'Size = Num_Elements is

      package Random_Number is new
        Ada.Numerics.Discrete_Random (Number_Range);

      Number_Set : Set;
      Cursor     : Number_Sets.Cursor;
      Generator  : Random_Number.Generator;
      Inserted   : Boolean;
      Counter    : Integer := 0;
   begin
      --  Generate the numbers for the set
      Random_Number.Reset (Generator);
      while Counter < Num_Elements loop
         Number_Set.Insert (Random_Number.Random (Generator),
                            Cursor,
                            Inserted);
         if Inserted then
            Counter := @ + 1;
         end if;
      end loop;

      return Number_Set;
   end Generate;

   procedure Put (Number_Set : Set;
                  Width      : Positive) is
   begin
      --  Display set
      for E of Number_Set loop
         Ada.Text_IO.Put (Int_Fmt.Format (E'Image, Width));

         if E /= Number_Set.Last_Element then
            Ada.Text_IO.Put (",");
         end if;
      end loop;
      Ada.Text_IO.New_Line;
   end Put;

end Discrete_Random_Number_Sets;

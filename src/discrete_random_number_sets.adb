pragma Ada_2022;

with Ada.Numerics.Discrete_Random;
with Ada.Text_IO;

with Integer_Formatting;

package body Discrete_Random_Number_Sets is

   package Int_Fmt renames Integer_Formatting;

   function Generate return Number_Sets.Set
     with Refined_Post => Generate'Result'Size = Num_Elements is

      package Random_Number is new
        Ada.Numerics.Discrete_Random (Number_Range);

      Set       : Number_Sets.Set;
      Cursor    : Number_Sets.Cursor;
      Generator : Random_Number.Generator;
      Inserted  : Boolean;
      Counter   : Integer;
   begin
      --  Generate the numbers for the set
      loop
         Random_Number.Reset (Generator);

         if not Set.Is_Empty then
            Set.Clear;
         end if;

         Counter := 0;
         while Counter < Num_Elements loop
            Set. Insert (Random_Number.Random (Generator),
                        Cursor,
                        Inserted);
            if Inserted then
               Counter := @ + 1;
            end if;
         end loop;

         exit when Validate (Set);
      end loop;

      return Set;
   end Generate;

   procedure Put (Set   : Number_Sets.Set;
                  Width : Positive) is
   begin
      --  Display set
      for E of Set loop
         Ada.Text_IO.Put (Int_Fmt.Format (E'Image, Width));

         if E /= Set.Last_Element then
            Ada.Text_IO.Put (",");
         end if;
      end loop;
      Ada.Text_IO.New_Line;
   end Put;

end Discrete_Random_Number_Sets;

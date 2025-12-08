pragma Ada_2022;

with Ada.Containers.Ordered_Sets;
with Ada.Numerics.Discrete_Random;

package body Discrete_Random_Number_Sets is

   function Generate return Num_Arrays
     with Refined_Post => Generate'Result'Size = Num_Elements is

      package Number_Sets is new
        Ada.Containers.Ordered_Sets
          (Element_Type =>  Lottery_Number);

      subtype Lottery_Number_Range is
        Lottery_Number range Number_Range_Start .. Number_Range_End;

      package Random_Number is new
        Ada.Numerics.Discrete_Random (Lottery_Number_Range);

      function To_Array (Set : Number_Sets.Set) return Num_Arrays is
         Index : Positive := 1;
      begin
         return A : Num_Arrays (1 .. Integer (Set.Length)) do
            for E of Set loop
               A (Index) := E;
               Index := @ + 1;
            end loop;
         end return;
      end To_Array;

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
            Set.Insert (Random_Number.Random (Generator),
                        Cursor,
                        Inserted);

            if Inserted then
               Counter := @ + 1;
            end if;
         end loop;

         exit when Validate (To_Array (Set));
      end loop;

      return To_Array (Set);
   end Generate;

end Discrete_Random_Number_Sets;

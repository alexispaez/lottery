pragma Ada_2022;

with Ada.Containers; use Ada.Containers;
with Ada.Containers.Ordered_Sets;
with Ada.Numerics.Discrete_Random;
with Ada.Text_IO;
with Integer_Formatting;

procedure Lottery is
   --  Euromillon
   subtype Euromillon_Number_Range is Integer range 1 .. 50;
   subtype Euromillon_Star_Range is Integer range 1 .. 12;

   package Random_Euromillon_Number is new
     Ada.Numerics.Discrete_Random (Euromillon_Number_Range);
   package Euromillon_Number_Sets is new
     Ada.Containers.Ordered_Sets
       (Element_Type =>  Euromillon_Number_Range);

   package Random_Euromillon_Star is new
     Ada.Numerics.Discrete_Random (Euromillon_Star_Range);
   package Euromillon_Star_Sets is new
     Ada.Containers.Ordered_Sets
       (Element_Type =>  Euromillon_Star_Range);

   --  Primitiva
   subtype Primitiva_Number_Range is Integer range 1 .. 49;

   package Random_Primitiva_Number is new
     Ada.Numerics.Discrete_Random (Primitiva_Number_Range);
   package Primitiva_Number_Sets is new
     Ada.Containers.Ordered_Sets
       (Element_Type =>  Primitiva_Number_Range);

   --  Helpers
   package Int_Fmt renames Integer_Formatting;

   Euro_Num_G : Random_Euromillon_Number.Generator;
   Euro_Num_Set : Euromillon_Number_Sets.Set;
   Euro_Num_C : Euromillon_Number_Sets.Cursor;

   Euro_Star_G : Random_Euromillon_Star.Generator;
   Euro_Star_Set : Euromillon_Star_Sets.Set;
   Euro_Star_C : Euromillon_Star_Sets.Cursor;

   Primi_Num_G : Random_Primitiva_Number.Generator;
   Primi_Num_Set : Primitiva_Number_Sets.Set;
   Primi_Num_C : Primitiva_Number_Sets.Cursor;

   Inserted : Boolean;
   Counter : Integer;
begin
   Ada.Text_IO.Put ("Euromillon numbers: ");

   --  Generate the numbers
   Random_Euromillon_Number.Reset (Euro_Num_G);
   Counter := 0;
   while Counter < 5 loop
      Euro_Num_Set.Insert (Random_Euromillon_Number.Random (Euro_Num_G),
                           Euro_Num_C,
                           Inserted);
      if Inserted then
         Counter := @ + 1;
      else
         Ada.Text_IO. Put_Line
           ("Duplicate number generated!");
      end if;
   end loop;
   --  Display them
   for E of Euro_Num_Set loop
      Ada.Text_IO.Put (Int_Fmt.Format (E'Image, 2));

      if E /= Euro_Num_Set.Last_Element then
         Ada.Text_IO.Put (",");
      end if;
   end loop;
   Ada.Text_IO.New_Line;

   --  Generate the stars
   Ada.Text_IO.Put ("Euromillon stars: ");

   Random_Euromillon_Star.Reset (Euro_Star_G);
   Counter := 0;
   while Counter < 2 loop
      Euro_Star_Set.Insert (Random_Euromillon_Star.Random (Euro_Star_G),
                            Euro_Star_C,
                            Inserted);
      if Inserted then
         Counter := @ + 1;
      else
         Ada.Text_IO. Put_Line
           ("Duplicate star generated!");
      end if;
   end loop;
   --  Display them
   for E of Euro_Star_Set loop
      Ada.Text_IO.Put (Int_Fmt.Format (E'Image, 2));

      if E /= Euro_Star_Set.Last_Element then
         Ada.Text_IO.Put (",");
      end if;
   end loop;
   Ada.Text_IO.New_Line;


   Ada.Text_IO.Put ("Primitiva numbers: ");

   --  Generate the numbers
   Random_Primitiva_Number.Reset (Primi_Num_G);
   Counter := 0;
   while Counter < 6 loop
      Primi_Num_Set.Insert (Random_Primitiva_Number.Random (Primi_Num_G),
                           Primi_Num_C,
                           Inserted);
      if Inserted then
         Counter := @ + 1;
      else
         Ada.Text_IO. Put_Line
           ("Duplicate number generated!");
      end if;
   end loop;
   --  Display them
   for E of Primi_Num_Set loop
      Ada.Text_IO.Put (Int_Fmt.Format (E'Image, 2));

      if E /= Primi_Num_Set.Last_Element then
         Ada.Text_IO.Put (",");
      end if;
   end loop;
   Ada.Text_IO.New_Line;

end Lottery;

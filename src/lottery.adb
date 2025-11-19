pragma Ada_2022;

with Ada.Numerics.Discrete_Random;
with Ada.Text_IO;
with Integer_Formatting;
with Discrete_Random_Number_Sets;

procedure Lottery is
   --  Euromillon
   subtype Euromillon_Number_Range is Integer range 1 .. 50;
   subtype Euromillon_Star_Range is Integer range 1 .. 12;

   package Euromillon_Number_Sets is new
     Discrete_Random_Number_Sets (Euromillon_Number_Range, 5);
   package Euromillon_Star_Sets is new
     Discrete_Random_Number_Sets (Euromillon_Star_Range, 2);

   --  Primitiva
   subtype Primitiva_Number_Range is Integer range 1 .. 49;

   package Primitiva_Number_Sets is new
     Discrete_Random_Number_Sets (Primitiva_Number_Range, 6);

   --  Loteria Nacional
   subtype Loteria_Nacional_Number_Range is Integer range 0 .. 99999;
   package Random_Loteria_Nacional_Number is new
     Ada.Numerics.Discrete_Random (Loteria_Nacional_Number_Range);

   --  Helpers
   package Int_Fmt renames Integer_Formatting;

   Lot_Nal_G : Random_Loteria_Nacional_Number.Generator;
   Lot_Nal_Num : Loteria_Nacional_Number_Range;

   Euro_Num_Set : Euromillon_Number_Sets.Number_Sets.Set;
   Euro_Star_Set : Euromillon_Star_Sets.Number_Sets.Set;

   Primi_Num_Set : Primitiva_Number_Sets.Number_Sets.Set;
begin
   --  Generate Euromillon numbers
   Ada.Text_IO.Put ("Euromillon numbers: ");
   Euro_Num_Set := Euromillon_Number_Sets.Generate;
   Euromillon_Number_Sets.Put (Euro_Num_Set, 2);

   --  Generate Euromillon stars
   Ada.Text_IO.Put ("Euromillon stars: ");
   Euro_Star_Set := Euromillon_Star_Sets.Generate;
   Euromillon_Star_Sets.Put (Euro_Star_Set, 2);

   --  Generate Primitiva numbers
   Ada.Text_IO.Put ("Primitiva numbers: ");
   Primi_Num_Set := Primitiva_Number_Sets.Generate;
   Primitiva_Number_Sets.Put (Primi_Num_Set, 2);

   Ada.Text_IO.Put_Line ("Loteria nacional numbers: ");

   --  Generate the numbers
   Random_Loteria_Nacional_Number.Reset (Lot_Nal_G);
   Ada.Text_IO.Put ("For Thursday: ");
   Lot_Nal_Num := Random_Loteria_Nacional_Number.Random (Lot_Nal_G);
   Ada.Text_IO.Put_Line (Int_Fmt.Format (Lot_Nal_Num'Image, 5));
   Ada.Text_IO.Put ("For Saturday: ");
   Lot_Nal_Num := Random_Loteria_Nacional_Number.Random (Lot_Nal_G);
   Ada.Text_IO.Put (Int_Fmt.Format (Lot_Nal_Num'Image, 5));
end Lottery;

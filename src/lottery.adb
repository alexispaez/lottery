pragma Ada_2022;

with Ada.Text_IO;
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

   package Loteria_Nacional_Number_Sets is new
     Discrete_Random_Number_Sets (Loteria_Nacional_Number_Range, 1);

   Euro_Num_Set : Euromillon_Number_Sets.Set;
   Euro_Star_Set : Euromillon_Star_Sets.Set;

   Primi_Num_Set : Primitiva_Number_Sets.Set;

   Lot_Nac_Num_Set : Loteria_Nacional_Number_Sets.Set;
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

   --  Generate Loteria Nacional numbers
   Ada.Text_IO.Put_Line ("Loteria nacional numbers: ");
   Ada.Text_IO.Put ("For Thursday: ");
   Lot_Nac_Num_Set := Loteria_Nacional_Number_Sets.Generate;
   Loteria_Nacional_Number_Sets.Put (Lot_Nac_Num_Set, 5);
   Ada.Text_IO.Put ("For Saturday: ");
   Lot_Nac_Num_Set := Loteria_Nacional_Number_Sets.Generate;
   Loteria_Nacional_Number_Sets.Put (Lot_Nac_Num_Set, 5);
end Lottery;

pragma Ada_2022;

with Ada.Containers.Ordered_Sets;
with Ada.Text_IO;

with Discrete_Random_Number_Sets;
with Lottery; use Lottery;
with Lottery.Validation;

procedure Generate_Lottery is

   package Lottery_Number_Sets is new
     Ada.Containers.Ordered_Sets
       (Element_Type =>  Lottery_Number);

   --  Euromillon
   subtype Euromillon_Number_Range is Lottery_Number range 1 .. 50;
   subtype Euromillon_Star_Range is Lottery_Number range 1 .. 12;

   package Euromillon_Number_Sets is new
     Ada.Containers.Ordered_Sets
       (Element_Type =>  Euromillon_Number_Range);

   function Euromillon_Number_Validate
     (Set : Euromillon_Number_Sets.Set) return Boolean is
   begin
      return True;
   end Euromillon_Number_Validate;

   package Euromillon_Random_Number_Sets is new
     Discrete_Random_Number_Sets
       (Number_Range  => Euromillon_Number_Range,
        Number_Sets   => Euromillon_Number_Sets,
        Num_Elements  => 5,
        Validate      => Euromillon_Number_Validate);

   package Euromillon_Star_Sets is new
     Ada.Containers.Ordered_Sets
       (Element_Type =>  Euromillon_Star_Range);

   function Euromillon_Star_Validate
     (Set : Euromillon_Star_Sets.Set) return Boolean is
   begin
      --  Number set validation logic
      return True;
   end Euromillon_Star_Validate;

   package Euromillon_Random_Star_Sets is new
     Discrete_Random_Number_Sets
       (Number_Range  => Euromillon_Star_Range,
        Number_Sets   => Euromillon_Star_Sets,
        Num_Elements  => 2,
        Validate      => Euromillon_Star_Validate);

   --  Primitiva
   subtype Primitiva_Number_Range is Lottery_Number range 1 .. 49;

   package Primitiva_Number_Sets is new
     Ada.Containers.Ordered_Sets
       (Element_Type =>  Primitiva_Number_Range);

   function Primitiva_Validate
     (Set : Primitiva_Number_Sets.Set) return Boolean is
   begin
      --  Number set validation logic
      return True;
   end Primitiva_Validate;

   package Primitiva_Random_Number_Sets is new
     Discrete_Random_Number_Sets
       (Number_Range  => Primitiva_Number_Range,
        Number_Sets   => Primitiva_Number_Sets,
        Num_Elements  => 6,
        Validate      => Primitiva_Validate);

   --  Loteria Nacional
   subtype Loteria_Nacional_Number_Range is Lottery_Number range 0 .. 99999;

   package Loteria_Nacional_Number_Sets is new
     Ada.Containers.Ordered_Sets
       (Element_Type =>  Loteria_Nacional_Number_Range);

   function Loteria_Nacional_Validate
     (Set : Loteria_Nacional_Number_Sets.Set) return Boolean is
   begin
      --  Number set validation logic
      return True;
   end Loteria_Nacional_Validate;

   package Loteria_Nacional_Random_Number_Sets is new
     Discrete_Random_Number_Sets
       (Number_Range  => Loteria_Nacional_Number_Range,
        Number_Sets   => Loteria_Nacional_Number_Sets,
        Num_Elements  => 1,
        Validate      => Loteria_Nacional_Validate);

   Euro_Random_Num_Set : Euromillon_Number_Sets.Set;
   Euro_Random_Star_Set : Euromillon_Star_Sets.Set;

   Primi_Random_Num_Set : Primitiva_Number_Sets.Set;

   Lot_Nac_Random_Num_Set : Loteria_Nacional_Number_Sets.Set;
begin
   --  Generate Euromillon numbers
   Ada.Text_IO.Put ("Euromillon numbers: ");
   Euro_Random_Num_Set := Euromillon_Random_Number_Sets.Generate;
   Euromillon_Random_Number_Sets.Put (Euro_Random_Num_Set, 2);
   --  Generate Euromillon stars
   Ada.Text_IO.Put ("Euromillon stars: ");
   Euro_Random_Star_Set := Euromillon_Random_Star_Sets.Generate;
   Euromillon_Random_Star_Sets.Put (Euro_Random_Star_Set, 2);

   --  Generate Primitiva numbers
   Ada.Text_IO.Put ("Primitiva numbers: ");
   Primi_Random_Num_Set := Primitiva_Random_Number_Sets.Generate;
   Primitiva_Random_Number_Sets.Put (Primi_Random_Num_Set, 2);

   --  Generate Loteria Nacional numbers
   Ada.Text_IO.Put_Line ("Loteria nacional numbers: ");
   Ada.Text_IO.Put ("For Thursday: ");
   Lot_Nac_Random_Num_Set := Loteria_Nacional_Random_Number_Sets.Generate;
   Loteria_Nacional_Random_Number_Sets.Put (Lot_Nac_Random_Num_Set, 5);
   Ada.Text_IO.Put ("For Saturday: ");
   Lot_Nac_Random_Num_Set := Loteria_Nacional_Random_Number_Sets.Generate;
   Loteria_Nacional_Random_Number_Sets.Put (Lot_Nac_Random_Num_Set, 5);
end Generate_Lottery;

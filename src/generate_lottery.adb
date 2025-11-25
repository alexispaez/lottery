pragma Ada_2022;

with Ada.Containers.Ordered_Sets;
with Ada.Text_IO;

with Discrete_Random_Number_Sets;
with Lottery; use Lottery;
with Lottery.Validation; use Lottery.Validation;

procedure Generate_Lottery is

   --  Euromillon
   subtype Euromillon_Number_Range is Lottery_Number range 1 .. 50;
   subtype Euromillon_Star_Range is Lottery_Number range 1 .. 12;

   package Euromillon_Number_Sets is new
     Ada.Containers.Ordered_Sets
       (Element_Type =>  Euromillon_Number_Range);

   function Euromillon_Number_Validate
     (Set : Euromillon_Number_Sets.Set) return Boolean is

      function Validate_Odd_Even (Set : Euromillon_Number_Sets.Set)
                                  return Boolean is
         Even : Natural := 0;
         Odd  : Natural := 0;
      begin
         for E of Set loop
            if Is_Odd (E) then
               Odd := @ + 1;
            else
               Even := @ + 1;
            end if;
         end loop;

         return (if (Odd = 3 and then Even = 2) or else
                   (Odd = 2 and then Even = 3) then True else False);
      end Validate_Odd_Even;

      function Validate_High_Low (Set : Euromillon_Number_Sets.Set)
                                  return Boolean is
         subtype Euromillon_Number_Low is
           Euromillon_Number_Range range 1 .. 25;

         High : Natural := 0;
         Low  : Natural := 0;
      begin
         for E of Set loop
            if E in Euromillon_Number_Low then
               Low := @ + 1;
            else
               High := @ + 1;
            end if;
         end loop;

         return (if (Low = 3 and then High = 2) or else
                   (Low = 2 and then High = 3) then True else False);
      end Validate_High_Low;

      function Validate_Sum (Set : Euromillon_Number_Sets.Set)
                             return Boolean is
         Sum : constant Natural := Set'Reduce ("+", 0);
      begin
         return (if Sum > 101 and then Sum < 160 then True else False);
      end Validate_Sum;
   begin
      return (Validate_Odd_Even (Set) and then
              Validate_High_Low (Set) and then
              Validate_Sum (Set));
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

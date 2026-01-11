pragma Ada_2022;

with Ada.Text_IO;
with Discrete_Random_Number_Sets;
with Lottery; use Lottery;
with Lottery.Validation; use Lottery.Validation;

procedure Generate_Lottery is
   --  Euromillon numbers
   --  ------------------
   subtype Euromillon_Number_Range is Lottery_Number range 1 .. 50;

   function Euromillon_Number_Validate (Num_Array : Num_Arrays)
                                        return Boolean is

      function Validate_Odd_Even (Num_Array : Num_Arrays)
                                  return Boolean is
         Pair : constant Even_Odd_Pair :=
           Get_Even_Odd (Num_Array => Num_Array);
      begin
         return (if Pair = Even_Odd_Pair'(3, 2) or else
                   Pair = Even_Odd_Pair'(2, 3) then True else False);
      end Validate_Odd_Even;

      function Validate_High_Low (Num_Array : Num_Arrays) return Boolean is
         function Get_High_Low_Pair is new
           Get_High_Low (Lower_Range_Start => 1,
                         Lower_Range_End => 25,
                         Higher_Range_Start => 26,
                         Higher_Range_End => 50);
         Pair : constant High_Low_Pair := Get_High_Low_Pair (Num_Array);
      begin
         return (if Pair = High_Low_Pair'(3, 2) or else
                 Pair = High_Low_Pair'(2, 3) then True else False);
      end Validate_High_Low;

      function Validate_Sum (Num_Array : Num_Arrays) return Boolean is
         Sum : constant Natural := Get_Sum (Num_Array => Num_Array);
      begin
         return (if Sum > 101 and then Sum < 160 then True else False);
      end Validate_Sum;

      function Validate_Consecutive_Runs (Num_Array : Num_Arrays)
                                          return Boolean is
         Runs : constant Run_Arrays :=
           Get_Consecutive_Runs (Num_Array => Num_Array);
      begin
         return (if Runs /= Run_Arrays'(0, 5) and then
                 Runs /= Run_Arrays'(1, 4) and then
                 Runs /= Run_Arrays'(2, 3)
                 then True else False);
      end Validate_Consecutive_Runs;

   begin
      if Validate_Odd_Even (Num_Array) = False then
         Ada.Text_IO.Put_Line ("Combination rejected by odd/even.");
         return False;
      end if;

      if Validate_High_Low (Num_Array) = False then
         Ada.Text_IO.Put_Line ("Combination rejected by high/low.");
         return False;
      end if;

      if Validate_Sum (Num_Array) = False then
         Ada.Text_IO.Put_Line ("Combination rejected by sum.");
         return False;
      end if;

      if Validate_Consecutive_Runs (Num_Array) = False then
         Ada.Text_IO.Put_Line ("Combination rejected by runs.");
         return False;
      end if;

      return True;
   end Euromillon_Number_Validate;

   package Euromillon_Random_Number_Sets is new
     Discrete_Random_Number_Sets
       (Number_Range_Start  => Euromillon_Number_Range'First,
        Number_Range_End => Euromillon_Number_Range'Last,
        Num_Elements  => 5,
        Validate      => Euromillon_Number_Validate);

   --  Euromillon stars
   --  ----------------
   subtype Euromillon_Star_Range is Lottery_Number range 1 .. 12;

   function Euromillon_Star_Validate (Num_Array : Num_Arrays) return Boolean is
   begin
      --  Number set validation logic
      return (if Num_Array'Length = 2 then True else False);
   end Euromillon_Star_Validate;

   package Euromillon_Random_Star_Sets is new
     Discrete_Random_Number_Sets
       (Number_Range_Start  => Euromillon_Star_Range'First,
        Number_Range_End => Euromillon_Star_Range'Last,
        Num_Elements  => 2,
        Validate      => Euromillon_Star_Validate);

   --  Primitiva numbers
   --  -----------------
   subtype Primitiva_Number_Range is Lottery_Number range 1 .. 49;

   function Primitiva_Validate (Num_Array : Num_Arrays)
                                return Boolean is

      function Validate_Odd_Even (Num_Array : Num_Arrays)
                                  return Boolean is
         Pair : constant Even_Odd_Pair :=
           Get_Even_Odd (Num_Array => Num_Array);
      begin
         return (if Pair = Even_Odd_Pair'(4, 2) or else
                 Pair = Even_Odd_Pair'(3, 3) or else
                 Pair = Even_Odd_Pair'(2, 4) then True else False);
      end Validate_Odd_Even;

      function Validate_High_Low (Num_Array : Num_Arrays) return Boolean is
         function Get_High_Low_Pair is new
           Get_High_Low (Lower_Range_Start => 1,
                         Lower_Range_End => 25,
                         Higher_Range_Start => 26,
                         Higher_Range_End => 49);
         Pair : constant High_Low_Pair := Get_High_Low_Pair (Num_Array);
      begin
         return (if Pair = High_Low_Pair'(4, 2) or else
                 Pair = High_Low_Pair'(3, 3) or else
                 Pair = High_Low_Pair'(2, 4) then True else False);
      end Validate_High_Low;

      function Validate_Sum (Num_Array : Num_Arrays) return Boolean is
         Sum : constant Natural := Get_Sum (Num_Array => Num_Array);
      begin
         return (if Sum > 101 and then Sum < 200 then True else False);
      end Validate_Sum;

      function Validate_Consecutive_Runs (Num_Array : Num_Arrays)
                                          return Boolean is
         Runs : constant Run_Arrays :=
           Get_Consecutive_Runs (Num_Array => Num_Array);
      begin
         return (if Runs /= Run_Arrays'(0, 6) and then
                 Runs /= Run_Arrays'(1, 5) and then
                 Runs /= Run_Arrays'(2, 4) and then
                 Runs /= Run_Arrays'(1, 1, 4) and then
                 Runs /= Run_Arrays'(3, 3)
                 then True else False);
      end Validate_Consecutive_Runs;

   begin
      if Validate_Odd_Even (Num_Array) = False then
         Ada.Text_IO.Put_Line ("Combination rejected by odd/even.");
         return False;
      end if;

      if Validate_High_Low (Num_Array) = False then
         Ada.Text_IO.Put_Line ("Combination rejected by high/low,");
         return False;
      end if;

      if Validate_Sum (Num_Array) = False then
         Ada.Text_IO.Put_Line ("Combination rejected by sum.");
         return False;
      end if;

      if Validate_Consecutive_Runs (Num_Array) = False then
         Ada.Text_IO.Put_Line ("Combination rejected by runs.");
         return False;
      end if;

      return True;
   end Primitiva_Validate;

   package Primitiva_Random_Number_Sets is new
     Discrete_Random_Number_Sets
       (Number_Range_Start  => Primitiva_Number_Range'First,
        Number_Range_End    => Primitiva_Number_Range'Last,
        Num_Elements        => 6,
        Validate            => Primitiva_Validate);

   --  Primitiva refund
   --  ----------------
   subtype Primitiva_Refund_Range is Lottery_Number range 0 .. 9;

   function Primitiva_Refund_Validate
     (Num_Array : Num_Arrays) return Boolean is
      pragma Unreferenced (Num_Array);
   begin
      --  Number set validation logic
      return True;
   end Primitiva_Refund_Validate;

   package Primitiva_Random_Refund_Sets is new
     Discrete_Random_Number_Sets
       (Number_Range_Start  => Primitiva_Refund_Range'First,
        Number_Range_End    => Primitiva_Refund_Range'Last,
        Num_Elements        => 1,
        Validate            => Primitiva_Refund_Validate);

   --  Loteria Nacional
   --  ----------------
   subtype Loteria_Nacional_Number_Range is
     Lottery_Number range 0 .. 99999;

   function Loteria_Nacional_Validate
     (Num_Array : Num_Arrays) return Boolean is
      pragma Unreferenced (Num_Array);
   begin
      --  Number set validation logic
      return True;
   end Loteria_Nacional_Validate;

   package Loteria_Nacional_Random_Number_Sets is new
     Discrete_Random_Number_Sets
       (Number_Range_Start  => Loteria_Nacional_Number_Range'First,
        Number_Range_End => Loteria_Nacional_Number_Range'Last,
        Num_Elements  => 1,
        Validate      => Loteria_Nacional_Validate);

   --  Special draw
   subtype Special_Number_Range is
     Lottery_Number range 1 .. 57041;

   function Special_Validate
     (Num_Array : Num_Arrays) return Boolean is
      pragma Unreferenced (Num_Array);
   begin
      --  Number set validation logic
      return True;
   end Special_Validate;

   package Special_Random_Number_Sets is new
     Discrete_Random_Number_Sets
       (Number_Range_Start  => Special_Number_Range'First,
        Number_Range_End => Special_Number_Range'Last,
        Num_Elements  => 1,
        Validate      => Special_Validate);

   Euro_Random_Numbers : Num_Arrays (1 .. 5);
   Euro_Random_Stars   : Num_Arrays (1 .. 2);

   Primi_Random_Numbers : Num_Arrays (1 .. 6);
   Primi_Random_Refund  : Num_Arrays (1 .. 1);

   Lot_Nac_Random_Numbers :  Num_Arrays (1 .. 1);
   Special_Random_Numbers :  Num_Arrays (1 .. 1);
begin
   --  Generate Euromillon numbers
   Ada.Text_IO.Put_Line ("Generating Euromillon...");
   Euro_Random_Numbers := Euromillon_Random_Number_Sets.Generate;
   Ada.Text_IO.Put ("Euromillon numbers: ");
   Lottery.Put (Euro_Random_Numbers, 2);

   --  Generate Euromillon stars
   Euro_Random_Stars := Euromillon_Random_Star_Sets.Generate;
   Ada.Text_IO.Put ("Euromillon stars: ");
   Lottery.Put (Euro_Random_Stars, 2);
   Ada.Text_IO.New_Line;

   --  Generate Primitiva numbers
   Ada.Text_IO.Put_Line ("Generating Primitiva numbers...");
   Primi_Random_Numbers := Primitiva_Random_Number_Sets.Generate;
   Ada.Text_IO.Put ("Primitiva numbers: ");
   Lottery.Put (Primi_Random_Numbers, 2);
   --  Generate refund number
   Primi_Random_Refund := Primitiva_Random_Refund_Sets.Generate;
   Ada.Text_IO.Put ("Primitiva refund: ");
   Lottery.Put (Primi_Random_Refund, 1);
   Ada.Text_IO.New_Line;

   --  Generate Loteria Nacional numbers
   Ada.Text_IO.Put_Line ("Loteria nacional numbers: ");
   Ada.Text_IO.Put ("For Thursday: ");
   Lot_Nac_Random_Numbers := Loteria_Nacional_Random_Number_Sets.Generate;
   Lottery.Put (Lot_Nac_Random_Numbers, 5);
   Ada.Text_IO.Put ("For Saturday: ");
   Lot_Nac_Random_Numbers := Loteria_Nacional_Random_Number_Sets.Generate;
   Lottery.Put (Lot_Nac_Random_Numbers, 5);
   Ada.Text_IO.New_Line;

   --  Generate Special numbers
   Ada.Text_IO.Put_Line ("Loteria nacional special: ");
   Special_Random_Numbers := Special_Random_Number_Sets.Generate;
   Lottery.Put (Special_Random_Numbers, 5);

end Generate_Lottery;

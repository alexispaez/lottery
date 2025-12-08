pragma Ada_2022;

with Ada.Containers.Vectors;

package body Lottery.Validation is

   function Get_Even_Odd (Num_Array : Num_Arrays) return Even_Odd_Pair is
      Result : Even_Odd_Pair := [others => 0];
   begin
      for I in Num_Array'Range loop
         if Is_Odd (Num_Array (I)) then
            Result (Odd) := @ + 1;
         else
            Result (Even) := @ + 1;
         end if;
      end loop;

      return Result;
   end Get_Even_Odd;

   function Get_High_Low (Num_Array : Num_Arrays) return High_Low_Pair is
      subtype Lower_Range is
        Lottery_Number range Lower_Range_Start .. Lower_Range_End;
      subtype Higher_Range is
        Lottery_Number range Higher_Range_Start .. Higher_Range_End;
      Result : High_Low_Pair := [others => 0];
   begin
      for I in Num_Array'Range loop
         if Num_Array (I) in Lower_Range then
            Result (Low) := @ + 1;
         elsif Num_Array (I) in Higher_Range then
            Result (High) := @ + 1;
         end if;
      end loop;

      return Result;
   end Get_High_Low;

   function Get_Sum (Num_Array : Num_Arrays) return Natural is
      Sum : Natural := 0;
   begin
      for I in Num_Array'Range loop
         Sum := @ + Num_Array (I);
      end loop;

      return Sum;
   end Get_Sum;

   function Get_Consecutive_Runs (Num_Array : Num_Arrays) return Run_Arrays is
      package Positive_Vectors is new
        Ada.Containers.Vectors
          (Index_type => Natural,
           Element_Type => Positive);
      package Positive_Vectors_Sorting is new
        Positive_Vectors.Generic_Sorting;

      Runs : Positive_Vectors.Vector;
      Count : Natural := 0;
      Current_Run   : Natural := 1;
   begin
      if Num_Array'Length = 0 then
         return Run_Arrays'(1 .. 1 => 0);  -- empty
      end if;

      for I in Num_Array'First + 1 .. Num_Array'Last loop
         if Num_Array (I) = Num_Array (I - 1) + 1 then
            Current_Run := Current_Run + 1;
         else
            Count := Count + 1;
            Runs.Append (Current_Run);
            Current_Run := 1;
         end if;
      end loop;

      --  Store final run
      Count := Count + 1;
      Runs.Append (Current_Run);

      Positive_Vectors_Sorting.Sort (Runs);

      --  Return only the used part
      return R : Run_Arrays (1 .. Integer (Runs.Length)) do
         for I in Runs.First_Index .. Runs.Last_Index loop
            R (I + 1) := Runs (I);
         end loop;
      end return;
   end Get_Consecutive_Runs;

end Lottery.Validation;

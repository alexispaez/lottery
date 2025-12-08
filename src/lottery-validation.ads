
package Lottery.Validation is

   --  Result type: an array of run lengths
   type Run_Arrays is array (Positive range <>) of Natural;

   type Even_Odd is (Even, Odd);
   type Even_Odd_Pair is array (Even_Odd'Range) of Natural;

   type High_Low is (High, Low);
   type High_Low_Pair is array (High_Low'Range) of Natural;

   subtype Odd_Number is Natural with
     Dynamic_Predicate => (Odd_Number mod 2) /= 0;

   function Is_Odd (Number : Lottery_Number) return Boolean is
     (if Number in Odd_Number then True else False);

   function Get_Even_Odd (Num_Array : Num_Arrays) return Even_Odd_Pair;

   generic
      Lower_Range_Start : Integer;
      Lower_Range_End : Integer;
      Higher_Range_Start : Integer;
      Higher_Range_End : Integer;
   function Get_High_Low (Num_Array : Num_Arrays) return High_Low_Pair;

   function Get_Sum (Num_Array : Num_Arrays) return Natural;

   function Get_Consecutive_Runs (Num_Array : Num_Arrays) return Run_Arrays;

end Lottery.Validation;


package Lottery.Validation is

   subtype Odd_Number is Natural with
     Dynamic_Predicate => (Odd_Number mod 2) /= 0;

   type Int_Array is array (Positive range <>) of Integer;
   --  Result type: an array of run lengths
   type Run_Array is array (Positive range <>) of Natural;

   function Is_Odd (N : Lottery_Number) return Boolean is
     (if N in Odd_Number then True else False);

   function All_Consecutive_Runs (A : Int_Array) return Run_Array;

end Lottery.Validation;

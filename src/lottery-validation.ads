
package Lottery.Validation is

   subtype Odd_Number is Natural with
     Dynamic_Predicate => (Odd_Number mod 2) /= 0;

   function Is_Odd (N : Lottery_Number) return Boolean is
     (if N in Odd_Number then True else False);

end Lottery.Validation;

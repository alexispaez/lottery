
package body Lottery.Validation is

   function Is_Odd (N : Lottery_Number) return Boolean is
   begin
      if N in Odd_Number then
         return True;
      else
         return False;
      end if;
   end Is_Odd;

end Lottery.Validation;

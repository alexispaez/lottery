
package body Lottery.Validation is

   function All_Consecutive_Runs (A : Int_Array) return Run_Array is
      Temp  : array (1 .. A'Length) of Natural := (others => 0);
      Count : Natural := 0;
      Run   : Natural := 1;
   begin
      if A'Length = 0 then
         return Run_Array'(1 .. 0 => 0);  -- empty
      end if;

      for I in A'First + 1 .. A'Last loop
         if A (I) = A (I - 1) + 1 then
            Run := Run + 1;
         else
            Count := Count + 1;
            Temp (Count) := Run;
            Run := 1;
         end if;
      end loop;

      --  Store final run
      Count := Count + 1;
      Temp (Count) := Run;

      --  Return only the used part
      return R : Run_Array (1 .. Count) do
         R := Run_Array (Temp (1 .. Count));
      end return;
   end All_Consecutive_Runs;

end Lottery.Validation;

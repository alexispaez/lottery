with Ada.Text_IO;
with Integer_Formatting;

package body Lottery is

   package Int_Fmt renames Integer_Formatting;

   procedure Put (Num_Array : Num_Arrays;
                  Width : Positive) is
   begin
      --  Display set
      for I in Num_Array'Range loop
         Ada.Text_IO.Put
           (Int_Fmt.Format (Num_Array (I)'Image, Width));

         if I /= Num_Array'Last then
            Ada.Text_IO.Put (",");
         end if;
      end loop;
      Ada.Text_IO.New_Line;
   end Put;

end Lottery;

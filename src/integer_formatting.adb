pragma Ada_2022;

package body Integer_Formatting is

   function Format (S        : String;
                    Width    : Integer  := 2;
                    Pad_Char : Character := '0')
                       return String is
      R : String (1 .. Width);
   begin
      if S'Length - 1 = Width then
         --  Output as it is
         R := S (S'First + 1 .. S'Last);
      elsif S'Length - 1 > Width then
         --  Truncate
         R := S (S'Last - Width + 1 .. S'Last);
      else
         --  Pad with Pad_Char character
         R := [others => Pad_Char];
         R (R'Last - (S'Length - 2) .. R'Last) :=
           S (S'Last - (S'Length - 2) .. S'Last);
      end if;

      return R;
   end Format;

end Integer_Formatting;

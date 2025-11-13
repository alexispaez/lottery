pragma Ada_2022;

package Integer_Formatting is

   function Format (S        : String;
                    Width    : Integer  := 2;
                    Pad_Char : Character := '0')
                    return String;

end Integer_Formatting;

pragma Ada_2022;

with Ada.Numerics.Discrete_Random;
with Ada.Text_IO;
with Integer_Formatting;

procedure Lottery is
   subtype Euromillon_Number_Range is Integer range 1 .. 50;
   subtype Euromillon_Star_Range is Integer range 1 .. 12;

   package Random_Number is new
     Ada.Numerics.Discrete_Random (Euromillon_Number_Range);
   use Random_Number;

   package Int_Fmt renames Integer_Formatting;

   G : Generator;
   N : Euromillon_Number_Range;
begin
   for I in 1 .. 5 loop
      N := Random (G);
      Ada.Text_IO.Put ("Image: " & N'Image);
      Ada.Text_IO.Put_Line (" " & Int_Fmt.Format (N'Image, J));
   end loop;
end Lottery;

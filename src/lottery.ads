package Lottery is

   subtype Lottery_Number is Natural;

   type Num_Arrays is array (Positive range <>) of Lottery_Number;

   procedure Put (Num_Array : Num_Arrays;
                  Width : Positive);

end Lottery;

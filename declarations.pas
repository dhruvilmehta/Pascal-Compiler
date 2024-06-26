CONST
    ten = 10;
    epsilon = 1.0E-6;
    x = 'x';
    limit = -epsilon;
    hello = 'Hello, world!';

TYPE
    range1 = 0..ten;
    range2 = 'a'..'q';
    range3 = range1;

    enum1 = (a, b, c, d, e);
    enum2 = enum1;
    range4 = b..d;

    week = (monday, tuesday, wednesday, thursday, friday, saturday, sunday);
    weekday = monday..friday;
    weekend = saturday..sunday;

    ar1 = ARRAY [range1] OF integer;
    ar2 = ARRAY [(alpha, beta, gamma)] OF range2;
    ar3 = ARRAY [enum2] OF ar1;
    ar4 = ARRAY [range3] OF (foo, bar, baz);
    ar5 = ARRAY [range1] OF ARRAY[range2] OF ARRAY[c..e] OF enum2;
    ar6 = ARRAY [range1, range2, c..e] OF enum2;

    rec1 = RECORD
               i : integer;
               r : real;
               b1, b2 : boolean;
               c : char
           END;

    ar7 = ARRAY [range2] OF RECORD
                                ten : integer;
                                r : rec1;
                                a : ARRAY[range4] OF range2;
                            END;

VAR
    var1 : integer;
    var2, var3 : range2;
    var4 : enum2;
    var5, var6, var7 : -7..ten;
    var8 : (fee, fye, foe, fum);
    var9 : range3;

    var10 : rec1;
    var11 : RECORD
                b : boolean;
                r : RECORD
                        aa : ar1;
                        bb : boolean;
                        r  : real;
                        v1 : ar6;
                        v2 : ARRAY [enum1, range1] OF ar7;
                    END;
                a : ARRAY [1..5] OF boolean;
            END;

    var12 : ar1;
    var15 : ar5;
    var16 : ar6;

    number : range1;
    root : real;

BEGIN
END.
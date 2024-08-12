PROGRAM ForTest;

TYPE
    grades = (A, B, C, D, F);

VAR
    i, j, k, n : integer;
    grade : grades;
    ch : char;

BEGIN {FOR statements}
    j  := 2;
    ch := 'x';

    FOR k := 1 TO 5 DO BEGIN
        writeln(k);
    END;
END.

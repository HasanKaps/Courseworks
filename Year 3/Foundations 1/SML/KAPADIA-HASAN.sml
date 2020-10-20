datatype LEXP =
APP of LEXP * LEXP | LAM of string * LEXP | ID of string;

datatype BEXP =
BAPP of BEXP * BEXP | BLAM of BEXP | BID of int;

datatype IEXP =
IAPP of IEXP * IEXP | ILAM of string * IEXP | IID of string;

val vx = (ID "x");
val vy = (ID "y");
val vz = (ID "z");
val Ivx = (IID "x");
val Ivy = (IID "y");
val Ivz = (IID "z");
val bv1 = BID 1;
val bv2 = BID 2;
val bv3 = BID 3;

(*Question 5a*)
val at101 = (LAM("x",LAM("z",APP(vx,vz))));
val aIt101 = ILAM("x",ILAM("z",IAPP(Ivz,Ivx)));
val aBt101 = (BLAM(BLAM(BAPP(bv2,bv1))));
(*Question 5b*)
val bt101 = (LAM("x",LAM("y",APP(vx,vy))));
val bIt101 = ILAM("x",ILAM("y",IAPP(Ivy,Ivx)));
val bBt101 = (BLAM(BLAM(BAPP(bv2,bv1))));
(*Question 5c*)
val ct101 = (APP((APP(vx,vz)),LAM("x",LAM("y",APP(vx,vy)))));

(*Question 4*)
fun printIEXP (IID v) =
    print v
  | printIEXP (ILAM (v,e)) =
    (print "[";
     print v;
     print "]";
     printIEXP e)
  | printIEXP (IAPP(e1,e2)) =
    (print "<";
     printIEXP e2;
     print ">";
     printIEXP e1);

fun printBEXP (BID n) =
    print (Int .toString (n))
  | printBEXP (BLAM (e)) =
    (print "(\\";
     printBEXP e;
     print ")")
  | printBEXP (BAPP(e1,e2)) =
    (print "(";
     printBEXP e1;
     print " ";
     printBEXP e2;
     print ")");

fun printLEXP (ID v) =
    print v
  | printLEXP (LAM (v,e)) =
    (print "(\\";
     print v;
     print ".";
     printLEXP e;
     print ")")
  | printLEXP (APP(e1,e2)) =
    (print "(";
     printLEXP e1;
     print " ";
     printLEXP e2;
     print ")");


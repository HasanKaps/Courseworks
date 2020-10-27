;Header and description

(define (domain submarine)
    (:requirements :strips )

    (:predicates
     
        (Sub ?x)
        (SubLocation ?x ?y)

        (Person ?x)
        (Designation ?x ?y)
        (StaffLocation ?x ?y)

        (Section ?x)
        (SectionConnection ?x ?y)

        ;(UnderWaterRegion ?x)
    )

(:action order
    :parameters
        (?x ?y ?c ?a ?b ?d) 
    :precondition
        (and
           (Person ?x)
           (Person ?y)
           (Sub ?c)
           (Section ?a)
           (SectionConnection ?b ?d)
           
           (Designation ?x Captain)
           (Designation ?y Navigator)
           
           (StaffLocation ?x Bridge)
           (StaffLocation ?y LaunchBay)
           
           (SubLocation ?c LaunchBay)
           
        )
    :effect
        (and
           (not (SubLocation ?c LaunchBay))
           (SubLocation ?c Reg1)
        )
)
)
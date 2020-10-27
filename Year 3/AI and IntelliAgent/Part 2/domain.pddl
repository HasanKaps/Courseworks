                                                                                                                                                                                                                                                                                                                                                                                                 ;Header and description

(define (domain submarine)
    (:requirements :strips )
    (:constants 
        Captain
        Navigator
        ScienceOfficer
        AbyssalPlain
        Ridge
        Vortex
        Empty
        LaunchBay
        Bridge
        SickBay
        ScienceLab)
        
    (:predicates
     
        (Sub ?x)
        (SubLocation ?x ?y)
        (SubTypes ?x ?y)

        (Person ?x)
        (Designation ?x ?y)
        (StaffLocation ?x ?y)
        (InjuredStaff ?x ?y)
        
        (Section ?x)
        (SectionConnection ?x ?y)

        (UnderWaterRegion ?x)
        
        (Mineral ?x)
        (ResearchMineral ?x ?y ?z)
    )

(:action order
    :parameters
        (?x ?y ?z ?c ?a ?b ?d) 
    :precondition
        (and
           (Person ?x)
           (Person ?y)
           (Sub ?c)
           (Section ?a)
           (SectionConnection ?b ?d)
           (UnderWaterRegion ?z)
           (Designation ?x Captain)
           (Designation ?y Navigator)
           
           (StaffLocation ?x Bridge)
           (StaffLocation ?y Bridge)
           
           (SubLocation ?c LaunchBay)
           
        )
    :effect
        (and
           (not (SubLocation ?c LaunchBay))
           (SubLocation ?c AbyssalPlain)
        )
)

(:action moving
    :parameters
        (?x ?y ?a ?b ?d) 
    :precondition
        (and
           
           (Person ?x)
           (Person ?y)
           
           (Section ?a)
           (SectionConnection ?b ?d)
           
           (Designation ?x Captain)
           (Designation ?y Navigator)
           

           
           
        )
    :effect
        (and
           (StaffLocation ?x Bridge)
           (StaffLocation ?y Bridge)
        )
)

(:action MiniSubLoc
    :parameters
        (?x ?y ?z ?a ?b) 
    :precondition
        (and
        
           (Sub ?x)
           (SubLocation ?y ?z)
           (SubTypes ?x ?a)
           
           
           (UnderWaterRegion ?b)
           
           
        )
    :effect
        (and
           (not (SubLocation ?x Empty))
           (SubLocation ?x AbyssalPlain)
           (SubLocation ?x Vortex)
           (SubLocation ?x Ridge)
           
           
           (not (SubLocation ?x Vortex))
           (SubLocation ?x AbyssalPlain)
           (SubLocation ?x Ridge)
           
        )
)

(:action Injuries
    :parameters
        ( ?y ?z ?a ?b ?c) 
    :precondition
        (and
           
           (Section ?y)
           (SectionConnection ?z ?a)
           
           (InjuredStaff ?b ?c)
           
           
        )
    :effect
        (and
           (not (InjuredStaff ?b SickBay))
        )
)

(:action MineralResearch
    :parameters
        (?x ?y ?z ?a ?b ?c ?d ?e ?f) 
    :precondition
        (and
           
           (Person ?x)
    
           (Section ?a)
           
           (Mineral ?e)
           
           (SectionConnection ?b ?d)
           (Section ?f)
           (Designation ?x ?y)
           
           (Designation ?x ScienceOfficer)
           
           (StaffLocation ?x ScienceLab)
           
           
           (ResearchMineral ?x ?e ScienceLab)
        )
    :effect
        (and
           (ResearchMineral ?x ?e ScienceLab)
        )
)


)
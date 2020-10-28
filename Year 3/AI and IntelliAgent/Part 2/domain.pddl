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
        (RegionConnection ?x ?y)

        (UnderWaterRegion ?x)
        
        (Mineral ?x)
        (ResearchMineral ?x ?y ?z)

    )

(:action order
    :parameters
        (?x ?y ?z  ?a ?b ?c ?d ?e ?f) 
    :precondition
        (and
           (Person ?x)
           (Person ?y)
           (Sub ?c)
           (Section ?a)
           (SectionConnection ?b ?d)
           (UnderWaterRegion ?z)

           (Designation ?x ?e)
           (Designation ?y ?e)
           
           (StaffLocation ?x ?f)
           
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
        (?x ?y ?z ?a ?b ?c ?d ?e) 
    :precondition
        (and
           
           (Person ?x)
           (Person ?y)
           (Person ?z)
           
           (Section ?a)
           (SectionConnection ?b ?d)
           
           (Designation ?x ?c)
           
        )
    :effect
        (and
           (StaffLocation ?x ?e)
        )
)

(:action SubLoc
    :parameters
        (?x ?y ?z ?a ?b) 
    :precondition
        (and
        
           (Sub ?x)
           
           (UnderWaterRegion ?b)

           (RegionConnection ?y ?z)

           (SubLocation ?x ?b)
        )
    :effect
        (and

           (SubLocation ?x ?b)

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
        (?x ?y ?a ?b ?d ?e ?f) 
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
           
           
        )
    :effect
        (and
           (ResearchMineral ?x ?e ScienceLab)
        )
)

(:action VortexStudy
    :parameters
        (?x ?y ?a ?b ?c ?d ?e ?f ?g ?h) 
    :precondition
        (and
           
           (Person ?x)
           (Person ?g)
           (Person ?h)
    
           (Section ?a)

           (Sub ?c)
           
           (UnderWaterRegion ?e)
           (SubLocation ?c vortex)
           
           (SectionConnection ?b ?d)
           (Section ?f)

           (Designation ?x ?y)
           
           (Designation ?x ScienceOfficer)
           (Designation ?g Captain)
           (Designation ?h Navigator)

           (StaffLocation ?x ScienceLab)
           (StaffLocation ?g Bridge)
           (StaffLocation ?h Bridge)
           
        )
    :effect
        (and
           (StaffLocation ?x Bridge)
           (StaffLocation ?y Bridge)
           (SubLocation ?c ?e)
        )
)


)
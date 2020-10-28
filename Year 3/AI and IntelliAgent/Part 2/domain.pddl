(define (domain HWSeaPort)
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
        ScienceLab
        ExplorationMiniSub
        Engineer
        LaunchPad
        Trainer
        ExerciseArea
        )
        
    (:predicates
     
        (Sub ?x)
        
        
        (SubLocation ?x ?y)
        (MiniSubCargo ?x)

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
        (VortexScan ?x ?y ?z)
        (PressureShields ?x)
        (DestroySub ?x)
        (Drill ?x ?y)
        (FixSensor ?x ?y)
        (LeadersMeeting ?x ?y)
        (SecurityPersonnel ?x ?y)
        (OrderStaff ?x ?y)
        (Reports ?x)
        (SendReport ?x ?y)
        (GymRegulars ?X)
        (Trains ?x ?y)
        
        (UnderwaterBaseSection ?x)
        (UnderwaterBaseSectionConnection ?x ?y)
    )

(:action order
    :parameters
        (?x ?z ?a ?b ?c ?d ?e ?f ?g) 
    :precondition
        (and
           (Person ?x)
           (Person ?g)
           (Sub ?c)
           (Section ?a)
           (SectionConnection ?b ?d)
           (UnderWaterRegion ?z)

           (Designation ?x ?e)
           
           (StaffLocation ?x ?f)
           
           (SubLocation ?c LaunchBay)
           
        )
    :effect
        (and
        
           (OrderStaff ?x ?g)        
           
           (not (SubLocation ?c LaunchBay))
           (SubLocation ?c ?z)
        )
)


(:action moving
    :parameters
        (?x ?a ?b ?c ?d) 
    :precondition
        (and
           
           (Person ?x)

           
           (Section ?a)
           
           (SectionConnection ?a ?d)
           
           (Designation ?x ?c)
           
        )
    :effect
        (and
           (StaffLocation ?x ?a)
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
        (?x ?a ?b ?d ?e) 
    :precondition
        (and
           
           (Person ?x)
    
           (Section ?a)
           
           (Mineral ?e)
           
           (SectionConnection ?b ?d)
           
           (Designation ?x ScienceOfficer)
           
           (StaffLocation ?x ScienceLab)
           
           
        )
    :effect
        (and
           (ResearchMineral ?x ?e ScienceLab)
        )
)

(:action VortexLeave
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
           
           (SubLocation ?c Vortex)
           
        )
    :effect
        (and
           (not (SubLocation ?c Vortex))
           (SubLocation ?c AbyssalPlain)
        )
)

(:action VortexStudy
    :parameters
        (?x ?y ?a ?c ?d ?e ?f ?g ?h) 
    :precondition
        (and
           
           (Person ?x)
           (Person ?g)
           (Person ?h)
    
           (Section ?a)

           (Sub ?c)
           
           (UnderWaterRegion ?e)
           (SubLocation ?c Vortex)
           
           (Section ?f)
           (SectionConnection ?f ?d)
           
           (Designation ?x ?y)

           (StaffLocation ?x ScienceLab)
           
           
        )
    :effect
        (and
           (VortexScan ?x ?e ScienceLab)
        )
)

(:action PressureShieldsCheck
    :parameters
        (?c ?e) 
    :precondition
        (and
    
           (Sub ?c)
           (PressureShields ?c)
           (UnderWaterRegion ?e)
           (SubLocation ?c Vortex)
         
        )
    :effect
        (and
           (PressureShields ?c)
        )
)

(:action Drilling
    :parameters
        (?x ?z ?a)
    :precondition
        (and
            (Sub ?x) 
            (SubLocation ?x Ridge)
            
        )
    :effect
        (and
            (Drill ?x ?z)
            (MiniSubCargo ?z)
            (Reports ?a)
        )
)

(:action SensorAfix
    :parameters
        (?x ?y)
    :precondition
        (and
            (Person ?x)
            (Designation ?X Engineer) 
            (Sub ?y)
            (SubLocation ?y AbyssalPlain)
            
        )
    :effect
        (and
            (StaffLocation ?x ExplorationMiniSub)
            (FixSensor ?x AbyssalPlain)
        )
)

(:action UnderwaterBaseCheck
    :parameters
        (?x ?y ?z ?b ?a ?i)
    :precondition
        (and
            (Person ?x)
            (Designation ?X Captain) 
            
            (Sub ?y)
            (SubLocation ?y AbyssalPlain)
            
            (UnderwaterBaseSection ?z)
            (UnderwaterBaseSectionConnection ?z ?b)
            
            (SecurityPersonnel ?a ?z)
        )
    :effect
        (and
            (StaffLocation ?x ExplorationMiniSub)
            (Reports ?i)
            (SubLocation ?y LaunchPad)
        )
)

(:action Meeting
    :parameters
        (?x ?y ?z ?a ?b ?c)
    :precondition
        (and
            (Person ?x)
            (Designation ?x Captain) 
            
            (Sub ?y)
            (SubLocation ?y AbyssalPlain)
            
            (UnderwaterBaseSection ?z)
            (UnderwaterBaseSectionConnection ?z ?a)
        )
    :effect
        (and
            (StaffLocation ?x ?c)
            (LeadersMeeting ?x ?b)
        )
)

(:action Return
    :parameters
        (?x ?y)
    :precondition
        (and
            (Sub ?x) 
            (SubLocation ?x ?y)
            
        )
    :effect
        (and
            (SubLocation ?x LaunchBay)
        )
)

(:action SendReport
    :parameters
        (?y ?z ?a)
    :precondition
        (and
            (Sub ?y)
            (SubLocation ?y LaunchBay)
        )
    :effect
        (and
            (SendReport ?z ?a)
        )
)

(:action GymTrainer
    :parameters
        (?x ?y ?z ?a)
    :precondition
        (and
            (Person ?x)
            (Designation ?x Trainer)
            (GymRegulars ?y)
        )
    :effect
        (and
            (StaffLocation ?x ExerciseArea)
            (Trains ?x ?y)
        )
)



)

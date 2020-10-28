(define (problem problem1)
  (:domain submarine)

  (:objects
    Anon Brenden Staff
    
    Captain Navigator Shipcrew
    
    Bridge LaunchBay ScienceLab SickBay ExerciseArea 
    
    Submarine

    AbyssalPlain Ridge Empty Vortex
  )


  (:init
    (Person Brenden)
    (Person Anon)
    (Person Staff)

    (Designation Brenden Captain)
    (Designation Anon Navigator)
    (Designation Staff Shipcrew)
    
    (Section Bridge)
    (Section LaunchBay)
    (Section ScienceLab)
    (Section SickBay)
    (Section ExerciseArea)
    
    (UnderWaterRegion  AbyssalPlain)
    (UnderWaterRegion  Empty)
    (UnderWaterRegion  Ridge)
    (UnderWaterRegion  Vortex)
    
    (Sub Submarine)
    
    (SectionConnection Bridge SickBay)
    (SectionConnection SickBay Bridge)
    (SectionConnection SickBay ExerciseArea)
    (SectionConnection ExerciseArea SickBay)
    (SectionConnection ExerciseArea LaunchBay)
    (SectionConnection ExerciseArea Bridge)
    (SectionConnection LaunchBay ExerciseArea)
    (SectionConnection LaunchBay ScienceLab)
    (SectionConnection ScienceLab LaunchBay)

    (StaffLocation Brenden SickBay)
    (StaffLocation Anon ExerciseArea)
    
    (InjuredStaff Staff SickBay)
    
    (SubLocation Submarine LaunchBay)

 
  )

  (:goal
      (and  

        (StaffLocation Brenden Bridge)
        (StaffLocation Anon Bridge)

        (not(InjuredStaff Staff SickBay))

        (SubLocation Submarine  AbyssalPlain)
      )
  )
)
                                
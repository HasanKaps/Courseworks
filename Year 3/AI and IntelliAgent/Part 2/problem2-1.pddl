(define (problem problem1)
  (:domain submarine)

  (:objects
    Anon Brenden Ziyad
    
    Captain Navigator ScienceOfficer
    
    Bridge LaunchBay ScienceLab SickBay ExerciseArea 
    
    Submarine

    AbyssalPlain Ridge Empty Vortex
  )


  (:init
    (Person Brenden)
    (Person Anon)
    (Person Ziyad)

    (Designation Brenden Captain)
    (Designation Anon Navigator)
    (Designation Ziyad ScienceOfficer)
    
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
    (StaffLocation Ziyad LaunchBay)
    
    (SubLocation Submarine LaunchBay)

 
  )

  (:goal
      (and

        (StaffLocation Brenden Bridge)
        (StaffLocation Anon Bridge)
        (StaffLocation Ziyad ScienceLab)

        (SubLocation Submarine  AbyssalPlain)
      )
  )
)
                                
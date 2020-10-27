(define (problem problem1)
  (:domain submarine)

  (:objects
    Ziyad
    
    ScienceOfficer
    
    Bridge LaunchBay ScienceLab SickBay ExerciseArea
    
    MineralX

  )


  (:init
    (Person Ziyad)

    (Designation Ziyad ScienceOfficer)
    
    (Mineral MineralX)
    
    (Section Bridge)
    (Section LaunchBay)
    (Section ScienceLab)
    (Section SickBay)
    (Section ExerciseArea)
    
    (SectionConnection Bridge SickBay)
    (SectionConnection SickBay ExerciseArea)
    (SectionConnection ExerciseArea LaunchBay)
    (SectionConnection LaunchBay ScienceLab)

    (StaffLocation Ziyad ScienceLab)
    
    
 
  )

  (:goal
      (and
        (ResearchMineral Ziyad MineralX ScienceLab)
      )
  )
)
                                
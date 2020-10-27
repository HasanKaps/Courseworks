(define (problem problem1)
  (:domain submarine)

  (:objects
    Anon Brenden Staff
    
    Captain Navigator Shipcrew
    
    Bridge LaunchBay ScienceLab SickBay ExerciseArea 
    
    MiniSub

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
    
    (Sub MiniSub)
    
    (SectionConnection Bridge SickBay)
    (SectionConnection SickBay ExerciseArea)
    (SectionConnection ExerciseArea LaunchBay)
    (SectionConnection LaunchBay ScienceLab)

    (StaffLocation Brenden Bridge)
    (StaffLocation Anon Bridge)
    
    (InjuredStaff Staff SickBay)
    
    (SubLocation MiniSub LaunchBay)

 
  )

  (:goal
      (and
        (not(InjuredStaff Staff SickBay))
        (SubLocation MiniSub  AbyssalPlain)
      )
  )
)
                                
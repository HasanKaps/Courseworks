(define (problem problem1)
  (:domain submarine)

  (:objects
    Anon Brenden
    
    Captain Navigator
    
    Bridge LaunchBay Reg1
    
    MiniSub

    
  )


  (:init
    (Person Brenden)
    (Person Anon)

    (Designation Brenden Captain)
    (Designation Anon Navigator)

    (Section Bridge)
    (Section LaunchBay)
    (Section Reg1)
    
    (Sub MiniSub)
    
    (SectionConnection Bridge LaunchBay)
    (SectionConnection LaunchBay Reg1)

    (StaffLocation Brenden Bridge)
    (StaffLocation Anon LaunchBay)

    (SubLocation MiniSub LaunchBay)

    ; (UnderWaterRegion Reg1)
  )

  (:goal
      (and
        (SubLocation MiniSub Reg1)
      )
  )
)

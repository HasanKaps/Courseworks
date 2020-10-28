  (define (problem problem2)
    (:domain submarine)

    (:objects
      Ziyad Brenden Anon
      
      ScienceOfficer Captain Navigator
      
      Bridge LaunchBay ScienceLab SickBay ExerciseArea
      
      AbyssalPlain Ridge Empty Vortex

      Submarine 

      MineralX

    )


    (:init
      (Person Ziyad)
      (Person Anon)
      (Person Brenden)

      (Designation Ziyad ScienceOfficer)
      (Designation Brenden Captain)
      (Designation Anon Navigator)
      
      (Mineral MineralX)
      
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

      (RegionConnection Empty AbyssalPlain)
      (RegionConnection Empty Ridge)
      (RegionConnection Empty Vortex)
      (RegionConnection AbyssalPlain Empty)
      (RegionConnection AbyssalPlain Ridge)
      (RegionConnection AbyssalPlain Vortex)
      (RegionConnection Ridge AbyssalPlain)
      (RegionConnection Ridge Empty)
      (RegionConnection Ridge Vortex)
      (RegionConnection Vortex Empty)
      (RegionConnection Vortex Ridge)
      (RegionConnection Vortex AbyssalPlain)


      (StaffLocation Ziyad Bridge)
      (StaffLocation Brenden SickBay)
      (StaffLocation Anon ExerciseArea)
      
      (SubLocation Submarine Vortex)
    )

    (:goal
        (and

          (StaffLocation Ziyad ScienceLab)
          (StaffLocation Brenden Bridge)
          (StaffLocation Anon Bridge)

          (ResearchMineral Ziyad MineralX ScienceLab)

          (SubLocation Submarine AbyssalPlain)

        )
    )
  )
                                  
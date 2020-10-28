(define (problem AdditionalFeature) (:domain HWSeaPort)
(:objects 
    Juan SubCrew
    Trainer 
    Bridge LaunchBay ScienceLab SickBay ExerciseArea
)

(:init
    (Person Juan)
    (GymRegulars SubCrew)
    (Designation Juan Trainer)
    
    (Section Bridge)
    (Section LaunchBay)
    (Section ScienceLab)
    (Section SickBay)
    (Section ExerciseArea)
    
    (SectionConnection Bridge SickBay)
    (SectionConnection SickBay Bridge)
    (SectionConnection SickBay ExerciseArea)
    (SectionConnection ExerciseArea SickBay)
    (SectionConnection ExerciseArea LaunchBay)
    (SectionConnection ExerciseArea Bridge)
    (SectionConnection LaunchBay ExerciseArea)
    (SectionConnection LaunchBay ScienceLab)
    (SectionConnection ScienceLab LaunchBay)    

    (StaffLocation Juan ExerciseArea)
    (StaffLocation SubCrew ExerciseArea)
)

(:goal (and
    ;todo: put the goal condition here
    (Trains Juan SubCrew)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)

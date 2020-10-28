(define (problem DrillingMission) (:domain HWSeaPort)
(:objects 

Brenden Andre Ziyad

Captain Engineer ScienceOfficer

Submarine MiniSub DrillingMiniSub

Bridge LaunchBay ScienceLab SickBay ExerciseArea 

Ridge

MineralX

DrillingReport
HWSeaPort
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (Person Brenden)
    (Person Andre)
    (Person Ziyad)
    
    (Designation Brenden Captain)
    (Designation Andre Engineer)
    (Designation Ziyad ScienceOfficer)

    (Sub DrillingMiniSub)
    
    (Mineral MineralX)

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
    
    (UnderWaterRegion  Ridge)

    
    (StaffLocation Brenden SickBay)
    (StaffLocation Andre ExerciseArea)
    (StaffLocation Ziyad LaunchBay)
    
    (SubLocation DrillingMiniSub LaunchBay)
    
)

(:goal (and
    ;todo: put the goal condition here
    
    (StaffLocation Brenden Bridge)
    (StaffLocation Andre LaunchBay)
    
    (OrderStaff Brenden Andre)
    
    (SubLocation DrillingMiniSub Ridge)
    
    (Drill DrillingMiniSub MineralX)
    (MiniSubCargo MineralX)
    
    (SubLocation DrillingMiniSub LaunchBay)
    (Reports DrillingReport)
    (StaffLocation Ziyad ScienceLab)
    (ResearchMineral Ziyad MineralX ScienceLab)
    (SendReport DrillingReport HWSeaPort)

    
    

))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)

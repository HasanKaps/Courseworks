(define (problem ExplorationMission) (:domain HWSeaPort)

(:objects 

Brenden Andre Rahul UnderwaterBaseLeader UnderwaterBaseSecurity

Captain EngineerStaff Engineer

Submarine MiniSub ExplorationMiniSub

Bridge LaunchBay ScienceLab SickBay ExerciseArea 

LaunchPad MeetingRoom

AbyssalPlain 

ExplorationReport
HWSeaPort


)

(:init
    ;todo: put the initial state's facts and numeric values here
    (Person Brenden)
    (Person Andre)
    (Person Rahul)
    
    (Designation Brenden Captain)
    (Designation Andre EngineerStaff)
    (Designation Rahul Engineer)
    
    (Sub ExplorationMiniSub)

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
    
    (UnderWaterRegion  AbyssalPlain)
    (UnderWaterRegion  Empty)
    (UnderWaterRegion  Ridge)
    (UnderWaterRegion  Vortex)
    
    (UnderwaterBaseSection LaunchPad)
    (UnderwaterBaseSection MeetingRoom)
    
    (UnderwaterBaseSectionConnection LaunchPad MeetingRoom)
    
    (StaffLocation Brenden SickBay)
    (StaffLocation Andre ExerciseArea)
    
    (SubLocation ExplorationMiniSub LaunchBay)
    
    (SecurityPersonnel UnderwaterBaseSecurity LaunchPad)
    
)

(:goal (and
    ;todo: put the goal condition here
    
    (StaffLocation Brenden Bridge)
    (StaffLocation Andre LaunchBay)
    (StaffLocation Rahul ExplorationMiniSub)
    (StaffLocation Brenden ExplorationMiniSub)
    
    (SubLocation ExplorationMiniSub AbyssalPlain)
    (FixSensor Rahul AbyssalPlain)
    
    (SubLocation ExplorationMiniSub LaunchPad)
    
    (StaffLocation Brenden MeetingRoom)
    (LeadersMeeting Brenden UnderwaterBaseLeader)
    
    (SubLocation ExplorationMiniSub LaunchBay)
    
    (StaffLocation Rahul LaunchBay)
    (StaffLocation Brenden LaunchBay)
    
    (Reports ExplorationReport)
    (SendReport ExplorationReport HWSeaPort)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)

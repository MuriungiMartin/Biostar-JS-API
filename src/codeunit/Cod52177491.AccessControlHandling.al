codeunit 52177491 "Access Control Handling"
{
    trigger OnRun()
    begin

    end;

    procedure fnCreateBiostarCard(CardId: Integer; CardType: Integer; status: Integer; userid: Integer; name: text[50]; cardname: Text[50]; isassigned: Boolean; blocked: Boolean) Returned: Boolean
    var
        ObjBstrCards: Record "Biostar Cards";
    begin
        Returned := false;
        ObjBstrCards.Init();
        ObjBstrCards."Card Id" := CardId;
        ObjBstrCards."Card Type" := CardType;
        ObjBstrCards.Status := status;
        ObjBstrCards."User ID" := userid;
        ObjBstrCards."User Name" := name;
        ObjBstrCards."Card Type Name" := cardname;
        ObjBstrCards.Assigned := isassigned;
        ObjBstrCards.BlackListed := blocked;
        if not ObjBstrCards.Get(ObjBstrCards."Card Id") then
            ObjBstrCards.Insert() else
            ObjBstrCards.Modify();

        Returned := true;
    end;

    procedure fnCreateBiostarUser(BUserId: Integer; UserNAme: Text[47]; UsergroupId: Integer; Disabled: Boolean; Email: Text[100];
  Department: Text[64]; Title: Text[50]; Phone: Text[13]; Permission: Integer; AccessGroup: Integer; loginId: Text[25]; Password: Text[25]; userIp: Text[20]; PinNo: Integer; expired: Boolean; cardcount: Integer)
    var
        ObjBsrUser: Record "Ac Ctrl Users Rec";
    begin
        ObjBsrUser.Init();
        ObjBsrUser.ID := BUserId;
        ObjBsrUser.Name := UserNAme;
        ObjBsrUser."User Group Id" := UsergroupId;
        ObjBsrUser.Disabled := Disabled;
        // ObjBsrUser."Start DateTime" := startDateTime;
        // ObjBsrUser."Expiry DateTime" := ExpiryDateTime;
        ObjBsrUser.Email := Email;
        ObjBsrUser.Department := Department;
        ObjBsrUser.Title := Title;
        ObjBsrUser."Phone No" := Phone;
        ObjBsrUser."Permission ID" := Permission;
        ObjBsrUser."Access Group" := AccessGroup;
        ObjBsrUser."Login id" := loginId;
        ObjBsrUser.Password := Password;
        ObjBsrUser."User Ip" := userIp;
        ObjBsrUser."Pin No" := PinNo;
        ObjBsrUser.expired := expired;
        ObjBsrUser."card count" := cardcount;
        ObjBsrUser.Insert();
    end;

    procedure fnAssignUserCard(BuserID: Integer; CardID: Integer) Returned: Boolean
    var
        ObjBsrUser: Record "Ac Ctrl Users Rec";
    begin
        ObjBsrUser.Reset();
        ObjBsrUser.SetRange(ObjBsrUser.ID, BuserID);
        if ObjBsrUser.FindFirst() then begin
            ObjBsrUser."Card ID" := CardID;
            ObjBsrUser.Modify();
            Returned := true;
        end;
    end;

    procedure fnDeleteUsers(BUserID: Integer) Returned: Boolean
    var
        ObjBsrUser: Record "Ac Ctrl Users Rec";
    begin
        ObjBsrUser.Reset();
        ObjBsrUser.SetRange(ObjBsrUser.ID, BuserID);
        if ObjBsrUser.FindFirst() then begin
            ObjBsrUser.Delete();
            Returned := true;
        end;
    end;

    procedure fnCreateNewBiostarDeviceGroup(GroupID: Integer; GroupName: Text[48]; Description: text[150]; ParentId: integer) returned: Boolean
    var
        ObjBstrDeviceGrps: Record "biostar Device Group";
    begin
        ObjBstrDeviceGrps.init;
        ObjBstrDeviceGrps."Id" := GroupID;
        ObjBstrDeviceGrps."Name" := GroupName;
        ObjBstrDeviceGrps.Description := Description;
        ObjBstrDeviceGrps."Parent Id" := ParentId;
        ObjBstrDeviceGrps.Insert();
        returned := true;
    end;

    procedure fnUpdateBiostarDeviceGroup(GroupID: Integer; GroupName: Text[48]; Description: text[150]; ParentId: integer) returned: Boolean
    var
        ObjBstrDeviceGrps: Record "biostar Device Group";
    begin
        ObjBstrDeviceGrps.Reset;
        ObjBstrDeviceGrps.SetRange(ObjBstrDeviceGrps.id, GroupID);
        ;
        if ObjBstrDeviceGrps.FindFirst() then begin
            ObjBstrDeviceGrps."Name" := GroupName;
            ObjBstrDeviceGrps.Description := Description;
            ObjBstrDeviceGrps."Parent Id" := ParentId;
            ObjBstrDeviceGrps.modify();
            returned := true;
        end;
    end;

    procedure fnDeleteBiostarDeviceGroup(GroupID: Integer) returned: Boolean
    var
        ObjBstrDeviceGrps: Record "biostar Device Group";
    begin
        ObjBstrDeviceGrps.Reset;
        ObjBstrDeviceGrps.SetRange(ObjBstrDeviceGrps.id, GroupID);
        ;
        if ObjBstrDeviceGrps.FindFirst() then begin
            ObjBstrDeviceGrps.Delete();
            returned := true;
        end;
    end;


    procedure fnCreateNewBiostarDevice(id: integer; Name: Text[48]; GroupId: integer; IsDisabled: Boolean; EnableDHCP: Boolean
    ; IpAddress: Text[20]; PortNo: Integer) Returned: boolean
    var
        ObjBDevices: Record "Access Control Devices";
    begin
        ObjBDevices.Init();
        ObjBDevices."Device Id" := id;
        ObjBDevices."Device Name" := Name;
        ObjBDevices."Device Group" := GroupId;
        ObjBDevices."Is Disabled" := IsDisabled;
        ObjBDevices."Enable DHCP" := EnableDHCP;
        ObjBDevices."Ip Address" := IpAddress;
        ObjBDevices."Port No" := PortNo;
        Returned := ObjBDevices.Insert(true);
    end;

    procedure fnCreateNewDoorGroup(Id: Integer; Name: Text; ParentID: integer; Depth: Integer)
    var
        ObjDoorGroup: record "Biostar Door Groups";
    begin
        ObjDoorGroup.Init();
        ObjDoorGroup.id := Id;
        ObjDoorGroup.Name := Name;
        ObjDoorGroup."Parent Id" := parentid;
        ObjDoorGroup.Depth := Depth;
        ObjDoorGroup.Insert();
    end;

    procedure fnDeleteDoorGroup(Id: Integer)
    var
        ObjDoorGroup: record "Biostar Door Groups";
    begin
        ObjDoorGroup.Reset();
        ObjDoorGroup.SetRange(ObjDoorGroup.Id, Id);
        if ObjDoorGroup.FindFirst() then begin
            ObjDoorGroup.Delete();
        end;
    end;

    procedure fnupdateDoorGroup(Id: Integer; Name: Text; ParentID: integer; Depth: Integer)
    var
        ObjDoorGroup: record "Biostar Door Groups";
    begin
        ObjDoorGroup.Reset();
        ObjDoorGroup.SetRange(ObjDoorGroup.Id, Id);
        if ObjDoorGroup.FindFirst() then begin
            ObjDoorGroup.Name := Name;
            ObjDoorGroup."Parent Id" := parentid;
            ObjDoorGroup.Depth := Depth;
            ObjDoorGroup.modify();
        end;
    end;

    procedure fnCreateBiostarDoor(id: Integer; name: Text; description: Text; DoorGroup: Integer; OpenTimeout: Integer; OpenDuration: Integer; OpenOnce: Boolean; UnconditionalLock: Boolean; RelayInputID: integer;
    RelayOutputIndex: Integer; ExitInputId: Integer; ExitInputIndex: Integer; ExitINputType: Boolean; SensorInputId: Integer; SensorInputIndex: Integer; SensorINputType: boolean; ApbUseDoorSensor: Boolean) Returned: Boolean
    var
        ObjDoors: Record "Door Register";
    begin
        ObjDoors.Init();
        ObjDoors."Door No." := id;
        ObjDoors.description := description;
        ObjDoors."Door Group" := DoorGroup;
        ObjDoors."Open Timeout" := OpenTimeout;
        ObjDoors."Open Duration" := OpenDuration;
        ObjDoors."Apb Use door Sensor" := ApbUseDoorSensor;
        ObjDoors."Open Once" := OpenOnce;
        ObjDoors."Unconditional Lock" := UnconditionalLock;
        ObjDoors."Entry Device" := RelayInputID;
        ObjDoors."Relay Index" := RelayOutputIndex;
        ObjDoors."Exit input Id" := ExitInputId;
        ObjDoors."Exit Input Index" := ExitInputIndex;
        ObjDoors."Exit Input type" := ExitINputType;
        ObjDoors."Sensor Input device id" := SensorInputId;
        ObjDoors."Sensor Input Index No" := SensorInputIndex;
        ObjDoors."Sensor Input type" := SensorINputType;
        ObjDoors.insert;
        Returned := true;
    end;

    procedure fnUpdateBiostarDoor(id: Integer; name: Text; description: Text; DoorGroup: Integer; OpenTimeout: Integer; OpenDuration: Integer; OpenOnce: Boolean; UnconditionalLock: Boolean; RelayInputID: integer;
RelayOutputIndex: Integer; ExitInputId: Integer; ExitInputIndex: Integer; ExitINputType: Boolean; SensorInputId: Integer; SensorInputIndex: Integer; SensorINputType: boolean; ApbUseDoorSensor: Boolean) Returned: Boolean
    var
        ObjDoors: Record "Door Register";
    begin
        ObjDoors.reset();
        ObjDoors.SetRange(ObjDoors."Door No.", id);
        if ObjDoors.findfirst then begin
            ObjDoors.description := description;
            ObjDoors."Door Group" := DoorGroup;
            ObjDoors."Open Timeout" := OpenTimeout;
            ObjDoors."Open Duration" := OpenDuration;
            ObjDoors."Apb Use door Sensor" := ApbUseDoorSensor;
            ObjDoors."Open Once" := OpenOnce;
            ObjDoors."Unconditional Lock" := UnconditionalLock;
            ObjDoors."Entry Device" := RelayInputID;
            ObjDoors."Relay Index" := RelayOutputIndex;
            ObjDoors."Exit input Id" := ExitInputId;
            ObjDoors."Exit Input Index" := ExitInputIndex;
            ObjDoors."Exit Input type" := ExitINputType;
            ObjDoors."Sensor Input device id" := SensorInputId;
            ObjDoors."Sensor Input Index No" := SensorInputIndex;
            ObjDoors."Sensor Input type" := SensorINputType;
            ObjDoors.Modify();
            Returned := true;
        end;

    end;

    procedure fnDeleteDor(id: Integer) Returned: Boolean
    var
        ObjDoors: Record "Door Register";
    begin
        ObjDoors.reset();
        ObjDoors.SetRange(ObjDoors."Door No.", id);
        if ObjDoors.findfirst then begin
            ObjDoors.Delete();
            Returned := true;
        end;
    end;

    procedure fnCreateWeeklySchedule()
    var
        myInt: Integer;
    begin

    end;

    procedure fnBiostarLogin("login_id": Text[25]; "Password": Text[25])
    begin

    end;

    procedure fnBiostarLogout()
    begin

    end;

    procedure fnCreateBiostarAccessGroup(Name: text[25]; Description: Text[40]; Users: TExt[250]; UserGroups: TExt[250]; AccessLevels: TExt[250]; FloorLevels: TExt[250])
    var
        ObjBStrAccGrp: Record "biostar Access Group";
    begin
        ObjBStrAccGrp.Init();
        ObjBStrAccGrp.Name := Name;
        ObjBStrAccGrp.Description := Description;
        ObjBStrAccGrp.Users := users;
        ObjBStrAccGrp."User groups" := UserGroups;
        ObjBStrAccGrp."Access levels" := AccessLevels;
        ObjBStrAccGrp."Floor Levels" := FloorLevels;
        ObjBStrAccGrp.Insert();
    end;

    procedure fnUpdateBiostarAccessGroup(Name: text[25]; Description: Text[40]; Users: TExt[250]; UserGroups: TExt[250]; AccessLevels: TExt[250]; FloorLevels: TExt[250])
    var
        ObjBStrAccGrp: Record "biostar Access Group";
    begin
        ObjBStrAccGrp.Reset();
        ObjBStrAccGrp.SetRange(ObjBStrAccGrp.Name, Name);
        if ObjBStrAccGrp.FindFirst() then begin
            ObjBStrAccGrp.Name := Name;
            ObjBStrAccGrp.Description := Description;
            ObjBStrAccGrp.Users := users;
            ObjBStrAccGrp."User groups" := UserGroups;
            ObjBStrAccGrp."Access levels" := AccessLevels;
            ObjBStrAccGrp."Floor Levels" := FloorLevels;
            ObjBStrAccGrp.Modify();
        end;
    end;

    procedure fnDeleteBiostarAccessGroup(Name: text[25])
    var
        ObjBStrAccGrp: Record "biostar Access Group";
    begin
        ObjBStrAccGrp.Reset();
        ObjBStrAccGrp.SetRange(ObjBStrAccGrp.Name, Name);
        if ObjBStrAccGrp.FindFirst() then begin
            ObjBStrAccGrp.Delete();
        end;
    end;

    Procedure fnCreateBiostarAccessLevel(Name: text[25]; Description: Text[40]; DoorId: Integer; SheduleID: Integer)
    var
        ObjBstrAccLvl: Record "Acccess Levels";
    begin
        ObjBstrAccLvl.Init();
        ObjBstrAccLvl.Name := name;
        ObjBstrAccLvl.Description := Description;
        ObjBstrAccLvl.Door := DoorId;
        ObjBstrAccLvl."Shedule Id" := SheduleID;
        ObjBstrAccLvl.Insert();
    end;

    Procedure fnUpdateBiostarAccessLevel(Name: text[25]; Description: Text[40]; DoorId: Integer; SheduleID: Integer)
    var
        ObjBstrAccLvl: Record "Acccess Levels";
    begin
        ObjBstrAccLvl.Reset();
        ObjBstrAccLvl.SetRange(ObjBstrAccLvl.Name, Name);
        if ObjBstrAccLvl.FindFirst() then begin
            ObjBstrAccLvl.Name := name;
            ObjBstrAccLvl.Description := Description;
            ObjBstrAccLvl.Door := DoorId;
            ObjBstrAccLvl."Shedule Id" := SheduleID;
            ObjBstrAccLvl.Modify();
        end;
    end;

    Procedure fnDeleteBiostarAccessLevel(Name: text[25])
    var
        ObjBstrAccLvl: Record "Acccess Levels";
    begin
        ObjBstrAccLvl.Reset();
        ObjBstrAccLvl.SetRange(ObjBstrAccLvl.Name, Name);
        if ObjBstrAccLvl.FindFirst() then begin
            ObjBstrAccLvl.Delete();
        end;
    end;

    procedure fnCreateBiostarUserGroup(Id: integer; Name: Text; ParentId: integer; Depth: Integer)
    var
        ObjBUsergrp: Record "biostar User Group";
    begin
        ObjBUsergrp.Init();
        ObjBUsergrp.id := Id;
        ObjBUsergrp.name := Name;
        ObjBUsergrp."Parent Id" := ParentId;
        ObjBUsergrp.depth := Depth;
        ObjBUsergrp.Insert();
    end;

    procedure fnUpdateBiostarUserGroup(Id: integer; Name: Text)
    var
        ObjBUsergrp: Record "biostar User Group";
    begin
        ObjBUsergrp.reset();
        ObjBUsergrp.SetRange(ObjBUsergrp.id, Id);
        if ObjBUsergrp.FindFirst() then begin
            ObjBUsergrp.name := Name;
            ObjBUsergrp.modify();
        end;
    end;

    procedure fnDeleteBiostarUserGroup(Id: integer)
    var
        ObjBUsergrp: Record "biostar User Group";
    begin
        ObjBUsergrp.reset();
        ObjBUsergrp.SetRange(ObjBUsergrp.id, Id);
        if ObjBUsergrp.FindFirst() then begin
            ObjBUsergrp.delete();
        end;
    end;

    //procedure fn

    Procedure FnInsertNewInteraction(VarUserid: code[50]; InteractionChannel: Code[25]; IssueReported: Text[2000];
     ComplainantType: Integer; CaseType: Integer; TimeLogged: Time; AccessControlLogNo: Integer) Inserted: Boolean
    begin
        Inserted := false;
        Clear(VarRunningDocNo);
        ObjMarketingSetup.get();
        VarRunningDocNo := CuNoSeriesMgmt.GetNextNo(ObjMarketingSetup."CRM Interaction Nos", 0D, true);
        ObjInteractionHeader.Init();
        ObjInteractionHeader."Interact Code" := VarRunningDocNo;
        ObjInteractionHeader."User ID" := VarUserid;
        ObjInteractionHeader.Issue := IssueReported;
        ObjInteractionHeader."Interaction Channel" := InteractionChannel;
        ObjInteractionHeader."From VMS" := true;
        ObjInteractionHeader."Access Control Log No" := AccessControlLogNo;
        ObjInteractionHeader."Time Registered In" := TimeLogged;
        ObjInteractionHeader."Case type" := CaseType;
        ObjInteractionHeader."Complaint Type" := ComplainantType;
        if ObjInteractionHeader."Interaction Channel" <> '' then begin
            if ObjInteractionHeader.insert(true) then begin
                Inserted := true;
            end;
        end;
    end;

    Procedure FnInsertAcceessControlCardLog(VarCardNo: Integer; varDate: date; VarTimeLoggedIn: Time; VarVisitorId: Code[25];
    VarFloorLevel: Integer; VarDoorGroup: Integer; VarDoorName: text[250]; VarVisitorName: Text[250])
    begin
        ObjAccControlLogs.Reset();
        if ObjAccControlLogs.FindLast() then begin
            Clear(LineNo);
            LineNo := ObjAccControlLogs."Entry No" + 1;
        end;
        ObjAccControlLogs.Reset();
        ObjAccControlLogs.Init();
        ObjAccControlLogs."Entry No" := LineNo;
        ObjAccControlLogs."Card No." := VarCardNo;
        ObjAccControlLogs."Visitor ID" := VarVisitorId;
        ObjAccControlLogs."Visitor Name" := VarVisitorName;
        ObjAccControlLogs."Date Accessed" := varDate;
        ObjAccControlLogs."Time In" := VarTimeLoggedIn;
        ObjAccControlLogs."Floor Level" := VarFloorLevel;
        ObjAccControlLogs."Door Group Id" := VarDoorGroup;
        ObjAccControlLogs."Door Name" := VarDoorName;
        ObjAccControlLogs.Insert(true);


    end;

    procedure fnCreateBiostarDeviceGroup(id: Integer; ParentId: Integer; Description: Text[40]; Name: text[25])
    var
        ObjBStrDeviceGrp: Record "biostar Device Group";
    begin
        ObjBStrDeviceGrp.Init();
        ObjBStrDeviceGrp.id := id;
        ObjBStrDeviceGrp."Parent Id" := ParentId;
        ObjBStrDeviceGrp.Description := Description;
        ObjBStrDeviceGrp.name := name;
        ObjBStrDeviceGrp.Insert();
    end;

    procedure fnCreateBiostarSchedule(Name: Text[50]; Description: Text[150]; Day: Integer; StartTime: Time; EndTime: Time; HolidayGroup: Integer; IterationDays: Integer; StartDate: Date; DailyIteration: Boolean)
    var
        ObjBStrSchedules: Record "Biostar Schedule";
    begin
        ObjBStrSchedules.Init();
        ObjBStrSchedules.Name := Name;
        ObjBStrSchedules.Description := Description;
        ObjBStrSchedules.day := Day;
        ObjBStrSchedules."Start Time" := StartTime;
        ObjBStrSchedules."End Time" := EndTime;
        ObjBStrSchedules."Holiday Group" := HolidayGroup;
        ObjBStrSchedules."Days of Iteration" := IterationDays;
        ObjBStrSchedules."Start Date" := StartDate;
        ObjBStrSchedules."Use daily Iteration" := DailyIteration;
        ObjBStrSchedules.Insert();
    end;


    procedure fnCreateBiostarSchedules2(id: Integer; ScheduleName: Text[50]; DayIndex: Integer; StartTime: Integer; EndTime: Integer; Description: Text[40]; HolidayGroup: Integer)
    var
        ObjBStrSchedules: Record "Biostar Schedules";
    begin
        ObjBStrSchedules.Init();
        ObjBStrSchedules."Schedule Id" := id;
        ObjBStrSchedules."Schedule Name" := ScheduleName;
        ObjBStrSchedules."Day Index" := DayIndex;
        ObjBStrSchedules."Start Time" := StartTime;
        ObjBStrSchedules."End Time" := EndTime;
        ObjBStrSchedules.Description := Description;
        ObjBStrSchedules."Holiday group Id" := HolidayGroup;
        ObjBStrSchedules.Insert();
    end;

    procedure fnCreateAccCtrlSetup(primarykey: Integer; url: Text[150]; id: Text[50]; password: Text[50])
    var
        ObjBstrAccCtrlSetup: Record "Access Control Setup";
    begin
        ObjBstrAccCtrlSetup.Init();
        ObjBstrAccCtrlSetup."Primary Key" := primarykey;
        ObjBstrAccCtrlSetup.Url := url;
        ObjBstrAccCtrlSetup."login id" := id;
        ObjBstrAccCtrlSetup.Password := password;
        ObjBstrAccCtrlSetup.Insert();
    end;

    procedure fnAccCtrlUsersRegister(ID: Integer; Name: Text[50]; Email: Text[150]; Department: Code[50]; Title: Text[150]; Active: Boolean; Period: Date; level: Text[50]; group: Integer; phone: Code[15]; ip: Code[50]; groupid: Option)
    var
        ObjBstrAccCtrlUsersReg: Record "Ac Ctrl Users Rec";
    begin
        ObjBstrAccCtrlUsersReg.Init();
        ObjBstrAccCtrlUsersReg.ID := ID;
        ObjBstrAccCtrlUsersReg.Name := Name;
        ObjBstrAccCtrlUsersReg.Email := Email;
        ObjBstrAccCtrlUsersReg.Department := Department;
        ObjBstrAccCtrlUsersReg.Title := Title;
        ObjBstrAccCtrlUsersReg.Active := Active;
        ObjBstrAccCtrlUsersReg.period := Period;
        ObjBstrAccCtrlUsersReg."Access Level" := level;
        ObjBstrAccCtrlUsersReg."Access Group" := group;
        ObjBstrAccCtrlUsersReg.Telephone := phone;
        ObjBstrAccCtrlUsersReg."User Ip" := ip;
        ObjBstrAccCtrlUsersReg."User Group Id" := groupid;
        ObjBstrAccCtrlUsersReg.Insert();
    end;

    procedure fnCreateBstarAccessLevels(name: Text[50]; description: Text[150]; door: Integer; sheduleid: Integer)
    var
        ObjBstarAccessLevel: Record "Acccess Levels";
    begin
        ObjBstarAccessLevel.Init();
        ObjBstarAccessLevel.Name := name;
        ObjBstarAccessLevel.Description := description;
        ObjBstarAccessLevel.Door := door;
        ObjBstarAccessLevel."Shedule Id" := sheduleid;
        ObjBstarAccessLevel.Insert();

    end;

    procedure fnCreateBstarFloorLevels(name: Text[150]; description: Text[250]; elevatorid: Integer; deviceid: Integer; floorno: Integer; sheduleid: Integer)
    var
        ObjBstarFloorLevel: Record "Biostar floor levels";
    begin
        ObjBstarFloorLevel.Init();
        ObjBstarFloorLevel.Name := name;
        ObjBstarFloorLevel.Description := description;
        ObjBstarFloorLevel."Elevator Id" := elevatorid;
        ObjBstarFloorLevel."Device Id" := deviceid;
        ObjBstarFloorLevel."Floors No" := floorno;
        ObjBstarFloorLevel."Schedule ID" := sheduleid;
        ObjBstarFloorLevel.Insert();

    end;

    procedure fnCreateBstarPermissionPerUser(userid: Integer; username: Text[150]; usergroup: Text[50]; userlevel: Text[50]; doorgroup: Text[50]; door: Integer; sheduleid: Integer; accessgroup: Text[50])
    var
        ObjBstarAccessLevel: Record "Biostar Permission By User";
    begin
        ObjBstarAccessLevel.Init();
        ObjBstarAccessLevel."User Id" := userid;
        ObjBstarAccessLevel."User Name" := username;
        ObjBstarAccessLevel."User Group" := usergroup;
        ObjBstarAccessLevel."User Level" := userlevel;
        ObjBstarAccessLevel."Door Group" := doorgroup;
        ObjBstarAccessLevel.Door := door;
        ObjBstarAccessLevel."Schedule Id" := sheduleid;
        ObjBstarAccessLevel."Access Group" := accessgroup;
        ObjBstarAccessLevel.Insert();

    end;

    procedure fnCreateBstarAuthorization(ID: Text[150]; Password: Text[250])
    var
        ObjBstarAuthorization: Record "Biostar Authorization";
    begin
        ObjBstarAuthorization.Init();
        ObjBstarAuthorization."Login ID" := ID;
        ObjBstarAuthorization.Password := Password;
        ObjBstarAuthorization.Insert();

    end;



    procedure fnCreateBstarElevatorGroups(ID: Integer; isGroup: Boolean; Depth: Integer; Inherited: Boolean)
    var
        ObjBstarElevatorGroup: Record "Biostar Elevator Groups";
    begin
        ObjBstarElevatorGroup.Init();
        ObjBstarElevatorGroup."parent_id:id" := ID;
        ObjBstarElevatorGroup.isElevatorGroups := isGroup;
        ObjBstarElevatorGroup.Depth := Depth;
        ObjBstarElevatorGroup.Inherited := Inherited;
        ObjBstarElevatorGroup.Insert();

    end;

    procedure fnCreateBstarElevators(Limit: Integer; SearchTxt: Text[250]; GroupId: Integer; OrderBy: Text[50])
    var
        ObjBstarElevator: Record "Biostar Elevators";
    begin
        ObjBstarElevator.Init();
        ObjBstarElevator.Limit := Limit;
        ObjBstarElevator."Search Text" := SearchTxt;
        ObjBstarElevator."Elevator Group ID" := GroupId;
        ObjBstarElevator."Order By" := OrderBy;
        ObjBstarElevator.Insert();

    end;

    procedure fnCreateBstarHolidayGroups(Name: Text[100]; Description: Text[250]; RepeatInterval: Integer; StartDate: DateTime)
    var
        ObjBstarHolidayGroup: Record "Biostar Holiday Groups";
    begin
        ObjBstarHolidayGroup.Init();
        ObjBstarHolidayGroup.Name := Name;
        ObjBstarHolidayGroup.Description := Description;
        ObjBstarHolidayGroup."Repeat Interval" := RepeatInterval;
        ObjBstarHolidayGroup."Start Date" := StartDate;
        ObjBstarHolidayGroup.Insert();

    end;

    procedure fnCreateBstarTriggerActions(Name: Text[100]; Priority: Integer; ScheduleId: Integer; TriggerSource: Integer)
    var
        ObjBstarTriggerAction: Record "Biostar Trigger Actions";
    begin
        ObjBstarTriggerAction.Init();
        ObjBstarTriggerAction.Name := Name;
        ObjBstarTriggerAction.Priority := Priority;
        ObjBstarTriggerAction."schedule_id:id" := ScheduleId;
        ObjBstarTriggerAction."trigger:source_type" := TriggerSource;
        ObjBstarTriggerAction.Insert();

    end;

    procedure fnCreateBstarEmailSettings(Title: Text[100]; CompanyName: Text[100]; Logo: Code[1000]; AdminContact: Text[100])
    var
        ObjBstarEmailSetting: Record "Biostar Email Settings";
    begin
        ObjBstarEmailSetting.Init();
        ObjBstarEmailSetting.Title := Title;
        ObjBstarEmailSetting."Company Name" := CompanyName;
        //  ObjBstarEmailSetting."Company Logo" := Logo;
        ObjBstarEmailSetting."Admin Contact" := AdminContact;
        ObjBstarEmailSetting.Insert();

    end;

    procedure fnCreateBstarCustomFieldSettings(Order: Integer; Name: Text[100]; Type: Integer; Enable: Boolean; Data: Text[100])
    var
        ObjBstarCustomFieldSetting: Record "Biostar Custom Fields Settings";
    begin
        ObjBstarCustomFieldSetting.Init();
        ObjBstarCustomFieldSetting.Order := Order;
        ObjBstarCustomFieldSetting.Name := Name;
        ObjBstarCustomFieldSetting.Type := Type;
        ObjBstarCustomFieldSetting.Enable := Enable;
        ObjBstarCustomFieldSetting.Data := Data;
        ObjBstarCustomFieldSetting.Insert();

    end;

    procedure fnCreateBstarEvents(Limit: Integer; Column: Text[100]; Operator: Integer)
    var
        ObjBstarEvent: Record "Biostar Events";
    begin
        ObjBstarEvent.Init();
        ObjBstarEvent.Limit := Limit;
        ObjBstarEvent."conditions:column" := Column;
        ObjBstarEvent."conditions:operator" := Operator;
        ObjBstarEvent.Insert();

    end;

    procedure fnCreateBstarZones(Name: Text[100]; Description: Text[250]; Zone: Integer; Global: Boolean)
    var
        ObjBstarZones: Record "Biostar Zones";
    begin
        ObjBstarZones.Init();
        ObjBstarZones.Name := Name;
        ObjBstarZones.Description := Description;
        ObjBstarZones."Zone Type" := Zone;
        ObjBstarZones."Is Global" := Global;
        ObjBstarZones.Insert();

    end;

    procedure fnInsertDoor()
    begin

    end;

    Procedure FnUpdateAccessLevel()
    begin

    end;

    Procedure FnUpdateUserGroup()
    Begin

    End;

    Procedure FnFindNextAvailableUserId()
    Begin

    End;

    Procedure FnCreateNewUser()
    Begin

    End;

    Procedure FnSendUserDataToDevice()
    Begin

    End;

    Procedure FnViewUserDetails()
    Begin

    End;

    Procedure FnDownloadUserDatFile()
    Begin

    End;

    Procedure FnDeleteUserDataFromADevice()
    Begin

    End;

    Procedure FnWriteDataToCard()
    Begin

    End;


    var
        LineNo: Integer;
        VarRunningDocNo: Code[50];
        ObjInteractionHeader: record "Client Interaction Header";
        ObjInteractionLines: record "Client Interaction Line";
        ObjSmtpSetup: Record "SMTP Mail Setup";
        ObjAccControlLogs: record "Access Control Card Logs";
        CuNoSeriesMgmt: codeunit NoSeriesManagement;
        CuSmtpMail: codeunit "SMTP Mail";
        ObjDECCaseComplainants: record "DEC Case Complainants";
        ObjCaseReSpondents: Record "Disciplinary Respondents";
        ObjMarketingSetup: Record "Marketing Setup";
}
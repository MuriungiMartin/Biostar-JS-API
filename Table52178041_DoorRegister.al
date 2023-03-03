table 52178041 "Door Register"
{
    DataClassification = ToBeClassified;
    // DrillDownPageId = "Doors List";

    fields
    {
        field(1; "Door No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Floor No."; integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Designated Employee No."; Code[50])
        {
            TableRelation = Employee."No.";

        }
        field(4; "Employee Name"; text[150])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                ObjEmp.reset;
                ObjEmp.SetRange(ObjEmp."No.", "Designated Employee No.");
                if ObjEmp.Find('-') then begin
                    "Employee Name" := "Employee Name";
                end;
            end;
        }
        field(5; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            Editable = false;

            trigger OnValidate()
            begin
            end;
        }
        field(6; "Door Group"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Entry Device"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Description; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Open Timeout"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Open Duration"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Open Once"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Unconditional Lock"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Relay Index"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Exit input Id"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Exit Input Index"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Exit Input type"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Sensor Input device id"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Sensor Input Index No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Sensor Input type"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Apb Use door Sensor"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        /*name	String	Y	Name of the door
        description	String	N	Description of the door
        door_group_id:id	Number	Y	ID of the Door Group which the door will be under
        open_timeout	Number	N	Configure the maximum allowed time for the door to remain open. Default: 10.
        open_duration	Number	N	Set the duration for which the door will remain open after a user authentication is completed. When the authentication is successful, the relay will be activated for the set time. When this time elapses, the relay no longer sends the signal to the door. Open Time may vary depending on the type of door lock used.
        open_once	Boolean	N	Lock when door is closed: When the door sensor detects that the door is closed, the door is locked. Set this option to false if unconditional_lock is true. Set true to enable this parameter. Default: false.
        unconditional _lock	Boolean	N	Use Automatic Door: When using an automatic door as an entrance door, a relay can operate regardless of the status of a door sensor. Set this option as false if open_once is set to true.
        relay_output_id:device_id:id	Number	Y	Device ID which the relay will be used to control the door lock.
        relay_output_id:relay_index	Number	Y	Relay index of the device which will be used.
        exit_button_input_id:device_id:id	Number	Y	Device ID which will be used as exit control.
        exit_button_input_id:input_index	Number	Y	Exit index of the device which will be used.
        exit_button_input_id:type	Boolean	Y	1: Normally Closed, 0: Normally Open
        sensor_input_id:device_id:id	Number	Y	Device ID which will be used as sensor control.
        sensor_input_id:input_index	Number	Y	Sensor index of the device which will be used.
        sensor_input_id:type	Boolean	Y	1: Normally Closed, 0: Normally Open
        sensor_input_id:apb_use_door_sensor	Boolean	Y	Set whether to use the door sensor when using Entry Confirmed APB.*/

    }

    keys
    {
        key(Key1; "Door No.")
        {
            Clustered = true;
        }
    }

    var
        ObjEmp: Record Employee;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}
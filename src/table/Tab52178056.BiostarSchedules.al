table 52178056 "Biostar Schedules"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Schedule Id"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Schedule Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Day Index"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Start Time"; integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "End Time"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        /*name	String	Y	Name of the schedule
description	String	N	Description of the schedule
day_index	Number	Y	Day of the Week(0-sun, 1-mon, 2-tue, 3-wed, 4-thu, 5-fri, 6-sat)
time_segments:start_time	Number	Y	Start time of the day (in minutes)
time_segments:end_time	Number	Y	End time of the day (in minutes)
holiday_group_id:id	Number	N	ID of the holiday group
days_of_iteration	Number	N	Repeat schedule every n days
start_date	Date	N	Enable schedule from specified date
use_daily_iteration	Boolean	Y	Specify schedule weekly or daily. False for weekly*/
        field(6; "Description"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Holiday group Id"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        // field(8; "D"; Boolean)
        // {
        //     DataClassification = ToBeClassified;
        // }
        // field(9; "Enable DHCP"; Boolean)
        // {
        //     DataClassification = ToBeClassified;
        // }
        // field(10; "Port No"; Integer)
        // {
        //     DataClassification = ToBeClassified;
        // }

    }

    keys
    {
        key(Key1; "Schedule Id")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

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
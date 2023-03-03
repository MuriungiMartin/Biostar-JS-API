table 52178037 "Access Control Card Logs"
{
    DataClassification = ToBeClassified;
    DrillDownPageId = "Access Control Logs List";

    fields
    {
        field(1; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Card No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Time In"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Time Out"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Visitor ID"; Code[25])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Floor Level"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Door Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Door Group Id"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Door Open Duration"; Duration)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Date Accessed"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Visitor Name"; text[250])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "Entry No")
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
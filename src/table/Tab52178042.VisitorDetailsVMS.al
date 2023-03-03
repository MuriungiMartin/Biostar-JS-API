table 52178042 "Visitor Details VMS"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "ID No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Email"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Time In"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Phone No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Visit Destination"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Purpose"; Text[150])
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
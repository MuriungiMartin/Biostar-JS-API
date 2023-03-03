table 52178049 "Biostar Permission By User"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "User Id"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "User Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "User Group"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "User Level"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Door Group"; text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Door"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Schedule Id"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Access Group"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "User Id")
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
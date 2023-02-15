table 52178048 "Biostar floor levels"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Name; Text[150])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Description"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Elevator Id"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Device Id"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Floors No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Schedule ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }


    keys
    {
        key(Key1; Name)
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
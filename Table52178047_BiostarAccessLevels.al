table 52178047 "Acccess Levels"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Name; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Description; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Door; integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Shedule Id"; Integer)
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
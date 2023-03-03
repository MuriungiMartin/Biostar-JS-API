table 52178043 "Access Control Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Url"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "login id"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Password"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
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
table 52178053 "biostar Access Group"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Name; Text[40])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Description"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Users"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Access levels"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Floor Levels"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "User groups"; Text[250])
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
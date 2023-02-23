table 52178057 "Biostar Authorization"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Login ID"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Password; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Login ID")
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
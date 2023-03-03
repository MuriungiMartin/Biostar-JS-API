table 52178064 "Biostar Events"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Limit; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "conditions:column"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "conditions:operator"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Limit)
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
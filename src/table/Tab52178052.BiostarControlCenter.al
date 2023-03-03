table 52178052 "Biostar Control Center"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Control No"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Successful"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Control No")
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
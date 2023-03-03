table 52178063 "Biostar Custom Fields Settings"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Order; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; Name; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Type; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; Enable; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(5; Data; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Order)
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
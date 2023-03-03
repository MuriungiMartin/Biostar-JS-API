table 52178058 "Biostar Elevators"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Limit; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Search Text"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Elevator Group ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Order By"; Text[50])
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
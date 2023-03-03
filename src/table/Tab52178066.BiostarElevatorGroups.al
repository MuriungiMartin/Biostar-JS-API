table 52178066 "Biostar Elevator Groups"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "parent_id:id"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "isElevatorGroups"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(3; Depth; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; Inherited; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "parent_id:id")
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
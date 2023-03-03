table 52178061 "Biostar Trigger Actions"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Name; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Priority; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "schedule_id:id"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "trigger:source_type"; Integer)
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
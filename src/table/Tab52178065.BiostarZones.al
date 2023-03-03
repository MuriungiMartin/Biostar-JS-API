table 52178065 "Biostar Zones"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Name; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Zone Type"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Is Global"; Boolean)
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
table 52178060 "Biostar Holiday Groups"
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
        field(3; "Repeat Interval"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Start Date"; DateTime)
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
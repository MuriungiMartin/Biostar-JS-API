table 52178062 "Biostar Email Settings"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Title; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Company Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Company Logo"; Code[1000])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Admin Contact"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Title)
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
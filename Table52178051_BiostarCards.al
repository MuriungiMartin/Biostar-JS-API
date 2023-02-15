table 52178051 "Biostar Cards"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Card Id"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Card Type"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Card Format"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Status"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "User ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "User Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Assigned"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "BlackListed"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Card Id")
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
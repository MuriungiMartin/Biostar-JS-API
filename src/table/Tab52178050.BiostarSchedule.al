table 52178050 "Biostar Schedule"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Name; text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Description; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(3; day; Integer)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                if day > 7 then
                    Error('A day Cannot be greater than 7');
            end;
        }
        field(4; "Start Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "End Time"; time
        )
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Holiday Group"; integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Days of Iteration"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Start Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(9; "Use daily Iteration"; Boolean)
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
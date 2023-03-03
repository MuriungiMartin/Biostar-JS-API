table 52178046 "Biostar Door Groups"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Id"; Integer)
        {
            DataClassification = ToBeClassified;
        }
       
        field(2; "Description"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Access Level"; Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Acccess Levels";
        }
        field(4; "Floor Level"; Text[50])
        {
            DataClassification = ToBeClassified;
            //  TableRelation=acces
        }
        field(5; "User Group"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "User Id"; integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Parent Id"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Depth; Integer)
        {
            DataClassification = ToBeClassified;
        }
         field(9; Name; Text[50])
        {
            DataClassification = ToBeClassified;

        }
    }

    keys
    {
        key(Key1; Id)
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
table 52178044 "Ac Ctrl Users Rec"
{
    DataClassification = ToBeClassified;
    DrillDownPageId = "Biostar Users";
    LookupPageId = "Biostar Users";
    fields
    {
        field(1; "ID"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Email"; text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Department"; Code[50])
        {

        }
        field(5; "Title"; Text[150])
        {
            DataClassification = ToBeClassified;

        }
        field(6; "Active"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7; period; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Access Level"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Access Group"; integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Telephone"; code[15])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "User Ip"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Card Type"; Option)
        {
            OptionMembers = CSN,Wiegand,"Smart Card","Read Card";
            OptionCaption = 'CSN,Wiegand,Smart Card,Read Card';
        }
        field(13; Device; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Registration Option"; Option)
        {
            OptionMembers = "Register by Card Reader","Assign Card","Enter Manually";
            OptionCaption = 'Register by Card Reader,Assign Card,Enter Manually';
        }
        field(15; "Card ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "User Group Id"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(17; "Disabled"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Start DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Expiry DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Phone No"; Text[13])
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Permission ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Login id"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(23; "Password"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Pin No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Idle User"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "card count"; Integer)
        {

        }
        field(27; "expired"; Boolean)
        {

        }

    }

    keys
    {
        key(Key1; ID)
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
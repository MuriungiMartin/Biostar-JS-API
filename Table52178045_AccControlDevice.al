table 52178045 "Access Control Devices"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Device Id"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(2; "Device Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Device Group"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Ip Address"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Status; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Description"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Parent Id"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Is Disabled"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Enable DHCP"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Port No"; Integer)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "Device Id")
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
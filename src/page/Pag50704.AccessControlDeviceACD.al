page 50704 "Access Control Device (ACD)"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Access Control Devices";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Device Name"; "Device Name")
                {
                }
                field("Device Group"; "Device Group")
                {
                }
                field("Ip Address"; "Ip Address")
                {
                }
                field(Status; Status)
                {
                }
                field(Description; Description)
                {
                }
                field("Parent Id"; "Parent Id")
                {
                }
                field("Is Disabled"; "Is Disabled")
                {
                }
                field("Enable DHCP"; "Enable DHCP")
                {
                }
                field("Port No"; "Port No")
                {
                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}
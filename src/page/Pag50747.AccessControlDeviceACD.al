page 50747 "Access Control Device (ACD)"
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
                field("Device Name"; Rec."Device Name")
                {
                }
                field("Device Group"; Rec."Device Group")
                {
                }
                field("Ip Address"; Rec."Ip Address")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Parent Id"; Rec."Parent Id")
                {
                }
                field("Is Disabled"; Rec."Is Disabled")
                {
                }
                field("Enable DHCP"; Rec."Enable DHCP")
                {
                }
                field("Port No"; Rec."Port No")
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
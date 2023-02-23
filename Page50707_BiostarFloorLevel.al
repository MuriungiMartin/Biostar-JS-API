page 50707 "BioStar Floor Level"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Biostar floor levels";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Name; Name)
                {
                }
                field(Description; Description)
                {
                }
                field("Elevator Id"; "Elevator Id")
                {
                }
                field("Device Id"; "Device Id")
                {
                }
                field("Schedule ID"; "Schedule ID")
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
page 50744 "BioStar Floor Level"
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
                field(Name; Rec.Name)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Elevator Id"; Rec."Elevator Id")
                {
                }
                field("Device Id"; Rec."Device Id")
                {
                }
                field("Schedule ID"; Rec."Schedule ID")
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
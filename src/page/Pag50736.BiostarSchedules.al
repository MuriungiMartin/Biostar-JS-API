page 50736 "Biostar Schedules"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Biostar Schedules";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Schedule Name"; Rec."Schedule Name")
                {
                }
                field("Day Index"; Rec."Day Index")
                {
                }
                field("Start Time"; Rec."Start Time")
                {
                }
                field("End Time"; Rec."End Time")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Holiday group Id"; Rec."Holiday group Id")
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
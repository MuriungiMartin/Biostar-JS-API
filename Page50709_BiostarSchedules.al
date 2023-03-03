page 50709 "BioStar Schedules"
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
                field("Schedule Name"; "Schedule Name")
                {
                }
                field("Day Index"; "Day Index")
                {
                }
                field("Start Time"; "Start Time")
                {
                }
                field("End Time"; "End Time")
                {
                }
                field(Description; Description)
                {
                }
                field("Holiday group Id"; "Holiday group Id")
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
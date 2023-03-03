page 50705 "BioStar Door Groups"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Biostar Door Groups";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Description; Description)
                {
                }
                field("Access Level"; "Access Level")
                {
                }
                field("Floor Level"; "Floor Level")
                {
                }
                field("User Group"; "User Group")
                {
                }
                field("User Id"; "User Id")
                {
                }
                field("Parent Id"; "Parent Id")
                {
                }
                field(Depth; Depth)
                {
                }
                field(Name; Name)
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
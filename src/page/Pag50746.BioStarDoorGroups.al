page 50746 "BioStar Door Groups"
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
                field(Description; Rec.Description)
                {
                }
                field("Access Level"; Rec."Access Level")
                {
                }
                field("Floor Level"; Rec."Floor Level")
                {
                }
                field("User Group"; Rec."User Group")
                {
                }
                field("User Id"; Rec."User Id")
                {
                }
                field("Parent Id"; Rec."Parent Id")
                {
                }
                field(Depth; Rec.Depth)
                {
                }
                field(Name; Rec.Name)
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
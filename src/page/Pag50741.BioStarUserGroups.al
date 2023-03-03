page 50741 "BioStar User Groups"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "biostar User Group";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Parent Id"; Rec."Parent Id")
                {
                }
                field(depth; Rec.depth)
                {
                }
                field(name; Rec.name)
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
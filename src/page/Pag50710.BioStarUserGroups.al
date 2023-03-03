page 50710 "BioStar User Groups"
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
                field("Parent Id"; "Parent Id")
                {
                }
                field(depth; depth)
                {
                }
                field(name; name)
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
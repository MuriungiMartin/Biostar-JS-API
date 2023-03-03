page 50711 "DEvice Group BStar"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "biostar Device Group";

    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field("Parent Id"; "Parent Id")
                {
                }
                field(Name; Name)
                {
                }
                field(Description; Description)
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
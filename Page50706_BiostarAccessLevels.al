page 50706 "BioStar Access Levels"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Acccess Levels";

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
                field(Door; Door)
                {
                }
                field("Shedule Id"; "Shedule Id")
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
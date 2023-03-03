page 50745 "BioStar Access Levels"
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
                field(Name; Rec.Name)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Door; Rec.Door)
                {
                }
                field("Shedule Id"; Rec."Shedule Id")
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
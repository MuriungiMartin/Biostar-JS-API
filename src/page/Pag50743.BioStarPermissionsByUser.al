page 50743 "BioStar Permissions By User"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Biostar Permission By User";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("User Name"; Rec."User Name")
                {
                }
                field("User Group"; Rec."User Group")
                {
                }
                field("User Level"; Rec."User Level")
                {
                }
                field("Door Group"; Rec."Door Group")
                {
                }
                field(Door; Rec.Door)
                {
                }
                field("Schedule Id"; Rec."Schedule Id")
                {
                }
                field("Access Group";Rec. "Access Group")
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
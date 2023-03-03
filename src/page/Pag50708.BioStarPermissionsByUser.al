page 50708 "BioStar Permissions By User"
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
                field("User Name"; "User Name")
                {
                }
                field("User Group"; "User Group")
                {
                }
                field("User Level"; "User Level")
                {
                }
                field("Door Group"; "Door Group")
                {
                }
                field(Door; Door)
                {
                }
                field("Schedule Id"; "Schedule Id")
                {
                }
                field("Access Group"; "Access Group")
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
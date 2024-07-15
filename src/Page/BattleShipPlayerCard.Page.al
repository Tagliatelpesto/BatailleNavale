page 50106 "BattleShipPlayer Card"
{
    ApplicationArea = All;
    Caption = 'BattleShipPlayer Card';
    PageType = Card;
    SourceTable = "BattleShip Player";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Number of looses"; Rec."Number of looses")
                {
                    ToolTip = 'Specifies the value of the Number of looses field.', Comment = '%';
                }
                field("Number of victories"; Rec."Number of victories")
                {
                    ToolTip = 'Specifies the value of the Number of victories field.', Comment = '%';
                }
                field(UserID; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User Id field.', Comment = '%';
                }
            }
        }
    }
}

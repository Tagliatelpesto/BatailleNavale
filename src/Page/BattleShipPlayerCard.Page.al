page 50106 "BattleShip Player Card"
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

                field("Number of loses"; Rec."Number of loses")
                {
                    ToolTip = 'Specifies the Number of loses the Player have', Comment = '%';
                }
                field("Number of victories"; Rec."Number of victories")
                {
                    ToolTip = 'Specifies the Number of victories the Player have', Comment = '%';
                }
                field(UserID; Rec."User ID")
                {
                    ToolTip = 'Specifies the Player User Id', Comment = '%';
                }
            }
        }
    }
}

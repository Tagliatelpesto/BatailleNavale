page 50101 "BattleShip Player List"
{
    ApplicationArea = All;
    Caption = 'BattleShip Player';
    PageType = List;
    SourceTable = "BattleShip Player";
    UsageCategory = Lists;
    AdditionalSearchTerms = 'BattleShip,Player';
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the Player User Id', Comment = '%';
                }
                field("Number of loses"; Rec."Number of loses")
                {
                    ToolTip = 'Specifies the Number of loses the Player have', Comment = '%';
                }
                field("Number of victories"; Rec."Number of victories")
                {
                    ToolTip = 'Specifies the Number of victories the Player have', Comment = '%';
                }
            }
        }
    }
}

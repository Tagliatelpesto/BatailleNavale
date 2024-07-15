page 50100 "BattleShip Game List"
{
    ApplicationArea = All;
    Caption = 'BattleShip Game';
    PageType = List;
    SourceTable = "BattleShip Game";
    CardPageId = "BattleShip Game Card";
    UsageCategory = "Lists";
    AdditionalSearchTerms = 'BattleShip Game, Game, BattleShip';
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Comment; Rec.Comment)
                {
                    Caption = 'Comment';
                    ToolTip = 'Specifies the value of the Comment field.', Comment = '%';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                }
                field("Player 1"; Rec."Player 1")
                {
                    Caption = 'Player 1';
                    ToolTip = 'Specifies the value of the Player 1 field.', Comment = '%';
                }
                field("Player 2"; Rec."Player 2")
                {
                    Caption = 'Player 2';
                    ToolTip = 'Specifies the value of the Player 2 field.', Comment = '%';
                }
                field(Winner; Rec.Winner)
                {
                    Caption = 'Winner';
                    ToolTip = 'Specifies the value of the Winner field.', Comment = '%';
                }
                field(Looser; Rec.Looser)
                {
                    Caption = 'Looser';
                    ToolTip = 'Specifies the value of the Looser field.', Comment = '%';
                }
                field(GameStatut; Rec."Game Statut")
                {
                    Caption = 'Statut of the game';
                    ToolTip = 'Specifies the value of the Game Statut field.', Comment = '%';
                }
            }
        }
    }

}

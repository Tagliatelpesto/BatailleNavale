page 50100 "BattleShip Game List"
{
    ApplicationArea = All;
    Caption = 'BattleShip Game';
    PageType = List;
    SourceTable = "BattleShip Game";
    CardPageId = "BattleShip Game Card";
    UsageCategory = "Lists";
    AdditionalSearchTerms = 'Game,BattleShip';
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    Caption = 'No.';
                    ToolTip = 'Specifies the No.Game', Comment = '%';
                }
                field(Comment; Rec.Comment)
                {
                    Caption = 'Comment';
                    ToolTip = 'Specifies a Comment for the Game', Comment = '%';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                    ToolTip = 'Posting Date of the Game', Comment = '%';
                }
                field("Player 1"; Rec."Player 1")
                {
                    Caption = 'Player 1';
                    ToolTip = 'Specifies the value of the Player 1', Comment = '%';
                }
                field("Player 2"; Rec."Player 2")
                {
                    Caption = 'Player 2';
                    ToolTip = 'Specifies the value of the Player 2', Comment = '%';
                }
                field(Winner; Rec.Winner)
                {
                    Caption = 'Winner';
                    ToolTip = 'Specifies the value of the Winner', Comment = '%';
                }
                field(Loser; Rec.Loser)
                {
                    Caption = 'Loser';
                    ToolTip = 'Specifies the value of the Loser', Comment = '%';
                }
                field(GameStatut; Rec."Game Statut")
                {
                    Caption = 'Statut of the game';
                    ToolTip = 'Specifies the Game Statut', Comment = '%';
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        GameMgt: CodeUnit "Game Mgt";
    begin
        GameMgt.IsNewUser();
    end;
}

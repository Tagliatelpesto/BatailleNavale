report 50100 "Resume Print BattleShip Game"
{
    ApplicationArea = All;
    Caption = 'Resume Print BattleShip Game';
    UsageCategory = Documents;
    RDLCLayout = 'src/RDLC/PrintResumeBattleShipGame.rdlc';
    dataset
    {
        dataitem(BattleShipGame; "BattleShip Game")
        {
            column(Comment; Comment)
            {
            }
            column(GameStatut; "Game Statut")
            {
            }
            column(Looser; Looser)
            {
            }
            column(No; "No.")
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(Player1; "Player 1")
            {
            }
            column(Player2; "Player 2")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(Winner; Winner)
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

}

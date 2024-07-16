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
            RequestFilterFields = "No.";
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

            dataitem(BattleGridP1; Integer)
            {
                DataItemTableView = sorting(Number);
                column(LineP1; BattleGridP1.Number) { }
                column(aPlacementP1; a) { }
                column(bPlacementP1; b) { }
                column(cPlacementP1; c) { }
                column(dPlacementP1; d) { }
                column(ePlacementP1; e) { }
                column(fPlacementP1; f) { }
                column(gPlacementP1; g) { }
                column(hPlacementP1; h) { }
                column(iPlacementP1; i) { }
                column(jPlacementP1; j) { }
                column(BoatColorAPlacementP1; BoatColorA) { }
                column(BoatColorBPlacementP1; BoatColorB) { }
                column(BoatColorCPlacementP1; BoatColorC) { }
                column(BoatColorDPlacementP1; BoatColorD) { }
                column(BoatColorEPlacementP1; BoatColorE) { }
                column(BoatColorFPlacementP1; BoatColorF) { }
                column(BoatColorGPlacementP1; BoatColorG) { }
                column(BoatColorHPlacementP1; BoatColorH) { }
                column(BoatColorIPlacementP1; BoatColorI) { }
                column(BoatColorJPlacementP1; BoatColorJ) { }

                trigger OnPreDataItem()
                begin
                    BattleGridP1.SetRange(Number, 1, TempGridGameP1_g.Count());
                end;

                trigger OnAfterGetRecord()
                begin
                    TempGridGameP1_g.Get('', '', BattleGridP1.Number, 0);
                    GridMgt_g.AssignValuesToColumn(BattleShipGame."No.", BattleShipGame."Player 2", Number, a, b, c, d, e, f, g, h, i, j, BoatColorA, BoatColorB, BoatColorC, BoatColorD, BoatColorE, BoatColorF, BoatColorG, BoatColorH, BoatColorI, BoatColorJ);
                end;
            }
            dataitem(BattleGridP2; Integer)
            {
                column(LineP2; BattleGridP2.Number) { }
                column(aPlacementP2; a) { }
                column(bPlacementP2; b) { }
                column(cPlacementP2; c) { }
                column(dPlacementP2; d) { }
                column(ePlacementP2; e) { }
                column(fPlacementP2; f) { }
                column(gPlacementP2; g) { }
                column(hPlacementP2; h) { }
                column(iPlacementP2; i) { }
                column(jPlacementP2; j) { }
                column(BoatColorAPlacementP2; BoatColorA) { }
                column(BoatColorBPlacementP2; BoatColorB) { }
                column(BoatColorCPlacementP2; BoatColorC) { }
                column(BoatColorDPlacementP2; BoatColorD) { }
                column(BoatColorEPlacementP2; BoatColorE) { }
                column(BoatColorFPlacementP2; BoatColorF) { }
                column(BoatColorGPlacementP2; BoatColorG) { }
                column(BoatColorHPlacementP2; BoatColorH) { }
                column(BoatColorIPlacementP2; BoatColorI) { }
                column(BoatColorJPlacementP2; BoatColorJ) { }

                trigger OnPreDataItem()
                begin
                    BattleGridP2.SetRange(Number, 1, TempGridGameP2_g.Count());
                end;

                trigger OnAfterGetRecord()
                begin
                    TempGridGameP2_g.Get('', '', BattleGridP2.Number, 0);
                    GridMgt_g.AssignValuesToColumn(BattleShipGame."No.", BattleShipGame."Player 1", Number, a, b, c, d, e, f, g, h, i, j, BoatColorA, BoatColorB, BoatColorC, BoatColorD, BoatColorE, BoatColorF, BoatColorG, BoatColorH, BoatColorI, BoatColorJ);
                end;
            }
            trigger OnAfterGetRecord()
            begin
                TempGridGameP2_g.CreateGrid();
                TempGridGameP1_g.CreateGrid();
            end;

            trigger OnPreDataItem()
            begin
                SetRange("No.", 'AZ00194');
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName) { }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    var
        TempGridGameP1_g: record "BattleShip Grid" temporary;
        TempGridGameP2_g: record "BattleShip Grid" temporary;
        GridMgt_g: CodeUnit CreateGrid;
        a: code[1];
        b: code[1];
        c: code[1];
        d: code[1];
        e: code[1];
        f: code[1];
        g: code[1];
        h: code[1];
        i: code[1];
        j: code[1];
        BoatColorA: Text[15];
        BoatColorB: Text[15];
        BoatColorC: Text[15];
        BoatColorD: Text[15];
        BoatColorE: Text[15];
        BoatColorF: Text[15];
        BoatColorG: Text[15];
        BoatColorH: Text[15];
        BoatColorI: Text[15];
        BoatColorJ: Text[15];
}

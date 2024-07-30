report 50100 "Resume Print BattleShip Game"
{
    ApplicationArea = All;
    Caption = 'Resume Print BattleShip Game';
    UsageCategory = Documents;
    RDLCLayout = 'src/RDLC/PrintResumeBattleShipGame.rdlc';
    UseRequestPage = false;
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
            column(Loser; Loser)
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
            column(PostingDate; format("Posting Date", 0, '<Day,2>/<Month,2>/<Year4>'))
            {
            }
            column(Winner; Winner)
            {
            }
            dataitem(BattleGridPlacementP1; Integer)
            {
                DataItemTableView = sorting(Number);
                column(LinePlacementP1; BattleGridPlacementP1.Number) { }
                column(aPlacementP1; a1) { }
                column(bPlacementP1; b1) { }
                column(cPlacementP1; c1) { }
                column(dPlacementP1; d1) { }
                column(ePlacementP1; e1) { }
                column(fPlacementP1; f1) { }
                column(gPlacementP1; g1) { }
                column(hPlacementP1; h1) { }
                column(iPlacementP1; i1) { }
                column(jPlacementP1; j1) { }
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
                    BattleGridPlacementP1.SetRange(Number, 1, TempGridPlacementP1_g.Count());
                end;

                trigger OnAfterGetRecord()
                begin
                    TempGridPlacementP1_g.Get('', '', BattleGridPlacementP1.Number, 0);
                    CreationGridMgt_g.PlacementGridAssignValuesToColumn(BattleShipGame."No.", BattleShipGame."Player 1", Number, a1, b1, c1, d1, e1, f1, g1, h1, i1, j1, BoatColorA, BoatColorB, BoatColorC, BoatColorD, BoatColorE, BoatColorF, BoatColorG, BoatColorH, BoatColorI, BoatColorJ);
                end;
            }
            dataitem(BattleGridPlacementP2; Integer)
            {
                DataItemTableView = sorting(Number);
                column(LinePlacementP2; BattleGridPlacementP2.Number) { }
                column(aPlacementP2; a1) { }
                column(bPlacementP2; b1) { }
                column(cPlacementP2; c1) { }
                column(dPlacementP2; d1) { }
                column(ePlacementP2; e1) { }
                column(fPlacementP2; f1) { }
                column(gPlacementP2; g1) { }
                column(hPlacementP2; h1) { }
                column(iPlacementP2; i1) { }
                column(jPlacementP2; j1) { }
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
                    BattleGridPlacementP2.SetRange(Number, 1, TempGridPlacementP2_g.Count());
                end;

                trigger OnAfterGetRecord()
                begin
                    TempGridPlacementP2_g.Get('', '', BattleGridPlacementP2.Number, 0);
                    CreationGridMgt_g.PlacementGridAssignValuesToColumn(BattleShipGame."No.", BattleShipGame."Player 2", Number, a1, b1, c1, d1, e1, f1, g1, h1, i1, j1, BoatColorA, BoatColorB, BoatColorC, BoatColorD, BoatColorE, BoatColorF, BoatColorG, BoatColorH, BoatColorI, BoatColorJ);
                end;
            }
            dataitem(BattleGridGameP1; Integer)
            {
                DataItemTableView = sorting(Number);
                column(LineGameP1; BattleGridGameP1.Number) { }
                column(aGameP1; a2) { }
                column(bGameP1; b2) { }
                column(cGameP1; c2) { }
                column(dGameP1; d2) { }
                column(eGameP1; e2) { }
                column(fGameP1; f2) { }
                column(gGameP1; g2) { }
                column(hGameP1; h2) { }
                column(iGameP1; i2) { }
                column(jGameP1; j2) { }
                column(BoatColorAGameP1; BoatColorA) { }
                column(BoatColorBGameP1; BoatColorB) { }
                column(BoatColorCGameP1; BoatColorC) { }
                column(BoatColorDGameP1; BoatColorD) { }
                column(BoatColorEGameP1; BoatColorE) { }
                column(BoatColorFGameP1; BoatColorF) { }
                column(BoatColorGGameP1; BoatColorG) { }
                column(BoatColorHGameP1; BoatColorH) { }
                column(BoatColorIGameP1; BoatColorI) { }
                column(BoatColorJGameP1; BoatColorJ) { }

                trigger OnPreDataItem()
                begin
                    BattleGridGameP1.SetRange(Number, 1, TempGridGameP1_g.Count());
                end;

                trigger OnAfterGetRecord()
                begin
                    TempGridGameP1_g.Get('', '', BattleGridGameP1.Number, 0);
                    CreationGridMgt_g.GameGridAssignValuesToColumn(BattleShipGame."No.", BattleShipGame."Player 2", Number, a2, b2, c2, d2, e2, f2, g2, h2, i2, j2, BoatColorA, BoatColorB, BoatColorC, BoatColorD, BoatColorE, BoatColorF, BoatColorG, BoatColorH, BoatColorI, BoatColorJ);
                end;
            }
            dataitem(BattleGridGameP2; Integer)
            {
                DataItemTableView = sorting(Number);
                column(LineGameP2; BattleGridGameP2.Number) { }
                column(aGameP2; a2) { }
                column(bGameP2; b2) { }
                column(cGameP2; c2) { }
                column(dGameP2; d2) { }
                column(eGameP2; e2) { }
                column(fGameP2; f2) { }
                column(gGameP2; g2) { }
                column(hGameP2; h2) { }
                column(iGameP2; i2) { }
                column(jGameP2; j2) { }
                column(BoatColorAGameP2; BoatColorA) { }
                column(BoatColorBGameP2; BoatColorB) { }
                column(BoatColorCGameP2; BoatColorC) { }
                column(BoatColorDGameP2; BoatColorD) { }
                column(BoatColorEGameP2; BoatColorE) { }
                column(BoatColorFGameP2; BoatColorF) { }
                column(BoatColorGGameP2; BoatColorG) { }
                column(BoatColorHGameP2; BoatColorH) { }
                column(BoatColorIGameP2; BoatColorI) { }
                column(BoatColorJGameP2; BoatColorJ) { }

                trigger OnPreDataItem()
                begin
                    BattleGridGameP2.SetRange(Number, 1, TempGridGameP2_g.Count());
                end;

                trigger OnAfterGetRecord()
                begin
                    TempGridGameP2_g.Get('', '', BattleGridGameP2.Number, 0);
                    CreationGridMgt_g.GameGridAssignValuesToColumn(BattleShipGame."No.", BattleShipGame."Player 1", Number, a2, b2, c2, d2, e2, f2, g2, h2, i2, j2, BoatColorA, BoatColorB, BoatColorC, BoatColorD, BoatColorE, BoatColorF, BoatColorG, BoatColorH, BoatColorI, BoatColorJ);
                end;
            }
            trigger OnAfterGetRecord()
            var
                CreationGridMgt: CodeUnit "Creation Grid Mgt";
            begin
                CreationGridMgt.CreateGrid(TempGridPlacementP2_g);
                CreationGridMgt.CreateGrid(TempGridPlacementP1_g);
                CreationGridMgt.CreateGrid(TempGridGameP2_g);
                CreationGridMgt.CreateGrid(TempGridGameP1_g);
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
        TempGridPlacementP1_g: record "BattleShip Grid" temporary;
        TempGridPlacementP2_g: record "BattleShip Grid" temporary;
        TempGridGameP1_g: record "BattleShip Grid" temporary;
        TempGridGameP2_g: record "BattleShip Grid" temporary;
        CreationGridMgt_g: CodeUnit "Creation Grid Mgt";
        a1: enum "Boat Type";
        b1: enum "Boat Type";
        c1: enum "Boat Type";
        d1: enum "Boat Type";
        e1: enum "Boat Type";
        f1: enum "Boat Type";
        g1: enum "Boat Type";
        h1: enum "Boat Type";
        i1: enum "Boat Type";
        j1: enum "Boat Type";
        a2: code[1];
        b2: code[1];
        c2: code[1];
        d2: code[1];
        e2: code[1];
        f2: code[1];
        g2: code[1];
        h2: code[1];
        i2: code[1];
        j2: code[1];
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

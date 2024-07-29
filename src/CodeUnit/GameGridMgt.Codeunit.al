codeunit 50104 "Game Grid Mgt"
{
    procedure HitOrMiss(var RecGame_g: Record "BattleShip Game"; Player_g: Text[50]; Opponent_g: Text[50]; Line_p: Integer; Column_p: Integer; var a: Code[1]; var b: Code[1]; var c: Code[1]; var d: Code[1]; var e: Code[1]; var f: Code[1]; var g: Code[1]; var h: Code[1]; var i: Code[1]; var j: Code[1]; var BoatColorA: Text[15]; var BoatColorB: Text[15]; var BoatColorC: Text[15]; var BoatColorD: Text[15]; var BoatColorE: Text[15]; var BoatColorF: Text[15]; var BoatColorG: Text[15]; var BoatColorH: Text[15]; var BoatColorI: Text[15]; var BoatColorJ: Text[15])
    var
        RecHitOrMiss_l: Record "BattleShip Grid";
        GridMgt: CodeUnit "Creation Grid Mgt";
        BoatStatut_l: Code[1];
        RecBoatType_l: Enum "Boat Type";
        BoatColor_l: Text[15];
    begin
        // If the Boat Exist
        if RecHitOrMiss_l.Get(RecGame_g."No.", Opponent_g, Line_p, Column_p) and (RecHitOrMiss_l.BoatType <> "Boat Type"::" ") then begin
            if not (RecHitOrMiss_l.BoatStatut in ["Boat Statut"::Hit, "Boat Statut"::Sinking]) then begin
                SetBoatHit(RecHitOrMiss_l, BoatStatut_l, RecBoatType_l, BoatColor_l);
                TestBoatSinking(RecGame_g, Player_g, Opponent_g, RecHitOrMiss_l, RecBoatType_l, BoatColor_l);
            end;
        end
        else begin
            BoatStatut_l := 'O';
            BoatColor_l := 'Subordinate';
            //Boat needs to be created to be set to miss and be seen in the game grid.
            GridMgt.InsertBoat(RecGame_g."No.", Opponent_g, Line_p, Column_p, "Boat Type"::" ", "Boat Statut"::Miss);
        end;

        GridMgt.GameGridAssignValuesToColumn(RecGame_g."No.", Opponent_g, Line_p, a, b, c, d, e, f, g, h, i, j, BoatColorA, BoatColorB, BoatColorC, BoatColorD, BoatColorE, BoatColorF, BoatColorG, BoatColorH, BoatColorI, BoatColorJ);
        ChangePlayerTurn(RecGame_g, Player_g, Opponent_g);
    end;

    procedure SetBoatHit(var RecHitOrMiss_p: Record "BattleShip Grid"; var CodeHitOrMiss_p: Code[1]; var RecBoatType_p: Enum "Boat Type"; var BoatColor_p: Text[15])
    begin
        CodeHitOrMiss_p := 'X';
        RecHitOrMiss_p.BoatStatut := "Boat Statut"::Hit;
        BoatColor_p := 'Attention';
        RecHitOrMiss_p.Modify();
        RecBoatType_p := RecHitOrMiss_p.BoatType;
    end;

    procedure TestBoatSinking(var RecGame_g: record "BattleShip Game"; Player_g: Text[50]; Opponent_g: Text[50]; var RecHitOrMiss: Record "BattleShip Grid"; var RecBoatType: Enum "Boat Type"; var BoatColor: Text[15])
    var
        BoatSize: Integer;
        BoatHit: Integer;
        NumberOfBoatSinking: Integer;
    begin
        //Test if all the Boat with the same Boat Type is Hit
        RecHitOrMiss.Reset();
        RecHitOrMiss.SetRange("No.Game", RecGame_g."No.");
        RecHitOrMiss.SetRange("No.Player", Opponent_g);
        RecHitOrMiss.SetRange(BoatType, RecBoatType);
        BoatSize := RecHitOrMiss.Count();
        RecHitOrMiss.SetRange(BoatStatut, "Boat Statut"::Hit);
        BoatHit := RecHitOrMiss.Count();

        if (BoatSize = BoatHit) then begin
            if (RecHitOrMiss.FindSet()) then
                repeat
                    RecHitOrMiss.BoatStatut := "Boat Statut"::Sinking;
                    BoatColor := 'Strong';
                    RecHitOrMiss.Modify();
                until (RecHitOrMiss.Next() = 0);
            //Test if all the boat is Sinking to set the Game Statut to Finish
            RecHitOrMiss.Reset();
            RecHitOrMiss.SetRange("No.Game", RecGame_g."No.");
            RecHitOrMiss.SetRange("No.Player", Opponent_g);
            RecHitOrMiss.SetRange(BoatStatut, "Boat Statut"::Sinking);
            NumberOfBoatSinking := RecHitOrMiss.Count();
            if (NumberOfBoatSinking >= 17) then begin
                RecGame_g."Game Statut" := "Game Statut"::Finish;
                RecGame_g.Winner := Player_g;
                RecGame_g.Looser := Opponent_g;
                RecGame_g.Modify();
            end
        end;
    end;

    procedure ChangePlayerTurn(var RecGame_g: record "BattleShip Game"; Player_g: Text[50]; Opponent_g: Text[50])
    begin
        if (RecGame_g."Player Turn" = Player_g) then
            RecGame_g."Player Turn" := Opponent_g
        else
            RecGame_g."Player Turn" := Player_g;
        RecGame_g.Modify();
    end;
}

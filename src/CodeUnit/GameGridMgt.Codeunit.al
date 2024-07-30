codeunit 50104 "Game Grid Mgt"
{
    /// <summary>
    /// Test if the target is Hit, Miss or Sinking
    /// </summary>
    /// <param name="RecGame_g">A Record of the Current Game</param>
    /// <param name="Player_g">The user who targeting</param>
    /// <param name="Opponent_g">The user who is targeted</param>
    /// <param name="Line_p">The Line of the target</param>
    /// <param name="Column_p">The Column of the target</param>
    /// <param name="a">The value of the a column</param>
    /// <param name="b">The value of the b column</param>
    /// <param name="c">The value of the c column</param>
    /// <param name="d">The value of the d column</param>
    /// <param name="e">The value of the e column</param>
    /// <param name="f">The value of the f column</param>
    /// <param name="g">The value of the g column</param>
    /// <param name="h">The value of the h column</param>
    /// <param name="i">The value of the i column</param>
    /// <param name="j">The value of the j column</param>
    /// <param name="BoatColorA>The color of the a column</param>
    /// <param name="BoatColorB">The colors of the a column</param>
    /// <param name="BoatColorC">The colors of the a column</param>
    /// <param name="BoatColorD">The colors of the a column</param>
    /// <param name="BoatColorE">The colors of the a column</param>
    /// <param name="BoatColorF">The colors of the a column</param>
    /// <param name="BoatColorG">The colors of the a column</param>
    /// <param name="BoatColorH">The colors of the a column</param>
    /// <param name="BoatColorI">The colors of the a column</param>
    /// <param name="BoatColorJ">The colors of the a column</param>
    /// <returns>No Return</returns>
    procedure HitOrMiss(var RecGame_g: Record "BattleShip Game"; Player_g: Text[50]; Opponent_g: Text[50]; Line_p: Integer; Column_p: Integer; var a: Code[1]; var b: Code[1]; var c: Code[1]; var d: Code[1]; var e: Code[1]; var f: Code[1]; var g: Code[1]; var h: Code[1]; var i: Code[1]; var j: Code[1]; var BoatColorA: Text[15]; var BoatColorB: Text[15]; var BoatColorC: Text[15]; var BoatColorD: Text[15]; var BoatColorE: Text[15]; var BoatColorF: Text[15]; var BoatColorG: Text[15]; var BoatColorH: Text[15]; var BoatColorI: Text[15]; var BoatColorJ: Text[15])
    var
        RecHitOrMiss_l: Record "BattleShip Grid";
        CreationGridMgt: CodeUnit "Creation Grid Mgt";
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
            CreationGridMgt.InsertBoat(RecGame_g."No.", Opponent_g, Line_p, Column_p, "Boat Type"::" ", "Boat Statut"::Miss);
        end;

        CreationGridMgt.GameGridAssignValuesToColumn(RecGame_g."No.", Opponent_g, Line_p, a, b, c, d, e, f, g, h, i, j, BoatColorA, BoatColorB, BoatColorC, BoatColorD, BoatColorE, BoatColorF, BoatColorG, BoatColorH, BoatColorI, BoatColorJ);
        ChangePlayerTurn(RecGame_g, Player_g, Opponent_g);
    end;

    /// <summary>
    /// Set the statut of a boat Hitted
    /// </summary>
    /// <param name="RecHitOrMiss_p">A Record of the current grid</param>
    /// <param name="CodeHitOrMiss_p">The code who need to be set to Hit ('X')</param>
    /// <param name="RecBoatType_p">The Type of the Boat hitted</param>
    /// <param name="BoatColor_p">The colors of the Boat hitted</param>
    /// <returns>No Return</returns>
    procedure SetBoatHit(var RecHitOrMiss_p: Record "BattleShip Grid"; var CodeHitOrMiss_p: Code[1]; var RecBoatType_p: Enum "Boat Type"; var BoatColor_p: Text[15])
    begin
        CodeHitOrMiss_p := 'X';
        RecHitOrMiss_p.BoatStatut := "Boat Statut"::Hit;
        BoatColor_p := 'Attention';
        RecHitOrMiss_p.Modify();
        RecBoatType_p := RecHitOrMiss_p.BoatType;
    end;

    /// <summary>
    /// Test if the Boat is sinking or just hit and set the Boat statut on sinking if he was
    /// </summary>
    /// <param name="RecGame_g">The record of the current game</param>
    /// <param name="Player_g">The user who want to hit the boat</param>
    /// <param name="Opponent_g">The user who is attacked</param>
    /// <param name="RecHitOrMiss">Record of the Grid attacked</param>
    /// <param name="RecBoatType">Type of the boat we wanted to saw if he is siking</param>
    /// <param name="BoatColor">The color of the boat we wanted to saw if he is siking</param>
    /// <returns>No Return</returns>
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
                RecGame_g.Loser := Opponent_g;
                RecGame_g.Modify();
            end
        end;
    end;
    /// <summary>
    /// Change the player turn
    /// </summary>
    /// <param name="RecGame_g">The record of the current game</param>
    /// <param name="Player_g">A User Id of player</param>
    /// <param name="Opponent_g">A User Id of the Opponent of the Player</param>
    /// <returns>No Return</returns>
    procedure ChangePlayerTurn(var RecGame_g: record "BattleShip Game"; Player_g: Text[50]; Opponent_g: Text[50])
    begin
        if (RecGame_g."Player Turn" = Player_g) then
            RecGame_g."Player Turn" := Opponent_g
        else
            RecGame_g."Player Turn" := Player_g;
        RecGame_g.Modify();
    end;
}

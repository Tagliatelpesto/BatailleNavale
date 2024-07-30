codeunit 50102 "Creation Grid Mgt"
{
    /// <summary>
    /// Create the 10 Lines of a BattleShip Grid
    /// </summary>
    /// <param name="BattleShipGridRecord">Record of a BattleShip Grid</param>
    /// <returns>No Return</returns>
    procedure CreateGrid(var BattleShipGridRecord: Record "BattleShip Grid")
    var
        k: Integer;
    begin
        if not BattleShipGridRecord.IsTemporary() then
            Error('%1 must be temporary', BattleShipGridRecord.TableCaption);
        BattleShipGridRecord.Reset();
        BattleShipGridRecord.DeleteAll();
        for k := 1 to 10 do begin
            BattleShipGridRecord.Init();
            BattleShipGridRecord.Line := k;
            BattleShipGridRecord.Insert();
        end;
    end;
    /// <summary>
    /// Insert a New Boat for a certains BattleShip Game
    /// </summary>
    /// <param name="NoGame_p">Code of the Game where the Boat need to be created</param>
    /// <param name="Player_p">The player who want to created the boat</param>
    /// <param name="Line_p">Line of the Created Boat</param>
    /// <param name="Column_p">Column of the Created Boat</param>
    /// <param name="BoatType_p">Type of the Created Boat</param>
    /// <param name="BoatStatut_p">Statut of the Created Boat</param>
    /// <returns>No Return</returns>
    procedure InsertBoat(NoGame_p: Code[20]; Player_p: Text[50]; Line_p: Integer; Column_p: Integer; BoatType_p: Enum "Boat Type"; BoatStatut_p: Enum "Boat Statut")
    var
        NewBoat: Record "BattleShip Grid";
    begin
        if not (NewBoat.Get(NoGame_p, Player_p, Line_p, Column_p)) then begin
            NewBoat.Init();
            NewBoat.BoatType := BoatType_p;
            NewBoat.Column := Column_p;
            NewBoat.Line := Line_p;
            NewBoat."No.Game" := NoGame_p;
            NewBoat."No.Player" := Player_p;
            NewBoat.BoatStatut := BoatStatut_p;
            NewBoat.Insert();
        end
    end;
    /// <summary>
    /// Assign the values and the colors to the column of the Game Grid
    /// </summary>
    /// <param name="No">The number of the Current Game</param>
    /// <param name="Opponent_g">The current Opponent of the Player</param>
    /// <param name="Player_p">The current Player</param>
    /// <param name="Line">The Line where the value need to be assign</param>
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
    internal procedure GameGridAssignValuesToColumn(No: Code[20]; Opponent_g: Text[50]; Line: Integer; var a: Code[1]; var b: Code[1]; var c: Code[1]; var d: Code[1]; var e: Code[1]; var f: Code[1]; var g: Code[1]; var h: Code[1]; var i: Code[1]; var j: Code[1]; var BoatColorA: Text[15]; var BoatColorB: Text[15]; var BoatColorC: Text[15]; var BoatColorD: Text[15]; var BoatColorE: Text[15]; var BoatColorF: Text[15]; var BoatColorG: Text[15]; var BoatColorH: Text[15]; var BoatColorI: Text[15]; var BoatColorJ: Text[15])
    var
        BattleGrid_l: Record "BattleShip Grid";
        Column_l: Integer;
        BoatStatut_l: Code[1];
        BoatColor_l: Text[15];
    begin
        a := '';
        b := '';
        c := '';
        d := '';
        e := '';
        f := '';
        g := '';
        h := '';
        i := '';
        j := '';
        BoatColorA := '';
        BoatColorB := '';
        BoatColorC := '';
        BoatColorD := '';
        BoatColorE := '';
        BoatColorF := '';
        BoatColorG := '';
        BoatColorH := '';
        BoatColorI := '';
        BoatColorJ := '';

        for Column_l := 1 to 10 do
            if (BattleGrid_l.Get(No, Opponent_g, Line, Column_l)) then begin
                if (BattleGrid_l.BoatStatut = "Boat Statut"::" ") then begin
                    BoatStatut_l := '';
                    BoatColor_l := '';
                end;
                if (BattleGrid_l.BoatStatut = "Boat Statut"::Miss) then begin
                    BoatStatut_l := 'O';
                    BoatColor_l := 'Subordinate';
                end;
                if (BattleGrid_l.BoatStatut = "Boat Statut"::Hit) then begin
                    BoatStatut_l := 'X';
                    BoatColor_l := 'Attention';
                end;
                if (BattleGrid_l.BoatStatut = "Boat Statut"::Sinking) then begin
                    BoatStatut_l := 'X';
                    BoatColor_l := 'Strong';
                end;
                case Column_l of
                    1:
                        begin
                            a := BoatStatut_l;
                            BoatColorA := BoatColor_l;
                        end;
                    2:
                        begin
                            b := BoatStatut_l;
                            BoatColorB := BoatColor_l;
                        end;
                    3:
                        begin
                            c := BoatStatut_l;
                            BoatColorC := BoatColor_l;
                        end;
                    4:
                        begin
                            d := BoatStatut_l;
                            BoatColorD := BoatColor_l;
                        end;
                    5:
                        begin
                            e := BoatStatut_l;
                            BoatColorE := BoatColor_l;
                        end;
                    6:
                        begin
                            f := BoatStatut_l;
                            BoatColorF := BoatColor_l;
                        end;
                    7:
                        begin
                            g := BoatStatut_l;
                            BoatColorG := BoatColor_l;
                        end;
                    8:
                        begin
                            h := BoatStatut_l;
                            BoatColorH := BoatColor_l;
                        end;
                    9:
                        begin
                            i := BoatStatut_l;
                            BoatColorI := BoatColor_l;
                        end;
                    10:
                        begin
                            j := BoatStatut_l;
                            BoatColorJ := BoatColor_l;
                        end;
                end;
            end;
    end;
    /// <summary>
    /// Assign the values and the colors to the column of the Placement Grid
    /// </summary>
    /// <param name="No">The number of the Current Game</param>
    /// <param name="Opponent_g">The current Opponent of the Player</param>
    /// <param name="Player_p">The current Player</param>
    /// <param name="Line">The Line where the value need to be assign</param>
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
    internal procedure PlacementGridAssignValuesToColumn(No: Code[20]; Player_g: Text[50]; Line: Integer; var a: Enum "Boat Type"; var b: Enum "Boat Type"; var c: Enum "Boat Type"; var d: Enum "Boat Type"; var e: Enum "Boat Type"; var f: Enum "Boat Type"; var g: Enum "Boat Type"; var h: Enum "Boat Type"; var i: Enum "Boat Type"; var j: Enum "Boat Type"; var BoatColorA: Text[15]; var BoatColorB: Text[15]; var BoatColorC: Text[15]; var BoatColorD: Text[15]; var BoatColorE: Text[15]; var BoatColorF: Text[15]; var BoatColorG: Text[15]; var BoatColorH: Text[15]; var BoatColorI: Text[15]; var BoatColorJ: Text[15])
    var
        BattleGrid_l: Record "BattleShip Grid";
        k: Integer;
        BoatColor_l: Text[15];
    begin
        a := "Boat Type"::" ";
        b := "Boat Type"::" ";
        c := "Boat Type"::" ";
        d := "Boat Type"::" ";
        e := "Boat Type"::" ";
        f := "Boat Type"::" ";
        g := "Boat Type"::" ";
        h := "Boat Type"::" ";
        i := "Boat Type"::" ";
        j := "Boat Type"::" ";
        BoatColorA := '';
        BoatColorB := '';
        BoatColorC := '';
        BoatColorD := '';
        BoatColorE := '';
        BoatColorF := '';
        BoatColorG := '';
        BoatColorH := '';
        BoatColorI := '';
        BoatColorJ := '';

        for k := 1 to 10 do
            if BattleGrid_l.Get(No, Player_g, Line, k) then begin
                if (BattleGrid_l.BoatStatut = "Boat Statut"::" ") then
                    BoatColor_l := '';

                if (BattleGrid_l.BoatStatut = "Boat Statut"::Miss) then
                    BoatColor_l := 'Subordinate';

                if (BattleGrid_l.BoatStatut = "Boat Statut"::Hit) then
                    BoatColor_l := 'Attention';

                if (BattleGrid_l.BoatStatut = "Boat Statut"::Sinking) then
                    BoatColor_l := 'Strong';
                case k of
                    1:
                        begin
                            a := BattleGrid_l.BoatType;
                            BoatColorA := BoatColor_l;
                        end;
                    2:
                        begin
                            b := BattleGrid_l.BoatType;
                            BoatColorB := BoatColor_l;
                        end;
                    3:
                        begin
                            c := BattleGrid_l.BoatType;
                            BoatColorC := BoatColor_l;
                        end;
                    4:
                        begin
                            d := BattleGrid_l.BoatType;
                            BoatColorD := BoatColor_l;
                        end;
                    5:
                        begin
                            e := BattleGrid_l.BoatType;
                            BoatColorE := BoatColor_l;
                        end;
                    6:
                        begin
                            f := BattleGrid_l.BoatType;
                            BoatColorF := BoatColor_l;
                        end;
                    7:
                        begin
                            g := BattleGrid_l.BoatType;
                            BoatColorG := BoatColor_l;
                        end;
                    8:
                        begin
                            h := BattleGrid_l.BoatType;
                            BoatColorH := BoatColor_l;
                        end;
                    9:
                        begin
                            i := BattleGrid_l.BoatType;
                            BoatColorI := BoatColor_l;
                        end;
                    10:
                        begin
                            j := BattleGrid_l.BoatType;
                            BoatColorJ := BoatColor_l;
                        end;
                end;
            end;
    end;


}

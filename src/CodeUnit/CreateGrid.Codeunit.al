codeunit 50102 CreateGrid
{
    trigger OnRun()
    begin

    end;



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
                if (BattleGrid_l."Boat Statut" = "Boat Statut"::" ") then begin
                    BoatStatut_l := '';
                    BoatColor_l := '';
                end;
                if (BattleGrid_l."Boat Statut" = "Boat Statut"::Miss) then begin
                    BoatStatut_l := 'O';
                    BoatColor_l := 'Subordinate';
                end;
                if (BattleGrid_l."Boat Statut" = "Boat Statut"::Hit) then begin
                    BoatStatut_l := 'X';
                    BoatColor_l := 'Attention';
                end;
                if (BattleGrid_l."Boat Statut" = "Boat Statut"::Sinking) then begin
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
                if (BattleGrid_l."Boat Statut" = "Boat Statut"::" ") then
                    BoatColor_l := '';

                if (BattleGrid_l."Boat Statut" = "Boat Statut"::Miss) then
                    BoatColor_l := 'Subordinate';

                if (BattleGrid_l."Boat Statut" = "Boat Statut"::Hit) then
                    BoatColor_l := 'Attention';

                if (BattleGrid_l."Boat Statut" = "Boat Statut"::Sinking) then
                    BoatColor_l := 'Strong';
                case k of
                    1:
                        begin
                            a := BattleGrid_l."Boat Type";
                            BoatColorA := BoatColor_l;
                        end;
                    2:
                        begin
                            b := BattleGrid_l."Boat Type";
                            BoatColorB := BoatColor_l;
                        end;
                    3:
                        begin
                            c := BattleGrid_l."Boat Type";
                            BoatColorC := BoatColor_l;
                        end;
                    4:
                        begin
                            d := BattleGrid_l."Boat Type";
                            BoatColorD := BoatColor_l;
                        end;
                    5:
                        begin
                            e := BattleGrid_l."Boat Type";
                            BoatColorE := BoatColor_l;
                        end;
                    6:
                        begin
                            f := BattleGrid_l."Boat Type";
                            BoatColorF := BoatColor_l;
                        end;
                    7:
                        begin
                            g := BattleGrid_l."Boat Type";
                            BoatColorG := BoatColor_l;
                        end;
                    8:
                        begin
                            h := BattleGrid_l."Boat Type";
                            BoatColorH := BoatColor_l;
                        end;
                    9:
                        begin
                            i := BattleGrid_l."Boat Type";
                            BoatColorI := BoatColor_l;
                        end;
                    10:
                        begin
                            j := BattleGrid_l."Boat Type";
                            BoatColorJ := BoatColor_l;
                        end;
                end;
            end;
    end;
}

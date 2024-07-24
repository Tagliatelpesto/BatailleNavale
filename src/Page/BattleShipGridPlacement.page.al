page 50105 "BattleShip Grid Placement"
{
    ApplicationArea = All;
    Caption = 'BattleShip Grid';
    PageType = ListPart;
    SourceTable = "BattleShip Grid";
    SourceTableTemporary = true;
    DeleteAllowed = false;
    InsertAllowed = false;
    MultipleNewLines = false;
    ShowFilter = false;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Line"; Rec."Line")
                {
                    ShowCaption = false;
                    Width = 5;
                    Caption = 'Line';
                    ToolTip = 'X Coordinate';
                    Editable = false;
                }
                field(a; a)
                {
                    Width = 5;
                    Caption = 'A';
                    StyleExpr = BoatColorA;
                    ToolTip = 'X Coordinate';
                    trigger OnValidate()
                    begin
                        OnValidateChoice(Rec.Line, 1, a);
                    end;
                }
                field(b; b)
                {
                    Width = 5;
                    Caption = 'B';
                    StyleExpr = BoatColorB;
                    ToolTip = 'X Coordinate';
                    trigger OnValidate()
                    begin
                        OnValidateChoice(Rec.Line, 2, b);
                    end;

                }
                field(c; c)
                {
                    Width = 5;
                    Caption = 'C';
                    StyleExpr = BoatColorC;
                    ToolTip = 'X Coordinate';
                    trigger OnValidate()
                    begin
                        OnValidateChoice(Rec.Line, 3, c);
                    end;
                }
                field(d; d)
                {
                    Width = 5;
                    Caption = 'D';
                    StyleExpr = BoatColorD;
                    ToolTip = 'X Coordinate';
                    trigger OnValidate()
                    begin
                        OnValidateChoice(Rec.Line, 4, d);
                    end;
                }
                field(e; e)
                {
                    Width = 5;
                    Caption = 'E';
                    StyleExpr = BoatColorE;
                    ToolTip = 'X Coordinate';
                    trigger OnValidate()
                    begin
                        OnValidateChoice(Rec.Line, 5, e);
                    end;
                }
                field(f; f)
                {
                    Width = 5;
                    Caption = 'F';
                    StyleExpr = BoatColorF;
                    ToolTip = 'X Coordinate';
                    trigger OnValidate()
                    begin
                        OnValidateChoice(Rec.Line, 6, f);
                    end;
                }
                field(g; g)
                {
                    Width = 5;
                    Caption = 'G';
                    StyleExpr = BoatColorG;
                    ToolTip = 'X Coordinate';
                    trigger OnValidate()
                    begin
                        OnValidateChoice(Rec.Line, 7, g);
                    end;
                }
                field(h; h)
                {
                    Width = 5;
                    Caption = 'H';
                    StyleExpr = BoatColorH;
                    ToolTip = 'X Coordinate';
                    trigger OnValidate()
                    begin
                        OnValidateChoice(Rec.Line, 8, h);
                    end;
                }
                field(i; i)
                {
                    Width = 5;
                    Caption = 'I';
                    StyleExpr = BoatColorI;
                    ToolTip = 'X Coordinate';
                    trigger OnValidate()
                    begin
                        OnValidateChoice(Rec.Line, 9, i);
                    end;
                }
                field(j; j)
                {
                    Width = 5;
                    Caption = 'J';
                    StyleExpr = BoatColorJ;
                    ToolTip = 'X Coordinate';
                    trigger OnValidate()
                    begin
                        OnValidateChoice(Rec.Line, 10, j);
                    end;
                }

            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        RecGame_g.CalcFields("Number Boat Placed");
    end;

    trigger OnAfterGetRecord()
    begin
        // SetGrid();
        CreateGridMgt.PlacementGridAssignValuesToColumn(RecGame_g."No.", Player_g, Rec.Line, a, b, c, d, e, f, g, h, i, j, BoatColorA, BoatColorB, BoatColorC, BoatColorD, BoatColorE, BoatColorF, BoatColorG, BoatColorH, BoatColorI, BoatColorJ);

    end;

    procedure SetGrid()
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

        for k := 1 to 10 do
            if BattleGrid_l.Get(RecGame_g."No.", Player_g, Rec.Line, k) then begin
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

    procedure CreateGrid(RecGame_p: Record "BattleShip Game"; Player_p: Text[50])
    begin
        RecGame_g := RecGame_p;
        Player_g := Player_p;
        Rec.CreateGrid();
        CurrPage.Update(false);
    end;

    procedure OnValidateChoice(Line_p: Integer; Column_p: Integer; BoatType_p: Enum "Boat Type")
    begin
        if (BoatType_p <> "Boat Type"::" ") then begin
            VerifBoat(Rec.Line, Column_p, BoatType_p);
            CreateOrModifyBoat(Rec.Line, Column_p, BoatType_p, "Boat Statut"::" ")
        end
        else
            DeleteBoat(Rec.Line, Column_p, BoatType_p);
        RecGame_g.CalcFields("Number Boat Placed");
        if (RecGame_g."Number Boat Placed" >= 34) then begin
            RecGame_g."Game Statut" := "Game Statut"::Game;
            RecGame_g.Modify();
        end


    end;

    procedure CreateOrModifyBoat(Line_p: Integer; Column_p: Integer; BoatType_p: Enum "Boat Type"; BoatStatut_p: Enum "Boat Statut")
    var
        BoatToModify_l: Record "BattleShip Grid";
    begin
        if (BoatToModify_l.Get(RecGame_g."No.", Player_g, Line_p, Column_p)) then begin
            BoatToModify_l."Boat Type" := BoatType_p;
            BoatToModify_l.Modify();
        end
        else
            Rec.InsertBoat(RecGame_g."No.", Player_g, Line_p, Column_p, BoatType_p, BoatStatut_p);
    end;

    procedure DeleteBoat(Line_p: Integer; Column_p: Integer; BoatType_p: Enum "Boat Type")
    var
        BoatToDelete_l: Record "BattleShip Grid";
        AroundRecIsFree_l: Record "BattleShip Grid";
        NumberOfSameBoatAround_l: Integer;
    begin
        AroundRecIsFree_l.SetRange("No. Game", RecGame_g."No.");
        AroundRecIsFree_l.SetRange("No. Player", Player_g);
        AroundRecIsFree_l.SetRange(Line, (Line_p - 1), (Line_p + 1));
        AroundRecIsFree_l.SetRange(Column, (Column_p - 1), (Column_p + 1));
        AroundRecIsFree_l.SetFilter("Boat Type", '<>%1', "Boat Type"::" ");
        NumberOfSameBoatAround_l := AroundRecIsFree_l.Count;
        if (NumberOfSameBoatAround_l > 2) then
            Error(DeleteErr);

        if (BoatToDelete_l.Get(RecGame_g."No.", Player_g, Line_p, Column_p)) then
            BoatToDelete_l.Delete();

    end;

    procedure VerifBoat(Line_p: Integer; Column_p: Integer; BoatType_p: Enum "Boat Type")
    var
        NewBoatToInsert: Record "BattleShip Grid";
        AroundRecIsFree_l: Record "BattleShip Grid";
        SameBoatPlacement_l: Record "BattleShip Grid";
        BoatSameLine_l: Boolean;
        BoatSameCol_l: Boolean;
        NumberOfSameBoat_l: Integer;
        SizeMaxOfBoatType_l: Integer;
        CaptionBoat_l: Text[50];
        NumberOfSameBoatAround_l: Integer;
    begin
        if NewBoatToInsert.Get(RecGame_g."No.", Player_g, Line_p, Column_p) then;

        AroundRecIsFree_l.SetRange("No. Game", RecGame_g."No.");
        AroundRecIsFree_l.SetRange("No. Player", Player_g);
        AroundRecIsFree_l.SetRange(Line, (Line_p - 1), (Line_p + 1));
        AroundRecIsFree_l.SetRange(Column, (Column_p - 1), (Column_p + 1));
        AroundRecIsFree_l.SetFilter("Boat Type", '<>%1&<>%2', "Boat Type"::" ", BoatType_p);

        // Test if there are no boats of a different type around the location
        if not (AroundRecIsFree_l.IsEmpty()) then
            if not ((NewBoatToInsert.Line = Line_p) and (NewBoatToInsert.Column = Column_p) and (NewBoatToInsert."Boat Type" <> BoatType_p)) then
                Error(PlacementErr);

        SameBoatPlacement_l.SetCurrentKey("No. Game", "No. Player", "Boat Type");
        SameBoatPlacement_l.SetRange("No. Game", RecGame_g."No.");
        SameBoatPlacement_l.SetRange("No. Player", Player_g);
        SameBoatPlacement_l.SetRange("Boat Type", BoatType_p);

        // Number of boats of the same type already placed
        NumberOfSameBoat_l := SameBoatPlacement_l.Count();

        // Get the maximum size of the boat record
        CaptionBoat_l := Format(BoatType_p, 0, '<Text>');
        SizeMaxOfBoatType_l := StrLen(CaptionBoat_l) - 7;
        CaptionBoat_l := CopyStr(CaptionBoat_l, SizeMaxOfBoatType_l, 1);
        Evaluate(SizeMaxOfBoatType_l, CaptionBoat_l);

        // If two same boats are around, then placement is on 2 axes, so error
        AroundRecIsFree_l.SetFilter("Boat Type", '<>%1', "Boat Type"::" ");
        NumberOfSameBoatAround_l := AroundRecIsFree_l.Count;

        if (NumberOfSameBoat_l >= SizeMaxOfBoatType_l) then
            Error(AllPlacedErr);

        if (NumberOfSameBoatAround_l > 1) and (NewBoatToInsert."Boat Type" <> BoatType_p) then
            Error(DoubleAxesErr);

        // Test placement on the rows
        AroundRecIsFree_l.SetRange(Line, (Line_p - 1), (Line_p + 1));
        AroundRecIsFree_l.SetRange(Column, Column_p);
        NumberOfSameBoatAround_l := AroundRecIsFree_l.Count;
        if (NumberOfSameBoat_l > 0) and (NumberOfSameBoatAround_l < 1) then
            BoatSameLine_l := true;

        // Test placement on the columns
        AroundRecIsFree_l.SetRange(Line, Line_p);
        AroundRecIsFree_l.SetRange(Column, (Column_p - 1), (Column_p + 1));
        NumberOfSameBoatAround_l := AroundRecIsFree_l.Count;
        if (NumberOfSameBoat_l > 0) and (NumberOfSameBoatAround_l < 1) then
            BoatSameCol_l := true;

        if (BoatSameCol_l) and (BoatSameLine_l) then
            Error(Placement2Err);

    end;

    var
        RecGame_g: Record "BattleShip Game";
        CreateGridMgt: CodeUnit "CreateGrid";
        Player_g: Text[50];
        a: enum "Boat Type";
        b: enum "Boat Type";
        c: enum "Boat Type";
        d: enum "Boat Type";
        e: enum "Boat Type";
        f: enum "Boat Type";
        g: enum "Boat Type";
        h: enum "Boat Type";
        i: enum "Boat Type";
        j: enum "Boat Type";
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
        DeleteErr: Label 'You can''t delete the boat by the center';
        PlacementErr: Label 'This placement is Impossible';
        AllPlacedErr: Label 'This Boat is completely placed';
        DoubleAxesErr: Label 'Placement on 2 axes impossible';
        Placement2Err: Label 'Placement need to be around the other same Boat Type';
}

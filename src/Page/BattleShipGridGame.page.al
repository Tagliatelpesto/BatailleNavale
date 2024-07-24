page 50104 "BattleShip Grid Game"
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
                    Width = 1;
                }
                field(a; a)
                {
                    Width = 1;
                    Caption = 'A';
                    ToolTip = 'X Coordinate';
                    Editable = false;
                    StyleExpr = BoatColorA;
                    trigger OnAssistEdit()
                    begin
                        OnValidateChoice(Rec.Line, 1);
                    end;
                }
                field(b; b)
                {
                    Width = 1;
                    Caption = 'B';
                    ToolTip = 'X Coordinate';
                    Editable = false;
                    StyleExpr = BoatColorB;
                    trigger OnAssistEdit()
                    begin
                        OnValidateChoice(Rec.Line, 2);
                    end;
                }
                field(c; c)
                {
                    Width = 1;
                    Caption = 'C';
                    ToolTip = 'X Coordinate';
                    Editable = false;
                    StyleExpr = BoatColorC;
                    trigger OnAssistEdit()
                    begin
                        OnValidateChoice(Rec.Line, 3);
                    end;
                }
                field(d; d)
                {
                    Width = 1;
                    Caption = 'D';
                    ToolTip = 'X Coordinate';
                    Editable = false;
                    StyleExpr = BoatColorD;
                    trigger OnAssistEdit()
                    begin
                        OnValidateChoice(Rec.Line, 4);
                    end;
                }
                field(e; e)
                {
                    Width = 1;
                    Caption = 'E';
                    ToolTip = 'X Coordinate';
                    Editable = false;
                    StyleExpr = BoatColorE;
                    trigger OnAssistEdit()
                    begin
                        OnValidateChoice(Rec.Line, 5);
                    end;
                }
                field(f; f)
                {
                    Width = 1;
                    Caption = 'F';
                    ToolTip = 'X Coordinate';
                    Editable = false;
                    StyleExpr = BoatColorF;
                    trigger OnAssistEdit()
                    begin
                        OnValidateChoice(Rec.Line, 6);
                    end;
                }
                field(g; g)
                {
                    Width = 1;
                    Caption = 'G';
                    ToolTip = 'X Coordinate';
                    Editable = false;
                    StyleExpr = BoatColorG;
                    trigger OnAssistEdit()
                    begin
                        OnValidateChoice(Rec.Line, 7);
                    end;
                }
                field(h; h)
                {
                    Width = 1;
                    Caption = 'H';
                    ToolTip = 'X Coordinate';
                    Editable = false;
                    StyleExpr = BoatColorH;
                    trigger OnAssistEdit()
                    begin
                        OnValidateChoice(Rec.Line, 8);
                    end;
                }
                field(i; i)
                {
                    Width = 1;
                    Caption = 'I';
                    ToolTip = 'X Coordinate';
                    Editable = false;
                    StyleExpr = BoatColorI;
                    trigger OnAssistEdit()
                    begin
                        OnValidateChoice(Rec.Line, 9);
                    end;
                }
                field(j; j)
                {
                    Width = 1;
                    Caption = 'J';
                    ToolTip = 'X Coordinate';
                    Editable = false;
                    StyleExpr = BoatColorJ;
                    trigger OnAssistEdit()
                    begin
                        OnValidateChoice(Rec.Line, 10);
                    end;
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        //Show the different ships and their status in the Grid.
        CreateGridMgt.GameGridAssignValuesToColumn(RecGame_g."No.", Opponent_g, Rec.Line, a, b, c, d, e, f, g, h, i, j, BoatColorA, BoatColorB, BoatColorC, BoatColorD, BoatColorE, BoatColorF, BoatColorG, BoatColorH, BoatColorI, BoatColorJ);
    end;

    procedure CreateGrid(RecGame_p: Record "BattleShip Game"; Player_p: Text[50]; Opponent_p: Text[50])
    begin
        RecGame_g := RecGame_p;
        Player_g := Player_p;
        Opponent_g := Opponent_p;
        Rec.CreateGrid();
        CurrPage.Update(false);
    end;

    procedure OnValidateChoice(Line_p: Integer; Column_p: Integer)
    begin
        if (RecGame_g."Player Turn" = UserId) and (RecGame_g."Game Statut" = "Game Statut"::Game) then
            HitOrMiss(Line_p, Column_p);
    end;

    //All the tests to determine if a ship is hit or not.
    procedure HitOrMiss(Line_p: Integer; Column_p: Integer)
    var
        RecHitOrMiss_l: Record "BattleShip Grid";
        BoatStatut_l: Code[1];
        RecBoatType_l: Enum "Boat Type";
        BoatColor_l: Text[15];
    begin
        // If the Boat Exist
        if RecHitOrMiss_l.Get(RecGame_g."No.", Opponent_g, Line_p, Column_p) and (RecHitOrMiss_l."Boat Type" <> "Boat Type"::" ") then begin
            if not (RecHitOrMiss_l."Boat Statut" in ["Boat Statut"::Hit, "Boat Statut"::Sinking]) then begin
                SetBoatHit(RecHitOrMiss_l, BoatStatut_l, RecBoatType_l, BoatColor_l);
                TestBoatSinking(RecHitOrMiss_l, RecBoatType_l, BoatColor_l);
            end;
        end
        else begin
            BoatStatut_l := 'O';
            BoatColor_l := 'Subordinate';
            //Boat needs to be created to be set to miss and be seen in the game grid.
            Rec.InsertBoat(RecGame_g."No.", Opponent_g, Line_p, Column_p, "Boat Type"::" ", "Boat Statut"::Miss);
        end;

        SetStatutAndColorOfBoat(Column_p, BoatStatut_l, BoatColor_l);

        ChangePlayerTurn();
    end;

    local procedure SetBoatHit(var RecHitOrMiss_p: Record "BattleShip Grid"; var CodeHitOrMiss_p: Code[1]; var RecBoatType_p: Enum "Boat Type"; var BoatColor_p: Text[15])
    begin
        CodeHitOrMiss_p := 'X';
        RecHitOrMiss_p."Boat Statut" := "Boat Statut"::Hit;
        BoatColor_p := 'Attention';
        RecHitOrMiss_p.Modify();
        RecBoatType_p := RecHitOrMiss_p."Boat Type";
    end;

    local procedure TestBoatSinking(var RecHitOrMiss: Record "BattleShip Grid"; var RecBoatType: Enum "Boat Type"; var BoatColor: Text[15])
    var
        BoatSize: Integer;
        BoatHit: Integer;
        NumberOfBoatSinking: Integer;
    begin
        //Test if all the Boat with the same Boat Type is Hit
        RecHitOrMiss.Reset();
        RecHitOrMiss.SetRange("No. Game", RecGame_g."No.");
        RecHitOrMiss.SetRange("No. Player", Opponent_g);
        RecHitOrMiss.SetRange("Boat Type", RecBoatType);
        BoatSize := RecHitOrMiss.Count();
        RecHitOrMiss.SetRange("Boat Statut", "Boat Statut"::Hit);
        BoatHit := RecHitOrMiss.Count();

        if (BoatSize = BoatHit) then begin
            if (RecHitOrMiss.FindSet()) then
                repeat
                    RecHitOrMiss."Boat Statut" := "Boat Statut"::Sinking;
                    BoatColor := 'Strong';
                    RecHitOrMiss.Modify();
                until (RecHitOrMiss.Next() = 0);
            CurrPage.Update();
            //Test if all the boat is Sinking to set the Game Statut to Finish
            RecHitOrMiss.Reset();
            RecHitOrMiss.SetRange("No. Game", RecGame_g."No.");
            RecHitOrMiss.SetRange("No. Player", Opponent_g);
            RecHitOrMiss.SetRange("Boat Statut", "Boat Statut"::Sinking);
            NumberOfBoatSinking := RecHitOrMiss.Count();
            if (NumberOfBoatSinking >= 17) then begin
                RecGame_g."Game Statut" := "Game Statut"::Finish;
                RecGame_g.Winner := Player_g;
                RecGame_g.Looser := Opponent_g;
                RecGame_g.Modify();
            end
        end;
    end;

    local procedure ChangePlayerTurn()
    begin
        if (RecGame_g."Player Turn" = Player_g) then
            RecGame_g."Player Turn" := Opponent_g
        else
            RecGame_g."Player Turn" := Player_g;
        RecGame_g.Modify();
    end;

    //Set the Statut and the Colors of the Boat 
    local procedure SetStatutAndColorOfBoat(Column_p: Integer; CodeHitOrMiss_l: Code[1]; BoatColor_l: Text[15])
    begin
        case Column_p of
            1:
                begin
                    a := CodeHitOrMiss_l;
                    BoatColorA := BoatColor_l;
                end;
            2:
                begin
                    b := CodeHitOrMiss_l;
                    BoatColorB := BoatColor_l;
                end;
            3:
                begin
                    c := CodeHitOrMiss_l;
                    BoatColorC := BoatColor_l;
                end;
            4:
                begin
                    d := CodeHitOrMiss_l;
                    BoatColorD := BoatColor_l;
                end;
            5:
                begin
                    e := CodeHitOrMiss_l;
                    BoatColorE := BoatColor_l;
                end;
            6:
                begin
                    f := CodeHitOrMiss_l;
                    BoatColorF := BoatColor_l;
                end;
            7:
                begin
                    g := CodeHitOrMiss_l;
                    BoatColorG := BoatColor_l;
                end;
            8:
                begin
                    h := CodeHitOrMiss_l;
                    BoatColorH := BoatColor_l;
                end;
            9:
                begin
                    i := CodeHitOrMiss_l;
                    BoatColorI := BoatColor_l;
                end;
            10:
                begin
                    j := CodeHitOrMiss_l;
                    BoatColorJ := BoatColor_l;
                end;
        end;
    end;

    var
        RecGame_g: Record "BattleShip Game";
        CreateGridMgt: CodeUnit "CreateGrid";
        Player_g: Text[50];
        Opponent_g: Text[50];
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

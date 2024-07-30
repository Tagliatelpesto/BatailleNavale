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
                    ToolTip = 'Y Coordinate';
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
        CreationGridMgt.GameGridAssignValuesToColumn(RecGame_g."No.", Opponent_g, Rec.Line, a, b, c, d, e, f, g, h, i, j, BoatColorA, BoatColorB, BoatColorC, BoatColorD, BoatColorE, BoatColorF, BoatColorG, BoatColorH, BoatColorI, BoatColorJ);
    end;

    procedure CreateGrid(RecGame_p: Record "BattleShip Game"; Player_p: Text[50]; Opponent_p: Text[50])
    begin
        RecGame_g := RecGame_p;
        Player_g := Player_p;
        Opponent_g := Opponent_p;
        CreationGridMgt.CreateGrid(Rec);
        CurrPage.Update(false);
    end;

    procedure OnValidateChoice(Line_p: Integer; Column_p: Integer)
    begin

        if (RecGame_g."Player Turn" = UserId) and (RecGame_g."Game Statut" = "Game Statut"::Game) then
            GameGridMgt.HitOrMiss(RecGame_g, Player_g, Opponent_g, Line_p, Column_p, a, b, c, d, e, f, g, h, i, j, BoatColorA, BoatColorB, BoatColorC, BoatColorD, BoatColorE, BoatColorF, BoatColorG, BoatColorH, BoatColorI, BoatColorJ);
        CurrPage.Update(false);
    end;

    var
        RecGame_g: Record "BattleShip Game";
        GameGridMgt: Codeunit "Game Grid Mgt";
        CreationGridMgt: CodeUnit "Creation Grid Mgt";
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

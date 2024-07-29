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
                        PlacementGridMgt.OnValidateChoice(Rec, RecGame_g, Player_g, Rec.Line, 1, a);
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
                        PlacementGridMgt.OnValidateChoice(Rec, RecGame_g, Player_g, Rec.Line, 2, b);
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
                        PlacementGridMgt.OnValidateChoice(Rec, RecGame_g, Player_g, Rec.Line, 3, c);
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
                        PlacementGridMgt.OnValidateChoice(Rec, RecGame_g, Player_g, Rec.Line, 4, d);
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
                        PlacementGridMgt.OnValidateChoice(Rec, RecGame_g, Player_g, Rec.Line, 5, e);
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
                        PlacementGridMgt.OnValidateChoice(Rec, RecGame_g, Player_g, Rec.Line, 6, f);
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
                        PlacementGridMgt.OnValidateChoice(Rec, RecGame_g, Player_g, Rec.Line, 7, g);
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
                        PlacementGridMgt.OnValidateChoice(Rec, RecGame_g, Player_g, Rec.Line, 8, h);
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
                        PlacementGridMgt.OnValidateChoice(Rec, RecGame_g, Player_g, Rec.Line, 9, i);
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
                        PlacementGridMgt.OnValidateChoice(Rec, RecGame_g, Player_g, Rec.Line, 10, j);
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
        CreationGridMgt.PlacementGridAssignValuesToColumn(RecGame_g."No.", Player_g, Rec.Line, a, b, c, d, e, f, g, h, i, j, BoatColorA, BoatColorB, BoatColorC, BoatColorD, BoatColorE, BoatColorF, BoatColorG, BoatColorH, BoatColorI, BoatColorJ);

    end;

    procedure CreateGrid(RecGame_p: Record "BattleShip Game"; Player_p: Text[50])
    begin
        RecGame_g := RecGame_p;
        Player_g := Player_p;
        CreationGridMgt.CreateGrid(Rec);
        CurrPage.Update(false);
    end;

    var
        RecGame_g: Record "BattleShip Game";
        CreationGridMgt: CodeUnit "Creation Grid Mgt";
        PlacementGridMgt: CodeUnit "Placement Grid Mgt";
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

}

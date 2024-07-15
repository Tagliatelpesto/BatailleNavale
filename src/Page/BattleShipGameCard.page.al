page 50102 "BattleShip Game Card"
{
    ApplicationArea = All;
    Caption = 'BattleShip Game Card';
    PageType = Card;
    SourceTable = "BattleShip Game";
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                group(Info)
                {
                    Editable = (Rec."Game Statut" = "Game Statut"::Placement) or (Rec."Game Statut" = "Game Statut"::Finish);
                    ShowCaption = false;
                    field("No."; Rec."No.")
                    {
                        Editable = false;
                        Caption = 'No.';
                        ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                    }
                    field(Comment; Rec.Comment)
                    {
                        Caption = 'Comment';
                        ToolTip = 'Specifies the value of the Comment field.', Comment = '%';
                    }
                    field("Posting Date"; Rec."Posting Date")
                    {
                        Editable = false;
                        Caption = 'Posting Date';
                        ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                    }
                }
                group(Player)
                {
                    Visible = (Rec."Game Statut" = "Game Statut"::Placement) or (Rec."Game Statut" = "Game Statut"::Finish);
                    ShowCaption = false;
                    Enabled = Rec."Game Statut" = "Game Statut"::Placement;
                    field("Player 1"; Rec."Player 1")
                    {
                        Caption = 'Player 1';
                        ToolTip = 'Specifies the value of the Player 1 field.', Comment = '%';
                        trigger OnValidate()
                        var
                            GridRecord: Record "BattleShip Grid";
                        begin
                            GridRecord.Reset();
                            if (xRec."Player 1" <> Rec."Player 1") then begin
                                GridRecord.SetRange("No. Game", xRec."No.");
                                GridRecord.SetRange("No. Player", xRec."Player 1");
                                GridRecord.DeleteAll();
                            end;
                            SetVisibleEditableVariable();
                        end;
                    }
                    field("Player 2"; Rec."Player 2")
                    {
                        Caption = 'Player 2';
                        ToolTip = 'Specifies the value of the Player 2 field.', Comment = '%';
                        trigger OnValidate()
                        var
                            GridRecord: Record "BattleShip Grid";
                        begin
                            GridRecord.Reset();
                            if (xRec."Player 2" <> Rec."Player 2") then begin
                                GridRecord.SetRange("No. Game", xRec."No.");
                                GridRecord.SetRange("No. Player", xRec."Player 2");
                                GridRecord.DeleteAll();
                            end;
                            SetVisibleEditableVariable();
                        end;
                    }
                }
                group(GameWinner)
                {

                    Visible = (Rec."Game Statut" = "Game Statut"::Finish);
                    ShowCaption = false;
                    field(Winner; Rec.Winner)
                    {
                        Editable = false;
                        Caption = 'Winner';
                        ToolTip = 'Specifies the value of the Winner field.', Comment = '%';
                    }
                    field(Looser; Rec.Looser)
                    {
                        Editable = false;
                        Caption = 'Looser';
                        ToolTip = 'Specifies the value of the Looser field.', Comment = '%';
                    }
                }
                field(GameStatut; Rec."Game Statut")
                {
                    Editable = false;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Game Statut field.', Comment = '%';
                }
                group(PlayerTurnGroup)
                {

                    Visible = (Rec."Game Statut" = "Game Statut"::Game);
                    ShowCaption = false;
                    field(PlayerTurn; Rec."Player Turn")
                    {
                        Editable = false;
                        ToolTip = 'Specifies the value of the Player Turn field.', Comment = '%';
                    }
                }
            }
            part(GridPlacementP1; "BattleShip Grid Placement")
            {
                ApplicationArea = All;
                Editable = PlacementGridPlayer1Editable;
                Visible = PlacementGridPlayer1Visible;
                Caption = 'BattleShip Grid Placement Player 1';
            }
            part(GridGameP1; "BattleShip Grid Game")
            {
                ApplicationArea = All;
                Editable = GameGridPlayer1Editable;
                Visible = GameGridPlayer1Visible;
                Caption = 'BattleShip Grid Game Player 1';
            }
            part(GridPlacementP2; "BattleShip Grid Placement")
            {
                ApplicationArea = All;
                Editable = PlacementGridPlayer2Editable;
                Visible = PlacementGridPlayer2Visible;
                Caption = 'BattleShip Grid Placement Player 2';
            }
            part(GridGameP2; "BattleShip Grid Game")
            {
                ApplicationArea = All;
                Editable = GameGridPlayer2Editable;
                Visible = GameGridPlayer2Visible;
                Caption = 'BattleShip Grid Game Player 2';
            }
            // Timer that updates the CurrPage every 2000 milliseconds to refresh the display. Need to Start the timer one time in OnAfterGetRecord
            // usercontrol(MyPingPong; MyPingPong)
            // {
            //     ApplicationArea = All;
            //     trigger TimerElapsed()
            //     begin
            //         CurrPage.MyPingPong.StartTimer(2000);
            //         CurrPage.Update();
            //         CurrPage.MyPingPong.StopTimer();
            //     end;
            // }
        }
    }

    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    begin
        if (TaskId = TaskIdToCheckIfNeedToRefresh_g) then
            EnqueueBackTaskToCheckIfNeedToRefresh();
    end;

    trigger OnAfterGetRecord()
    begin
        EnqueueBackTaskToCheckIfNeedToRefresh();
    end;

    procedure SetVisibleEditableVariable()
    begin
        // Set the Visible and Editable variable of the Grid
        PlacementGridPlayer1Visible := (Rec."Game Statut" = "Game Statut"::Finish) or (Rec."Player 2" <> UserId);
        PlacementGridPlayer2Visible := (Rec."Game Statut" = "Game Statut"::Finish) or (Rec."Player 1" <> UserId);
        PlacementGridPlayer1Editable := (Rec."Game Statut" = "Game Statut"::Placement) and (Rec."Player 1" = UserId);
        PlacementGridPlayer2Editable := (Rec."Game Statut" = "Game Statut"::Placement) and (Rec."Player 2" = UserId);
        GameGridPlayer1Visible := (Rec."Game Statut" = "Game Statut"::Finish) or ((Rec."Game Statut" = "Game Statut"::Game) and (Rec."Player 2" <> UserId));
        GameGridPlayer2Visible := (Rec."Game Statut" = "Game Statut"::Finish) or ((Rec."Game Statut" = "Game Statut"::Game) and (Rec."Player 1" <> UserId));
        GameGridPlayer1Editable := (Rec."Game Statut" = "Game Statut"::Game) and (Rec."Player 1" = UserId);
        GameGridPlayer2Editable := (Rec."Game Statut" = "Game Statut"::Game) and (Rec."Player 2" = UserId);
    end;



    procedure SetGrid()
    begin
        // The Get is used to update the grids with an updated Record.
        Rec.Get(Rec."No.");
        CurrPage.GridPlacementP1.Page.CreateGrid(Rec, Rec."Player 1");
        CurrPage.GridPlacementP2.Page.CreateGrid(Rec, Rec."Player 2");
        CurrPage.GridGameP1.Page.CreateGrid(Rec, Rec."Player 1", Rec."Player 2");
        CurrPage.GridGameP2.Page.CreateGrid(Rec, Rec."Player 2", Rec."Player 1");
    end;

    local procedure ProcOnAfterGetRecord()
    begin
        SetVisibleEditableVariable();
        SetGrid();
    end;

    //Set the refresh of the page
    local procedure EnqueueBackTaskToCheckIfNeedToRefresh()
    var
        TaskParameters: Dictionary of [Text, Text];
        NoPartieInText: Text[20];
    begin
        ProcOnAfterGetRecord();
        NoPartieInText := Format(Rec."No.");
        TaskParameters.Add('No.', NoPartieInText);

        case true of
            Rec."Game Statut" = "Game Statut"::Placement:
                CurrPage.EnqueueBackgroundTask(TaskIdToCheckIfNeedToRefresh_g, codeunit::SleepToRefreshPlacement, TaskParameters, 600000, PageBackgroundTaskErrorLevel::Warning);
            Rec."Game Statut" = "Game Statut"::Game:
                begin
                    TaskParameters.Add('CurrPlayerTurn', Rec."Player Turn");
                    CurrPage.EnqueueBackgroundTask(TaskIdToCheckIfNeedToRefresh_g, codeunit::SleepToRefreshGame, TaskParameters, 600000, PageBackgroundTaskErrorLevel::Warning);
                end;
        end;
    end;

    var
        PlacementGridPlayer1Visible: Boolean;
        PlacementGridPlayer2Visible: Boolean;
        PlacementGridPlayer1Editable: Boolean;
        PlacementGridPlayer2Editable: Boolean;
        GameGridPlayer1Visible: Boolean;
        GameGridPlayer2Visible: Boolean;
        GameGridPlayer1Editable: Boolean;
        GameGridPlayer2Editable: Boolean;
        TaskIdToCheckIfNeedToRefresh_g: Integer;

}

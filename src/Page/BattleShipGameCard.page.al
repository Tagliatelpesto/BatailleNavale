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
                    ShowCaption = false;
                    field("No."; Rec."No.")
                    {
                        Editable = GameIsPlacement;
                        Caption = 'No.';
                        ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                    }
                    field(Comment; Rec.Comment)
                    {
                        Editable = GameIsPlacement;
                        Caption = 'Comment';
                        ToolTip = 'Specifies the value of the Comment field.', Comment = '%';
                    }
                    field("Posting Date"; Rec."Posting Date")
                    {
                        Editable = GameIsPlacement;
                        Caption = 'Posting Date';
                        ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                    }
                }
                group(Player)
                {
                    Editable = GameIsPlacement;
                    Visible = GroupPlayerVisible;
                    ShowCaption = false;

                    field("Player 1"; Rec."Player 1")
                    {
                        Caption = 'Player 1';
                        ToolTip = 'Specifies the value of the Player 1 field.', Comment = '%';
                        trigger OnValidate()
                        begin
                            GameMgt.IsOtherPlayerBeenChoose(Rec."No.", Rec."Player 1", xRec."Player 1");
                            SetVisibleEditableVariable()
                        end;
                    }
                    field("Player 2"; Rec."Player 2")
                    {
                        Caption = 'Player 2';
                        ToolTip = 'Specifies the value of the Player 2 field.', Comment = '%';
                        trigger OnValidate()
                        begin
                            GameMgt.IsOtherPlayerBeenChoose(Rec."No.", Rec."Player 2", xRec."Player 2");
                            SetVisibleEditableVariable()
                        end;
                    }
                }
                group(GameWinner)
                {

                    Visible = GameIsFinish;
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

                    Visible = GameIsGame;
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
    actions
    {
        area(processing)
        {
            action(PrintGame)
            {
                Caption = 'PrintGame';
                ToolTip = 'Print your game';
                Image = ConfirmAndPrint;
                Visible = GameIsFinish;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    RecGame: Record "BattleShip Game";
                    ReportPrint: Report "Resume Print BattleShip Game";
                begin
                    RecGame.SetRange("No.", Rec."No.");
                    ReportPrint.SetTableView(RecGame);
                    ReportPrint.RunModal();
                end;
            }
        }
    }
    trigger OnPageBackgroundTaskCompleted(TaskId: Integer; Results: Dictionary of [Text, Text])
    begin
        if (TaskId = TaskIdToCheckIfNeedToRefresh_g) then
            SetAndCreateGridAndEnqueueBackTaskToCheckIfNeedToRefresh();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Insert(true);
        SetAndCreateGridAndEnqueueBackTaskToCheckIfNeedToRefresh();
        exit(false);
    end;

    trigger OnOpenPage()
    begin
        SetVisibleEditableVariable();
    end;

    trigger OnAfterGetRecord()
    begin
        SetAndCreateGridAndEnqueueBackTaskToCheckIfNeedToRefresh();
    end;


    procedure CreateGrid(): Boolean
    begin
        // The Get is used to update the grids with an updated Record.
        if not Rec.Get(Rec."No.") then
            exit(false);
        CurrPage.GridPlacementP1.Page.CreateGrid(Rec, Rec."Player 1");
        CurrPage.GridPlacementP2.Page.CreateGrid(Rec, Rec."Player 2");
        CurrPage.GridGameP1.Page.CreateGrid(Rec, Rec."Player 1", Rec."Player 2");
        CurrPage.GridGameP2.Page.CreateGrid(Rec, Rec."Player 2", Rec."Player 1");
        exit(true);
    end;
    //Set the refresh of the page
    procedure SetAndCreateGridAndEnqueueBackTaskToCheckIfNeedToRefresh()
    var
        TaskParameters: Dictionary of [Text, Text];
        NoPartieInText: Text[20];
    begin
        SetVisibleEditableVariable();
        if not CreateGrid() then
            exit;
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

    procedure SetVisibleEditableVariable()
    begin
        // Set the Visible and Editable variable of the Grid
        GameIsPlacement := Rec."Game Statut" = "Game Statut"::Placement;
        GameIsGame := Rec."Game Statut" = "Game Statut"::Game;
        GameIsFinish := Rec."Game Statut" = "Game Statut"::Finish;
        PlacementGridPlayer1Visible := GameIsFinish or (Rec."Player 2" <> UserId);
        PlacementGridPlayer2Visible := GameIsFinish or (Rec."Player 1" <> UserId);
        PlacementGridPlayer1Editable := GameIsPlacement and (Rec."Player 1" = UserId);
        PlacementGridPlayer2Editable := GameIsPlacement and (Rec."Player 2" = UserId);
        GameGridPlayer1Visible := GameIsFinish or (GameIsGame and (Rec."Player 2" <> UserId));
        GameGridPlayer2Visible := GameIsFinish or (GameIsGame and (Rec."Player 1" <> UserId));
        GameGridPlayer1Editable := GameIsGame and (Rec."Player 1" = UserId);
        GameGridPlayer2Editable := GameIsGame and (Rec."Player 2" = UserId);
        GroupPlayerVisible := GameIsPlacement or GameIsFinish;
    end;

    var
        GameMgt: Codeunit "Game Mgt";
        GameIsPlacement: Boolean;
        GroupPlayerVisible: Boolean;
        GameIsFinish: Boolean;
        GameIsGame: Boolean;
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

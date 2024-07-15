table 50101 "BattleShip Game"
{
    Caption = 'BattleShip Game';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            trigger OnValidate()
            var
                NoSeries: Codeunit "No. Series";
            begin
                if "No." <> xRec."No." then begin
                    BattleShipSetUp.Get();
                    NoSeries.TestManual(GetNoSeriesCode());
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "No. Series"; Code[20])
        {
            Caption = 'No. Series';

        }
        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            trigger OnValidate()
            begin
                TestField("Posting Date");
                TestNoSeriesDate("No.", "No. Series");
                BattleShipSetUp.Get();
            end;
        }
        field(4; "Comment"; Text[250])
        {
            Caption = 'Comment';
        }
        field(5; "Player 1"; Text[50])
        {
            Caption = 'Player 1';
            TableRelation = "BattleShip Player";
            trigger OnValidate()
            begin
                if "Player 1" = "Player 2" then
                    Error('Player 1 ne doit pas être égal à %1', "Player 2");
            end;
        }
        field(6; "Player 2"; Text[50])
        {
            Caption = 'Player 2';
            TableRelation = "BattleShip Player";
            trigger OnValidate()
            begin
                if "Player 2" = "Player 1" then
                    Error('Player 2 ne doit pas être égal à %1', "Player 1");
            end;
        }
        field(7; "Winner"; Text[50])
        {
            Caption = 'Winner';
        }
        field(8; "Looser"; Text[50])
        {
            Caption = 'Looser';
        }
        field(9; "Number Boat Placed"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("BattleShip Grid" where("No. Game" = field("No.")));
        }
        field(10; "Game Statut"; Enum "Game Statut")
        {
            Caption = 'Game Statut';
            InitValue = Placement;
        }
        field(11; "Player Turn"; Text[50])
        {
            Caption = 'Player Turn';
        }

    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        InitInsert();
        SetView('');
    end;

    trigger OnDelete()
    var
        GridRecord: Record "BattleShip Grid";
    begin
        GridRecord.SetRange("No. Game", Rec."No.");
        GridRecord.DeleteAll();
    end;

    trigger OnModify()
    begin

    end;


    procedure InitInsert()
    var
        NoSeries: Codeunit "No. Series";
        NoSeriesCode: Code[20];
    begin
        //Set Automaticaly The Number of the Game and the Date
        "Posting Date" := WORKDATE();
        if "No." = '' then begin
            NoSeriesCode := GetNoSeriesCode();
            TestNoSeries();
            "No. Series" := NoSeriesCode;
            if NoSeries.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeries.GetNextNo("No. Series", "Posting Date");
        end;
    end;

    procedure GetNoSeriesCode(): Code[20]
    var
        NoSeriesCode: Code[20];
    begin
        GetBattleShipSetup();
        NoSeriesCode := BattleShipSetUp."No. Series";
        exit(NoSeriesCode);
    end;

    local procedure GetBattleShipSetup()
    begin
        BattleShipSetUp.Get();
    end;

    procedure TestNoSeries()
    begin
        BattleShipSetUp.TestField("No. Series");
    end;

    procedure TestNoSeriesDate(No: Code[20]; NoSeriesCode: Code[20])
    begin
        if (No <> '') and (NoSeriesCode <> '') then begin
            GlobalNoSeries.Get(NoSeriesCode);
            if GlobalNoSeries."Date Order" then
                Error('No valid Date');
        end;
    end;

    var
        BattleShipSetUp: Record "BattleShip SetUp";
        GlobalNoSeries: Record "No. Series";
}
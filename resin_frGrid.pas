unit resin_frGrid;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWTypes, Controls,
  IWBaseControl, IWControl, IWCompLabel, IWDBGrids, IWDBStdCtrls,
  Forms, IWHTMLControls,
  IWVCLBaseControl, IWBaseHTMLControl, resin_frProductTree, resin_frTopBar,
  IWCompGrids;

type
  TISFGrid = class(TIWAppForm)
    TopBar: TISFTopBar;
    lblRecordCount: TIWLabel;
    iwDBgResults: TIWDBGrid;
    iwlPrevPage: TIWLink;
    iwlNextPage: TIWLink;
    iwlSortedBy: TIWLabel;
    LeftTree: TISFProductTree;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWDBGrid1ColumnsTitleClick(Sender: TObject);
    procedure iwlPrevPageClick(Sender: TObject);
    procedure iwlNextPageClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses
  ServerController, resin_dm;




procedure TISFGrid.IWAppFormRender(Sender: TObject);
begin
  TopBar.lnkSignIn.Visible := not UserSession.LoggedIn;
  if UserSession.LoggedIn then
  begin
    TopBar.lblWelcome.Caption := 'Welcome ' + UserSession.UserDisplayName;
    lblRecordCount.Text := IntToStr(dmR.cdsQuery1.RecordCount)+' records match the query specified';
  end;
end;

procedure TISFGrid.IWDBGrid1ColumnsTitleClick(Sender: TObject);
begin
  dmR.cdsQuery1.IndexFieldNames := TIWDBGridColumn(Sender).DataField;
  iwlSortedBy.Caption := 'Sorted by ' + TIWDBGridColumn(Sender).Title.Text;
end;

procedure TISFGrid.iwlPrevPageClick(Sender: TObject);
begin
  dmR.cdsQuery1.MoveBy(-1*iwDBgResults.RowLimit);
end;

procedure TISFGrid.iwlNextPageClick(Sender: TObject);
begin
  dmR.cdsQuery1.MoveBy(iwDBgResults.RowLimit);
end;

procedure TISFGrid.IWAppFormCreate(Sender: TObject);
begin
  if UserSession.LoggedIn then
  begin
    dmR.Query1.Close;
    dmR.cdsQuery1.Close;
    dmR.cdsQuery1.Open;
    iwlPrevPage.Visible := (dmR.cdsQuery1.RecordCount > iwDBgResults.RowLimit);
    iwlNextPage.Visible := (dmR.cdsQuery1.RecordCount > iwDBgResults.RowLimit);
  end;
end;

end.

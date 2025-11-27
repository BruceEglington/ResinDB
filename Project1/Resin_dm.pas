unit Resin_dm;

interface

uses
  Forms,
  DBXCommon, midaslib,
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider,
  IWCompListbox, WideStrings, DBXDevartInterBase;

type
  TdmR = class(TDataModule)
    sqlcResinDB: TSQLConnection;
    Query1: TSQLQuery;
    dspQuery1: TDataSetProvider;
    cdsQuery1: TClientDataSet;
    dsQuery1: TDataSource;
    qProgress: TSQLQuery;
    qProgressPROGRESSID: TIntegerField;
    qProgressPROGRESSDATE: TSQLTimeStampField;
    qProgressPROGRESSDETAILS: TMemoField;
    dspProgress: TDataSetProvider;
    cdsProgress: TClientDataSet;
    cdsProgressPROGRESSID: TIntegerField;
    cdsProgressPROGRESSDATE: TSQLTimeStampField;
    cdsProgressPROGRESSDETAILS: TMemoField;
    dsProgress: TDataSource;
    qReagents: TSQLQuery;
    qResins: TSQLQuery;
    qElements: TSQLQuery;
    qIons: TSQLQuery;
    qReferences: TSQLQuery;
    qReagentsREAGENTID: TWideStringField;
    qReagentsREAGENTNAME: TWideStringField;
    qResinsRESINID: TWideStringField;
    qResinsRESINNAME: TWideStringField;
    qResinsRESIN: TWideStringField;
    qResinsXLINK: TWideStringField;
    qElementsELEMENT: TWideStringField;
    qIonsELEMENT: TWideStringField;
    qIonsVALENCE: TSmallintField;
    qReferencesREFERENCEID: TWideStringField;
    qRefFull: TSQLQuery;
    qRefFullREFERENCEID: TWideStringField;
    qRefFullREFERNCEDETAIL: TMemoField;
    dspReagents: TDataSetProvider;
    dspResins: TDataSetProvider;
    dspElements: TDataSetProvider;
    dspIons: TDataSetProvider;
    dspReferences: TDataSetProvider;
    dspRefFull: TDataSetProvider;
    cdsReagents: TClientDataSet;
    cdsResins: TClientDataSet;
    cdsElements: TClientDataSet;
    cdsIons: TClientDataSet;
    cdsReferences: TClientDataSet;
    cdsRefFull: TClientDataSet;
    dsReagents: TDataSource;
    dsResins: TDataSource;
    dsElements: TDataSource;
    dsIons: TDataSource;
    dsReferences: TDataSource;
    dsRefFull: TDataSource;
    cdsReagentsREAGENTID: TWideStringField;
    cdsReagentsREAGENTNAME: TWideStringField;
    cdsResinsRESINID: TWideStringField;
    cdsResinsRESINNAME: TWideStringField;
    cdsResinsRESIN: TWideStringField;
    cdsResinsXLINK: TWideStringField;
    cdsElementsELEMENT: TWideStringField;
    cdsIonsELEMENT: TWideStringField;
    cdsIonsVALENCE: TSmallintField;
    cdsReferencesREFERENCEID: TWideStringField;
    cdsRefFullREFERENCEID: TWideStringField;
    cdsRefFullREFERNCEDETAIL: TMemoField;
    qIonsIONID: TWideStringField;
    cdsIonsIONID: TWideStringField;
    Query1REAGENT1: TWideStringField;
    Query1REAGENT2: TWideStringField;
    Query1RESINID: TWideStringField;
    Query1ELEMENT: TWideStringField;
    Query1VALENCE: TSmallintField;
    Query1MOLARITY1: TFloatField;
    Query1MOLARITY2: TFloatField;
    Query1KD: TFloatField;
    cdsQuery1REAGENT1: TWideStringField;
    cdsQuery1REAGENT2: TWideStringField;
    cdsQuery1RESINID: TWideStringField;
    cdsQuery1ELEMENT: TWideStringField;
    cdsQuery1VALENCE: TSmallintField;
    cdsQuery1MOLARITY1: TFloatField;
    cdsQuery1MOLARITY2: TFloatField;
    cdsQuery1KD: TFloatField;
    Query1RESINNAME: TWideStringField;
    Query1RESIN: TWideStringField;
    Query1XLINK: TWideStringField;
    Query1REAGENTNAME: TWideStringField;
    cdsQuery1RESINNAME: TWideStringField;
    cdsQuery1RESIN: TWideStringField;
    cdsQuery1XLINK: TWideStringField;
    cdsQuery1REAGENTNAME: TWideStringField;
    cdsTempDataKD: TClientDataSet;
    cdsTempDataKDIonID: TWideStringField;
    cdsTempDataKDElement: TWideStringField;
    cdsTempDataKDValence: TIntegerField;
    cdsTempDataKDMolarity: TFloatField;
    cdsTempDataKDKD: TFloatField;
    dsTempDataKD: TDataSource;
    cdsTempDataKDIonName: TWideStringField;
    Querydm: TSQLQuery;
    dspQuerydm: TDataSetProvider;
    cdsQuerydm: TClientDataSet;
    dsQuerydm: TDataSource;
    QuerydmREAGENT1: TWideStringField;
    QuerydmREAGENT2: TWideStringField;
    QuerydmRESINID: TWideStringField;
    QuerydmELEMENT: TWideStringField;
    QuerydmVALENCE: TSmallintField;
    QuerydmMOLARITY1: TFloatField;
    QuerydmMOLARITY2: TFloatField;
    QuerydmKD: TFloatField;
    QuerydmRESINNAME: TWideStringField;
    QuerydmRESIN: TWideStringField;
    QuerydmXLINK: TWideStringField;
    QuerydmREAGENTNAME: TWideStringField;
    cdsQuerydmREAGENT1: TWideStringField;
    cdsQuerydmREAGENT2: TWideStringField;
    cdsQuerydmRESINID: TWideStringField;
    cdsQuerydmELEMENT: TWideStringField;
    cdsQuerydmVALENCE: TSmallintField;
    cdsQuerydmMOLARITY1: TFloatField;
    cdsQuerydmMOLARITY2: TFloatField;
    cdsQuerydmKD: TFloatField;
    cdsQuerydmRESINNAME: TWideStringField;
    cdsQuerydmRESIN: TWideStringField;
    cdsQuerydmXLINK: TWideStringField;
    cdsQuerydmREAGENTNAME: TWideStringField;
    Query1IONID: TWideStringField;
    cdsQuery1IONID: TWideStringField;
    QuerydmIONID: TWideStringField;
    cdsQuerydmIONID: TWideStringField;
    SQLMonitor1: TSQLMonitor;
    procedure cdsAnyReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
  public
    procedure GetFormData;
    procedure SetFormData;
    procedure ConstructQuery;
    procedure SubmitQuery;
    procedure AllocateMolarityKdData;
  end;

// Procs
  function dmR: TdmR;

implementation
{$R *.dfm}

uses
  IWInit,
  ServerController,
  Variants, usrIW_dm, resin_constants;

// Since we are threaded we cannot use global variables to store form / datamodule references
// so we store them in WebApplication.Data and we could reference that each time, but by creating
// a function like this our other code looks "normal" almost as if its referencing a global.
// This function is not necessary but it makes the code in the main form which references this
// datamodule a lot neater.
// Without this function every time we would reference this datamodule we would use:
//   TDataModule1(WebApplication.Data).Datamodule.<method / component>
// By creating this procedure it becomes:
//   TDataModule1.<method / component>
// Which is just like normal Delphi code.

function dmR: TdmR;
begin
  Result := TUserSession(WebApplication.Data).dmR;
end;


procedure TdmR.cdsAnyReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  WebApplication.ShowMessage('Reconcile error - '+E.Message);
end;

procedure TdmR.GetFormData;
var
  V: Variant;
begin
  dmUser.UserInfo.Close;
  dmUser.UserInfo.ParamByName('USERNAMEID').AsString := UserSession.UserID;
  dmUser.UserInfo.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
  dmUser.cdsUserInfo.Close;
  dmUser.cdsUserInfo.Open;
  V := dmUser.cdsUserInfoSESSIONINFO.AsVariant;
  dmUser.cdsUserInfo.Close;
end;

procedure TdmR.SetFormData;
begin
  UserSession.WhereAmI := 'SetFormData';
  dmUser.UserInfo.Close;
  dmUser.UserInfo.ParamByName('USERNAMEID').AsString := UserSession.UserID;
  dmUser.UserInfo.ParamByName('SOFTWAREID').AsString := UserSession.ThisProgram;
  dmUser.cdsUserInfo.Close;
  dmUser.cdsUserInfo.Open;
  if (dmUser.cdsUserInfo.RecordCount = 0) then
  begin
    dmUser.cdsUserInfo.Append;
    dmUser.cdsUserInfoUSERID.AsString := UserSession.UserID;
    dmUser.cdsUserInfoSOFTWAREID.AsString := UserSession.ThisProgram;
    dmUser.cdsUserInfoLASTUSED.AsDateTime := Now;
    dmUser.cdsUserInfoSESSIONINFO.AsVariant := UserSession.SQLMemoField.Text;
    dmUser.cdsUserInfo.Post;
  end else
  begin
    dmUser.cdsUserInfo.Edit;
    dmUser.cdsUserInfoLASTUSED.AsDateTime := Now;
    dmUser.cdsUserInfoSESSIONINFO.AsVariant := UserSession.SQLMemoField.Text;
    dmUser.cdsUserInfo.Post;
  end;
  dmUser.cdsUserInfo.ApplyUpdates(0);
  dmUser.cdsUserInfo.Close;
end;



procedure TdmR.ConstructQuery;
var
  i : integer;
begin
  dmR.cdsQuery1.Close;
  dmR.Query1.Close;
  dmR.Query1.SQL.Clear;
  dmR.Query1.SQL.Add('select COLKDS.REAGENT1, COLKDS.REAGENT2, COLKDS.RESINID,');
  dmR.Query1.SQL.Add('  COLKDS.ELEMENT, COLKDS.VALENCE,');
  dmR.Query1.SQL.Add('  COLKDS.MOLARITY1, COLKDS.MOLARITY2, COLKDS.KD,');
  dmR.Query1.SQL.Add('  RESINS.RESINNAME, RESINS.RESIN, RESINS.XLINK,');
  dmR.Query1.SQL.Add('  REAGENTS.REAGENTNAME, IONS.IONID');
  dmR.Query1.SQL.Add('from COLKDS, RESINS, REAGENTS, IONS, ELEMENTS');
  dmR.Query1.SQL.Add('where COLKDS.RESINID=RESINS.RESINID');
  dmR.Query1.SQL.Add('and COLKDS.REAGENT1=REAGENTS.REAGENTID');
  {
  dmR.Query1.SQL.Add('and COLKDS.REAGENT2=REAGENTS.REAGENTID');
  }
  dmR.Query1.SQL.Add('and COLKDS.ELEMENT=IONS.ELEMENT');
  dmR.Query1.SQL.Add('and COLKDS.VALENCE=IONS.VALENCE');
  dmR.Query1.SQL.Add('and ELEMENTS.ELEMENT=IONS.ELEMENT');
  if UserSession.IncludeResinValues then
  begin
    dmR.Query1.SQL.Add('and (COLKDS.RESINID='+''''+UserSession.ResinValues.Strings[0]+'''');
    if (UserSession.ResinValues.Count > 1) then
    begin
      for i := 2 to UserSession.ResinValues.Count do
      begin
        dmR.Query1.SQL.Add('or COLKDS.RESINID='+''''+UserSession.ResinValues.Strings[i-1]+'''');
      end;
    end;
    dmR.Query1.SQL.Add(' ) ');
  end;
  if UserSession.IncludeReagent1Values then
  begin
    dmR.Query1.SQL.Add('and (COLKDS.REAGENT1='+''''+UserSession.Reagent1Values.Strings[0]+'''');
    if (UserSession.Reagent1Values.Count > 1) then
    begin
      for i := 2 to UserSession.Reagent1Values.Count do
      begin
        dmR.Query1.SQL.Add('or COLKDS.REAGENT1='+''''+UserSession.Reagent1Values.Strings[i-1]+'''');
      end;
    end;
    dmR.Query1.SQL.Add(' ) ');
  end;
  if UserSession.IncludeReagent2Values then
  begin
    dmR.Query1.SQL.Add('and (COLKDS.REAGENT2='+''''+UserSession.Reagent2Values.Strings[0]+'''');
    if (UserSession.Reagent2Values.Count > 1) then
    begin
      for i := 2 to UserSession.Reagent2Values.Count do
      begin
        dmR.Query1.SQL.Add('or COLKDS.REAGENT2='+''''+UserSession.Reagent2Values.Strings[i-1]+'''');
      end;
    end;
    dmR.Query1.SQL.Add(' ) ');
  end;
  if UserSession.IncludeIonValues then
  begin
    dmR.Query1.SQL.Add('and (IONS.IONID='+''''+UserSession.IonValues.Strings[0]+'''');
    if (UserSession.IonValues.Count > 1) then
    begin
      for i := 2 to UserSession.IonValues.Count do
      begin
        dmR.Query1.SQL.Add('or IONS.IONID='+''''+UserSession.IonValues.Strings[i-1]+'''');
      end;
    end;
    dmR.Query1.SQL.Add(' ) ');
  end;
end;

procedure TdmR.SubmitQuery;
begin
  dmR.ConstructQuery;
  //UserSession.SQLMemoField.Text := dmR.Query1.SQL.Text;
  dmUser.SetFormData2(dmR.Query1.SQL.Text);
end;

procedure TdmR.AllocateMolarityKdData;
begin
  dmR.cdsTempDataKD.Open;
  {Allocate data}
  dmR.cdsTempDataKD.Filtered := false;
  dmR.cdsTempDataKD.First;
  UserSession.StartAtX := MolarityEnd;
  UserSession.EndAtX := MolarityStart;
  UserSession.StartAtY := KdEnd;
  UserSession.EndAtY := KdStart;
  if (dmR.cdsTempDataKD.RecordCount > 0) then
  begin
    dmR.cdsTempDataKD.EmptyDataSet;
  end;
  with dmR do
  begin
    Querydm.Close;
    Querydm.SQL.Text := dmR.Query1.SQL.Text;
    cdsQuerydm.Close;
    cdsQuerydm.Open;
  end;
  try
    dmR.cdsQuerydm.First;
    repeat
        if (UserSession.StartAtX > dmR.cdsQuerydmMolarity1.AsFloat) then UserSession.StartAtX := dmR.cdsQuerydmMolarity1.AsFloat;
        if (UserSession.EndAtX < dmR.cdsQuerydmMolarity1.AsFloat) then UserSession.EndAtX := dmR.cdsQuerydmMolarity1.AsFloat;
        if (UserSession.StartAtY > dmR.cdsQuerydmKD.AsFloat) then UserSession.StartAtY := dmR.cdsQuerydmKD.AsFloat;
        if (UserSession.EndAtY < dmR.cdsQuerydmKD.AsFloat) then UserSession.EndAtY := dmR.cdsQuerydmKD.AsFloat;
        try
          dmR.cdsTempDataKD.Append;
          dmR.cdsTempDataKDIonID.AsString := dmR.cdsQuerydmIONID.AsString;
          dmR.cdsTempDataKDElement.AsString := dmR.cdsQuerydmELEMENT.AsString;
          dmR.cdsTempDataKDValence.AsInteger := dmR.cdsQuerydmVALENCE.AsInteger;
          dmR.cdsTempDataKDMolarity.AsFloat := dmR.cdsQuerydmMOLARITY1.AsFloat;
          dmR.cdsTempDataKDKD.AsFloat := dmR.cdsQuerydmKD.AsFloat;
          dmR.cdsTempDataKDIonName.AsString := dmR.cdsQuerydmELEMENT.AsString+' ('+dmR.cdsQuerydmVALENCE.AsString+')';
          dmR.cdsTempDataKD.Post;
        except
        end;
      dmR.cdsQuerydm.Next;
    until dmR.cdsQuerydm.EOF;
  finally
    dmR.cdsQuerydm.Close;
  end;
end;

end.

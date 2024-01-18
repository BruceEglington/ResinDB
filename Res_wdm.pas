
unit Res_wdm;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, DB,
  IBCustomDataSet, DBClient, Provider, IBDatabase, IBQuery;

type
  TWebDataModule1 = class(TWebDataModule)
    IBResin: TIBDatabase;
    Elements: TIBQuery;
    IBTransaction1: TIBTransaction;
    Reagents: TIBQuery;
    Resins: TIBQuery;
    Ions: TIBQuery;
    ColKDs: TIBQuery;
    dsReagents: TDataSource;
    dsElements: TDataSource;
    dspElements: TDataSetProvider;
    dspReagents: TDataSetProvider;
    dspResins: TDataSetProvider;
    dspIons: TDataSetProvider;
    dspColKDs: TDataSetProvider;
    cdsElements: TClientDataSet;
    cdsReagents: TClientDataSet;
    cdsResins: TClientDataSet;
    cdsIons: TClientDataSet;
    cdsColKDs: TClientDataSet;
    ElementsELEMENT: TIBStringField;
    ReagentsREAGENTID: TIBStringField;
    ReagentsREAGENTNAME: TIBStringField;
    ResinsRESINID: TIBStringField;
    ResinsRESINNAME: TIBStringField;
    ResinsRESIN: TIBStringField;
    ResinsXLINK: TIBStringField;
    IonsELEMENT: TIBStringField;
    IonsVALENCE: TIBStringField;
    ColKDsREAGENT1: TIBStringField;
    ColKDsREAGENT2: TIBStringField;
    ColKDsRESINID: TIBStringField;
    ColKDsELEMENT: TIBStringField;
    ColKDsVALENCE: TIBStringField;
    ColKDsMOLARITY1: TFloatField;
    ColKDsMOLARITY2: TFloatField;
    ColKDsKD: TFloatField;
    ColKDsRESINLOADINGMEQ: TFloatField;
    ColKDsCOMMENT: TMemoField;
    ColKDsREFERENCE: TMemoField;
    cdsElementsELEMENT: TStringField;
    cdsReagentsREAGENTID: TStringField;
    cdsReagentsREAGENTNAME: TStringField;
    cdsResinsRESINID: TStringField;
    cdsResinsRESINNAME: TStringField;
    cdsResinsRESIN: TStringField;
    cdsResinsXLINK: TStringField;
    cdsIonsELEMENT: TStringField;
    cdsIonsVALENCE: TStringField;
    cdsColKDsREAGENT1: TStringField;
    cdsColKDsREAGENT2: TStringField;
    cdsColKDsRESINID: TStringField;
    cdsColKDsELEMENT: TStringField;
    cdsColKDsVALENCE: TStringField;
    cdsColKDsMOLARITY1: TFloatField;
    cdsColKDsMOLARITY2: TFloatField;
    cdsColKDsKD: TFloatField;
    cdsColKDsRESINLOADINGMEQ: TFloatField;
    cdsColKDsCOMMENT: TMemoField;
    cdsColKDsREFERENCE: TMemoField;
    dsIons: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function WebDataModule1: TWebDataModule1;

implementation

{$R *.dfm} 

uses WebReq, WebCntxt, WebFact, Variants;

function WebDataModule1: TWebDataModule1;
begin
  Result := TWebDataModule1(WebContext.FindModuleClass(TWebDataModule1));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebDataModuleFactory.Create(TWebDataModule1, crOnDemand, caCache));

end.

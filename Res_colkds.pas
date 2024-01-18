
unit Res_colkds;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd,
  WebForm, MidItems, WebComp, DBAdapt, WebAdapt, CompProd, PagItems,
  SiteProd;

type
  TColKd = class(TWebPageModule)
    AdapterPageProducer: TAdapterPageProducer;
    dsaElements: TDataSetAdapter;
    dsaIons: TDataSetAdapter;
    dsaColKds: TDataSetAdapter;
    AdaptREAGENT1: TDataSetAdapterField;
    AdaptREAGENT2: TDataSetAdapterField;
    AdaptRESINID: TDataSetAdapterField;
    AdaptELEMENT: TDataSetAdapterField;
    AdaptVALENCE: TDataSetAdapterField;
    AdaptMOLARITY1: TDataSetAdapterField;
    AdaptMOLARITY2: TDataSetAdapterField;
    AdaptKD: TDataSetAdapterField;
    AdaptRESINLOADINGMEQ: TDataSetAdapterField;
    AdaptCOMMENT: TDataSetAdapterMemoField;
    AdaptREFERENCE: TDataSetAdapterMemoField;
    AdaptELEMENT2: TDataSetAdapterField;
    AdaptELEMENT3: TDataSetAdapterField;
    AdaptVALENCE2: TDataSetAdapterField;
    AdapterForm1: TAdapterForm;
    AdapterFieldGroupElements: TAdapterFieldGroup;
    FldELEMENT: TAdapterDisplayField;
    AdapterFieldGroupIons: TAdapterFieldGroup;
    FldELEMENT2: TAdapterDisplayField;
    FldVALENCE: TAdapterDisplayField;
    AdapterGrid1: TAdapterGrid;
    ColREAGENT1: TAdapterDisplayColumn;
    ColREAGENT2: TAdapterDisplayColumn;
    ColRESINID: TAdapterDisplayColumn;
    ColELEMENT: TAdapterDisplayColumn;
    ColVALENCE: TAdapterDisplayColumn;
    ColMOLARITY1: TAdapterDisplayColumn;
    ColMOLARITY2: TAdapterDisplayColumn;
    ColKD: TAdapterDisplayColumn;
    dsaReagents: TDataSetAdapter;
    AdaptREAGENTID: TDataSetAdapterField;
    AdaptREAGENTNAME: TDataSetAdapterField;
    AdapterFieldGroupReagents: TAdapterFieldGroup;
    FldREAGENTNAME: TAdapterDisplayField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function ColKd: TColKd;

implementation

{$R *.dfm}  {*.html}

uses WebReq, WebCntxt, WebFact, Variants, Res_wdm;

function ColKd: TColKd;
begin
  Result := TColKd(WebContext.FindModuleClass(TColKd));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TColKd, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), crOnDemand, caCache));

end.

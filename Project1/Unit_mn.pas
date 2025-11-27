unit Unit_mn;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, Vcl.Controls,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWCompButton;

type
  TIWForm_mn = class(TIWAppForm)
    IWButton1: TIWButton;
  public
  end;

implementation

{$R *.dfm}

uses Unit_dm, ServerController, Resin_dm;


initialization
  TIWForm_mn.SetAsMainForm;

end.

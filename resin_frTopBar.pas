unit resin_frTopBar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, IWBaseControl, IWControl, IWHTMLControls,
  IWCompLabel, IWHTMLTag, IWCompEdit, IWCompRectangle,
  IWContainer, IWRegion, IWVCLBaseControl, IWBaseHTMLControl,
  IWVCLBaseContainer, IWHTMLContainer, IWHTML40Container;

type
  TISFTopBar = class(TFrame)
    IWFrameRegion: TIWRegion;
    rectBlackTop: TIWRectangle;
    rectRedTop: TIWRectangle;
    lnkSignIn: TIWLink;
    IWRectangleTitle: TIWRectangle;
    lblWelcome: TIWLabel;
    iwlSignOut: TIWLink;
    procedure SignIn(Sender: TObject);
    procedure iwlSignOutClick(Sender: TObject);
  private
  public
  end;

implementation
{$R *.dfm}

uses
  IWInit, IWAppForm,
  ServerController,
  IWApplication, resin_constants, usr_uDBInterface;

procedure TISFTopBar.SignIn(Sender: TObject);
begin
  UserSession.NeedLogin(TIWAppFormClass(WebApplication.ActiveForm.ClassType));
end;



procedure TISFTopBar.iwlSignOutClick(Sender: TObject);
begin
  {need to add code here to save user choices before closing session}
  try
    UserSession.SetCookies;
  finally
    WebApplication.TerminateAndRedirect(GetURLonTerminate(UserSession.ThisProgram));
  end;
end;

end.


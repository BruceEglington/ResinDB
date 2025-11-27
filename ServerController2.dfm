object IWServerController: TIWServerController
  AppName = 'MyApp'
  Description = 'My IntraWeb Application'
  DisplayName = 'IntraWeb Application'
  Log = loFile
  Port = 8084
  URLBase = '/resindb/'
  Version = '15.6.1'
  BackButtonOptions.ShowMessage = True
  BackButtonOptions.WarningMessage = 'Please use the buttons in the app'
  OnNewSession = IWServerControllerBaseNewSession
  Height = 310
  Width = 342
end

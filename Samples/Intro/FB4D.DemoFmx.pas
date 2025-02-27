﻿{******************************************************************************}
{                                                                              }
{  Delphi FB4D Library                                                         }
{  Copyright (c) 2018-2021 Christoph Schneider                                 }
{  Schneider Infosystems AG, Switzerland                                       }
{  https://github.com/SchneiderInfosystems/FB4D                                }
{                                                                              }
{******************************************************************************}
{                                                                              }
{  Licensed under the Apache License, Version 2.0 (the "License");             }
{  you may not use this file except in compliance with the License.            }
{  You may obtain a copy of the License at                                     }
{                                                                              }
{      http://www.apache.org/licenses/LICENSE-2.0                              }
{                                                                              }
{  Unless required by applicable law or agreed to in writing, software         }
{  distributed under the License is distributed on an "AS IS" BASIS,           }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.    }
{  See the License for the specific language governing permissions and         }
{  limitations under the License.                                              }
{                                                                              }
{******************************************************************************}

unit FB4D.DemoFmx;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.StrUtils, System.JSON,
{$IFNDEF LINUX64}
  System.Sensors,
{$ENDIF}
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Edit, FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.TabControl, FMX.DateTimeCtrls, FMX.ListBox, FMX.Layouts, FMX.EditBox,
  FMX.SpinBox, FMX.Memo.Types,
  FB4D.Interfaces, FB4D.RealTimeDB;

type
  TfmxFirebaseDemo = class(TForm)
    edtProjectID: TEdit;
    Text1: TText;
    TabControl: TTabControl;
    tabAuth: TTabItem;
    edtKey: TEdit;
    Text2: TText;
    btnLogin: TButton;
    Label5: TLabel;
    edtToken: TEdit;
    Label6: TLabel;
    edtUID: TEdit;
    Label1: TLabel;
    edtEmail: TEdit;
    Label2: TLabel;
    edtPassword: TEdit;
    memUser: TMemo;
    btnRefresh: TButton;
    lblTokenExp: TLabel;
    timRefresh: TTimer;
    tabStorage: TTabItem;
    Label9: TLabel;
    edtStorageBucket: TEdit;
    btnGetStorageSynch: TButton;
    btnGetStorageAsynch: TButton;
    Label10: TLabel;
    memStorageResp: TMemo;
    btnDownloadSync: TButton;
    btnDownloadAsync: TButton;
    SaveDialog: TSaveDialog;
    btnUploadSynch: TButton;
    btnUploadAsynch: TButton;
    OpenDialog: TOpenDialog;
    Label11: TLabel;
    btnDeleteSync: TButton;
    btnDeleteAsync: TButton;
    tabScanRTEvent: TTabItem;
    btnNotifyEvent: TButton;
    memScans: TMemo;
    btnStopEvent: TButton;
    tabRealTimeDB: TTabItem;
    btnPutRTSynch: TButton;
    btnPostRTSynch: TButton;
    edtPutKeyName: TEdit;
    memRTDB: TMemo;
    btnGetRTSynch: TButton;
    btnSignUpNewUser: TButton;
    btnPasswordReset: TButton;
    tabFirestore: TTabItem;
    btnGet: TButton;
    edtCollection: TEdit;
    edtDocument: TEdit;
    Label4: TLabel;
    Label7: TLabel;
    memFirestore: TMemo;
    btnCreateDocument: TButton;
    btnInsertOrUpdateDocument: TButton;
    TabControlUser: TTabControl;
    tabInfo: TTabItem;
    tabUserProfile: TTabItem;
    edtChangeEMail: TEdit;
    txtEMail: TText;
    edtChangeDisplayName: TEdit;
    Text3: TText;
    btnChange: TButton;
    btnChangeEMail: TButton;
    edtChangePassword: TEdit;
    Text4: TText;
    btnChangePwd: TButton;
    edtChangePhotoURL: TEdit;
    txtPhotoURL: TText;
    btnChangePhotoURL: TButton;
    btnGetUserData: TButton;
    edtPath: TEdit;
    Label3: TLabel;
    btnGetRT: TButton;
    Label8: TLabel;
    edtPutKeyValue: TEdit;
    Label12: TLabel;
    lstDBNode: TListBox;
    TabControlRTDB: TTabControl;
    tabGet: TTabItem;
    tabPut: TTabItem;
    tabPost: TTabItem;
    Label13: TLabel;
    aniGetRT: TAniIndicator;
    btnAddUpdateNode: TButton;
    btnClearNode: TButton;
    btnPutRTAsynch: TButton;
    aniPutRT: TAniIndicator;
    Label14: TLabel;
    edtColumName: TEdit;
    Label15: TLabel;
    cboOrderBy: TComboBox;
    spbLimitToFirst: TSpinBox;
    Label16: TLabel;
    spbLimitToLast: TSpinBox;
    Label17: TLabel;
    Label18: TLabel;
    tabPatch: TTabItem;
    btnPatchRTSynch: TButton;
    Label19: TLabel;
    edtPatchKeyName: TEdit;
    Label20: TLabel;
    edtPatchKeyValue: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    edtPostKeyName: TEdit;
    Label23: TLabel;
    edtPostKeyValue: TEdit;
    Label24: TLabel;
    tabDelete: TTabItem;
    tabServerVars: TTabItem;
    btnDelRTSynch: TButton;
    Label25: TLabel;
    btnGetServerTimeStamp: TButton;
    btnPatchRTAsynch: TButton;
    aniPatchRT: TAniIndicator;
    aniPostRT: TAniIndicator;
    btnPostRTAsynch: TButton;
    btnDelRTAsynch: TButton;
    aniDeleteRT: TAniIndicator;
    edtRTDBEventPath: TEdit;
    Label26: TLabel;
    edtStorageObject: TEdit;
    edtStoragePath: TEdit;
    btnDeleteUserAccount: TButton;
    btnRunQuery: TButton;
    cboDemoDocType: TComboBox;
    btnDeleteDoc: TButton;
    btnPatchDoc: TButton;
    btnSendEMailVerification: TButton;
    chbUseChildDoc: TCheckBox;
    Label27: TLabel;
    Label28: TLabel;
    edtChildCollection: TEdit;
    edtChildDocument: TEdit;
    trbMinTestInt: TTrackBar;
    lblMinTestInt: TLabel;
    btnLinkEMailPwd: TButton;
    btnStartTransReadOnly: TButton;
    btnStopTrans: TButton;
    chbLimitTo10Docs: TCheckBox;
    chbUsePageToken: TCheckBox;
    tbFSListener: TTabItem;
    edtCollectionIDForFSListener: TEdit;
    Label29: TLabel;
    btnStartFSListener: TButton;
    btnStopFSListener: TButton;
    memScanFS: TMemo;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    edtDocPathForFSListener: TEdit;
    Label30: TLabel;
    edtFirebaseURL: TEdit;
    txtFirebaseURL: TText;
    lblFirebaseURL: TLabel;
    tabFunctions: TTabItem;
    edtFunctionName: TEdit;
    lblFunctionName: TLabel;
    btnCallFunctionSynchronous: TButton;
    btnCallFunctionAsynchronous: TButton;
    memFunctionResp: TMemo;
    edtParam1: TEdit;
    cboParams: TComboBox;
    Label31: TLabel;
    Label32: TLabel;
    edtParam1Val: TEdit;
    Label33: TLabel;
    edtParam2: TEdit;
    Label34: TLabel;
    edtParam2Val: TEdit;
    Label35: TLabel;
    edtParam3: TEdit;
    Label36: TLabel;
    edtParam3Val: TEdit;
    Label37: TLabel;
    edtParam4: TEdit;
    Label38: TLabel;
    edtParam4Val: TEdit;
    Label39: TLabel;
    procedure btnLoginClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure timRefreshTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGetStorageSynchClick(Sender: TObject);
    procedure btnGetStorageAsynchClick(Sender: TObject);
    procedure btnDownloadSyncClick(Sender: TObject);
    procedure btnDownloadAsyncClick(Sender: TObject);
    procedure btnUploadSynchClick(Sender: TObject);
    procedure btnUploadAsynchClick(Sender: TObject);
    procedure btnDeleteSyncClick(Sender: TObject);
    procedure btnDeleteAsyncClick(Sender: TObject);
    procedure btnNotifyEventClick(Sender: TObject);
    procedure btnStopEventClick(Sender: TObject);
    procedure btnPutRTSynchClick(Sender: TObject);
    procedure btnPostRTSynchClick(Sender: TObject);
    procedure btnDelRTSynchClick(Sender: TObject);
    procedure btnPatchRTSynchClick(Sender: TObject);
    procedure btnGetRTSynchClick(Sender: TObject);
    procedure btnPasswordResetClick(Sender: TObject);
    procedure btnSignUpNewUserClick(Sender: TObject);
    procedure edtEmailChange(Sender: TObject);
    procedure TabControlChange(Sender: TObject);
    procedure btnGetClick(Sender: TObject);
    procedure btnCreateDocumentClick(Sender: TObject);
    procedure btnInsertOrUpdateDocumentClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnChangeEMailClick(Sender: TObject);
    procedure btnChangePwdClick(Sender: TObject);
    procedure btnChangePhotoURLClick(Sender: TObject);
    procedure btnGetUserDataClick(Sender: TObject);
    procedure btnGetServerTimeStampClick(Sender: TObject);
    procedure btnGetRTClick(Sender: TObject);
    procedure btnAddUpdateNodeClick(Sender: TObject);
    procedure btnClearNodeClick(Sender: TObject);
    procedure btnPutRTAsynchClick(Sender: TObject);
    procedure cboOrderByChange(Sender: TObject);
    procedure spbLimitToFirstChange(Sender: TObject);
    procedure spbLimitToLastChange(Sender: TObject);
    procedure btnPatchRTAsynchClick(Sender: TObject);
    procedure btnPostRTAsynchClick(Sender: TObject);
    procedure btnDelRTAsynchClick(Sender: TObject);
    procedure btnDeleteUserAccountClick(Sender: TObject);
    procedure btnDeleteDocClick(Sender: TObject);
    procedure btnPatchDocClick(Sender: TObject);
    procedure btnSendEMailVerificationClick(Sender: TObject);
    procedure chbUseChildDocChange(Sender: TObject);
    procedure btnRunQueryClick(Sender: TObject);
    procedure trbMinTestIntChange(Sender: TObject);
    procedure btnLinkEMailPwdClick(Sender: TObject);
    procedure btnStartTransReadOnlyClick(Sender: TObject);
    procedure btnStopTransClick(Sender: TObject);
    procedure edtDocumentChangeTracking(Sender: TObject);
    procedure btnStartFSListenerClick(Sender: TObject);
    procedure btnStopFSListenerClick(Sender: TObject);
    procedure btnCallFunctionSynchronousClick(Sender: TObject);
    procedure cboParamsChange(Sender: TObject);
    procedure btnCallFunctionAsynchronousClick(Sender: TObject);
  private
    fAuth: IFirebaseAuthentication;
    fStorageObject: IStorageObject;
    fDatabase: IFirestoreDatabase;
    fTransaction: TTransaction;
    fRealTimeDB: IRealTimeDB;
    fFirebaseEvent: IFirebaseEvent;
    fDownloadStream: TFileStream;
    fStorage: IFirebaseStorage;
    fUploadStream: TFileStream;
    fFirebaseFunction: IFirebaseFunctions;
    function CheckSignedIn(Log: TMemo): boolean;
    procedure DisplayUser(mem: TMemo; User: IFirebaseUser);
    procedure DisplayTokenJWT(mem: TMemo);
    procedure OnRecData(const Event: string; Params: TRequestResourceParam;
      JSONObj: TJSONObject);
    procedure OnRecDataError(const Info, ErrMsg: string);
    procedure OnRecDataStop(Sender: TObject);
    procedure ShowDocument(Doc: IFirestoreDocument);
    procedure CheckDocument;
    procedure OnUserResp(const Info: string; Response: IFirebaseResponse);
    procedure OnUserResponse(const Info: string; User: IFirebaseUser);
    procedure OnGetUserData(FirebaseUserList: TFirebaseUserList);
    procedure OnTokenRefresh(TokenRefreshed: boolean);
    procedure OnUserError(const Info, ErrMsg: string);
    function CheckAndCreateAuthenticationClass: boolean;
    function CheckAndCreateFirestoreDBClass(Log: TMemo): boolean;
    procedure OnFirestoreError(const Info, ErrMsg: string);
    procedure OnFirestoreGet(const Info: string; Docs: IFirestoreDocuments);
    procedure OnFirestoreCreate(const Info: string; Doc: IFirestoreDocument);
    procedure OnFirestoreInsertOrUpdate(const Info: string;
      Doc: IFirestoreDocument);
    procedure OnFirestoreDeleted(const RequestID: string;
      Response: IFirebaseResponse);
    procedure OnFSChangedDocInCollection(Doc: IFirestoreDocument);
    procedure OnFSChangedDoc(Doc: IFirestoreDocument);
    procedure OnFSDeletedDocCollection(const DelDocPath: string; TS: TDateTime);
    procedure OnFSDeletedDoc(const DelDocPath: string; TS: TDateTime);
    procedure OnFSStopListening(Sender: TObject);
    procedure OnFSRequestError(const RequestID, ErrMsg: string);
    procedure OnFSAuthRevoked(TokenRenewPassed: boolean);
    function CheckFirestoreFields(InsUpdGetWF: boolean): boolean;
    function CheckAndCreateRealTimeDBClass(Log: TMemo): boolean;
    function GetRTDBPath: TStringDynArray;
    function GetOptions: TQueryParams;
    function GetPathFromResParams(ResParams: TRequestResourceParam): string;
    procedure ShowRTNode(ResourceParams: TRequestResourceParam; Val: TJSONValue);
    procedure OnGetResp(ResourceParams: TRequestResourceParam; Val: TJSONValue);
    procedure OnGetError(const RequestID, ErrMsg: string);
    procedure OnPutResp(ResourceParams: TRequestResourceParam; Val: TJSONValue);
    procedure OnPutError(const RequestID, ErrMsg: string);
    procedure OnPatchResp(ResourceParams: TRequestResourceParam; Val: TJSONValue);
    procedure OnPatchError(const RequestID, ErrMsg: string);
    procedure OnPostResp(ResourceParams: TRequestResourceParam; Val: TJSONValue);
    procedure OnPostError(const RequestID, ErrMsg: string);
    procedure OnDeleteResp(Params: TRequestResourceParam; Success: boolean);
    procedure OnDeleteError(const RequestID, ErrMsg: string);
    function CheckAndCreateStorageClass: boolean;
    procedure ShowFirestoreObject(Obj: IStorageObject);
    function GetStorageFileName: string;
    procedure OnGetStorage(Obj: IStorageObject);
    procedure OnGetStorageError(const ObjectName, ErrMsg: string);
    procedure OnDownload(Obj: IStorageObject);
    procedure OnDownloadError(Obj: IStorageObject; const ErrorMsg: string);
    procedure OnUpload(Obj: IStorageObject);
    procedure OnUploadError(const ObjectName, ErrorMsg: string);
    procedure OnDeleteStorage(const ObjectName: TObjectName);
    procedure OnDeleteStorageError(const ObjectName, ErrorMsg: string);
    function CheckAndCreateFunctionClass: boolean;
    procedure OnFunctionSuccess(const Info: string; ResultObj: TJSONObject);
    procedure OnFunctionError(const RequestID, ErrMsg: string);
  end;

var
  fmxFirebaseDemo: TfmxFirebaseDemo;

implementation

{$R *.fmx}

uses
  System.Generics.Collections, System.IniFiles, System.IOUtils, System.RTTI,
  REST.Types,
  FB4D.Authentication, FB4D.Helpers,
{$IFDEF TOKENJWT}
  FB4D.OAuth,
{$ENDIF}
  FB4D.Response, FB4D.Request, FB4D.Functions, FB4D.Storage,
  FB4D.Firestore, FB4D.Document, FB4D.Configuration;

{$REGION 'Form Handling'}
procedure TfmxFirebaseDemo.FormShow(Sender: TObject);
var
  IniFile: TIniFile;
begin
  Caption := Caption + ' - ' + TFirebaseHelpers.GetPlatform +
    ' [' + TFirebaseConfiguration.GetLibVersionInfo + ']';
  OpenDialog.Filter := TBitmapCodecManager.GetFilterString;
  TabControl.ActiveTab := tabAuth;
  IniFile := TIniFile.Create(IncludeTrailingPathDelimiter(TPath.GetHomePath) +
    ChangeFileExt(ExtractFileName(ParamStr(0)), '.ini'));
  try
    edtKey.Text := IniFile.ReadString('FBProjectSettings', 'APIKey', '');
    edtProjectID.Text := IniFile.ReadString('FBProjectSettings', 'ProjectID',
      '');
    edtEmail.Text := IniFile.ReadString('Authentication', 'User', '');
    edtPassword.Text := IniFile.ReadString('Authentication', 'Pwd', '');
    if not edtKey.Text.IsEmpty and not edtProjectID.Text.IsEmpty then
      // Downward compatibility for databases created before 2021
      edtFirebaseURL.Text := IniFile.ReadString('RTDB', 'FirebaseURL',
        Format(GOOGLE_FIREBASE, [edtProjectID.Text]))
    else
      edtFirebaseURL.Text := IniFile.ReadString('RTDB', 'FirebaseURL', '');
    edtPath.Text := IniFile.ReadString('RTDB', 'DBPath', 'TestNode');
    edtRTDBEventPath.Text := IniFile.ReadString('RTDBEvent', 'DBPath',
      'TestNode');
    edtStorageBucket.Text := IniFile.ReadString('Storage', 'Bucket', '');
    edtStorageObject.Text := IniFile.ReadString('Storage', 'Object', '');
    edtStoragePath.Text := IniFile.ReadString('Storage', 'Path', '');
    edtCollection.Text := IniFile.ReadString('Firestore', 'Collection', '');
    edtDocument.Text := IniFile.ReadString('Firestore', 'Document', '');
    chbUseChildDoc.IsChecked := IniFile.ReadBool('Firestore', 'UseChild', false);
    chbLimitTo10Docs.IsChecked := IniFile.ReadBool('Firestore', 'Limited', false);
    edtChildCollection.Text := IniFile.ReadString('Firestore', 'ChildCol', '');
    edtChildDocument.Text := IniFile.ReadString('Firestore', 'ChildDoc', '');
    cboDemoDocType.ItemIndex := IniFile.ReadInteger('Firestore', 'DocType', 0);
    btnRunQuery.Enabled := IniFile.ReadBool('Firestore', 'RunQueryEnabled', false);
    edtCollectionIDForFSListener.Text := IniFile.ReadString('Firestore',
      'ListenerColID', '');
    edtDocPathForFSListener.Text := IniFile.ReadString('Firestore', 'DocPath', '');
    edtFunctionName.Text := IniFile.ReadString('Function', 'FuncName', '');
    cboParams.ItemIndex := IniFile.ReadInteger('Function', 'ParamCount', 0);
    edtParam1.Text := IniFile.ReadString('Function', 'Param1', '');
    edtParam1Val.Text := IniFile.ReadString('Function', 'Param1Val', '');
    edtParam2.Text := IniFile.ReadString('Function', 'Param2', '');
    edtParam2Val.Text := IniFile.ReadString('Function', 'Param2Val', '');
    edtParam3.Text := IniFile.ReadString('Function', 'Param3', '');
    edtParam3Val.Text := IniFile.ReadString('Function', 'Param3Val', '');
    edtParam4.Text := IniFile.ReadString('Function', 'Param4', '');
    edtParam4Val.Text := IniFile.ReadString('Function', 'Param4Val', '');
  finally
    IniFile.Free;
  end;
  CheckDocument;
  cboParamsChange(nil);
end;

procedure TfmxFirebaseDemo.FormClose(Sender: TObject; var Action: TCloseAction);
var
  IniFile: TIniFile;
begin
  if assigned(fRealTimeDB) and assigned(fFirebaseEvent) then
    fFirebaseEvent.StopListening;

  IniFile := TIniFile.Create(IncludeTrailingPathDelimiter(TPath.GetHomePath) +
    ChangeFileExt(ExtractFileName(ParamStr(0)), '.ini'));
  try
    IniFile.WriteString('FBProjectSettings', 'APIKey', edtKey.Text);
    IniFile.WriteString('FBProjectSettings', 'ProjectID', edtProjectID.Text);
    IniFile.WriteString('Authentication', 'User', edtEmail.Text);
    {$MESSAGE 'Attention: Password will be stored in your inifile in clear text'}
    IniFile.WriteString('Authentication', 'Pwd', edtPassword.Text);
    IniFile.WriteString('RTDB', 'FirebaseURL', edtFirebaseURL.Text);
    IniFile.WriteString('RTDB', 'DBPath', edtPath.Text);
    IniFile.WriteString('RTDBEvent', 'DBPath', edtRTDBEventPath.Text);
    IniFile.WriteString('Storage', 'Bucket', edtStorageBucket.Text);
    IniFile.WriteString('Storage', 'Object', edtStorageObject.Text);
    IniFile.WriteString('Storage', 'Path', edtStoragePath.Text);
    IniFile.WriteString('Firestore', 'Collection', edtCollection.Text);
    IniFile.WriteString('Firestore', 'Document', edtDocument.Text);
    IniFile.WriteBool('Firestore', 'UseChild', chbUseChildDoc.IsChecked);
    IniFile.WriteBool('Firestore', 'Limited', chbLimitTo10Docs.IsChecked);
    IniFile.WriteString('Firestore', 'ChildCol', edtChildCollection.Text);
    IniFile.WriteString('Firestore', 'ChildDoc', edtChildDocument.Text);
    IniFile.WriteInteger('Firestore', 'DocType', cboDemoDocType.ItemIndex);
    IniFile.WriteBool('Firestore', 'RunQueryEnabled', btnRunQuery.Enabled);
    IniFile.WriteString('Firestore', 'ListenerColID',
      edtCollectionIDForFSListener.Text);
    IniFile.WriteString('Firestore', 'DocPath', edtDocPathForFSListener.Text);
    IniFile.WriteString('Function', 'FuncName', edtFunctionName.Text);
    IniFile.WriteInteger('Function', 'ParamCount', cboParams.ItemIndex);
    IniFile.WriteString('Function', 'Param1', edtParam1.Text);
    IniFile.WriteString('Function', 'Param1Val', edtParam1Val.Text);
    IniFile.WriteString('Function', 'Param2', edtParam2.Text);
    IniFile.WriteString('Function', 'Param2Val', edtParam2Val.Text);
    IniFile.WriteString('Function', 'Param3', edtParam3.Text);
    IniFile.WriteString('Function', 'Param3Val', edtParam3Val.Text);
    IniFile.WriteString('Function', 'Param4', edtParam4.Text);
    IniFile.WriteString('Function', 'Param4Val', edtParam4Val.Text);
  finally
    IniFile.Free;
  end;
end;

procedure TfmxFirebaseDemo.TabControlChange(Sender: TObject);
begin
  if assigned(fAuth) and (TabControl.ActiveTab = tabAuth) and
    (edtToken.Text <> fAuth.Token) then
  begin
    lblTokenExp.Text := 'expires at ' + DateTimeToStr(fAuth.TokenExpiryDT);
    edtToken.Text := fAuth.Token;
    memUser.Lines.Add('Token automatically refreshed ' + fAuth.GetRefreshToken);
  end;
end;
{$ENDREGION }

{$REGION 'Authentication'}
function TfmxFirebaseDemo.CheckAndCreateAuthenticationClass: boolean;
begin
  result := true;
  if not assigned(fAuth) then
  begin
    if edtKey.Text.IsEmpty then
    begin
      memUser.Lines.Add('Enter Web API Key frist');
      memUser.GoToTextEnd;
      exit(false);
    end;
    fAuth := TFirebaseAuthentication.Create(edtKey.Text);
    edtKey.ReadOnly := true;
  end;
end;

procedure TfmxFirebaseDemo.btnLoginClick(Sender: TObject);
begin
  if not CheckAndCreateAuthenticationClass then
    exit;
  if edtEMail.Text.IsEmpty then
  begin
    fAuth.SignInAnonymously(OnUserResponse, OnUserError);
    btnLinkEMailPwd.Visible := true;
    btnSignUpNewUser.Visible := false;
  end else
    fAuth.SignInWithEmailAndPassword(edtEmail.Text, edtPassword.Text,
      OnUserResponse, OnUserError);
end;

procedure TfmxFirebaseDemo.btnSignUpNewUserClick(Sender: TObject);
begin
  if not CheckAndCreateAuthenticationClass then
    exit;
  fAuth.SignUpWithEmailAndPassword(edtEmail.Text, edtPassword.Text,
    OnUserResponse, OnUserError);
end;

procedure TfmxFirebaseDemo.btnLinkEMailPwdClick(Sender: TObject);
begin
  fAuth.LinkWithEMailAndPassword(edtEmail.Text, edtPassword.Text,
    OnUserResponse, OnUserError);
  btnLinkEMailPwd.Visible := false;
  btnLogin.Visible := true;
end;

procedure TfmxFirebaseDemo.OnUserResponse(const Info: string;
  User: IFirebaseUser);
begin
  memUser.Lines.Clear;
  DisplayUser(memUser, User);
  edtToken.Text := fAuth.Token;
  edtUID.Text := User.UID;
  lblTokenExp.Text := 'expires at ' + DateTimeToStr(fAuth.TokenExpiryDT);
  btnRefresh.Enabled := false;
  btnRefresh.Visible := fAuth.Authenticated;
  btnPasswordReset.Visible := not fAuth.Authenticated;
  timRefresh.Enabled := btnRefresh.Visible;
  btnLogin.Visible := not User.IsNewSignupUser;
  btnSignUpNewUser.Visible := User.IsNewSignupUser;
end;

procedure TfmxFirebaseDemo.OnUserResp(const Info: string;
  Response: IFirebaseResponse);
begin
  if Response.StatusOk then
    memUser.Lines.Add(Info + ' done')
  else if not Response.ErrorMsg.IsEmpty then
    memUser.Lines.Add(Info + ' failed: ' + Response.ErrorMsg)
  else
    memUser.Lines.Add(Info + ' failed: ' + Response.StatusText);
end;

procedure TfmxFirebaseDemo.OnUserError(const Info, ErrMsg: string);
begin
  memUser.Lines.Add(Info + ' failed: ' + ErrMsg);
  ShowMessage(Info + ' failed: ' + ErrMsg);
end;

procedure TfmxFirebaseDemo.btnPasswordResetClick(Sender: TObject);
begin
  if not CheckAndCreateAuthenticationClass then
    exit;
  fAuth.SendPasswordResetEMail(edtEmail.Text, OnUserResp, OnUserError);
end;

procedure TfmxFirebaseDemo.edtDocumentChangeTracking(Sender: TObject);
begin
  CheckDocument;
end;

procedure TfmxFirebaseDemo.edtEmailChange(Sender: TObject);
begin
  if edtEmail.Text.IsEmpty then
    btnLogin.Text := 'Anonymous Login'
  else
    btnLogin.Text := 'Login';
  btnPasswordReset.Enabled := not edtEmail.Text.IsEmpty;
end;

procedure TfmxFirebaseDemo.btnRefreshClick(Sender: TObject);
begin
  if fAuth.NeedTokenRefresh then
    fAuth.RefreshToken(OnTokenRefresh, onUserError);
end;

procedure TfmxFirebaseDemo.OnTokenRefresh(TokenRefreshed: boolean);
begin
  if TokenRefreshed then
  begin
    memUser.Lines.Add('Token refreshed at ' + DateTimeToStr(now));
    edtToken.Text := fAuth.Token;
    DisplayTokenJWT(memUser);
    lblTokenExp.Text := 'expires at ' + DateTimeToStr(fAuth.TokenExpiryDT);
    memUser.Lines.Add('Refresh token ' + fAuth.GetRefreshToken);
  end else
    memUser.Lines.Add('Token refresh failed at ' + DateTimeToStr(now));
end;

procedure TfmxFirebaseDemo.DisplayTokenJWT(mem: TMemo);
{$IFDEF TOKENJWT}
var
  c: integer;
begin
  if assigned(fAuth.TokenJWT) then
  begin
    mem.Lines.Add('JWT.Header:');
    for c := 0 to fAuth.TokenJWT.Header.JSON.Count - 1 do
      mem.Lines.Add('  ' +
        fAuth.TokenJWT.Header.JSON.Pairs[c].JsonString.Value + ': ' +
        fAuth.TokenJWT.Header.JSON.Pairs[c].JsonValue.Value);
    mem.Lines.Add('JWT.Claims:');
    for c := 0 to fAuth.TokenJWT.Claims.JSON.Count - 1 do
      if fAuth.TokenJWT.Claims.JSON.Pairs[c].JsonValue is TJSONString then
        mem.Lines.Add('  ' +
          fAuth.TokenJWT.Claims.JSON.Pairs[c].JsonString.Value + ': ' +
          fAuth.TokenJWT.Claims.JSON.Pairs[c].JsonValue.Value)
      else
        mem.Lines.Add('  ' +
          fAuth.TokenJWT.Claims.JSON.Pairs[c].JsonString.Value + ': ' +
          fAuth.TokenJWT.Claims.JSON.Pairs[c].JsonValue.ToJSON);
    if fAuth.TokenJWT.VerifySignature then
      mem.Lines.Add('Token signatur verified')
    else
      mem.Lines.Add('Token signatur broken');
  end else
    mem.Lines.Add('No JWT Token');
end;
{$ELSE}
begin
  mem.Lines.Add('No JWT Support');
end;
{$ENDIF}

procedure TfmxFirebaseDemo.DisplayUser(mem: TMemo; User: IFirebaseUser);
var
  c: Integer;
begin
  mem.Lines.Add('UID: ' + User.UID);
  case User.IsDisabled of
    tsbTrue:
      memUser.Lines.Add('  User is disabled');
    tsbFalse:
      memUser.Lines.Add('  User is not disabled');
  end;
  if User.IsDisplayNameAvailable then
    mem.Lines.Add('Display name: ' + User.DisplayName);
  if User.IsEMailAvailable then
  begin
    mem.Lines.Add('EMail: ' + User.EMail);
    case User.IsEMailVerified of
      tsbTrue:
        memUser.Lines.Add('  EMail is verified');
      tsbFalse:
        memUser.Lines.Add('  EMail is not verified');
    end;
  end;
  if User.IsCreatedAtAvailable then
    mem.Lines.Add('User created at: ' + DateTimeToStr(User.CreatedAt));
  if User.IsLastLoginAtAvailable then
    mem.Lines.Add('Last login at: ' + DateTimeToStr(User.LastLoginAt));
  if User.IsPhotoURLAvailable then
    mem.Lines.Add('Photo URL: ' + User.PhotoURL);
  mem.Lines.Add('Refresh token ' + fAuth.GetRefreshToken);
  DisplayTokenJWT(memUser);
  if not edtEMail.Text.IsEmpty then
  begin
    if User.IsDisplayNameAvailable then
      edtChangeDisplayName.Text := User.DisplayName
    else
      edtChangeDisplayName.Text := 'n/a';
    if User.IsEMailAvailable then
      edtChangeEMail.Text := User.EMail
    else
      edtChangeEMail.Text := 'n/a';
    if User.IsPhotoURLAvailable then
      edtChangePhotoURL.Text := User.PhotoURL
    else
      edtChangePhotoURL.Text := '';
  end;
  if User.ProviderCount > 0 then
  begin
    mem.Lines.Add(Format('%d Providers:', [User.ProviderCount]));
    for c := 0 to User.ProviderCount - 1 do
    begin
      mem.Lines.Add(Format('  [%d] Provider Id: %s',
        [c + 1, User.Provider(c).ProviderId]));
      if not User.Provider(c).FederatedId.IsEmpty then
        mem.Lines.Add(Format('  [%d] Federated Id: %s',
          [c + 1, User.Provider(c).FederatedId]));
      if not User.Provider(c).RawId.IsEmpty then
        mem.Lines.Add(Format('  [%d] Raw Id: %s',
          [c + 1, User.Provider(c).RawId]));
      if not User.Provider(c).Email.IsEmpty then
        mem.Lines.Add(Format('  [%d] Email: %s',
          [c + 1, User.Provider(c).Email]));
      if not User.Provider(c).DisplayName.IsEmpty then
        mem.Lines.Add(Format('  [%d] Display Name: %s',
          [c + 1, User.Provider(c).DisplayName]));
      if not User.Provider(c).ScreenName.IsEmpty then
        mem.Lines.Add(Format('  [%d] Screen Name: %s',
          [c + 1, User.Provider(c).ScreenName]));
    end;
  end;
end;

procedure TfmxFirebaseDemo.btnGetUserDataClick(Sender: TObject);
begin
  memUser.Lines.Clear;
  fAuth.GetUserData(OnGetUserData, OnUserError);
end;

procedure TfmxFirebaseDemo.OnGetUserData(
  FirebaseUserList: TFirebaseUserList);
var
  User: IFirebaseUser;
begin
  for User in FirebaseUserList do
    DisplayUser(memUser, User);
end;

procedure TfmxFirebaseDemo.btnChangeClick(Sender: TObject);
begin
  fAuth.ChangeProfile('', '', edtChangeDisplayName.Text, '', OnUserResp,
    OnUserError);
end;

procedure TfmxFirebaseDemo.btnChangeEMailClick(Sender: TObject);
begin
  fAuth.ChangeProfile(edtChangeEMail.Text, '', '', '', OnUserResp,
    OnUserError);
end;

procedure TfmxFirebaseDemo.btnChangePwdClick(Sender: TObject);
begin
  fAuth.ChangeProfile('', edtChangePassword.Text, '', '', OnUserResp,
    OnUserError);
end;

procedure TfmxFirebaseDemo.btnChangePhotoURLClick(Sender: TObject);
begin
  fAuth.ChangeProfile('', '', '', edtChangePhotoURL.Text, OnUserResp,
    OnUserError);
end;

procedure TfmxFirebaseDemo.timRefreshTimer(Sender: TObject);
begin
  if assigned(fAuth) then
    btnRefresh.Enabled := fAuth.NeedTokenRefresh;
end;

function TfmxFirebaseDemo.CheckSignedIn(Log: TMemo): boolean;
begin
  if assigned(fAuth) and fAuth.Authenticated then
    result := true
  else begin
    Log.Lines.Add('Please sign in first!');
    Log.GoToTextEnd;
    result := false;
  end;
end;

procedure TfmxFirebaseDemo.btnDeleteUserAccountClick(Sender: TObject);
begin
  fAuth.DeleteCurrentUser(OnUserResp, OnUserError);
end;

procedure TfmxFirebaseDemo.btnSendEMailVerificationClick(Sender: TObject);
begin
  if not CheckAndCreateAuthenticationClass then
    exit;
  fAuth.SendEmailVerification(OnUserResp, OnUserError);
end;
{$ENDREGION}

{$REGION 'Storage'}
function TfmxFirebaseDemo.CheckAndCreateStorageClass: boolean;
begin
  if assigned(fStorage) then
    exit(true)
  else if not CheckSignedIn(memStorageResp) then
    exit(false)
  else if edtStorageBucket.Text.IsEmpty then
  begin
    memStorageResp.Lines.Add('Please enter the Storage bucket first!');
    memStorageResp.GoToTextEnd;
    edtStorageBucket.SetFocus;
    exit(false);
  end;
  fStorage := TFirebaseStorage.Create(edtStorageBucket.Text, fAuth);
  edtStorageBucket.enabled := false;
  result := true;
end;

function TfmxFirebaseDemo.GetStorageFileName: string;
begin
  result := edtStoragePath.Text;
  if (result.Length > 0) and (result[High(result)] <> '/') then
    result := result + '/';
  result := result + edtStorageObject.Text;
end;

procedure TfmxFirebaseDemo.btnGetStorageSynchClick(Sender: TObject);
begin
  if not CheckAndCreateStorageClass then
    exit;
  fStorageObject := fStorage.GetSynchronous(GetStorageFileName);
  memStorageResp.Lines.Text := 'Storage object synchronous retrieven';
  ShowFirestoreObject(fStorageObject);
  if assigned(fStorageObject) then
    btnDownloadSync.Enabled := fStorageObject.DownloadToken > ''
  else
    btnDownloadSync.Enabled := false;
  btnDownloadAsync.Enabled := btnDownloadSync.Enabled;
  btnDeleteSync.Enabled := btnDownloadSync.Enabled;
  btnDeleteAsync.Enabled := btnDeleteSync.Enabled;
end;

procedure TfmxFirebaseDemo.btnGetStorageAsynchClick(Sender: TObject);
begin
  if not CheckAndCreateStorageClass then
    exit;
  fStorage.Get(GetStorageFileName, OnGetStorage, OnGetStorageError);
end;

procedure TfmxFirebaseDemo.OnGetStorage(Obj: IStorageObject);
begin
  memStorageResp.Lines.Text := 'Storage object asynchronous retrieven';
  ShowFirestoreObject(Obj);
  if assigned(Obj) then
    btnDownloadSync.Enabled := Obj.DownloadToken > ''
  else
    btnDownloadSync.Enabled := false;
  btnDownloadAsync.Enabled := btnDownloadSync.Enabled;
  btnDeleteSync.Enabled := btnDownloadSync.Enabled;
  btnDeleteAsync.Enabled := btnDeleteSync.Enabled;
  fStorageObject := Obj;
end;

procedure TfmxFirebaseDemo.OnGetStorageError(const ObjectName, ErrMsg: string);
begin
  memStorageResp.Lines.Text := 'Error while asynchronous get for ' + ObjectName;
  memStorageResp.Lines.Add('Error: ' + ErrMsg);
end;

procedure TfmxFirebaseDemo.ShowFirestoreObject(Obj: IStorageObject);
var
  sizeInBytes: extended;
begin
  if assigned(Obj) then
  begin
    memStorageResp.Lines.Add('ObjectName: ' + Obj.ObjectName(false));
    memStorageResp.Lines.Add('Path: ' + Obj.Path);
    memStorageResp.Lines.Add('Type: ' + Obj.ContentType);
    sizeInBytes := Obj.Size;
    memStorageResp.Lines.Add('Size: ' + Format('%.0n bytes', [SizeInBytes]));
    memStorageResp.Lines.Add('Created: ' +
      DateTimeToStr(Obj.createTime));
    memStorageResp.Lines.Add('Updated: ' +
      DateTimeToStr(Obj.updateTime));
    memStorageResp.Lines.Add('Download URL: ' + Obj.DownloadUrl);
    memStorageResp.Lines.Add('Download Token: ' + Obj.DownloadToken);
    memStorageResp.Lines.Add('MD5 hash code: ' + Obj.MD5HashCode);
    memStorageResp.Lines.Add('E-Tag: ' + Obj.etag);
    memStorageResp.Lines.Add('Generation: ' + IntTostr(Obj.generation));
    memStorageResp.Lines.Add('StorageClass: ' + Obj.storageClass);
    memStorageResp.Lines.Add('Meta Generation: ' +
      IntTostr(Obj.metaGeneration));
  end else
    memStorageResp.Lines.Text := 'No Storage object';
end;

procedure TfmxFirebaseDemo.btnDownloadAsyncClick(Sender: TObject);
begin
  Assert(assigned(fStorageObject), 'Storage object is missing');
  SaveDialog.FileName := fStorageObject.ObjectName(false);
  if SaveDialog.Execute then
  begin
    FreeAndNil(fDownloadStream);
    fDownloadStream := TFileStream.Create(SaveDialog.FileName, fmCreate);
    fStorageObject.DownloadToStream(fDownloadStream, OnDownload,
      OnDownloadError);
    memStorageResp.Lines.Add(fStorageObject.ObjectName(true) +
      ' download started');
  end;
end;

procedure TfmxFirebaseDemo.btnDownloadSyncClick(Sender: TObject);
var
  Stream: TFileStream;
begin
  Assert(assigned(fStorageObject), 'Storage object is missing');
  SaveDialog.FileName := fStorageObject.ObjectName(false);
  if SaveDialog.Execute then
  begin
    Stream := TFileStream.Create(SaveDialog.FileName, fmCreate);
    try
      fStorageObject.DownloadToStreamSynchronous(Stream);
      memStorageResp.Lines.Add(fStorageObject.ObjectName(true) +
        ' downloaded to ' + SaveDialog.FileName);
    finally
      Stream.Free;
    end;
  end;
end;

procedure TfmxFirebaseDemo.OnDownload(Obj: IStorageObject);
begin
  memStorageResp.Lines.Add(Obj.ObjectName(true) + ' downloaded to ' +
    SaveDialog.FileName + ' passed');
  FreeAndNil(fDownloadStream);
end;

procedure TfmxFirebaseDemo.OnDownloadError(Obj: IStorageObject;
  const ErrorMsg: string);
begin
  memStorageResp.Lines.Add(Obj.ObjectName(true) + ' downloaded to ' +
    SaveDialog.FileName + ' failed: ' + ErrorMsg);
  FreeAndNil(fDownloadStream);
end;

procedure TfmxFirebaseDemo.btnUploadSynchClick(Sender: TObject);
var
  fs: TFileStream;
  ExtType: string;
  ContentType: TRESTContentType;
  ObjectName: string;
  Obj: IStorageObject;
begin
  if not CheckAndCreateStorageClass then
    exit;
  if OpenDialog.Execute then
  begin
    ExtType := LowerCase(ExtractFileExt(OpenDialog.FileName).Substring(1));
    if (ExtType = 'jpg') or (ExtType = 'jpeg') then
      ContentType := TRESTContentType.ctIMAGE_JPEG
    else if ExtType = 'png' then
      ContentType := TRESTContentType.ctIMAGE_PNG
    else if ExtType = 'gif' then
      ContentType := TRESTContentType.ctIMAGE_GIF
    else if ExtType = 'mp4' then
      ContentType := TRESTContentType.ctVIDEO_MP4
    else
      ContentType := TRESTContentType.ctNone;
    edtStorageObject.Text := ExtractFilename(OpenDialog.FileName);
    ObjectName := GetStorageFileName;
    fs := TFileStream.Create(OpenDialog.FileName, fmOpenRead);
    try
      Obj := fStorage.UploadSynchronousFromStream(fs, ObjectName, ContentType);
      memStorageResp.Lines.Text := 'Object synchronous uploaded';
      ShowFirestoreObject(Obj);
    finally
      fs.Free;
    end;
  end;
end;

procedure TfmxFirebaseDemo.btnUploadAsynchClick(Sender: TObject);
var
  ExtType: string;
  ContentType: TRESTContentType;
  ObjectName: string;
begin
  if not CheckAndCreateStorageClass then
    exit;
  if assigned(fUploadStream) then
  begin
    memStorageResp.Lines.Add('Wait until previous upload is finisehd');
    memStorageResp.GoToTextEnd;
  end;
  if OpenDialog.Execute then
  begin
    ExtType := LowerCase(ExtractFileExt(OpenDialog.FileName).Substring(1));
    if (ExtType = 'jpg') or (ExtType = 'jpeg') then
      ContentType := TRESTContentType.ctIMAGE_JPEG
    else if ExtType = 'png' then
      ContentType := TRESTContentType.ctIMAGE_PNG
    else if ExtType = 'gif' then
      ContentType := TRESTContentType.ctIMAGE_GIF
    else if ExtType = 'mp4' then
      ContentType := TRESTContentType.ctVIDEO_MP4
    else
      ContentType := TRESTContentType.ctNone;
    edtStorageObject.Text := ExtractFilename(OpenDialog.FileName);
    ObjectName := GetStorageFileName;
    if not assigned(fStorage) then
      fStorage := TFirebaseStorage.Create(edtStorageBucket.Text, fAuth);
    fUploadStream := TFileStream.Create(OpenDialog.FileName, fmOpenRead);
    fStorage.UploadFromStream(fUploadStream, ObjectName, ContentType,
      OnUpload, OnUploadError);
  end;
end;

procedure TfmxFirebaseDemo.OnUpload(Obj: IStorageObject);
begin
  memStorageResp.Lines.Text := 'Object asynchronous uploaded: ' +
    Obj.ObjectName(true);
  ShowFirestoreObject(Obj);
  FreeAndNil(fUploadStream);
end;

procedure TfmxFirebaseDemo.OnUploadError(const ObjectName, ErrorMsg: string);
begin
  memStorageResp.Lines.Text := 'Error while asynchronous upload of ' + ObjectName;
  memStorageResp.Lines.Add('Error: ' + ErrorMsg);
  FreeAndNil(fUploadStream);
end;

procedure TfmxFirebaseDemo.btnDeleteSyncClick(Sender: TObject);
begin
  if not CheckAndCreateStorageClass then
    exit;
  fStorage.DeleteSynchronous(GetStorageFileName);
  memStorageResp.Lines.Text := GetStorageFileName + ' synchronous deleted';
  btnDownloadSync.Enabled := false;
  btnDownloadAsync.Enabled :=  false;
  btnDeleteSync.Enabled := false;
  btnDeleteAsync.Enabled := false;
end;

procedure TfmxFirebaseDemo.btnDeleteAsyncClick(Sender: TObject);
begin
  if not CheckAndCreateStorageClass then
    exit;
  fStorage.Delete(GetStorageFileName, OnDeleteStorage, OnDeleteStorageError);
end;

procedure TfmxFirebaseDemo.OnDeleteStorage(const ObjectName: TObjectName);
begin
  memStorageResp.Lines.Text := ObjectName + ' asynchronous deleted';
  btnDownloadSync.Enabled := false;
  btnDownloadAsync.Enabled :=  false;
  btnDeleteSync.Enabled := false;
  btnDeleteAsync.Enabled := false;
end;

procedure TfmxFirebaseDemo.OnDeleteStorageError(const ObjectName,
  ErrorMsg: string);
begin
  memStorageResp.Lines.Text := 'Error while asynchronous delete of ' + ObjectName;
  memStorageResp.Lines.Add('Error: ' + ErrorMsg);
end;
{$ENDREGION}

{$REGION 'Firestore DB'}
function TfmxFirebaseDemo.CheckAndCreateFirestoreDBClass(Log: TMemo): boolean;
begin
  if not CheckSignedIn(Log) then
    exit(false);
  if not assigned(fDatabase) then
  begin
    fDatabase := TFirestoreDatabase.Create(edtProjectID.Text, fAuth);
    edtProjectID.enabled := false;
    fTransaction := '';
  end;
  result := true;
end;

procedure TfmxFirebaseDemo.OnFirestoreError(const Info, ErrMsg: string);
begin
  memFirestore.Lines.Add(Info + ' failed: ' + ErrMsg);
  memFirestore.GoToTextEnd;
end;

function TfmxFirebaseDemo.CheckFirestoreFields(InsUpdGetWF: boolean): boolean;
begin
  result := false;
  if edtCollection.Text.IsEmpty then
    memFirestore.Lines.Add('Hint: Collection need to be filled')
  else if not InsUpdGetWF and not chbUseChildDoc.IsChecked then
    result := true
  else if edtDocument.Text.IsEmpty then
     memFirestore.Lines.Add('Hint: Document need to be filled')
  else if not chbUseChildDoc.IsChecked then
    result := true
  else if edtChildCollection.Text.IsEmpty then
    memFirestore.Lines.Add('Hint: Child collection need to be filled')
  else if not InsUpdGetWF then
    result := true
  else if edtChildDocument.Text.IsEmpty then
    memFirestore.Lines.Add('Hint: Child document need to be filled')
  else
    result := true;
end;

procedure TfmxFirebaseDemo.btnGetClick(Sender: TObject);
var
  Query: TQueryParams;
begin
  if not CheckAndCreateFirestoreDBClass(memFirestore) then
    exit;
  if not CheckFirestoreFields(false) then
    exit;
  if not fTransaction.IsEmpty then
    Query := TQueryParams.CreateQueryParams.AddTransaction(fTransaction)
  else
    Query := nil;
  if chbLimitTo10Docs.IsChecked then
    Query := TQueryParams.CreateQueryParams(Query).AddPageSize(10);
  if chbUsePageToken.IsChecked then
    Query := TQueryParams.CreateQueryParams(Query).AddPageToken(
      chbUsePageToken.TagString);
  if not chbUseChildDoc.IsChecked then
    fDatabase.Get([edtCollection.Text, edtDocument.Text], Query,
      OnFirestoreGet, OnFirestoreError)
  else
    fDatabase.Get([edtCollection.Text, edtDocument.Text,
      edtChildCollection.Text, edtChildDocument.Text], Query,
      OnFirestoreGet, OnFirestoreError);
  if assigned(Query) then
    Query.Free;
end;

procedure TfmxFirebaseDemo.OnFirestoreGet(const Info: string;
  Docs: IFirestoreDocuments);
var
  c: integer;
begin
  memFirestore.Lines.Clear;
  try
    if assigned(Docs) and (Docs.Count > 0) then
    begin
      if Docs.MorePagesToLoad then
        memFirestore.Lines.Add(Docs.Count.ToString +
          ' documents fetched but more documents available')
      else if (Docs.SkippedResults = 0) and (Docs.Count > 1) then
        memFirestore.Lines.Add(Docs.Count.ToString + ' documents')
      else if Docs.SkippedResults > 0 then
        memFirestore.Lines.Add(Docs.Count.ToString + ' documents, skipped ' +
          Docs.SkippedResults.ToString);
      chbUsePageToken.IsChecked := Docs.MorePagesToLoad;
      chbUsePageToken.Visible := chbUsePageToken.IsChecked;
      chbUsePageToken.TagString := Docs.PageToken;
      for c := 0 to Docs.Count - 1 do
        ShowDocument(Docs.Document(c));
    end else
      ShowDocument(nil);
  except
    on e: exception do
      OnFirestoreError(Info, e.Message);
  end;
end;

procedure TfmxFirebaseDemo.btnCreateDocumentClick(Sender: TObject);
begin
  if not CheckAndCreateFirestoreDBClass(memFirestore) then
    exit;
  if not CheckFirestoreFields(false) then
    exit;
  if not chbUseChildDoc.IsChecked then
    fDatabase.CreateDocument([edtCollection.Text], nil, OnFirestoreCreate,
      OnFirestoreError)
  else
    fDatabase.CreateDocument([edtCollection.Text, edtDocument.Text,
      edtChildCollection.Text], nil, OnFirestoreCreate, OnFirestoreError);
end;

procedure TfmxFirebaseDemo.OnFirestoreCreate(const Info: string;
  Doc: IFirestoreDocument);
begin
  memFirestore.Lines.Clear;
  try
    ShowDocument(Doc);
    if assigned(Doc) and not chbUseChildDoc.IsChecked then
      edtDocument.Text := Doc.DocumentName(false)
    else if not assigned(Doc) and not chbUseChildDoc.IsChecked then
      edtDocument.Text := ''
    else if assigned(Doc) and chbUseChildDoc.IsChecked then
      edtChildDocument.Text := Doc.DocumentName(false)
    else
      edtChildDocument.Text := '';
  except
    on e: exception do
      OnFirestoreError(Info, e.Message);
  end;
end;

procedure TfmxFirebaseDemo.btnDeleteDocClick(Sender: TObject);
begin
  if not CheckAndCreateFirestoreDBClass(memFirestore) then
    exit;
  if not CheckFirestoreFields(true) then
    exit;
  if not chbUseChildDoc.IsChecked then
    fDatabase.Delete([edtCollection.Text, edtDocument.Text], nil,
      OnFirestoreDeleted, OnFirestoreError)
  else
    fDatabase.Delete([edtCollection.Text, edtDocument.Text,
      edtChildCollection.Text, edtChildDocument.Text], nil,
      OnFirestoreDeleted, OnFirestoreError)
end;

procedure TfmxFirebaseDemo.OnFirestoreDeleted(const RequestID: string;
  Response: IFirebaseResponse);
begin
  memFirestore.Lines.Clear;
  memFirestore.Lines.Add('Document deleted: ' + RequestID);
end;

procedure TfmxFirebaseDemo.btnInsertOrUpdateDocumentClick(Sender: TObject);
var
  Doc: IFirestoreDocument;
begin
  if not CheckAndCreateFirestoreDBClass(memFirestore) then
    exit;
  if not CheckFirestoreFields(true) then
    exit;
  Doc := TFirestoreDocument.Create(edtDocument.Text);
  case cboDemoDocType.ItemIndex of
    0: Doc.AddOrUpdateField(TJSONObject.SetString('TestField',
         'Now try to create a complex document 😀'));
    1: begin
         Doc.AddOrUpdateField(TJSONObject.SetString('MyString',
           'This demonstrates a complex document that contains all supported data types'));
         Doc.AddOrUpdateField(TJSONObject.SetInteger('MyInt', 123));
         Doc.AddOrUpdateField(TJSONObject.SetDouble('MyReal', 1.54));
         Doc.AddOrUpdateField(TJSONObject.SetBoolean('MyBool', true));
         Doc.AddOrUpdateField(TJSONObject.SetTimeStamp('MyTime', now));
         Doc.AddOrUpdateField(TJSONObject.SetNull('MyNull'));
         Doc.AddOrUpdateField(TJSONObject.SetReference('MyRef', edtProjectID.Text,
           edtCollection.Text + '/' + edtDocument.Text));
         Doc.AddOrUpdateField(TJSONObject.SetGeoPoint('MyGeo',
           TLocationCoord2D.Create(1.1, 2.2)));
         Doc.AddOrUpdateField(TJSONObject.SetBytes('MyBytes', [0,1,2,253,254,255]));
         Doc.AddOrUpdateField(TJSONObject.SetMap('MyMap', [
           TJSONObject.SetString('MapStr', 'Map would be called in Delphi "record"'),
           TJSONObject.SetInteger('MapInt', 324),
           TJSONObject.SetBoolean('MapBool', false),
           TJSONObject.SetTimeStamp('MapTime', now + 1),
           TJSONObject.SetArray('MapSubArray', [TJSONObject.SetIntegerValue(1),
               TJSONObject.SetIntegerValue(2)]), // Array in Map
           TJSONObject.SetMap('SubMap', [ // Map in Map
             TJSONObject.SetString('SubMapStr', 'SubText'),
             TJSONObject.SetDouble('SubMapReal', 3.1414),
             TJSONObject.SetGeoPoint('SubMapGeo',
               TLocationCoord2D.Create(-1.0, -2.23)),
             TJSONObject.SetNull('SubMapNull')])]));
         Doc.AddOrUpdateField(TJSONObject.SetArray('MyArr',[
             TJSONObject.SetStringValue('What can I learn next?'),
             TJSONObject.SetStringValue('In order to play later with the function Run Query'),
             TJSONObject.SetStringValue('try also "Docs for Run Query"'),
             // Array in Array is not supported in Firestore: use a map between
             TJSONObject.SetMapValue([
               TJSONObject.SetString('MapInArray_String',
                 'Delphi rocks with Firebase 👨'),
               TJSONObject.SetInteger('MapInArray_Int', 4711)])]));
         Doc.AddOrUpdateField(TJSONObject.SetString('Hint',
           'Keep in mind that the fields order is not defined when call get - ' +
           'multiple gets has different field orders 🤔'));
       end;
    2: begin
         if not chbUseChildDoc.IsChecked then
           Doc.AddOrUpdateField(TJSONObject.SetString('info',
             'This demonstrates a simple collection with random data.'))
         else
           Doc.AddOrUpdateField(TJSONObject.SetString('info',
             'This demonstrates a simple child collection with random data.'));
         if not btnRunQuery.Enabled then
           Doc.AddOrUpdateField(TJSONObject.SetString('hint',
             'For test Run Query create same record as this one and by press ' +
             'Create Doc and Insert Doc repeatedly'))
         else
           Doc.AddOrUpdateField(TJSONObject.SetString('hint',
             'Create at least 5 documents so you have some records for later ' +
             'test of Run Query'));
         Doc.AddOrUpdateField(TJSONObject.SetInteger('testInt', random(100)));
         Doc.AddOrUpdateField(TJSONObject.SetTimeStamp('documentCreated', now));
         btnRunQuery.Enabled := true;
       end;
  end;
  // Log.d(Doc.AsJSON.ToJSON);
  if not chbUseChildDoc.IsChecked then
    fDatabase.InsertOrUpdateDocument([edtCollection.Text, edtDocument.Text],
      Doc, nil, OnFirestoreInsertOrUpdate, OnFirestoreError)
  else
    fDatabase.InsertOrUpdateDocument([edtCollection.Text, edtDocument.Text,
      edtChildCollection.Text, edtChildDocument.Text], Doc, nil,
      OnFirestoreInsertOrUpdate, OnFirestoreError);
end;

procedure TfmxFirebaseDemo.OnFirestoreInsertOrUpdate(const Info: string;
  Doc: IFirestoreDocument);
begin
  memFirestore.Lines.Clear;
  try
    ShowDocument(Doc);
    if not chbUseChildDoc.IsChecked then
    begin
      if assigned(Doc) then
        edtDocument.Text := Doc.DocumentName(false)
      else
        edtDocument.Text := '';
    end else begin
      if assigned(Doc) then
        edtChildDocument.Text := Doc.DocumentName(false)
      else
        edtChildDocument.Text := '';
    end;
  except
    on e: exception do
      OnFirestoreError(Info, e.Message);
  end;
  Doc := nil;
end;

procedure TfmxFirebaseDemo.btnPatchDocClick(Sender: TObject);
var
  Doc: IFirestoreDocument;
begin
  if not CheckAndCreateFirestoreDBClass(memFirestore) then
    exit;
  if not CheckFirestoreFields(true) then
    exit;
  Doc := TFirestoreDocument.Create(edtDocument.Text);
  Doc.AddOrUpdateField(TJSONObject.SetString('patchedField',
    'This field is added while patch'));
  if cboDemoDocType.ItemIndex > 0 then
    Doc.AddOrUpdateField(TJSONObject.SetString('patchedField2',
      'If this works issue #10 is solved👍'));
  if not chbUseChildDoc.IsChecked then
  begin
    if cboDemoDocType.ItemIndex = 0 then
      fDatabase.PatchDocument([edtCollection.Text, edtDocument.Text], Doc,
        ['patchedField'], OnFirestoreInsertOrUpdate, OnFirestoreError)
    else
      fDatabase.PatchDocument([edtCollection.Text, edtDocument.Text], Doc,
        ['patchedField', 'patchedField2'], OnFirestoreInsertOrUpdate,
        OnFirestoreError);
  end else begin
    if cboDemoDocType.ItemIndex = 0 then
      fDatabase.PatchDocument([edtCollection.Text, edtDocument.Text,
        edtChildCollection.Text, edtChildDocument.Text], Doc,
        ['patchedField'], OnFirestoreInsertOrUpdate, OnFirestoreError)
    else
      fDatabase.PatchDocument([edtCollection.Text, edtDocument.Text,
        edtChildCollection.Text, edtChildDocument.Text], Doc,
        ['patchedField', 'patchedField2'], OnFirestoreInsertOrUpdate,
        OnFirestoreError);
  end;
end;

procedure TfmxFirebaseDemo.ShowDocument(Doc: IFirestoreDocument);

  function BytesToHexStr(Bytes: TBytes): string;
  const
    HexChars: string = '0123456789ABCDEF';
  var
    c: integer;
  begin
    result := '[';
    for c := Low(Bytes) to High(Bytes) do
    begin
      result := result + HexChars[1 + Bytes[c] shr 4] +
        HexChars[1 + Bytes[c] and $F];
      if c < High(Bytes) then
        result := result + ', '
      else
        result := result + ']';
    end;
  end;

  function GetFieldVal(const Indent: string; FieldType: TFirestoreFieldType;
    FieldVal: TJSONObject): string;
  var
    c: integer;
    Obj: TJSONObject;
    Pair: TJSONPair;
    SubFieldType: TFirestoreFieldType;
  begin
    result := '';
    case FieldType of
      fftNull:
        result := 'Null';
      fftString:
        result := FieldVal.GetStringValue;
      fftBoolean:
        result := BoolToStr(FieldVal.GetBooleanValue, true);
      fftInteger:
        result := FieldVal.GetIntegerValue.ToString;
      fftDouble:
        result := FieldVal.GetDoubleValue.ToString;
      fftTimeStamp:
        result := DateTimeToStr(FieldVal.GetTimeStampValue);
      fftGeoPoint:
        result := Format('[%2.10f°N, %2.10f°E]',
          [FieldVal.GetGeoPoint.Latitude,
           FieldVal.GetGeoPoint.Longitude]);
      fftReference:
        result := FieldVal.GetReference;
      fftBytes:
        result := BytesToHexStr(FieldVal.GetBytes);
      fftArray:
        for c := 0 to FieldVal.GetArraySize - 1 do
        begin
          Obj := FieldVal.GetArrayItem(c);
          SubFieldType := TFirestoreDocument.GetFieldType(
            Obj.Pairs[0].JsonString.Value);
         result := result + #13 + Indent + '[' + c.ToString + ']: ' +
            TRttiEnumerationType.GetName<TFirestoreFieldType>(SubFieldType) +
            ' = ' + GetFieldVal('  ' + Indent, SubFieldType, Obj);
        end;
      fftMap:
        for c := 0 to FieldVal.GetMapSize - 1 do
        begin
          Pair := FieldVal.GetMapItem(c);
          Obj := Pair.JsonValue as TJSONObject;
          SubFieldType := TFirestoreDocument.GetFieldType(
            Obj.Pairs[0].JsonString.Value);
          result := result + #13 + Indent + Pair.JsonString.Value + ': ' +
            TRttiEnumerationType.GetName<TFirestoreFieldType>(SubFieldType) +
            ' = ' + GetFieldVal('  ' + Indent, SubFieldType, Obj);
        end;
      else
        memFirestore.Lines.Add(Indent + 'Unsupported type: ' +
          TRttiEnumerationType.GetName<TFirestoreFieldType>(FieldType));
    end;
  end;

var
  c: integer;
  FieldName: string;
  FieldType: TFirestoreFieldType;
begin
  if assigned(Doc) then
  begin
    memFirestore.Lines.Add('Document name: ' + Doc.DocumentName(true));
    memFirestore.Lines.Add('  Created    : ' + DateTimeToStr(
      TFirebaseHelpers.ConvertToLocalDateTime(doc.createTime)));
    memFirestore.Lines.Add('  Updated    : ' + DateTimeToStr(
      TFirebaseHelpers.ConvertToLocalDateTime(doc.updateTime)));
    // Log.d(Doc.AsJSON.ToJSON);
    for c := 0 to Doc.CountFields - 1 do
    begin
      FieldName := Doc.FieldName(c);
      FieldType := Doc.FieldType(c);
      memFirestore.Lines.Add('  ' + FieldName + ' : ' +
        TRttiEnumerationType.GetName<TFirestoreFieldType>(FieldType) + ' = ' +
        GetFieldVal('  ', FieldType, Doc.FieldValue(c)));
    end;
  end else
    memFirestore.Lines.Add('No document found');
end;

procedure TfmxFirebaseDemo.CheckDocument;
begin
  chbLimitTo10Docs.Visible := edtDocument.Text.IsEmpty;
  chbUseChildDoc.Visible := not chbLimitTo10Docs.Visible;
  edtChildCollection.Visible := chbUseChildDoc.IsChecked;
  edtChildDocument.Visible := chbUseChildDoc.IsChecked;
  chbUsePageToken.Visible := false;
end;

procedure TfmxFirebaseDemo.chbUseChildDocChange(Sender: TObject);
begin
  if chbUseChildDoc.IsChecked and edtDocument.Text.IsEmpty then
  begin
    chbUseChildDoc.IsChecked := false;
    memFirestore.Lines.Add('Hint: You need to enter a Document ID before you ' +
      'can address a child document');
  end;
  edtChildCollection.Visible := chbUseChildDoc.IsChecked;
  edtChildDocument.Visible := chbUseChildDoc.IsChecked;
end;

procedure TfmxFirebaseDemo.trbMinTestIntChange(Sender: TObject);
begin
  lblMinTestInt.Text := 'Min testInt Val: ' +
    IntToStr(trunc(trbMinTestInt.Value));
end;

procedure TfmxFirebaseDemo.btnRunQueryClick(Sender: TObject);
var
  Query: TQueryParams;
begin
  if not CheckAndCreateFirestoreDBClass(memFirestore) then
    exit;
  if not CheckFirestoreFields(false) then
    exit;
  if not fTransaction.IsEmpty then
    Query := TQueryParams.CreateQueryParams.AddTransaction(fTransaction)
  else
    Query := nil;
  // the following structured query expects a db built with 'Docs for Run Query'
  if not chbUseChildDoc.IsChecked then
    fDatabase.RunQuery(
      TStructuredQuery.CreateForCollection(edtCollection.Text).
        QueryForFieldFilter(
          TQueryFilter.IntegerFieldFilter('testInt', woGreaterThan,
            trunc(trbMinTestInt.Value))).
        OrderBy('testInt', odAscending),
      OnFirestoreGet, OnFirestoreError, Query)
  else
    fDatabase.RunQuery([edtCollection.Text, edtDocument.Text],
      TStructuredQuery.CreateForSelect(['testInt', 'documentCreated', 'info']).
        Collection(edtChildCollection.Text).
        QueryForFieldFilter(
          TQueryFilter.IntegerFieldFilter('testInt', woGreaterThan,
            trunc(trbMinTestInt.Value))).
        OrderBy('testInt', odAscending).
        OrderBy('documentCreated', odDescending).
// For testing the cursor function StartAt and EndAt enter existing values from
// your collection for testInt instead of 61 and 85
//        StartAt(TFirestoreDocument.CreateCursor.AddOrUpdateField(
//          TJSONObject.SetInteger('testInt', 61)), false).
//        EndAt(TFirestoreDocument.CreateCursor.AddOrUpdateField(
//          TJSONObject.SetInteger('testInt', 85)), false).
        Limit(10).Offset(1),
      OnFirestoreGet, OnFirestoreError, Query);
end;

procedure TfmxFirebaseDemo.btnStartTransReadOnlyClick(Sender: TObject);
begin
  if not CheckAndCreateFirestoreDBClass(memFirestore) then
    exit;
  try
    fTransaction := fDatabase.BeginReadOnlyTransactionSynchronous;
    memFirestore.Lines.Add('Read only transaction started');
  except
    on e: EFirebaseResponse do
      memFirestore.Lines.Add('Transaction failed: ' + e.Message);
  end;
  btnStartTransReadOnly.Visible := false;
  btnStopTrans.Visible := true;
end;

procedure TfmxFirebaseDemo.btnStopTransClick(Sender: TObject);
begin
  fTransaction := '';
  btnStopTrans.Visible := false;
  btnStartTransReadOnly.Visible := true;
end;
{$ENDREGION}

{$REGION 'Firestore Listener'}
procedure TfmxFirebaseDemo.btnStartFSListenerClick(Sender: TObject);
var
  Targets: string;
begin
  if not CheckAndCreateFirestoreDBClass(memScanFS) then
    exit;
  memScanFS.Lines.Clear;
  Targets := '';
  if not edtCollectionIDForFSListener.Text.IsEmpty then
  begin
    fDatabase.SubscribeQuery(TStructuredQuery.CreateForCollection(
      edtCollectionIDForFSListener.Text), OnFSChangedDocInCollection,
      OnFSDeletedDocCollection);
    Targets := 'Target-1: Collection ';
  end;
  if not edtDocPathForFSListener.Text.IsEmpty then
  begin
    fDatabase.SubscribeDocument(edtDocPathForFSListener.Text.Split(['/']),
      OnFSChangedDoc, OnFSDeletedDoc);
    Targets := Targets + 'Target-2: Single Doc ';
  end;
  if not Targets.IsEmpty then
  begin
    memScanFS.Lines.Add('Listener started for ' + Targets);
    fDatabase.StartListener(OnFSStopListening, OnFSRequestError, OnFSAuthRevoked);
    btnStartFSListener.Enabled := false;
    btnStopFSListener.Enabled := true;
  end else
    memScanFS.Lines.Add('No target defined for starting listener');
end;

procedure TfmxFirebaseDemo.btnStopFSListenerClick(Sender: TObject);
begin
  if not CheckAndCreateFirestoreDBClass(memFirestore) then
    exit;
  fDatabase.StopListener;
  btnStopFSListener.Enabled := false;
end;

procedure TfmxFirebaseDemo.OnFSChangedDocInCollection(
  Doc: IFirestoreDocument);
begin
  memScanFS.Lines.Add('Target-1: ' + TimeToStr(now) + ': Doc changed ' +
    Doc.DocumentName(true));
  memScanFS.Lines.Add(Doc.AsJSON.ToJSON);
end;

procedure TfmxFirebaseDemo.OnFSChangedDoc(Doc: IFirestoreDocument);
begin
  memScanFS.Lines.Add('Target-2: ' + TimeToStr(now) + ': Doc changed ' +
    Doc.DocumentName(true));
  memScanFS.Lines.Add(Doc.AsJSON.ToJSON);
end;

procedure TfmxFirebaseDemo.OnFSDeletedDocCollection(const DelDocPath: string;
  TS: TDateTime);
begin
  memScanFS.Lines.Add('Target-1: ' + TimeToStr(TS) + ': Doc deleted ' +
    DelDocPath);
end;

procedure TfmxFirebaseDemo.OnFSDeletedDoc(const DelDocPath: string;
  TS: TDateTime);
begin
  memScanFS.Lines.Add('Target-2: ' + TimeToStr(TS) + ': Doc deleted ' +
    DelDocPath);
end;

procedure TfmxFirebaseDemo.OnFSStopListening(Sender: TObject);
begin
  memScanFS.Lines.Add(TimeToStr(now) + ': Listener stopped');
  btnStartFSListener.Enabled := true;
end;

procedure TfmxFirebaseDemo.OnFSRequestError(const RequestID, ErrMsg: string);
begin
  memScanFS.Lines.Add(TimeToStr(now) + ': Listener error ' + ErrMsg);
end;

procedure TfmxFirebaseDemo.OnFSAuthRevoked(TokenRenewPassed: boolean);
begin
  if TokenRenewPassed then
    memScanFS.Lines.Add(TimeToStr(now) + ': Token renew passed')
  else
    memScanFS.Lines.Add(TimeToStr(now) + ': Token renew failed');
end;

{$ENDREGION}

{$REGION 'Realtime DB'}
const
  sUnauthorized = 'Unauthorized';
  sHintToDBRules = 'For first steps setup the Realtime Database Rules to '#13 +
    '{'#13'  "rules": {'#13'     ".read": "auth != null",'#13'     ".write": ' +
    '"auth != null"'#13'  }'#13'}';

function TfmxFirebaseDemo.CheckAndCreateRealTimeDBClass(Log: TMemo): boolean;
begin
  if not CheckSignedIn(Log) then
    exit(false)
  else if edtFirebaseURL.Text.IsEmpty then
  begin
    Log.Lines.Add('Please enter your Firebase URL first');
    Log.GoToTextEnd;
    edtFirebaseURL.SetFocus;
    exit(false);
  end;
  if not assigned(fRealTimeDB) then
  begin
    fRealTimeDB := TRealTimeDB.CreateByURL(edtFirebaseURL.Text, fAuth);
    lblFirebaseURL.Text := txtFirebaseURL.Text + #9 + edtFirebaseURL.Text;
    edtProjectID.ReadOnly := true;
    edtFirebaseURL.ReadOnly := true;
    edtProjectID.enabled := false;
    fFirebaseEvent := nil;
  end;
  result := true;
end;

function TfmxFirebaseDemo.GetRTDBPath: TStringDynArray;
begin
  result := SplitString(edtPath.Text.Replace('\', '/'), '/');
end;

procedure TfmxFirebaseDemo.cboOrderByChange(Sender: TObject);
begin
  edtColumName.Visible := cboOrderBy.ItemIndex = 1;
end;

procedure TfmxFirebaseDemo.spbLimitToFirstChange(Sender: TObject);
begin
  spbLimitToLast.Value := 0;
end;

procedure TfmxFirebaseDemo.spbLimitToLastChange(Sender: TObject);
begin
  spbLimitToFirst.Value := 0;
end;

function TfmxFirebaseDemo.GetOptions: TQueryParams;
begin
  result := nil;
  if (cboOrderBy.ItemIndex = 1) and (not edtColumName.Text.IsEmpty) then
    result := TQueryParams.CreateQueryParams.AddOrderBy(edtColumName.Text)
  else if cboOrderBy.ItemIndex > 1 then
    result := TQueryParams.CreateQueryParams.AddOrderByType(
      cboOrderBy.Items[cboOrderBy.ItemIndex]);
  if spbLimitToFirst.Value > 0 then
    result := TQueryParams.CreateQueryParams(result).
      AddLimitToFirst(trunc(spbLimitToFirst.Value));
  if spbLimitToLast.Value > 0 then
    result := TQueryParams.CreateQueryParams(result).
      AddLimitToLast(trunc(spbLimitToLast.Value));
end;

function TfmxFirebaseDemo.GetPathFromResParams(
  ResParams: TRequestResourceParam): string;
var
  i: integer;
begin
  result := '';
  for i := low(ResParams) to high(ResParams) do
    if i = low(ResParams) then
      result := ResParams[i]
    else
      result := result + '/' + ResParams[i];
end;

procedure TfmxFirebaseDemo.btnGetRTSynchClick(Sender: TObject);
var
  Val: TJSONValue;
  Query: TQueryParams;
begin
  if not CheckAndCreateRealTimeDBClass(memRTDB) then
    exit;
  memRTDB.Lines.Clear;
  try
    Query := GetOptions;
    try
      Val := fRealTimeDB.GetSynchronous(GetRTDBPath, Query);
      try
        ShowRTNode(GetRTDBPath, Val);
      finally
        Val.Free;
      end;
    finally
      Query.Free;
    end;
  except
    on e: exception do
      memRTDB.Lines.Add('Get ' + GetPathFromResParams(GetRTDBPath) +
        ' failed: ' + e.Message);
  end;
end;

procedure TfmxFirebaseDemo.ShowRTNode(ResourceParams: TRequestResourceParam;
  Val: TJSONValue);
var
  Obj: TJSONObject;
  c: integer;
begin
  try
    if Val is TJSONObject then
    begin
      Obj := Val as TJSONObject;
      for c := 0 to Obj.Count - 1 do
      begin
        if Obj.Pairs[c].JsonValue is TJSONString then
          memRTDB.Lines.Add(Obj.Pairs[c].JsonString.Value + ': ' +
            Obj.Pairs[c].JsonValue.ToString)
        else
          memRTDB.Lines.Add(Obj.Pairs[c].JsonString.Value + ': ' +
            Obj.Pairs[c].JsonValue.ToJSON);
      end;
    end
    else if not(Val is TJSONNull) then
      memRTDB.Lines.Add(Val.ToString)
    else
      memRTDB.Lines.Add(Format('Path "%s" not found or invalid Firebase URL',
        [GetPathFromResParams(ResourceParams)]));
  except
    on e: exception do
      memRTDB.Lines.Add('Show RT Node failed: ' + e.Message);
  end
end;

procedure TfmxFirebaseDemo.btnGetRTClick(Sender: TObject);
var
  Query: TQueryParams;
begin
  if not CheckAndCreateRealTimeDBClass(memRTDB) then
    exit;
  Query := GetOptions;
  try
    fRealTimeDB.Get(GetRTDBPath, OnGetResp, OnGetError, Query);
  finally
    Query.Free;
  end;
  memRTDB.Lines.Clear;
  aniGetRT.Enabled := true;
  aniGetRT.Visible := true;
end;

procedure TfmxFirebaseDemo.OnGetResp(ResourceParams: TRequestResourceParam;
  Val: TJSONValue);
begin
  aniGetRT.Visible := false;
  aniGetRT.Enabled := false;
  ShowRTNode(ResourceParams, Val);
end;

procedure TfmxFirebaseDemo.OnGetError(const RequestID, ErrMsg: string);
begin
  aniGetRT.Enabled := false;
  aniGetRT.Visible := false;
  memRTDB.Lines.Add('Get ' + RequestID + ' failed: ' + ErrMsg);
  if SameText(ErrMsg, sUnauthorized) then
    memRTDB.Lines.Add(sHintToDBRules);
end;

procedure TfmxFirebaseDemo.btnAddUpdateNodeClick(Sender: TObject);
begin
  if edtPutKeyName.Text.IsEmpty then
    edtPutKeyName.SetFocus
  else if edtPutKeyValue.Text.IsEmpty then
    edtPutKeyValue.SetFocus
  else begin
    if lstDBNode.Items.IndexOfName(edtPutKeyName.Text) < 0 then
      lstDBNode.Items.AddPair(edtPutKeyName.Text, edtPutKeyValue.Text)
    else
      lstDBNode.Items.Values[edtPutKeyName.Text] := edtPutKeyValue.Text;
  end;
end;

procedure TfmxFirebaseDemo.btnClearNodeClick(Sender: TObject);
begin
  lstDBNode.Clear;
end;

procedure TfmxFirebaseDemo.btnPutRTSynchClick(Sender: TObject);
var
  Data: TJSONObject;
  Val: TJSONValue;
  c: integer;
begin
  if not CheckAndCreateRealTimeDBClass(memRTDB) then
    exit;
  if lstDBNode.Items.Count = 0 then
  begin
    memRTDB.Lines.Add('Add first elements to the node');
    exit;
  end;
  Data := TJSONObject.Create;
  Val := nil;
  try
    for c := 0 to lstDBNode.Items.Count - 1 do
      Data.AddPair(lstDBNode.Items.Names[c], lstDBNode.Items.ValueFromIndex[c]);
    memRTDB.Lines.Clear;
    try
      Val := fRealTimeDB.PutSynchronous(GetRTDBPath, Data);
      ShowRTNode(GetRTDBPath, Val);
    except
      on e: exception do
        memRTDB.Lines.Add('Put ' + GetPathFromResParams(GetRTDBPath) +
          ' failed: ' + e.Message);
    end;
  finally
    Val.Free;
    Data.Free;
  end;
end;

procedure TfmxFirebaseDemo.btnPutRTAsynchClick(Sender: TObject);
var
  Data: TJSONObject;
  c: integer;
begin
  if not CheckAndCreateRealTimeDBClass(memRTDB) then
    exit;
  if lstDBNode.Items.Count = 0 then
  begin
    memRTDB.Lines.Add('Add first elements to the node');
    exit;
  end;
  Data := TJSONObject.Create;
  try
    for c := 0 to lstDBNode.Items.Count - 1 do
      Data.AddPair(lstDBNode.Items.Names[c], lstDBNode.Items.ValueFromIndex[c]);
    fRealTimeDB.Put(GetRTDBPath, Data, OnPutResp, OnPutError);
  finally
    Data.Free;
  end;
  memRTDB.Lines.Clear;
  aniPutRT.Enabled := true;
  aniPutRT.Visible := true;
end;

procedure TfmxFirebaseDemo.OnPutResp(ResourceParams: TRequestResourceParam;
  Val: TJSONValue);
begin
  aniPutRT.Visible := false;
  aniPutRT.Enabled := false;
  ShowRTNode(ResourceParams, Val);
end;

procedure TfmxFirebaseDemo.OnPutError(const RequestID, ErrMsg: string);
begin
  aniPutRT.Visible := false;
  aniPutRT.Enabled := false;
  memRTDB.Lines.Add('Put ' + RequestID + ' failed: ' + ErrMsg);
  if SameText(ErrMsg, sUnauthorized) then
    memRTDB.Lines.Add(sHintToDBRules);
end;

procedure TfmxFirebaseDemo.btnPostRTSynchClick(Sender: TObject);
var
  Data: TJSONValue;
  Val: TJSONValue;
begin
  if not CheckAndCreateRealTimeDBClass(memRTDB) then
    exit;
  Val := nil;
  if edtPostKeyName.Text.IsEmpty then
    Data := TJSONString.Create(edtPostKeyValue.Text)
  else
    Data := TJSONObject.Create(TJSONPair.Create(
      edtPostKeyName.Text, edtPostKeyValue.Text));
  try
    memRTDB.Lines.Clear;
    try
      Val := fRealTimeDB.PostSynchronous(GetRTDBPath, Data);
      ShowRTNode(GetRTDBPath, Val);
    except
      on e: exception do
        memRTDB.Lines.Add('Post ' + GetPathFromResParams(GetRTDBPath) +
          ' failed: ' + e.Message);
    end;
  finally
    Val.Free;
    Data.Free;
  end;
end;

procedure TfmxFirebaseDemo.btnPostRTAsynchClick(Sender: TObject);
var
  Data: TJSONValue;
begin
  if not CheckAndCreateRealTimeDBClass(memRTDB) then
    exit;
  if edtPostKeyName.Text.IsEmpty then
    Data := TJSONString.Create(edtPostKeyValue.Text)
  else
    Data := TJSONObject.Create(TJSONPair.Create(
      edtPostKeyName.Text, edtPostKeyValue.Text));
  try
    fRealTimeDB.Post(GetRTDBPath, Data, OnPostResp, OnPostError);
  finally
    Data.Free;
  end;
  memRTDB.Lines.Clear;
  aniPostRT.Enabled := true;
  aniPostRT.Visible := true;
end;

procedure TfmxFirebaseDemo.OnPostResp(ResourceParams: TRequestResourceParam;
  Val: TJSONValue);
begin
  aniPostRT.Visible := false;
  aniPostRT.Enabled := false;
  ShowRTNode(ResourceParams, Val);
end;

procedure TfmxFirebaseDemo.OnPostError(const RequestID, ErrMsg: string);
begin
  aniPostRT.Visible := false;
  aniPostRT.Enabled := false;
  memRTDB.Lines.Add('Post ' + RequestID + ' failed: ' + ErrMsg);
  if SameText(ErrMsg, sUnauthorized) then
    memRTDB.Lines.Add(sHintToDBRules);
end;

procedure TfmxFirebaseDemo.btnPatchRTSynchClick(Sender: TObject);
var
  Data: TJSONObject;
  Val: TJSONValue;
begin
  if not CheckAndCreateRealTimeDBClass(memRTDB) then
    exit;
  Data := TJSONObject.Create;
  Val := nil;
  try
    Data.AddPair(edtPatchKeyName.Text, edtPatchKeyValue.Text);
    memRTDB.Lines.Clear;
    try
      Val := fRealTimeDB.PatchSynchronous(GetRTDBPath, Data);
      ShowRTNode(GetRTDBPath, Val);
    except
      on e: exception do
        memRTDB.Lines.Add('Post ' + GetPathFromResParams(GetRTDBPath) +
          ' failed: ' + e.Message);
    end;
  finally
    Val.Free;
    Data.Free;
  end;
end;

procedure TfmxFirebaseDemo.btnPatchRTAsynchClick(Sender: TObject);
var
  Data: TJSONObject;
begin
  if not CheckAndCreateRealTimeDBClass(memRTDB) then
    exit;
  Data := TJSONObject.Create;
  try
    Data.AddPair(edtPatchKeyName.Text, edtPatchKeyValue.Text);
    fRealTimeDB.Patch(GetRTDBPath, Data, OnPatchResp, OnPatchError);
  finally
    Data.Free;
  end;
  memRTDB.Lines.Clear;
  aniPatchRT.Enabled := true;
  aniPatchRT.Visible := true;
end;

procedure TfmxFirebaseDemo.OnPatchResp(ResourceParams: TRequestResourceParam;
  Val: TJSONValue);
begin
  aniPatchRT.Visible := false;
  aniPatchRT.Enabled := false;
  ShowRTNode(ResourceParams, Val);
end;

procedure TfmxFirebaseDemo.OnPatchError(const RequestID, ErrMsg: string);
begin
  aniPatchRT.Visible := false;
  aniPatchRT.Enabled := false;
  memRTDB.Lines.Add('Patch ' + RequestID + ' failed: ' + ErrMsg);
  if SameText(ErrMsg, sUnauthorized) then
    memRTDB.Lines.Add(sHintToDBRules);
end;

procedure TfmxFirebaseDemo.btnDelRTSynchClick(Sender: TObject);
begin
  if not CheckAndCreateRealTimeDBClass(memRTDB) then
    exit;
  memRTDB.Lines.Clear;
  try
    if fRealTimeDB.DeleteSynchronous(GetRTDBPath) then
      memRTDB.Lines.Add('Delete ' +
        GetPathFromResParams(GetRTDBPath) +
        ' passed')
    else
      memRTDB.Lines.Add('Path ' +
        GetPathFromResParams(GetRTDBPath) +
        ' not found');
  except
    on e: exception do
      memRTDB.Lines.Add('Delete ' + GetPathFromResParams(GetRTDBPath) +
        ' failed: ' + e.Message);
  end;
end;

procedure TfmxFirebaseDemo.btnDelRTAsynchClick(Sender: TObject);
begin
  if not CheckAndCreateRealTimeDBClass(memRTDB) then
    exit;
  memRTDB.Lines.Clear;
  fRealTimeDB.Delete(GetRTDBPath, OnDeleteResp, OnDeleteError);
  memRTDB.Lines.Clear;
  aniDeleteRT.Enabled := true;
  aniDeleteRT.Visible := true;
end;

procedure TfmxFirebaseDemo.OnDeleteResp(Params: TRequestResourceParam;
  Success: boolean);
begin
  aniDeleteRT.Enabled := false;
  aniDeleteRT.Visible := false;
  if Success then
    memRTDB.Lines.Add('Delete ' + GetPathFromResParams(GetRTDBPath) + ' passed')
  else
    memRTDB.Lines.Add('Path ' + GetPathFromResParams(GetRTDBPath) +
      ' not found');
end;

procedure TfmxFirebaseDemo.OnDeleteError(const RequestID, ErrMsg: string);
begin
  aniDeleteRT.Enabled := false;
  aniDeleteRT.Visible := false;
  memRTDB.Lines.Add('Delete ' + RequestID + ' failed: ' + ErrMsg);
end;

procedure TfmxFirebaseDemo.btnGetServerTimeStampClick(Sender: TObject);
var
  ServerTime: TJSONValue;
begin
  if not CheckAndCreateRealTimeDBClass(memRTDB) then
    exit;
  ServerTime := fRealTimeDB.GetServerVariablesSynchronous(
    cServerVariableTimeStamp, GetRTDBPath);
  try
    memRTDB.Lines.Add('ServerTime (local time): ' +
      DateTimeToStr(TFirebaseHelpers.ConvertTimeStampToLocalDateTime(
        (ServerTime as TJSONNumber).AsInt64)));
  finally
    ServerTime.Free;
  end;
end;
{$ENDREGION}

{$REGION 'Realtime DB Listener'}
procedure TfmxFirebaseDemo.btnNotifyEventClick(Sender: TObject);
begin
  if not CheckAndCreateRealTimeDBClass(memScans) then
    exit;
  fFirebaseEvent := fRealTimeDB.ListenForValueEvents(
    SplitString(edtRTDBEventPath.Text.Replace('\', '/'), '/'),
    OnRecData, OnRecDataStop, OnRecDataError);
  memScans.Lines.Add(TimeToStr(now) + ': Event handler started for ' +
    TFirebaseHelpers.ArrStrToCommaStr(fFirebaseEvent.GetResourceParams));
  btnNotifyEvent.Enabled := false;
  btnStopEvent.Enabled := true;
end;

procedure TfmxFirebaseDemo.btnStopEventClick(Sender: TObject);
begin
  if assigned(fFirebaseEvent) then
    fFirebaseEvent.StopListening;
end;

procedure TfmxFirebaseDemo.OnRecData(const Event: string;
  Params: TRequestResourceParam; JSONObj: TJSONObject);
var
  par, p: string;
begin
  par := '[';
  for p in Params do
  begin
    if par.Length > 1 then
      par := par + ', ' + p
    else
      par := par + p;
  end;
  memScans.Lines.Add(TimeToStr(now) + ': ' + Event + par + '] = ' +
    JSONObj.ToJSON);
end;

procedure TfmxFirebaseDemo.OnRecDataError(const Info, ErrMsg: string);
begin
  memScans.Lines.Add(TimeToStr(now) + ': Error in ' + Info + ': ' + ErrMsg);
end;

procedure TfmxFirebaseDemo.OnRecDataStop(Sender: TObject);
begin
  memScans.Lines.Add(TimeToStr(now) + ': Event handler stopped');
  fFirebaseEvent := nil;
  btnNotifyEvent.Enabled := true;
  btnStopEvent.Enabled := false;
end;
{$ENDREGION}

{$REGION 'FB Function'}
function TfmxFirebaseDemo.CheckAndCreateFunctionClass: boolean;
begin
  if assigned(fFirebaseFunction) then
    exit(true)
  else if not CheckSignedIn(memFunctionResp) then
    exit(false);
  fFirebaseFunction := TFirebaseFunctions.Create(edtProjectID.Text, fAuth);
  edtProjectID.enabled := false;
  result := true;
end;

procedure TfmxFirebaseDemo.cboParamsChange(Sender: TObject);
begin
  edtParam1.Visible := cboParams.ItemIndex > 0;
  edtParam2.Visible := cboParams.ItemIndex > 1;
  edtParam3.Visible := cboParams.ItemIndex > 2;
  edtParam4.Visible := cboParams.ItemIndex > 3;
end;

procedure TfmxFirebaseDemo.btnCallFunctionSynchronousClick(Sender: TObject);
var
  Data, Res: TJSONObject;
begin
  if not CheckAndCreateFunctionClass then
    exit;
  memFunctionResp.Lines.Add('Call: ' + edtFunctionName.Text);
  try
    Data := TJSONObject.Create;
    if cboParams.ItemIndex > 0 then
    begin
      Data.AddPair(edtParam1.Text, edtParam1Val.Text);
      if cboParams.ItemIndex > 1 then
      begin
        Data.AddPair(edtParam2.Text, edtParam2Val.Text);
        if cboParams.ItemIndex > 2 then
        begin
          Data.AddPair(edtParam3.Text, edtParam3Val.Text);
          if cboParams.ItemIndex > 3 then
            Data.AddPair(edtParam4.Text, edtParam4Val.Text);
        end;
      end;
    end;
    Res := fFirebaseFunction.CallFunctionSynchronous(edtFunctionName.Text, Data);
    try
      memFunctionResp.Lines.Add('Result: ' + Res.ToJSON);
    finally
      Res.Free;
    end;
  except
    on e: exception do
      memFunctionResp.Lines.Add('Call ' + edtFunctionName.Text + ' failed: ' +
        e.Message);
  end;
end;

procedure TfmxFirebaseDemo.btnCallFunctionAsynchronousClick(Sender: TObject);
var
  Data: TJSONObject;
begin
  if not CheckAndCreateFunctionClass then
    exit;
  memFunctionResp.Lines.Add('Call: ' + edtFunctionName.Text);
  try
    Data := TJSONObject.Create;
    if cboParams.ItemIndex > 0 then
    begin
      Data.AddPair(edtParam1.Text, edtParam1Val.Text);
      if cboParams.ItemIndex > 1 then
      begin
        Data.AddPair(edtParam2.Text, edtParam2Val.Text);
        if cboParams.ItemIndex > 2 then
        begin
          Data.AddPair(edtParam3.Text, edtParam3Val.Text);
          if cboParams.ItemIndex > 3 then
            Data.AddPair(edtParam4.Text, edtParam4Val.Text);
        end;
      end;
    end;
    fFirebaseFunction.CallFunction(onFunctionSuccess, OnFunctionError,
      edtFunctionName.Text, Data);
  except
    on e: exception do
      memFunctionResp.Lines.Add('Call ' + edtFunctionName.Text +
        ' failed: ' + e.Message);
  end;
end;

procedure TfmxFirebaseDemo.OnFunctionSuccess(const Info: string;
  ResultObj: TJSONObject);
begin
  memFunctionResp.Lines.Add('Result of ' + Info + ': ' + ResultObj.ToJSON);
end;

procedure TfmxFirebaseDemo.OnFunctionError(const RequestID, ErrMsg: string);
begin
  memFunctionResp.Lines.Add('Call ' + RequestID + ' failed: ' + ErrMsg);
end;
{$ENDREGION}

end.

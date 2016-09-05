{
Copyright © 1999 by Delphi 5 Developer's Guide - Xavier Pacheco and Steve Teixeira
}

unit VerInfo;

interface

uses SysUtils, WinTypes, Dialogs, Classes;

type
  { define a generic exception class for version info, and an exception
    to indicate that no version info is available. }
  EVerInfoError   = class(Exception);
  ENoVerInfoError = class(Exception);
  eNoFixeVerInfo  = class(Exception);

  // define enum type representing different types of version info
  TVerInfoType =
    (viCompanyName,
     viFileDescription,
     viFileVersion,
     viInternalName,
     viLegalCopyright,
     viLegalTrademarks,
     viOriginalFilename,
     viProductName,
     viProductVersion,
     viComments);

const

  // define an array constant of strings representing the pre-defined
  // version information keys.
  VerNameArray: array[viCompanyName..viComments] of String[20] =
  ('CompanyName',
   'FileDescription',
   'FileVersion',
   'InternalName',
   'LegalCopyright',
   'LegalTrademarks',
   'OriginalFilename',
   'ProductName',
   'ProductVersion',
   'Comments');

type

  // Define the version info class
  TVerInfoRes = class
  private
    Handle            : DWord;
    Size              : Integer;
    RezBuffer         : String;
    TransTable        : PLongint;
    FixedFileInfoBuf  : PVSFixedFileInfo;
    FFileFlags        : TStringList;
    FFileName         : String;
    procedure FillFixedFileInfoBuf;
    procedure FillFileVersionInfo;
    procedure FillFileMaskInfo;
  protected
    function GetFileVersion   : String;
    function GetProductVersion: String;
    function GetFileOS        : String;
  public
    constructor Create(AFileName: String);
    destructor Destroy; override;
    function GetPreDefKeyString(AVerKind: TVerInfoType): String;
    function GetUserDefKeyString(AKey: String): String;
    property FileVersion    : String read GetFileVersion;
    property ProductVersion : String read GetProductVersion;
    property FileFlags      : TStringList read FFileFlags;
    property FileOS         : String read GetFileOS;
  end;

implementation

uses Windows;

const
  // strings that must be fed to VerQueryValue() function
  SFInfo                = '\StringFileInfo\';
  VerTranslation: PChar = '\VarFileInfo\Translation';
  FormatStr             = '%s%.4x%.4x\%s%s';


constructor TVerInfoRes.Create(AFileName: String);
begin
  FFileName := aFileName;
  FFileFlags := TStringList.Create;
  // Get the file version information
  FillFileVersionInfo;
  //Get the fixed file info
  FillFixedFileInfoBuf;
  // Get the file mask values
  FillFileMaskInfo;
end;


destructor TVerInfoRes.Destroy;
begin
  FFileFlags.Free;
end;

procedure TVerInfoRes.FillFileVersionInfo;
var
  SBSize: UInt;
begin
  // Determine size of version information
  Size := GetFileVersionInfoSize(PChar(FFileName), Handle);
  if Size <= 0 then         { raise exception if size <= 0 }
    raise ENoVerInfoError.Create('No Version Info Available.');

  // Set the length accordingly
  SetLength(RezBuffer, Size);
  // Fill the buffer with version information, raise exception on error
  if not GetFileVersionInfo(PChar(FFileName), Handle, Size, PChar(RezBuffer)) then
    raise EVerInfoError.Create('Cannot obtain version info.');

  // Get translation info, raise exception on error
  if not VerQueryValue(PChar(RezBuffer), VerTranslation,  pointer(TransTable),
  SBSize) then
    raise EVerInfoError.Create('No language info.');
end;

procedure TVerInfoRes.FillFixedFileInfoBuf;
var
  Size: Cardinal;
begin
  if VerQueryValue(PChar(RezBuffer), '\', Pointer(FixedFileInfoBuf), Size) then begin
     if Size < SizeOf(TVSFixedFileInfo) then
        raise eNoFixeVerInfo.Create('No fixed file info');
  end
  else
    raise eNoFixeVerInfo.Create('No fixed file info')
end;

procedure TVerInfoRes.FillFileMaskInfo;
begin
  with FixedFileInfoBuf^ do begin
    if (dwFileFlagsMask and dwFileFlags and VS_FF_PRERELEASE) <> 0then
      FFileFlags.Add('Pre-release');
    if (dwFileFlagsMask and dwFileFlags and VS_FF_PRIVATEBUILD) <> 0 then
      FFileFlags.Add('Private build');
    if (dwFileFlagsMask and dwFileFlags and VS_FF_SPECIALBUILD) <> 0 then
      FFileFlags.Add('Special build');
    if (dwFileFlagsMask and dwFileFlags and VS_FF_DEBUG) <> 0 then
      FFileFlags.Add('Debug');
  end;
end;

function TVerInfoRes.GetPreDefKeyString(AVerKind: TVerInfoType): String;
var
  P: PChar;
  S: UInt;
begin
  Result := Format(FormatStr, [SfInfo, LoWord(TransTable^),HiWord(TransTable^),
    VerNameArray[aVerKind], #0]);
  // get and return version query info, return empty string on error
  if VerQueryValue(PChar(RezBuffer), @Result[1], Pointer(P), S) then
    Result := StrPas(P)
  else
    Result := '';
end;

function TVerInfoRes.GetUserDefKeyString(AKey: String): String;
var
  P: Pchar;
  S: UInt;
begin
  Result := Format(FormatStr, [SfInfo, LoWord(TransTable^),HiWord(TransTable^),
    aKey, #0]);
  // get and return version query info, return empty string on error
  if VerQueryValue(PChar(RezBuffer), @Result[1], Pointer(P), S) then
    Result := StrPas(P)
  else
    Result := '';
end;


function VersionString(Ms, Ls: Longint): String;
begin
  Result := Format('%d.%d.%d.%d', [HIWORD(Ms), LOWORD(Ms),
     HIWORD(Ls), LOWORD(Ls)]);
end;

function TVerInfoRes.GetFileVersion: String;
begin
  with FixedFileInfoBuf^ do
    Result := VersionString(dwFileVersionMS, dwFileVersionLS);
end;

function TVerInfoRes.GetProductVersion: String;
begin
  with FixedFileInfoBuf^ do
    Result := VersionString(dwProductVersionMS, dwProductVersionLS);
end;

function TVerInfoRes.GetFileOS: String;
begin
  with FixedFileInfoBuf^ do
    case dwFileOS of
      VOS_UNKNOWN:  // Same as VOS__BASE
        Result := 'Unknown';
      VOS_DOS:
        Result := 'Designed for MS-DOS';
      VOS_OS216:
        Result := 'Designed for 16-bit OS/2';
      VOS_OS232:
        Result := 'Designed for 32-bit OS/2';
      VOS_NT:
        Result := 'Designed for Windows NT';


      VOS__WINDOWS16:
        Result := 'Designed for 16-bit Windows';
      VOS__PM16:
        Result := 'Designed for 16-bit PM';
      VOS__PM32:
        Result := 'Designed for 32-bit PM';
      VOS__WINDOWS32:
        Result := 'Designed for 32-bit Windows';

      VOS_DOS_WINDOWS16:
        Result := 'Designed for 16-bit Windows, running on MS-DOS';
      VOS_DOS_WINDOWS32:
        Result := 'Designed for Win32 API, running on MS-DOS';
      VOS_OS216_PM16:
        Result := 'Designed for 16-bit PM, running on 16-bit OS/2';
      VOS_OS232_PM32:
        Result := 'Designed for 32-bit PM, running on 32-bit OS/2';
      VOS_NT_WINDOWS32:
        Result := 'Designed for Win32 API, running on Windows/NT';
    else
      Result := 'Unknown';
    end;
end;


end.

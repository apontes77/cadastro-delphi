unit Geral.Conexao;

interface
uses
  FireDAC.Comp.Client,
  FireDAC.Stan.Def,
  FireDAC.Stan.Intf,
  FireDAC.Phys.PG,
  System.Classes,
  System.SysUtils;

type
  TConexao = class
    private
      FDatabase: string;
      FUser: string;
      FPassword: string;
      FServer: string;
      FPort: string;
      FFdConnection: TFDConnection;
      FDPhysFBDriverLink: TFDPhysPgDriverLink;
    public
      property Database: string read FDatabase write FDatabase;
      property User: string read FUser write FUser;
      property Password: string read FPassword write FPassword;
      property Server: string read FServer write FServer;
      property Port: string read FPort write FPort;
      property FdConnection: TFdConnection read FFdConnection write FFdConnection;

      procedure CreateConnection();
      procedure CloseConnection();

      constructor Create(); overload;
      destructor Destroy(); override;
  end;

implementation

{ TConexao }

procedure TConexao.CloseConnection;
begin
  FFdConnection.Close;
end;

constructor TConexao.Create;
begin
  inherited;
  FFdConnection := TFDConnection.Create(nil);
  FDPhysFBDriverLink := TFDPhysPgDriverLink.Create(FFdConnection);
  FDPhysFBDriverLink.VendorHome := './psqlodbc';
end;

procedure TConexao.CreateConnection;
begin
  FFdConnection.DriverName := 'PG';
  FFdConnection.Params.Values['Database'] := FDatabase;
  FFdConnection.Params.Values['User_name'] := FUser;
  FFdConnection.Params.Values['Password'] := FPassword;
  FFdConnection.Params.Values['Port'] := FPort;
  FFdConnection.Params.Values['Server'] := FServer;
  FFdConnection.Open;
end;

destructor TConexao.Destroy;
begin
  FreeAndNil(FDPhysFBDriverLink);
  FreeAndNil(FFdConnection);
  inherited;
end;

end.

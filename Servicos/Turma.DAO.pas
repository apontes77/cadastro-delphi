unit Turma.DAO;

interface

uses
  Turma.Classe,
  Geral.Conexao,
  FireDAC.Comp.Client,
  FireDAC.DApt,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Async,
  Generics.Collections;

type
  TTurmaDAO = class
  private
    FConexao: TConexao;
  public
    procedure Insert(Turma: TTurma);
    function Update(Turma: TTurma): Boolean;
    function Delete(Id: Integer): Boolean;
    function getAll(): TList<TTurma>;

    property Conexao: TConexao read FConexao write FConexao;
  end;

implementation

uses
  System.Classes,
  System.SysUtils;

{ TCursoDAO }

function TTurmaDAO.Delete(Id: Integer): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);

  try
    Query.Connection := FConexao.FdConnection;
    Query.ExecSQL('DELETE FROM tb_turma WHERE id_turma = :id_turma', [Id]);
  finally
    FreeAndNil(Query);
  end;
  Result := True;
end;

function TTurmaDAO.getAll: TList<TTurma>;
var
  Query: TFDQuery;
  ListaTurmas: TList<TTurma>;
  Turma: TTurma;
begin
  Query := TFDQuery.Create(nil);

  try
    Query.Connection := FConexao.FdConnection;

    Query.SQL.Text := 'SELECT * FROM tb_turma';
    Query.Open;

    ListaTurmas := TList<TTurma>.Create();
    while not Query.Eof do
    begin

      Turma := TTurma.Create();
      Turma.Id := Query.FieldByName('id_turma').AsInteger;
      Turma.Codigo := Query.FieldByName('codigo_turma').AsString;
      Turma.Disciplina := Query.FieldByName('id_disciplina').AsInteger;

      ListaTurmas.Add(Turma);
      Query.Next;
    end;
    Query.Close;
  finally
    FreeAndNil(Query);
  end;

  Result := ListaTurmas;
end;

procedure TTurmaDAO.Insert(Turma: TTurma);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);

  try
    Query.Connection := FConexao.FdConnection;

    Query.ExecSQL('INSERT INTO tb_turma   ' + sLineBreak +
                  '       (codigo_turma,  ' + sLineBreak +
                  '        id_disciplina) ' + sLineBreak +
                  'VALUES(:codigo_turma,  ' + sLineBreak +
                  '       :id_disciplina) ',
                  [Turma.Codigo,
                  Turma.Disciplina]);
  finally
    FreeAndNil(Query);
  end;

end;

function TTurmaDAO.Update(Turma: TTurma): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);

  try
    Query.Connection := FConexao.FdConnection;

    Query.ExecSQL('UPDATE tb_turma                       ' + sLineBreak +
                  '   SET codigo_turma = :codigo_turma,  ' + sLineBreak +
                  '       id_disciplina = :id_disciplina ' + sLineBreak +
                  ' WHERE id_turma = :id_turma           ',
                  [Turma.Codigo,
                   Turma.Disciplina,
                   Turma.Id]);
  finally
    FreeAndNil(Query);
  end;
end;

end.

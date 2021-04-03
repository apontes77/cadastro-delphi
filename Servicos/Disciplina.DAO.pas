unit Disciplina.DAO;

interface

uses
  Disciplina.Classe,
  Geral.Conexao,
  FireDAC.Comp.Client,
  FireDAC.DApt,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Async,
  Generics.Collections;

type
  TDisciplinaDAO = class
  private
    FConexao: TConexao;
  public
    procedure Insert(Disciplina: TDisciplina);
    function Update(Disciplina: TDisciplina): Boolean;
    function Delete(Id: Integer): Boolean;
    function getAll(): TList<TDisciplina>;

    property Conexao: TConexao read FConexao write FConexao;
  end;

implementation

uses
  System.Classes,
  System.SysUtils;

{ TCursoDAO }

function TDisciplinaDAO.Delete(Id: Integer): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);

  try
    Query.Connection := FConexao.FdConnection;
    Query.ExecSQL('DELETE FROM tb_disciplina WHERE id_disciplina = :id_disciplina', [Id]);
  finally
    FreeAndNil(Query);
  end;
  Result := True;
end;

function TDisciplinaDAO.getAll: TList<TDisciplina>;
var
  Query: TFDQuery;
  ListaDisciplinas: TList<TDisciplina>;
  Disciplina: TDisciplina;
begin
  Query := TFDQuery.Create(nil);

  try
    Query.Connection := FConexao.FdConnection;

    Query.SQL.Text := 'SELECT * FROM tb_disciplina';
    Query.Open;

    ListaDisciplinas := TList<TDisciplina>.Create();
    while not Query.Eof do
    begin

      Disciplina := TDisciplina.Create();
      Disciplina.Id := Query.FieldByName('id_disciplina').AsInteger;
      Disciplina.Nome := Query.FieldByName('nome_disciplina').AsString;

      ListaDisciplinas.Add(Disciplina);
      Query.Next;
    end;
    Query.Close;
  finally
    FreeAndNil(Query);
  end;

  Result := ListaDisciplinas;
end;

procedure TDisciplinaDAO.Insert(Disciplina: TDisciplina);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);

  try
    Query.Connection := FConexao.FdConnection;

    Query.ExecSQL('INSERT INTO tb_disciplina ' + sLineBreak +
                  '       (nome_disciplina)  ' + sLineBreak +
                  'VALUES(:nome_disciplina)  ',
                  [Disciplina.Nome]);
  finally
    FreeAndNil(Query);
  end;

end;

function TDisciplinaDAO.Update(Disciplina: TDisciplina): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);

  try
    Query.Connection := FConexao.FdConnection;

    Query.ExecSQL('UPDATE tb_disciplina                      ' + sLineBreak +
                  '   SET nome_disciplina = :nome_disciplina ' + sLineBreak +
                  ' WHERE id_disciplina = :id_disciplina     ',
                  [Disciplina.Nome, Disciplina.Id]);
  finally
    FreeAndNil(Query);
  end;
end;

end.

unit Curso.DAO;

interface

uses
  Curso.Classe,
  Geral.Conexao,
  FireDAC.Comp.Client,
  FireDAC.DApt,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Async,
  Generics.Collections;

type
  TCursoDAO = class
  private
    FConexao: TConexao;
  public
    procedure Insert(Curso: TCurso);
    function Update(Curso: TCurso): Boolean;
    function Delete(Id: Integer): Boolean;
    function getAll(): TList<TCurso>;

    property Conexao: TConexao read FConexao write FConexao;
  end;

implementation

uses
  System.Classes,
  System.SysUtils;

{ TCursoDAO }

function TCursoDAO.Delete(Id: Integer): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);

  try
    Query.Connection := FConexao.FdConnection;
    Query.ExecSQL('DELETE FROM tb_curso WHERE id_curso = :id_curso', [Id]);
  finally
    FreeAndNil(Query);
  end;
  Result := True;
end;

function TCursoDAO.getAll: TList<TCurso>;
var
  Query: TFDQuery;
  ListaCursos: TList<TCurso>;
  Curso: TCurso;
begin
  Query := TFDQuery.Create(nil);

  try
    Query.Connection := FConexao.FdConnection;

    Query.SQL.Text := 'SELECT * FROM tb_curso';
    Query.Open;

    ListaCursos := TList<TCurso>.Create();
    while not Query.Eof do
    begin

      Curso := TCurso.Create();
      Curso.Id := Query.FieldByName('id_curso').AsInteger;
      Curso.Nome := Query.FieldByName('nome_curso').AsString;

      ListaCursos.Add(Curso);
      Query.Next;
    end;
    Query.Close;
  finally
    FreeAndNil(Query);
  end;

  Result := ListaCursos;
end;

procedure TCursoDAO.Insert(Curso: TCurso);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);

  try
    Query.Connection := FConexao.FdConnection;

    Query.ExecSQL('INSERT INTO tb_curso ' + sLineBreak +
                  '       (nome_curso)  ' + sLineBreak +
                  'VALUES(:nome_curso)  ',
                  [Curso.Nome]);
  finally
    FreeAndNil(Query);
  end;
end;

function TCursoDAO.Update(Curso: TCurso): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);

  try
    Query.Connection := FConexao.FdConnection;

    Query.ExecSQL('UPDATE tb_curso                 ' + sLineBreak +
                  '   SET nome_curso = :nome_curso ' + sLineBreak +
                  ' WHERE id_curso = :id_curso     ',
                  [Curso.Nome, Curso.Id]);
  finally
    FreeAndNil(Query);
  end;
end;

end.

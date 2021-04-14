unit Discente.DAO;

interface

uses
  Discente.Classe,
  Geral.Conexao,
  FireDAC.Comp.Client,
  FireDAC.DApt,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Async,
  Generics.Collections;

type
  TDiscenteDAO = class
  private
    FConexao: TConexao;
  public
    procedure Insert(Discente: TDiscente);
    function Update(Discente: TDiscente): Boolean;
    function Delete(Id: Integer): Boolean;
    function getAll(): TList<TDiscente>;
    function getReleases(): TList<TDiscente>;

    property Conexao: TConexao read FConexao write FConexao;
  end;

implementation

uses
  System.Classes,
  System.SysUtils;

{ TCursoDAO }

function TDiscenteDAO.Delete(Id: Integer): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);

  try
    Query.Connection := FConexao.FdConnection;
    Query.ExecSQL('DELETE FROM tb_discente WHERE id_discente = :id_discente', [Id]);
  finally
    FreeAndNil(Query);
  end;
end;

function TDiscenteDAO.getAll: TList<TDiscente>;
var
  Query: TFDQuery;
  ListaCursos: TList<TDiscente>;
  Discente: TDiscente;
begin
  Query := TFDQuery.Create(nil);

  try
    Query.Connection := FConexao.FdConnection;

    Query.SQL.Text := 'SELECT * FROM tb_discente order by id_discente';
    Query.Open;

    ListaCursos := TList<TDiscente>.Create();
    while not Query.Eof do
    begin

      Discente := TDiscente.Create();
      Discente.Id := Query.FieldByName('id_discente').AsInteger;
      Discente.Nome := Query.FieldByName('nome_discente').AsString;
      Discente.Idade := Query.FieldByName('idade').AsInteger;
      Discente.Sexo := Query.FieldByName('sexo').AsString;
      Discente.Curso := Query.FieldByName('id_curso').AsInteger;

      ListaCursos.Add(Discente);
      Query.Next;
    end;
    Query.Close;
  finally
    FreeAndNil(Query);
  end;

  Result := ListaCursos;
end;

function TDiscenteDAO.getReleases: TList<TDiscente>;
var
  Query: TFDQuery;
  ListaCursos: TList<TDiscente>;
  Discente: TDiscente;
begin
  Query := TFDQuery.Create(nil);

  try
    Query.Connection := FConexao.FdConnection;

    Query.SQL.Text := 'SELECT * FROM tb_discente JOIN tb_lancamentos on tb_discente.id_discente = tb_lancamentos.id_discente JOIN tb_turma on tb_turma.id_turma = tb_lancamentos.id_turma ';
    Query.Open;

    ListaCursos := TList<TDiscente>.Create();
    while not Query.Eof do
    begin

      Discente := TDiscente.Create();
      Discente.Id := Query.FieldByName('id_discente').AsInteger;
      Discente.Nome := Query.FieldByName('nome_discente').AsString;
      Discente.Idade := Query.FieldByName('idade').AsInteger;
      Discente.Sexo := Query.FieldByName('sexo').AsString;
      Discente.Curso := Query.FieldByName('id_curso').AsInteger;
      Discente.N1 := Query.FieldByName('n1').AsFloat;
      Discente.N2 := Query.FieldByName('n2').AsFloat;
      Discente.Turma := Query.FieldByName('codigo_turma').AsString;

      ListaCursos.Add(Discente);
      Query.Next;
    end;
    Query.Close;
  finally
    FreeAndNil(Query);
  end;

  Result := ListaCursos;
end;

procedure TDiscenteDAO.Insert(Discente: TDiscente);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);

  try
    Query.Connection := FConexao.FdConnection;

    Query.ExecSQL('INSERT INTO tb_discente ' + sLineBreak +
                  '       (nome_discente,  ' + sLineBreak +
                  '        idade,          ' + sLineBreak +
                  '        sexo,           ' + sLineBreak +
                  '        id_curso)       ' + sLineBreak +
                  'VALUES(:nome_discente,  ' + sLineBreak +
                  '       :idade,          ' + sLineBreak +
                  '       :sexo,           ' + sLineBreak +
                  '       :id_curso)       ',
                  [Discente.Nome,
                   Discente.idade,
                   Discente.sexo,
                   Discente.Curso]);
  finally
    FreeAndNil(Query);
  end;
end;

function TDiscenteDAO.Update(Discente: TDiscente): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);

  try
    Query.Connection := FConexao.FdConnection;

    Query.ExecSQL('UPDATE tb_discente                     ' + sLineBreak +
                  '   SET nome_discente = :nome_discente, ' + sLineBreak +
                  '       idade = :idade,                 ' + sLineBreak +
                  '       sexo = :sexo,                   ' + sLineBreak +
                  '       id_curso = :id_curso            ' + sLineBreak +
                  ' WHERE id_discente = :id_discente      ',
                  [Discente.Nome,
                   Discente.idade,
                   Discente.sexo,
                   Discente.Curso,
                   Discente.Id]);
  finally
    FreeAndNil(Query);
  end;
end;

end.

unit Docente.DAO;

interface

uses
  Docente.Classe,
  Turma.Classe,
  Geral.Conexao,
  FireDAC.Comp.Client,
  FireDAC.DApt,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Async,
  Generics.Collections;

type
  TDocenteDAO = class
  private
    FConexao: TConexao;
    procedure AdicionarTurmas(Docente: TDocente);
  public
    procedure Insert(Docente: TDocente);
    function Update(Docente: TDocente): Boolean;
    function Delete(Id: Integer): Boolean;
    function getAll(): TList<TDocente>;

    property Conexao: TConexao read FConexao write FConexao;
  end;

implementation

uses
  System.Classes,
  System.SysUtils;

{ TDiscenteDAO }

procedure TDocenteDAO.AdicionarTurmas(Docente: TDocente);
var
  Query: TFDQuery;
  ListaTurma: TList<TTurma>;
  Turma: TTurma;
begin
  Query := TFDQuery.Create(nil);

  try
    Query.Connection := FConexao.FdConnection;

    Query.SQL.Text := 'SELECT * FROM tb_turma                            ' + sLineBreak +
                      'JOIN tb_docente_turma                             ' + sLineBreak +
                      'ON tb_docente_turma.id_docente = :id              ' + sLineBreak +
                      'and tb_docente_turma.id_turma = tb_turma.id_turma ';
    Query.Params.ParamByName('id').AsInteger := Docente.Id;
    Query.Open;

    ListaTurma := TList<TTurma>.Create();
    while not Query.Eof do
    begin
      Turma := TTurma.Create();
      Turma.Id := Query.FieldByName('id_turma').AsInteger;
      Turma.Codigo := Query.FieldByName('codigo_turma').AsString;
      Turma.Disciplina := Query.FieldByName('id_disciplina').AsInteger;

      ListaTurma.Add(Turma);
      Query.Next;
    end;
    Query.Close;
    Docente.ListaTurma := ListaTurma;
  finally
    FreeAndNil(Query);
  end;
end;

function TDocenteDAO.Delete(Id: Integer): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);

  try
    Query.Connection := FConexao.FdConnection;
    Query.ExecSQL('DELETE FROM tb_docente WHERE id_docente = :id_docente', [Id]);
  finally
    FreeAndNil(Query);
  end;
end;

function TDocenteDAO.getAll: TList<TDocente>;
var
  Query: TFDQuery;
  ListaDocentes: TList<TDocente>;
  Docente: TDocente;
begin
  Query := TFDQuery.Create(nil);

  try
    Query.Connection := FConexao.FdConnection;

    Query.SQL.Text := 'SELECT * FROM tb_docente order by id_docente';
    Query.Open;

    ListaDocentes := TList<TDocente>.Create();
    while not Query.Eof do
    begin

      Docente := TDocente.Create();
      Docente.Id := Query.FieldByName('id_docente').AsInteger;
      Docente.Nome := Query.FieldByName('nome_docente').AsString;
      Docente.Idade := Query.FieldByName('idade').AsInteger;
      Docente.Sexo := Query.FieldByName('sexo').AsString;
      AdicionarTurmas(Docente);

      ListaDocentes.Add(Docente);
      Query.Next;
    end;
    Query.Close;
  finally
    FreeAndNil(Query);
  end;

  Result := ListaDocentes;
end;

procedure TDocenteDAO.Insert(Docente: TDocente);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);

  try
    Query.Connection := FConexao.FdConnection;

    Query.ExecSQL('INSERT INTO tb_docente ' + sLineBreak +
                  '       (nome_docente,  ' + sLineBreak +
                  '        idade,         ' + sLineBreak +
                  '        sexo)          ' + sLineBreak +
                  'VALUES(:nome_docente,  ' + sLineBreak +
                  '       :idade,         ' + sLineBreak +
                  '       :sexo)          ',
                  [Docente.Nome,
                   Docente.idade,
                   Docente.sexo]);
  finally
    FreeAndNil(Query);
  end;

end;

function TDocenteDAO.Update(Docente: TDocente): Boolean;
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);

  try
    Query.Connection := FConexao.FdConnection;

    Query.ExecSQL('UPDATE tb_docente                    ' + sLineBreak +
                  '   SET nome_docente = :nome_docente, ' + sLineBreak +
                  '       idade = :idade,               ' + sLineBreak +
                  '       sexo = :sexo                  ' + sLineBreak +
                  ' WHERE id_docente = :id_docente      ',
                  [Docente.Nome,
                   Docente.idade,
                   Docente.sexo,
                   Docente.Id]);
  finally
    FreeAndNil(Query);
  end;
end;

end.

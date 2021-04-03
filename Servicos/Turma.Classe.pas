unit Turma.Classe;

interface

type
  TTurma = class
  private
    FId: Integer;
    FCodigo: string;
    FDisciplina: Integer;
  public
    property Id: Integer read FId write FId;
    property Codigo: string read FCodigo write FCodigo;
    property Disciplina: Integer read FDisciplina write FDisciplina;
  end;

implementation

end.

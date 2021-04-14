unit Discente.Classe;

interface

type
  TDiscente = class
  private
    FId: Integer;
    FNome: string;
    FIdade: Integer;
    FSexo: string;
    FCurso: Integer;
    FN1: Double;
    FN2: Double;
    FTurma: string;
  public
    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;
    property Idade: Integer read FIdade write FIdade;
    property Sexo: string read FSexo write FSexo;
    property Curso: Integer read FCurso write FCurso;
    property N1: Double read FN1 write FN1;
    property N2: Double read FN2 write FN2;
    property Turma: string read FTurma write FTurma;
  end;

implementation

end.

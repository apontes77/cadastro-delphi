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
  public
    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;
    property Idade: Integer read FIdade write FIdade;
    property Sexo: string read FSexo write FSexo;
    property Curso: Integer read FCurso write FCurso;
  end;

implementation

end.

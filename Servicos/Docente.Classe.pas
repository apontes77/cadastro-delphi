unit Docente.Classe;

interface

type
  TDocente = class
  private
    FId: Integer;
    FNome: string;
    FIdade: Integer;
    FSexo: string;
  public
    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;
    property Idade: Integer read FIdade write FIdade;
    property Sexo: string read FSexo write FSexo;
  end;

implementation

end.

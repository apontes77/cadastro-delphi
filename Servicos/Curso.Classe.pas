unit Curso.Classe;

interface

type
  TCurso = class
  private
    FId: Integer;
    FNome: string;
  public
    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;
  end;

implementation

end.

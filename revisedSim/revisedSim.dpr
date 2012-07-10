program revisedSim;

uses
  FMX_Forms,
  uMain in 'uMain.pas' {Form1},
  uSpecies in 'uSpecies.pas',
  uReaction in 'uReaction.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

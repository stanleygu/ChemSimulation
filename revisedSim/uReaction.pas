unit uReaction;

interface

uses FMX_Types, Types, sysUtils, Classes;

Type
  TReaction = class(TObject)
    x, y, w, h: single;
    name: string;
    Reactants: TStringList;
    Products: TStringList;
    RateConstant: single;
    Constructor Create(x, y, w, h: single; name: string);
    procedure paint(Canvas: TCanvas);
  end;

implementation

constructor TReaction.Create(x: Single; y: Single; w: Single; h: Single; name: string);
begin
  //coords and dimensions
  self.x := x;
  self.y := y;
  self.w := w;
  self.h := h;
  self.name := name;
  //Lists that record the index of a given reacion's reactants/products
  //within the respectful list within main (ie reactantslist/prodcutslist
  self.Reactants := TStringList.Create;
  self.Products := TStringList.Create;
  //rate constant that the user inputs
  self.RateConstant := 0;
end;

procedure TReaction.paint(Canvas: TCanvas);
begin
  //Fill
  Canvas.Fill.Kind := TBrushKind.bkSolid;
  Canvas.Fill.Color := claWhite;
  //Border
  Canvas.StrokeThickNess := 2;
  Canvas.Stroke.Kind := TBrushKind.bkSolid;
  Canvas.StrokeDash := TStrokeDash.sdSolid;
  Canvas.Stroke.Color := claBlack;
  //Ellipse
  Canvas.FillEllipse(RectF(x-w, y-h, x+w, y+h), 50);
  Canvas.DrawEllipse(RectF(x-w, y-h, x+w, y+h), 50);
  //Text
  Canvas.Fill.Color := claBlack;
  Canvas.Fill.Kind := TBrushKind.bkSolid;
  Canvas.FillText(RectF(x-w, y-h, x+w, y+h), name, True, 100, [],
          TTextAlign.taCenter, TTextAlign.taCenter);
end;

end.

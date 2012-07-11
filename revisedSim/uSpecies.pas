unit uSpecies;

interface

uses FMX_Types, Types, sysUtils;

type
  TSpecies = Class(TObject)
    x, y, w, h: single;
    name: string;
    coefficient, reaction: integer;
    constructor Create(x, y, w, h: single; name: string; coefficient: integer = 1; reaction: integer = -1);
    procedure paint(Canvas: TCanvas);
    procedure paintCoefficients(Canvas: TCanvas);
  End;

implementation

constructor TSpecies.Create(x: Single; y: Single; w: Single; h: Single; name: string;
                            coefficient: integer = 1; reaction: integer = -1);
begin
  self.x := x;
  self.y := y;
  self.w := w;
  self.h := h;
  self.name := name;
  self.coefficient := coefficient;
  self.reaction := reaction;
end;

procedure TSpecies.paint(Canvas: TCanvas);
begin
  //Fill
  Canvas.Fill.Kind := TBrushKind.bkSolid;
  Canvas.Fill.Color := claWhite;
  //Border
  Canvas.StrokeThickness := 2;
  Canvas.Stroke.Kind := TBrushkind.bkSolid;
  Canvas.StrokeDash := TStrokeDash.sdSolid;
  //ellipse
  Canvas.FillEllipse(RectF(x-w, y-h, x+w, y+h), 50);
  Canvas.DrawEllipse(RectF(x-w, y-h, x+w, y+h), 50);
  //Text
  Canvas.Fill.Color := claBlack;
  Canvas.Fill.Kind := TBrushKind.bkSolid;
  if self.coefficient <= 1 then
    Canvas.FillText(RectF(x-w, y-h, x+w, y+h), name, True, 100, [],
            TTextAlign.taCenter, TTextAlign.taCenter)
  else
    Canvas.FillText(RectF(x-w, y-h, x+w, y+h), IntToStr(coefficient)+name, True, 100, [],
            TTextAlign.taCenter, TTextAlign.taCenter);
end;

procedure TSpecies.paintCoefficients(Canvas: TCanvas);
begin
  //fill and border
  Canvas.Fill.Kind := TBrushKind.bkSolid;
  Canvas.Fill.Color := claWhite;
  Canvas.StrokeThickness := 2;
  Canvas.Stroke.Kind := TBrushkind.bkSolid;
  Canvas.StrokeDash := TStrokeDash.sdSolid;
  //decrease button
  if self.coefficient > 1 then
  begin
    Canvas.DrawRect(RectF(x-w/4, y+h*1.2, x+w/4, y+h*1.7), 1, 1, AllCorners, 50);
    Canvas.FillRect(RectF(x-w/4, y+h*1.2, x+w/4, y+h*1.7), 1, 1, AllCorners, 50);
  end;
  //IncreaseButton
  Canvas.DrawRect(RectF(x-w/4, y-h*1.7, x+w/4, y-h*1.2), 1, 1, AllCorners, 50);
  Canvas.FillRect(RectF(x-w/4, y-h*1.7, x+w/4, y-h*1.2), 1, 1, AllCorners, 50);
  Canvas.Fill.Kind := TBrushKind.bkSolid;
  Canvas.Fill.Color := claBlack;
  if self.coefficient > 1 then
    Canvas.FillText(RectF(x-w/4, y+h*1.2, x+w/4, y+h*1.7), '-', True, 100, [],
          TTextAlign.taCenter, TTextAlign.taCenter);
  Canvas.FillText(RectF(x-w/4, y-h*1.7, x+w/4, y-h*1.2), '+', True, 100, [],
          TTextAlign.taCenter, TTextAlign.taCenter);
end;

end.

unit TestEllipse;

interface

uses
  TestFrameWork, GR32;

{$DEFINE RUN_BENCHMARKS}

type
  TTestEllipse = class(TTestCase)
  published
    procedure FillEllipse_WorksForArbitrarySizes;
    procedure FillEllipse_OnZeroSizedBitmapDoesNothing;
    procedure FillEllipse_HandlesBackendBitsBeingNil;
    procedure FillEllipse_InMeasuringModeDrawsNothing;
    procedure FillEllipse_InMeasuringModeChangesBoundingRectangle;
    procedure FillEllipse_HandlesLargeEllipses;
    procedure FillEllipse_IgnoresEmptyEllipses;

    procedure FillEllipseT_WorksForArbitrarySizes;
    procedure FillEllipseT_CanBlendEllipses;
    procedure FillEllipseT_CanMergeEllipses;
    procedure FillEllipseT_CanBlendEllipsesOfArbitrarySizes;
    procedure FillEllipseT_CanMergeEllipsesOfArbitrarySizes;
    procedure FillEllipseT_WithFullOpacityBehavesLikeFillEllipse;
    procedure FillEllipseT_WithFullTransparencyDrawsNothing;
    procedure FillEllipseT_HandlesBackendBitsBeingNil;
    procedure FillEllipseT_InMeasuringModeDrawsNothing;
    procedure FillEllipseT_InMeasuringModeChangesBoundingRectangle;
    procedure FillEllipseT_HandlesLargeEllipses;
    procedure FillEllipseT_IgnoresEmptyEllipses;

    procedure FillEllipseS_WorksForArbitrarySizes;
    procedure FillEllipseS_ClipsEllipses;
    procedure FillEllipseS_OnZeroSizedBitmapDoesNothing;
    procedure FillEllipseS_HandlesBackendBitsBeingNil;
    procedure FillEllipseS_DoesNotDrawInvalidEllipses;
    procedure FillEllipseS_InMeasuringModeDrawsNothing;
    procedure FillEllipseS_InMeasuringModeChangesBoundingRectangle;
    procedure FillEllipseS_MeasuresOnlyClippedRectangle;
    procedure FillEllipseS_HasOverloadTakingRectangle;
    procedure FillEllipseS_HandlesLargeEllipses;

    procedure FillEllipseTS_WorksForArbitrarySizes;
    procedure FillEllipseTS_ClipsBlendedEllipses;
    procedure FillEllipseTS_ClipsMrgedEllipses;
    procedure FillEllipseTS_OnZeroSizedBitmapDoesNothing;
    procedure FillEllipseTS_WithFullOpacityBehavesLike_FillEllipseS;
    procedure FillEllipseTS_WithFullTransparencyDrawsNothing;
    procedure FillEllipseTS_HandlesBackendBitsBeingNil;
    procedure FillEllipseTS_DoesNotDrawInvalidEllipses;
    procedure FillEllipseTS_InMeasuringModeDrawsNothing;
    procedure FillEllipseTS_InMeasuringModeChangesBoundingRectangle;
    procedure FillEllipseTS_MeasuresOnlyClippedRectangle;
    procedure FillEllipseTS_HasOverloadTakingRectangle;
    procedure FillEllipseTS_HandlesLargeEllipses;

    procedure Ellipse_WorksForArbitrarySizes;
    procedure Ellipse_OnZeroSizedBitmapDoesNothing;
    procedure Ellipse_HandlesBackendBitsBeingNil;
    procedure Ellipse_InMeasuringModeDrawsNothing;
    procedure Ellipse_InMeasuringModeChangesBoundingRectangle;

    procedure EllipseT_WorksForArbitrarySizes;
    procedure EllipseT_CanBlendEllipses;
    procedure EllipseT_CanMergeEllipses;
    procedure EllipseT_CanBlendEllipsesOfArbitrarySizes;
    procedure EllipseT_CanMergeEllipsesOfArbitrarySizes;
    procedure EllipseT_WithFullOpacityBehavesLikeFillEllipse;
    procedure EllipseT_WithFullTransparencyDrawsNothing;
    procedure EllipseT_HandlesBackendBitsBeingNil;
    procedure EllipseT_InMeasuringModeDrawsNothing;
    procedure EllipseT_InMeasuringModeChangesBoundingRectangle;

    procedure EllipseS_WorksForArbitrarySizes;
    procedure EllipseS_ClipsEllipses;
    procedure EllipseS_OnZeroSizedBitmapDoesNothing;
    procedure EllipseS_HandlesBackendBitsBeingNil;
    procedure EllipseS_DoesNotDrawInvalidEllipses;
    procedure EllipseS_InMeasuringModeDrawsNothing;
    procedure EllipseS_InMeasuringModeChangesBoundingRectangle;
    procedure EllipseS_MeasuresOnlyClippedRectangle;
    procedure EllipseS_MeasuresNothingForInvalidEllipse;
    procedure EllipseS_HasOverloadTakingRectangle;
    procedure EllipseS_HandlesLargeEllipses;

    procedure EllipseTS_WorksForArbitrarySizes;
    procedure EllipseTS_ClipsBlendedEllipses;
    procedure EllipseTS_ClipsMrgedEllipses;
    procedure EllipseTS_OnZeroSizedBitmapDoesNothing;
    procedure EllipseTS_WithFullOpacityBehavesLike_FillEllipseS;
    procedure EllipseTS_WithFullTransparencyDrawsNothing;
    procedure EllipseTS_HandlesBackendBitsBeingNil;
    procedure EllipseTS_DoesNotDrawInvalidEllipses;
    procedure EllipseTS_InMeasuringModeDrawsNothing;
    procedure EllipseTS_InMeasuringModeChangesBoundingRectangle;
    procedure EllipseTS_MeasuresOnlyClippedRectangle;
    procedure EllipseTS_MeasuresNothingForInvalidEllipse;
    procedure EllipseTS_HasOverloadTakingRectangle;
    procedure EllipseTS_HandlesLargeEllipses;

{$IFDEF RUN_BENCHMARKS} published {$ELSE} private {$ENDIF}
    procedure FillRect_Benchmark;
    procedure FillEllipse_Benchmark;
    procedure FillEllipseT_Benchmark;
    procedure FillEllipseS_Benchmark;
    procedure FillEllipseTS_Benchmark;
    procedure TCavas32_Ellipse_Benchmark;
    procedure BenchmarkLargeFilledEllipse;

    procedure Ellipse_Benchmark;
    procedure EllipseT_Benchmark;
    procedure EllipseS_Benchmark;
    procedure EllipseTS_Benchmark;

  private
    // This test case shows the difference between the TCanvas32.Ellipse version
    // (anti-aliased) and FillEllipse. Make it published to see the difference.
    procedure Compare_FillEllipse_And_TCanvas32_Ellipse;

  protected
    procedure SetUp; override;
    procedure TearDown; override;
  private
    Have, Want: TBitmap32;
    ChangeCount: Integer;
    ChangeArea: TRect;
    ChangeInfo: Cardinal;
    procedure RememberLastChangeEvent(Sender: TObject; const Area: TRect;
      const Info: Cardinal);
  private type
    EllipseFunction = procedure(X1, Y1, X2, Y2: Integer; Value: TColor32) of object;
  private
    procedure CheckEllipsesOfAllSizes(GoldFile: string; RenderEllipse: EllipseFunction;
      Color: TColor32);
  end;

implementation

uses
  Bitmap32CompareDialogUnit, System.Classes, System.Diagnostics, System.SysUtils,
  System.Types, GR32_Paths, GR32_Brushes, GR32_Polygons;

procedure TTestEllipse.SetUp;
begin
  Have := TBitmap32.Create;
  Want := TBitmap32.Create;
end;

procedure TTestEllipse.TearDown;
begin
  Have.Free;
  Want.Free;
end;

procedure TTestEllipse.CheckEllipsesOfAllSizes(GoldFile: string;
  RenderEllipse: EllipseFunction; Color: TColor32);
const
  MaxSize = 15;
var
  X, Y, W, H: Integer;
begin
  // We draw ellipses in all sizes from 1x1 to 15x15 into one bitmap and compare it to a
  // pre-computed bitmap on disk.
  Want.LoadFromFile(GoldFile);
  Have.SetSize(Want.Width, Want.Height);

  Y := 1;
  for H := 1 to MaxSize do
  begin
    X := 1;
    for W := 1 to MaxSize do
    begin
      RenderEllipse(X, Y, X + W, Y + H, Color);
      Inc(X, W + 1);
    end;
    Inc(Y, H + 1);
  end;

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.FillEllipse_WorksForArbitrarySizes;
begin
  CheckEllipsesOfAllSizes('gold_ellipses_in_all_sizes.bmp', Have.FillEllipse, clRed32);
end;

procedure TTestEllipse.FillEllipse_OnZeroSizedBitmapDoesNothing;
begin
  Want.SetSize(0, 0);
  Have.SetSize(0, 0);
  Have.FillEllipse(0, 0, 0, 0, clRed32);
  CheckBitmapsEqual(Want, Have);
end;

type
  // NilBackend is only there to have a backend whose Bits property is nil.
  NilBackend = class(TCustomBackend)
  protected
    procedure Changing; override;
{$IFDEF BITS_GETTER}
    function GetBits: PColor32Array; override;
{$ENDIF}
    procedure InitializeSurface(NewWidth, NewHeight: Integer;
      ClearBuffer: Boolean); override;
    procedure FinalizeSurface; override;
  public
    constructor Create; overload; override;
    constructor Create(Owner: TCustomBitmap32); reintroduce; overload; virtual;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure Clear; override;
    function Empty: Boolean; override;
    procedure ChangeSize(out Width, Height: Integer; NewWidth, NewHeight: Integer;
      ClearBuffer: Boolean = True); override;
  end;

procedure NilBackend.Changing;
begin
end;

{$IFDEF BITS_GETTER}

function NilBackend.GetBits: PColor32Array;
begin
  Result := nil;
end;

{$ENDIF}

procedure NilBackend.InitializeSurface(NewWidth, NewHeight: Integer;
  ClearBuffer: Boolean);
begin
end;

procedure NilBackend.FinalizeSurface;
begin
end;

constructor NilBackend.Create;
begin
end;

constructor NilBackend.Create(Owner: TCustomBitmap32);
begin
end;

destructor NilBackend.Destroy;
begin
end;

procedure NilBackend.Assign(Source: TPersistent);
begin
end;

procedure NilBackend.Clear;
begin
end;

function NilBackend.Empty: Boolean;
begin
  Result := false;
end;

procedure NilBackend.ChangeSize(out Width, Height: Integer; NewWidth, NewHeight: Integer;
  ClearBuffer: Boolean = True);
begin
end;

procedure TTestEllipse.FillEllipse_HandlesBackendBitsBeingNil;
begin
  // The FillRect function handles the case where the Bits property is nil. We want to
  // handle this for FillEllipse as well so we provoke an error here if it is not handled
  // properly.
  Have.SetSize(20, 20);
  Have.Backend := NilBackend.Create;
  Have.FillEllipse(1, 1, 19, 19, clRed32);
  // If FillEllipse tries to access the Bits an AccessViolation should occur.
end;

procedure TTestEllipse.FillEllipse_InMeasuringModeDrawsNothing;
begin
  Want.SetSize(20, 20);

  Have.SetSize(20, 20);
  Have.BeginMeasuring(nil);
  Have.FillEllipse(1, 1, 19, 19, clRed32);
  Have.EndMeasuring;

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.RememberLastChangeEvent(Sender: TObject; const Area: TRect;
  const Info: Cardinal);
begin
  Inc(ChangeCount);
  ChangeArea := Area;
  ChangeInfo := Info;
end;

procedure TTestEllipse.FillEllipse_InMeasuringModeChangesBoundingRectangle;
begin
  Have.SetSize(20, 20);
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.FillEllipse(1, 2, 15, 10, clRed32);
  Have.EndMeasuring;
  CheckEquals(1, ChangeCount);
  CheckEquals(AREAINFO_RECT, ChangeInfo);
  CheckEquals(1, ChangeArea.Left);
  CheckEquals(2, ChangeArea.Top);
  // Note that these are not the Right and Bottom values of the ellipse but 1 larger. This
  // is done in accordance with the implementation of FillRect which also marks an area 1
  // larger than the rectangle being filled. This might well be a bug as discussed in this
  // Github issue:
  // https://github.com/graphics32/graphics32/issues/157#issuecomment-817732999
  // but until we are sure it is a bug and not on purpose we do the same here to be safe.
  CheckEquals(16, ChangeArea.Right);
  CheckEquals(11, ChangeArea.Bottom);
end;

procedure TTestEllipse.FillEllipse_HandlesLargeEllipses;
begin
  Have.SetSize(4000, 4000);
  Have.FillEllipse(0, 0, 4000, 4000, clRed32);
  // There was a bug when using 32 bit integers in the calculation (which contains
  // squares) the ellipse would only draw the top and bottom parts, the center line would
  // be missing. Thus we assure that the center contains a pixel of the ellipse.
  CheckEquals(clRed32, Have.Pixel[2000, 2000]);
end;

procedure TTestEllipse.FillEllipse_IgnoresEmptyEllipses;
begin
  Want.SetSize(4, 4);
  Have.SetSize(4, 4);

  Have.FillEllipse(2, 1, 2, 3, clRed32);
  CheckBitmapsEqual(Want, Have);

  Have.FillEllipse(1, 2, 3, 2, clGreen32);
  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.FillEllipseT_WorksForArbitrarySizes;
begin
  // The cmMerge mode makes the half-transparent red on black background appear fully red,
  // thus we can use the same gold bitmap for comparison.
  Have.CombineMode := cmMerge;
  CheckEllipsesOfAllSizes('gold_ellipses_in_all_sizes.bmp', Have.FillEllipseT, $80FF0000);
end;

procedure TTestEllipse.FillEllipseT_CanBlendEllipses;
begin
  Want.LoadFromFile('gold_blend_ellipses.bmp');

  Have.SetSize(26, 17);
  Have.CombineMode := cmBlend;
  Have.FillEllipseT(1, 1, 16, 16, $80FF0000);
  Have.FillEllipseT(10, 1, 25, 16, $800000FF);

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.FillEllipseT_CanMergeEllipses;
begin
  Want.LoadFromFile('gold_merge_ellipses.bmp');

  Have.SetSize(26, 17);
  Have.CombineMode := cmMerge;
  Have.FillEllipseT(1, 1, 16, 16, $80FF0000);
  Have.FillEllipseT(10, 1, 25, 16, $800000FF);

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.FillEllipseT_CanBlendEllipsesOfArbitrarySizes;
const
  MaxSize = 15;
var
  X, Y, W, H: Integer;
begin
  Want.LoadFromFile('gold_blend_ellipses_in_all_sizes.bmp');
  Have.SetSize(Want.Width, Want.Height);
  Have.CombineMode := cmBlend;

  Y := 1;
  for H := 1 to MaxSize do
  begin
    X := 1;
    for W := 1 to MaxSize do
    begin
      Have.FillEllipseT(X, Y, X + W, Y + H, $80FF0000);
      Have.FillEllipseT(X, Y, X + W, Y + H, $800000FF);
      Inc(X, W + 1);
    end;
    Inc(Y, H + 1);
  end;

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.FillEllipseT_CanMergeEllipsesOfArbitrarySizes;
const
  MaxSize = 15;
var
  X, Y, W, H: Integer;
begin
  Want.LoadFromFile('gold_merge_ellipses_in_all_sizes.bmp');
  Have.SetSize(Want.Width, Want.Height);
  // The cmMerge mode makes the half-transparent red on black background appear full red,
  // thus we can use the same gold bitmap for comparison.
  Have.CombineMode := cmMerge;

  Y := 1;
  for H := 1 to MaxSize do
  begin
    X := 1;
    for W := 1 to MaxSize do
    begin
      Have.FillEllipseT(X, Y, X + W, Y + H, $80FF0000);
      Have.FillEllipseT(X, Y, X + W, Y + H, $800000FF);
      Inc(X, W + 1);
    end;
    Inc(Y, H + 1);
  end;

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.FillEllipseT_WithFullOpacityBehavesLikeFillEllipse;
begin
  Want.SetSize(20, 20);
  Have.SetSize(20, 20);
  Have.FillEllipseT(1, 1, 19, 19, $FFFF0000);
  Want.FillEllipse(1, 1, 19, 19, $FFFF0000);
  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.FillEllipseT_WithFullTransparencyDrawsNothing;
begin
  Want.SetSize(20, 20);
  Have.SetSize(20, 20);
  Have.FillEllipseT(1, 1, 19, 19, $00FF0000);
  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.FillEllipseT_HandlesBackendBitsBeingNil;
begin
  Have.SetSize(20, 20);
  Have.Backend := NilBackend.Create;
  Have.FillEllipseT(1, 1, 19, 19, $88FF0000);
end;

procedure TTestEllipse.FillEllipseT_InMeasuringModeDrawsNothing;
begin
  Want.SetSize(20, 20);

  Have.SetSize(20, 20);
  Have.BeginMeasuring(nil);
  // Use different alpha values.
  Have.FillEllipseT(1, 1, 10, 10, $FFFF0000);
  Have.FillEllipseT(10, 10, 19, 19, $80FF0000);
  Have.FillEllipseT(1, 1, 19, 19, $00FF0000);
  Have.EndMeasuring;

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.FillEllipseT_InMeasuringModeChangesBoundingRectangle;
begin
  Have.SetSize(20, 20);

  // Fully opaque.
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.FillEllipseT(1, 2, 15, 10, $FFFF0000);
  Have.EndMeasuring;
  CheckEquals(1, ChangeCount);
  CheckEquals(AREAINFO_RECT, ChangeInfo);
  CheckEquals(1, ChangeArea.Left);
  CheckEquals(2, ChangeArea.Top);
  CheckEquals(16, ChangeArea.Right);
  CheckEquals(11, ChangeArea.Bottom);

  // Semi transparent.
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.FillEllipseT(2, 3, 14, 9, $88FF0000);
  Have.EndMeasuring;
  CheckEquals(2, ChangeCount);
  CheckEquals(AREAINFO_RECT, ChangeInfo);
  CheckEquals(2, ChangeArea.Left);
  CheckEquals(3, ChangeArea.Top);
  CheckEquals(15, ChangeArea.Right);
  CheckEquals(10, ChangeArea.Bottom);

  // Fully transparent ellipses do not change anything.
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.FillEllipseT(3, 4, 13, 8, $00FF0000);
  Have.EndMeasuring;
  CheckEquals(2, ChangeCount); // Same as before.
end;

procedure TTestEllipse.FillEllipseT_HandlesLargeEllipses;
begin
  Have.SetSize(4000, 4000);
  Have.CombineMode := cmMerge;
  Have.FillEllipseT(0, 0, 4000, 4000, $80FF0000);
  // There was a bug when using 32 bit integers in the calculation (which contains
  // squares) the ellipse would only draw the top and bottom parts, the center line would
  // be missing. Thus we assure that the center contains a pixel of the ellipse.
  CheckEquals($80FF0000, Have.Pixel[2000, 2000]);
end;

procedure TTestEllipse.FillEllipseT_IgnoresEmptyEllipses;
begin
  Want.SetSize(4, 4);
  Have.SetSize(4, 4);

  Have.FillEllipseT(2, 1, 2, 3, $80FF0000);
  CheckBitmapsEqual(Want, Have);

  Have.FillEllipseT(1, 2, 3, 2, $8000FF00);
  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.FillEllipseS_WorksForArbitrarySizes;
begin
  CheckEllipsesOfAllSizes('gold_ellipses_in_all_sizes.bmp', Have.FillEllipseS, clRed32);
end;

procedure TTestEllipse.FillEllipseS_ClipsEllipses;
begin
  Want.LoadFromFile('gold_clip_rect_ellipses.bmp');

  Have.SetSize(22, 20);
  Have.ClipRect := MakeRect(1, 2, 20, 16);
  Have.FillEllipseS(-6, -6, 9, 9, clRed32);
  Have.FillEllipseS(14, -6, 29, 9, clRed32);
  Have.FillEllipseS(-6, 12, 9, 27, clRed32);
  Have.FillEllipseS(14, 12, 29, 27, clRed32);

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.FillEllipseS_OnZeroSizedBitmapDoesNothing;
begin
  Want.SetSize(0, 0);
  Have.SetSize(0, 0);
  Have.FillEllipseS(-10, -10, 10, 10, clRed32);
  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.FillEllipseS_HandlesBackendBitsBeingNil;
begin
  Have.SetSize(20, 20);
  Have.Backend := NilBackend.Create;
  Have.FillEllipseS(1, 1, 19, 19, clRed32);
end;

procedure TTestEllipse.FillEllipseS_DoesNotDrawInvalidEllipses;
begin
  Have.SetSize(20, 20);
  Want.SetSize(20, 20);

  // Regression: this ellipse provokes a bug from the past.
  Have.FillEllipseS(-90, -90, 10, 10, clFuchsia32);

  Have.FillEllipseS(1, 1, 1, 5, clRed32); // 0 wide.
  Have.FillEllipseS(1, 1, 5, 1, clRed32); // 0 high.
  Have.FillEllipseS(1, 1, 0, 5, clRed32); // Negative width.
  Have.FillEllipseS(1, 1, 5, 0, clRed32); // Negative height.

  // Ellipses outside the clipping rectangle.
  Have.ClipRect := MakeRect(5, 6, 10, 11);
  Have.FillEllipseS(0, 0, 5, 20, clRed32);
  Have.FillEllipseS(0, 0, 20, 6, clRed32);
  Have.FillEllipseS(10, 0, 20, 20, clRed32);
  Have.FillEllipseS(0, 11, 20, 20, clRed32);
end;

procedure TTestEllipse.FillEllipseS_InMeasuringModeDrawsNothing;
begin
  Want.SetSize(20, 20);

  Have.SetSize(20, 20);
  Have.BeginMeasuring(nil);
  Have.FillEllipseS(1, 1, 10, 10, clRed32);
  Have.EndMeasuring;

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.FillEllipseS_InMeasuringModeChangesBoundingRectangle;
begin
  Have.SetSize(20, 20);
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.FillEllipseS(1, 2, 15, 10, clRed32);
  Have.EndMeasuring;
  CheckEquals(1, ChangeCount);
  CheckEquals(AREAINFO_RECT, ChangeInfo);
  CheckEquals(1, ChangeArea.Left);
  CheckEquals(2, ChangeArea.Top);
  CheckEquals(16, ChangeArea.Right);
  CheckEquals(11, ChangeArea.Bottom);
end;

procedure TTestEllipse.FillEllipseS_MeasuresOnlyClippedRectangle;
begin
  Have.SetSize(20, 20);
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.FillEllipseS(-10, -10, 30, 30, clRed32);
  Have.EndMeasuring;
  CheckEquals(1, ChangeCount);
  CheckEquals(AREAINFO_RECT, ChangeInfo);
  CheckEquals(0, ChangeArea.Left);
  CheckEquals(0, ChangeArea.Top);
  CheckEquals(21, ChangeArea.Right);
  CheckEquals(21, ChangeArea.Bottom);
end;

procedure TTestEllipse.FillEllipseS_HasOverloadTakingRectangle;
begin
  Want.SetSize(20, 20);
  Want.FillEllipseS(5, 5, 30, 30, clRed32);

  Have.SetSize(20, 20);
  Have.FillEllipseS(MakeRect(5, 5, 30, 30), clRed32);

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.FillEllipseS_HandlesLargeEllipses;
begin
  Want.SetSize(20, 20);
  Want.Clear(clRed32);

  Have.SetSize(20, 20);
  Have.FillEllipseS(-1000000, -1000000, 1000000, 1000000, clRed32);

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.FillEllipseTS_WorksForArbitrarySizes;
begin
  // The cmMerge mode makes the half-transparent red on black background appear fully red,
  // thus we can use the same gold bitmap for comparison.
  Have.CombineMode := cmMerge;
  CheckEllipsesOfAllSizes('gold_ellipses_in_all_sizes.bmp', Have.FillEllipseTS,
    $80FF0000);
end;

procedure TTestEllipse.FillEllipseTS_ClipsBlendedEllipses;
begin
  Want.LoadFromFile('gold_blend_clipped_ellipses.bmp');

  Have.SetSize(26, 17);
  Have.ClipRect := MakeRect(2, 3, 2 + 17, 3 + 12);
  Have.CombineMode := cmBlend;
  Have.FillEllipseTS(1, 1, 16, 16, $80FF0000);
  Have.FillEllipseTS(10, 1, 26, 16, $800000FF);

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.FillEllipseTS_ClipsMrgedEllipses;
begin
  Want.LoadFromFile('gold_merge_clipped_ellipses.bmp');

  Have.SetSize(26, 17);
  Have.ClipRect := MakeRect(2, 3, 2 + 17, 3 + 12);
  Have.CombineMode := cmMerge;
  Have.FillEllipseTS(1, 1, 16, 16, $80FF0000);
  Have.FillEllipseTS(10, 1, 26, 16, $800000FF);

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.FillEllipseTS_OnZeroSizedBitmapDoesNothing;
begin
  Want.SetSize(0, 0);
  Have.SetSize(0, 0);
  Have.FillEllipseTS(-10, -10, 10, 10, $88FF0000);
  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.FillEllipseTS_WithFullOpacityBehavesLike_FillEllipseS;
begin
  Want.SetSize(20, 20);
  Have.SetSize(20, 20);
  Have.FillEllipseTS(5, 5, 30, 30, $FFFF0000);
  Want.FillEllipseS(5, 5, 30, 30, $FFFF0000);
  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.FillEllipseTS_WithFullTransparencyDrawsNothing;
begin
  Want.SetSize(20, 20);
  Have.SetSize(20, 20);
  Have.FillEllipseTS(1, 1, 19, 19, $00FF0000);
  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.FillEllipseTS_HandlesBackendBitsBeingNil;
begin
  Have.SetSize(20, 20);
  Have.Backend := NilBackend.Create;
  Have.FillEllipseTS(1, 1, 19, 19, $88FF0000);
end;

procedure TTestEllipse.FillEllipseTS_DoesNotDrawInvalidEllipses;
begin
  Have.SetSize(20, 20);
  Want.SetSize(20, 20);

  Have.FillEllipseTS(1, 1, 1, 5, $88FF0000); // 0 wide.
  Have.FillEllipseTS(1, 1, 5, 1, $88FF0000); // 0 high.
  Have.FillEllipseTS(1, 1, 0, 5, $88FF0000); // Negative width.
  Have.FillEllipseTS(1, 1, 5, 0, $88FF0000); // Negative height.

  // Ellipses outside the clipping rectangle.
  Have.ClipRect := MakeRect(5, 6, 10, 11);
  Have.FillEllipseTS(0, 0, 5, 20, $88FF0000);
  Have.FillEllipseTS(0, 0, 20, 6, $88FF0000);
  Have.FillEllipseTS(10, 0, 20, 20, $88FF0000);
  Have.FillEllipseTS(0, 11, 20, 20, $88FF0000);
end;

procedure TTestEllipse.FillEllipseTS_InMeasuringModeDrawsNothing;
begin
  Want.SetSize(20, 20);

  Have.SetSize(20, 20);
  Have.BeginMeasuring(nil);
  // Use different alpha values.
  Have.FillEllipseTS(5, 5, 30, 30, $FFFF0000);
  Have.FillEllipseTS(10, 10, 40, 40, $80FF0000);
  Have.FillEllipseTS(15, 15, 50, 50, $00FF0000);
  Have.EndMeasuring;

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.FillEllipseTS_InMeasuringModeChangesBoundingRectangle;
begin
  Have.SetSize(20, 20);

  // Fully opaque.
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.FillEllipseTS(1, 2, 15, 10, $FFFF0000);
  Have.EndMeasuring;
  CheckEquals(1, ChangeCount);
  CheckEquals(AREAINFO_RECT, ChangeInfo);
  CheckEquals(1, ChangeArea.Left);
  CheckEquals(2, ChangeArea.Top);
  CheckEquals(16, ChangeArea.Right);
  CheckEquals(11, ChangeArea.Bottom);

  // Semi transparent.
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.FillEllipseTS(2, 3, 14, 9, $88FF0000);
  Have.EndMeasuring;
  CheckEquals(2, ChangeCount);
  CheckEquals(AREAINFO_RECT, ChangeInfo);
  CheckEquals(2, ChangeArea.Left);
  CheckEquals(3, ChangeArea.Top);
  CheckEquals(15, ChangeArea.Right);
  CheckEquals(10, ChangeArea.Bottom);

  // Fully transparent ellipses do not change anything.
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.FillEllipseTS(3, 4, 13, 8, $00FF0000);
  Have.EndMeasuring;
  CheckEquals(2, ChangeCount); // Same as before.
end;

procedure TTestEllipse.FillEllipseTS_MeasuresOnlyClippedRectangle;
begin
  Have.SetSize(20, 20);

  // Fully opaque.
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.FillEllipseTS(-10, -10, 30, 30, $FFFF0000);
  Have.EndMeasuring;
  CheckEquals(1, ChangeCount);
  CheckEquals(AREAINFO_RECT, ChangeInfo);
  CheckEquals(0, ChangeArea.Left);
  CheckEquals(0, ChangeArea.Top);
  CheckEquals(21, ChangeArea.Right);
  CheckEquals(21, ChangeArea.Bottom);

  // Semi transparent.
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.FillEllipseTS(-10, -10, 30, 30, $88FF0000);
  Have.EndMeasuring;
  CheckEquals(2, ChangeCount);
  CheckEquals(AREAINFO_RECT, ChangeInfo);
  CheckEquals(0, ChangeArea.Left);
  CheckEquals(0, ChangeArea.Top);
  CheckEquals(21, ChangeArea.Right);
  CheckEquals(21, ChangeArea.Bottom);

  // Fully transparent ellipses do not change anything.
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.FillEllipseTS(-10, -10, 30, 30, $00FF0000);
  Have.EndMeasuring;
  CheckEquals(2, ChangeCount); // Same as before.
end;

procedure TTestEllipse.FillEllipseTS_HasOverloadTakingRectangle;
begin
  Want.SetSize(20, 20);
  Want.FillEllipseTS(5, 5, 30, 30, $88FF0000);

  Have.SetSize(20, 20);
  Have.FillEllipseTS(MakeRect(5, 5, 30, 30), $88FF0000);

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.FillEllipseTS_HandlesLargeEllipses;
begin
  Want.SetSize(20, 20);
  Want.Clear(clRed32);

  Have.SetSize(20, 20);
  Have.CombineMode := cmMerge;
  Have.FillEllipseTS(-1000000, -1000000, 1000000, 1000000, $80FF0000);

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.Ellipse_WorksForArbitrarySizes;
begin
  CheckEllipsesOfAllSizes('gold_ellipse_outlines_in_all_sizes.bmp', Have.Ellipse,
    clRed32);
end;

procedure TTestEllipse.Ellipse_OnZeroSizedBitmapDoesNothing;
begin
  Want.SetSize(0, 0);
  Have.SetSize(0, 0);
  Have.Ellipse(0, 0, 0, 0, clRed32);
  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.Ellipse_HandlesBackendBitsBeingNil;
begin
  Have.SetSize(20, 20);
  Have.Backend := NilBackend.Create;
  Have.Ellipse(1, 1, 19, 19, clRed32);
end;

procedure TTestEllipse.Ellipse_InMeasuringModeDrawsNothing;
begin
  Want.SetSize(20, 20);

  Have.SetSize(20, 20);
  Have.BeginMeasuring(nil);
  Have.Ellipse(1, 1, 19, 19, clRed32);
  Have.EndMeasuring;

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.Ellipse_InMeasuringModeChangesBoundingRectangle;
begin
  Have.SetSize(20, 20);
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.Ellipse(1, 2, 15, 10, clRed32);
  Have.EndMeasuring;
  CheckEquals(1, ChangeCount);
  CheckEquals(AREAINFO_RECT, ChangeInfo);
  CheckEquals(1, ChangeArea.Left);
  CheckEquals(2, ChangeArea.Top);
  CheckEquals(16, ChangeArea.Right);
  CheckEquals(11, ChangeArea.Bottom);
end;

procedure TTestEllipse.EllipseT_WorksForArbitrarySizes;
begin
  // The cmMerge mode makes the half-transparent red on black background appear fully red,
  // thus we can use the same gold bitmap for comparison.
  Have.CombineMode := cmMerge;
  CheckEllipsesOfAllSizes('gold_ellipse_outlines_in_all_sizes.bmp', Have.EllipseT,
    $80FF0000);
end;

procedure TTestEllipse.EllipseT_CanBlendEllipses;
begin
  Want.LoadFromFile('gold_blend_ellipse_outlines.bmp');

  Have.SetSize(24, 17);
  Have.CombineMode := cmBlend;
  Have.EllipseT(1, 1, 16, 16, $80FF0000);
  Have.EllipseT(8, 1, 23, 16, $800000FF);

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.EllipseT_CanMergeEllipses;
begin
  Want.LoadFromFile('gold_merge_ellipse_outlines.bmp');

  Have.SetSize(24, 17);
  Have.CombineMode := cmMerge;
  Have.EllipseT(1, 1, 16, 16, $80FF0000);
  Have.EllipseT(8, 1, 23, 16, $800000FF);

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.EllipseT_CanBlendEllipsesOfArbitrarySizes;
const
  MaxSize = 15;
var
  X, Y, W, H: Integer;
begin
  Want.LoadFromFile('gold_blend_ellipse_outlines_in_all_sizes.bmp');
  Have.SetSize(Want.Width, Want.Height);
  Have.CombineMode := cmBlend;

  Y := 1;
  for H := 1 to MaxSize do
  begin
    X := 1;
    for W := 1 to MaxSize do
    begin
      Have.EllipseT(X, Y, X + W, Y + H, $80FF0000);
      Have.EllipseT(X, Y, X + W, Y + H, $800000FF);
      Inc(X, W + 1);
    end;
    Inc(Y, H + 1);
  end;

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.EllipseT_CanMergeEllipsesOfArbitrarySizes;
const
  MaxSize = 15;
var
  X, Y, W, H: Integer;
begin
  Want.LoadFromFile('gold_merge_ellipse_outlines_in_all_sizes.bmp');
  Have.SetSize(Want.Width, Want.Height);
  Have.CombineMode := cmMerge;

  Y := 1;
  for H := 1 to MaxSize do
  begin
    X := 1;
    for W := 1 to MaxSize do
    begin
      Have.EllipseT(X, Y, X + W, Y + H, $80FF0000);
      Have.EllipseT(X, Y, X + W, Y + H, $800000FF);
      Inc(X, W + 1);
    end;
    Inc(Y, H + 1);
  end;

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.EllipseT_WithFullOpacityBehavesLikeFillEllipse;
begin
  Want.SetSize(20, 20);
  Have.SetSize(20, 20);
  Have.EllipseT(1, 1, 19, 19, $FFFF0000);
  Want.Ellipse(1, 1, 19, 19, $FFFF0000);
  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.EllipseT_WithFullTransparencyDrawsNothing;
begin
  Want.SetSize(20, 20);
  Have.SetSize(20, 20);
  Have.EllipseT(1, 1, 19, 19, $00FF0000);
  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.EllipseT_HandlesBackendBitsBeingNil;
begin
  Have.SetSize(20, 20);
  Have.Backend := NilBackend.Create;
  Have.EllipseT(1, 1, 19, 19, $88FF0000);
end;

procedure TTestEllipse.EllipseT_InMeasuringModeDrawsNothing;
begin
  Want.SetSize(20, 20);

  Have.SetSize(20, 20);
  Have.BeginMeasuring(nil);
  // Use different alpha values.
  Have.EllipseT(1, 1, 10, 10, $FFFF0000);
  Have.EllipseT(10, 10, 19, 19, $80FF0000);
  Have.EllipseT(1, 1, 19, 19, $00FF0000);
  Have.EndMeasuring;

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.EllipseT_InMeasuringModeChangesBoundingRectangle;
begin
  Have.SetSize(20, 20);

  // Fully opaque.
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.EllipseT(1, 2, 15, 10, $FFFF0000);
  Have.EndMeasuring;
  CheckEquals(1, ChangeCount);
  CheckEquals(AREAINFO_RECT, ChangeInfo);
  CheckEquals(1, ChangeArea.Left);
  CheckEquals(2, ChangeArea.Top);
  CheckEquals(16, ChangeArea.Right);
  CheckEquals(11, ChangeArea.Bottom);

  // Semi transparent.
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.EllipseT(2, 3, 14, 9, $88FF0000);
  Have.EndMeasuring;
  CheckEquals(2, ChangeCount);
  CheckEquals(AREAINFO_RECT, ChangeInfo);
  CheckEquals(2, ChangeArea.Left);
  CheckEquals(3, ChangeArea.Top);
  CheckEquals(15, ChangeArea.Right);
  CheckEquals(10, ChangeArea.Bottom);

  // Fully transparent ellipses do not change anything.
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.EllipseT(3, 4, 13, 8, $00FF0000);
  Have.EndMeasuring;
  CheckEquals(2, ChangeCount); // Same as before.
end;

procedure TTestEllipse.EllipseS_WorksForArbitrarySizes;
begin
  CheckEllipsesOfAllSizes('gold_ellipse_outlines_in_all_sizes.bmp',
    Have.EllipseS, clRed32);
end;

procedure TTestEllipse.EllipseS_ClipsEllipses;
begin
  Want.LoadFromFile('gold_clip_rect_ellipse_outlines.bmp');

  Have.SetSize(22, 20);
  Have.ClipRect := MakeRect(1, 2, 20, 16);
  Have.EllipseS(-6, -6, 9, 9, clRed32);
  Have.EllipseS(14, -6, 29, 9, clRed32);
  Have.EllipseS(-6, 12, 9, 27, clRed32);
  Have.EllipseS(14, 12, 29, 27, clRed32);

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.EllipseS_OnZeroSizedBitmapDoesNothing;
begin
  Want.SetSize(0, 0);
  Have.SetSize(0, 0);
  Have.EllipseS(-10, -10, 10, 10, clRed32);
  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.EllipseS_HandlesBackendBitsBeingNil;
begin
  Have.SetSize(20, 20);
  Have.Backend := NilBackend.Create;
  Have.EllipseS(1, 1, 19, 19, clRed32);
end;

procedure TTestEllipse.EllipseS_DoesNotDrawInvalidEllipses;
begin
  Have.SetSize(20, 20);
  Want.SetSize(20, 20);

  // Regression: this ellipse provokes a bug from the past.
  Have.EllipseS(-90, -90, 10, 10, clFuchsia32);

  Have.EllipseS(1, 1, 1, 5, clRed32); // 0 wide.
  Have.EllipseS(1, 1, 5, 1, clRed32); // 0 high.
  Have.EllipseS(1, 1, 0, 5, clRed32); // Negative width.
  Have.EllipseS(1, 1, 5, 0, clRed32); // Negative height.

  // Ellipses outside the clipping rectangle.
  Have.ClipRect := MakeRect(5, 6, 10, 11);
  Have.EllipseS(0, 0, 5, 20, clRed32);
  Have.EllipseS(0, 0, 20, 6, clRed32);
  Have.EllipseS(10, 0, 20, 20, clRed32);
  Have.EllipseS(0, 11, 20, 20, clRed32);
end;

procedure TTestEllipse.EllipseS_InMeasuringModeDrawsNothing;
begin
  Want.SetSize(20, 20);

  Have.SetSize(20, 20);
  Have.BeginMeasuring(nil);
  Have.EllipseS(1, 1, 10, 10, clRed32);
  Have.EndMeasuring;

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.EllipseS_InMeasuringModeChangesBoundingRectangle;
begin
  Have.SetSize(20, 20);
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.EllipseS(1, 2, 15, 10, clRed32);
  Have.EndMeasuring;
  CheckEquals(1, ChangeCount);
  CheckEquals(AREAINFO_RECT, ChangeInfo);
  CheckEquals(1, ChangeArea.Left);
  CheckEquals(2, ChangeArea.Top);
  CheckEquals(16, ChangeArea.Right);
  CheckEquals(11, ChangeArea.Bottom);
end;

procedure TTestEllipse.EllipseS_MeasuresOnlyClippedRectangle;
begin
  Have.SetSize(20, 20);
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.EllipseS(-10, -10, 30, 30, clRed32);
  Have.EndMeasuring;
  CheckEquals(1, ChangeCount);
  CheckEquals(AREAINFO_RECT, ChangeInfo);
  CheckEquals(0, ChangeArea.Left);
  CheckEquals(0, ChangeArea.Top);
  CheckEquals(21, ChangeArea.Right);
  CheckEquals(21, ChangeArea.Bottom);
end;

procedure TTestEllipse.EllipseS_MeasuresNothingForInvalidEllipse;
begin
  Have.SetSize(20, 20);
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.EllipseS(5, 5, 5, 5, clRed32);
  Have.EndMeasuring;
  CheckEquals(0, ChangeCount);
end;

procedure TTestEllipse.EllipseS_HasOverloadTakingRectangle;
begin
  Want.SetSize(20, 20);
  Want.EllipseS(5, 5, 30, 30, clRed32);

  Have.SetSize(20, 20);
  Have.EllipseS(MakeRect(5, 5, 30, 30), clRed32);

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.EllipseS_HandlesLargeEllipses;
begin
  Want.SetSize(20, 20);
  Want.LineS(10, 0, 10, 20, clRed32);

  Have.SetSize(20, 20);
  Have.EllipseS(10, -1000000, 2000000, 1000000, clRed32);

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.EllipseTS_WorksForArbitrarySizes;
begin
  // The cmMerge mode makes the half-transparent red on black background appear fully red,
  // thus we can use the same gold bitmap for comparison.
  Have.CombineMode := cmMerge;
  CheckEllipsesOfAllSizes('gold_ellipse_outlines_in_all_sizes.bmp', Have.EllipseTS,
    $80FF0000);
end;

procedure TTestEllipse.EllipseTS_ClipsBlendedEllipses;
begin
  Want.LoadFromFile('gold_blend_clipped_ellipse_outlines.bmp');

  Have.SetSize(24, 17);
  Have.ClipRect := MakeRect(2, 3, 2 + 17, 3 + 12);
  Have.CombineMode := cmBlend;
  Have.EllipseTS(1, 1, 16, 16, $80FF0000);
  Have.EllipseTS(8, 1, 24, 16, $800000FF);

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.EllipseTS_ClipsMrgedEllipses;
begin
  Want.LoadFromFile('gold_merge_clipped_ellipse_outlines.bmp');

  Have.SetSize(24, 17);
  Have.ClipRect := MakeRect(2, 3, 2 + 17, 3 + 12);
  Have.CombineMode := cmMerge;
  Have.EllipseTS(1, 1, 16, 16, $80FF0000);
  Have.EllipseTS(8, 1, 24, 16, $800000FF);

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.EllipseTS_OnZeroSizedBitmapDoesNothing;
begin
  Want.SetSize(0, 0);
  Have.SetSize(0, 0);
  Have.EllipseTS(-10, -10, 10, 10, $88FF0000);
  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.EllipseTS_WithFullOpacityBehavesLike_FillEllipseS;
begin
  Want.SetSize(20, 20);
  Have.SetSize(20, 20);
  Have.EllipseTS(5, 5, 30, 30, $FFFF0000);
  Want.EllipseS(5, 5, 30, 30, $FFFF0000);
  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.EllipseTS_WithFullTransparencyDrawsNothing;
begin
  Want.SetSize(20, 20);
  Have.SetSize(20, 20);
  Have.EllipseTS(10, 10, 30, 30, $00FF0000);
  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.EllipseTS_HandlesBackendBitsBeingNil;
begin
  Have.SetSize(20, 20);
  Have.Backend := NilBackend.Create;
  Have.EllipseTS(1, 1, 19, 19, $88FF0000);
end;

procedure TTestEllipse.EllipseTS_DoesNotDrawInvalidEllipses;
begin
  Have.SetSize(20, 20);
  Want.SetSize(20, 20);

  Have.EllipseTS(1, 1, 1, 5, $88FF0000); // 0 wide.
  Have.EllipseTS(1, 1, 5, 1, $88FF0000); // 0 high.
  Have.EllipseTS(1, 1, 0, 5, $88FF0000); // Negative width.
  Have.EllipseTS(1, 1, 5, 0, $88FF0000); // Negative height.

  // Ellipses outside the clipping rectangle.
  Have.ClipRect := MakeRect(5, 6, 10, 11);
  Have.EllipseTS(0, 0, 5, 20, $88FF0000);
  Have.EllipseTS(0, 0, 20, 6, $88FF0000);
  Have.EllipseTS(10, 0, 20, 20, $88FF0000);
  Have.EllipseTS(0, 11, 20, 20, $88FF0000);
end;

procedure TTestEllipse.EllipseTS_InMeasuringModeDrawsNothing;
begin
  Want.SetSize(20, 20);

  Have.SetSize(20, 20);
  Have.BeginMeasuring(nil);
  // Use different alpha values.
  Have.EllipseTS(5, 5, 30, 30, $FFFF0000);
  Have.EllipseTS(10, 10, 40, 40, $80FF0000);
  Have.EllipseTS(15, 15, 50, 50, $00FF0000);
  Have.EndMeasuring;

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.EllipseTS_InMeasuringModeChangesBoundingRectangle;
begin
  Have.SetSize(20, 20);

  // Fully opaque.
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.EllipseTS(1, 2, 15, 10, $FFFF0000);
  Have.EndMeasuring;
  CheckEquals(1, ChangeCount);
  CheckEquals(AREAINFO_RECT, ChangeInfo);
  CheckEquals(1, ChangeArea.Left);
  CheckEquals(2, ChangeArea.Top);
  CheckEquals(16, ChangeArea.Right);
  CheckEquals(11, ChangeArea.Bottom);

  // Semi transparent.
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.EllipseTS(2, 3, 14, 9, $88FF0000);
  Have.EndMeasuring;
  CheckEquals(2, ChangeCount);
  CheckEquals(AREAINFO_RECT, ChangeInfo);
  CheckEquals(2, ChangeArea.Left);
  CheckEquals(3, ChangeArea.Top);
  CheckEquals(15, ChangeArea.Right);
  CheckEquals(10, ChangeArea.Bottom);

  // Fully transparent ellipses do not change anything.
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.EllipseTS(3, 4, 13, 8, $00FF0000);
  Have.EndMeasuring;
  CheckEquals(2, ChangeCount); // Same as before.
end;

procedure TTestEllipse.EllipseTS_MeasuresOnlyClippedRectangle;
begin
  Have.SetSize(20, 20);

  // Fully opaque.
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.EllipseTS(-10, -10, 30, 30, $FFFF0000);
  Have.EndMeasuring;
  CheckEquals(1, ChangeCount);
  CheckEquals(AREAINFO_RECT, ChangeInfo);
  CheckEquals(0, ChangeArea.Left);
  CheckEquals(0, ChangeArea.Top);
  CheckEquals(21, ChangeArea.Right);
  CheckEquals(21, ChangeArea.Bottom);

  // Semi transparent.
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.EllipseTS(-10, -10, 30, 30, $88FF0000);
  Have.EndMeasuring;
  CheckEquals(2, ChangeCount);
  CheckEquals(AREAINFO_RECT, ChangeInfo);
  CheckEquals(0, ChangeArea.Left);
  CheckEquals(0, ChangeArea.Top);
  CheckEquals(21, ChangeArea.Right);
  CheckEquals(21, ChangeArea.Bottom);

  // Fully transparent ellipses do not change anything.
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.EllipseTS(-10, -10, 30, 30, $00FF0000);
  Have.EndMeasuring;
  CheckEquals(2, ChangeCount); // Same as before.
end;

procedure TTestEllipse.EllipseTS_MeasuresNothingForInvalidEllipse;
begin
  Have.SetSize(20, 20);
  Have.BeginMeasuring(RememberLastChangeEvent);
  Have.EllipseTS(5, 5, 5, 5, $80FF0000);
  Have.EndMeasuring;
  CheckEquals(0, ChangeCount);
end;

procedure TTestEllipse.EllipseTS_HasOverloadTakingRectangle;
begin
  Want.SetSize(20, 20);
  Want.EllipseTS(5, 5, 30, 30, $88FF0000);

  Have.SetSize(20, 20);
  Have.EllipseTS(MakeRect(5, 5, 30, 30), $88FF0000);

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.EllipseTS_HandlesLargeEllipses;
begin
  Want.SetSize(20, 20);
  Want.LineS(10, 0, 10, 20, clRed32);

  Have.SetSize(20, 20);
  Have.CombineMode := cmMerge;
  Have.EllipseTS(10, -1000000, 2000000, 1000000, $80FF0000);

  CheckBitmapsEqual(Want, Have);
end;

procedure TTestEllipse.FillRect_Benchmark;
var
  Watch: TStopwatch;
  X, Y: Integer;
begin
  Have.SetSize(1000, 1000);
  Watch := TStopwatch.StartNew;

  for Y := 0 to 100 - 10 do
    for X := 0 to 100 - 10 do
      Have.FillRect(X * 10, Y * 10, X * 10 + 100, Y * 10 + 100, clFuchsia32);

  for Y := 0 to 100 - 5 do
    for X := 0 to 100 - 5 do
      Have.FillRect(X * 10, Y * 10, X * 10 + 50, Y * 10 + 50, clRed32);

  for Y := 0 to 100 - 1 do
    for X := 0 to 100 - 1 do
      Have.FillRect(X * 10, Y * 10, X * 10 + 10, Y * 10 + 10, clBlue32);

  Watch.Stop;
  Have.SaveToFile('FillRect_Benchmark.bmp');
  Fail(Format('FillRect took %d ms', [Watch.ElapsedMilliseconds]));
end;

procedure TTestEllipse.FillEllipse_Benchmark;
var
  Watch: TStopwatch;
  X, Y: Integer;
begin
  Have.SetSize(1000, 1000);
  Watch := TStopwatch.StartNew;

  for Y := 0 to 100 - 10 do
    for X := 0 to 100 - 10 do
      Have.FillEllipse(X * 10, Y * 10, X * 10 + 100, Y * 10 + 100, clFuchsia32);

  for Y := 0 to 100 - 5 do
    for X := 0 to 100 - 5 do
      Have.FillEllipse(X * 10, Y * 10, X * 10 + 50, Y * 10 + 50, clRed32);

  for Y := 0 to 100 - 1 do
    for X := 0 to 100 - 1 do
      Have.FillEllipse(X * 10, Y * 10, X * 10 + 10, Y * 10 + 10, clBlue32);

  Watch.Stop;
  Have.SaveToFile('FillEllipse_Benchmark.bmp');
  Fail(Format('FillEllipse took %d ms', [Watch.ElapsedMilliseconds]));
end;

procedure TTestEllipse.FillEllipseT_Benchmark;
var
  Watch: TStopwatch;
  X, Y: Integer;
begin
  Have.SetSize(1000, 1000);
  Watch := TStopwatch.StartNew;

  for Y := 0 to 100 - 10 do
    for X := 0 to 100 - 10 do
      Have.FillEllipseT(X * 10, Y * 10, X * 10 + 100, Y * 10 + 100, $66FF00FF);

  for Y := 0 to 100 - 5 do
    for X := 0 to 100 - 5 do
      Have.FillEllipseT(X * 10, Y * 10, X * 10 + 50, Y * 10 + 50, $55FF0000);

  for Y := 0 to 100 - 1 do
    for X := 0 to 100 - 1 do
      Have.FillEllipseT(X * 10, Y * 10, X * 10 + 10, Y * 10 + 10, $440000FF);

  Watch.Stop;
  Have.SaveToFile('FillEllipseT_Benchmark.bmp');
  Fail(Format('FillEllipseT took %d ms', [Watch.ElapsedMilliseconds]));
end;

procedure TTestEllipse.FillEllipseS_Benchmark;
var
  Watch: TStopwatch;
  X, Y: Integer;
begin
  Have.SetSize(1000, 1000);
  Watch := TStopwatch.StartNew;

  for Y := -10 to 100 do
    for X := -10 to 100 do
      Have.FillEllipseS(X * 10, Y * 10, X * 10 + 100, Y * 10 + 100, clFuchsia32);

  for Y := -10 to 100 do
    for X := -10 to 100 do
      Have.FillEllipseS(X * 10, Y * 10, X * 10 + 50, Y * 10 + 50, clRed32);

  for Y := -10 to 100 do
    for X := -10 to 100 do
      Have.FillEllipseS(X * 10, Y * 10, X * 10 + 10, Y * 10 + 10, clBlue32);

  Watch.Stop;
  Have.SaveToFile('FillEllipseS_Benchmark.bmp');
  Fail(Format('FillEllipseS took %d ms', [Watch.ElapsedMilliseconds]));
end;

procedure TTestEllipse.FillEllipseTS_Benchmark;
var
  Watch: TStopwatch;
  X, Y: Integer;
begin
  Have.SetSize(1000, 1000);
  Watch := TStopwatch.StartNew;

  for Y := -10 to 100 do
    for X := -10 to 100 do
      Have.FillEllipseTS(X * 10, Y * 10, X * 10 + 100, Y * 10 + 100, $66FF00FF);

  for Y := -10 to 100 do
    for X := -10 to 100 do
      Have.FillEllipseTS(X * 10, Y * 10, X * 10 + 50, Y * 10 + 50, $55FF0000);

  for Y := -10 to 100 do
    for X := -10 to 100 do
      Have.FillEllipseTS(X * 10, Y * 10, X * 10 + 10, Y * 10 + 10, $440000FF);

  Watch.Stop;
  Have.SaveToFile('FillEllipseTS_Benchmark.bmp');
  Fail(Format('FillEllipseTS took %d ms', [Watch.ElapsedMilliseconds]));
end;

procedure TTestEllipse.TCavas32_Ellipse_Benchmark;
var
  Watch: TStopwatch;
  C: TCanvas32;
  Brush: TSolidBrush;
  X, Y: Integer;
begin
  Have.SetSize(1000, 1000);
  C := TCanvas32.Create(Have);
  Brush := C.Brushes.Add(TSolidBrush) as TSolidBrush;

  Watch := TStopwatch.StartNew;

  Brush.FillColor := clFuchsia32;
  for Y := 0 to 100 - 10 do
    for X := 0 to 100 - 10 do
      C.Ellipse(X * 10 + 50, Y * 10 + 50, 50, 50, 50);

  Brush.FillColor := clRed32;
  for Y := 0 to 100 - 5 do
    for X := 0 to 100 - 5 do
      C.Ellipse(X * 10 + 25, Y * 10 + 25, 25, 25, 25);

  Brush.FillColor := clBlue32;
  for Y := 0 to 100 - 1 do
    for X := 0 to 100 - 1 do
      C.Ellipse(X * 10 + 5, Y * 10 + 5, 5, 5, 5);

  Watch.Stop;
  Have.SaveToFile('TCavas32_Ellipse_Benchmark.bmp');
  C.Free;
  Fail(Format('TCavas32.Ellipse took %d ms', [Watch.ElapsedMilliseconds]));
end;

procedure TTestEllipse.BenchmarkLargeFilledEllipse;
var
  Watch: TStopwatch;
begin
  Have.SetSize(20, 20);
  Watch := TStopwatch.StartNew;

  // TODO There is potential here to shortcut ellipses that are so large that they cover
  // the whole clip rect. We can use a FillRect instead in that case. We have to look at
  // the center of the ellipse, the x and y radius and see if they are outside the clip
  // rect, minus some rounding errors due to drawing pixels and not floating point
  // accurate ellipses.
  // A more complicated case is a very large ellipse that is neither outside the clip rect
  // nor covers the whole screen. Say that only the ellipse's left edge is visible. Now we
  // might have to still trace the whole ellipse. Or maybe trace the 90 degree rotated
  // ellipse instead, starting the algorithm from the center to the upper and lower edges.
  // Right now the algorithm works its way inward, from top and bottom to the center.
  Have.FillEllipseS(-1000000, -1000000, 1000000, 1000000, clRed32);

  Watch.Stop;
  Have.SaveToFile('LargeEllipse_Benchmark.bmp');
  Fail(Format('Large Ellipse took %d ms', [Watch.ElapsedMilliseconds]));
end;

procedure TTestEllipse.Ellipse_Benchmark;
var
  Watch: TStopwatch;
  X, Y: Integer;
begin
  Have.SetSize(1000, 1000);
  Watch := TStopwatch.StartNew;

  for Y := 0 to 100 - 10 do
    for X := 0 to 100 - 10 do
      Have.Ellipse(X * 10, Y * 10, X * 10 + 100, Y * 10 + 100, clFuchsia32);

  for Y := 0 to 100 - 5 do
    for X := 0 to 100 - 5 do
      Have.Ellipse(X * 10, Y * 10, X * 10 + 50, Y * 10 + 50, clRed32);

  for Y := 0 to 100 - 1 do
    for X := 0 to 100 - 1 do
      Have.Ellipse(X * 10, Y * 10, X * 10 + 10, Y * 10 + 10, clBlue32);

  Watch.Stop;
  Have.SaveToFile('Ellipse_Benchmark.bmp');
  Fail(Format('Ellipse took %d ms', [Watch.ElapsedMilliseconds]));
end;

procedure TTestEllipse.EllipseT_Benchmark;
var
  Watch: TStopwatch;
  X, Y: Integer;
begin
  Have.SetSize(1000, 1000);
  Watch := TStopwatch.StartNew;

  for Y := 0 to 100 - 10 do
    for X := 0 to 100 - 10 do
      Have.EllipseT(X * 10, Y * 10, X * 10 + 100, Y * 10 + 100, $66FF00FF);

  for Y := 0 to 100 - 5 do
    for X := 0 to 100 - 5 do
      Have.EllipseT(X * 10, Y * 10, X * 10 + 50, Y * 10 + 50, $55FF0000);

  for Y := 0 to 100 - 1 do
    for X := 0 to 100 - 1 do
      Have.EllipseT(X * 10, Y * 10, X * 10 + 10, Y * 10 + 10, $440000FF);

  Watch.Stop;
  Have.SaveToFile('EllipseT_Benchmark.bmp');
  Fail(Format('EllipseT took %d ms', [Watch.ElapsedMilliseconds]));
end;

procedure TTestEllipse.EllipseS_Benchmark;
var
  Watch: TStopwatch;
  X, Y: Integer;
begin
  Have.SetSize(1000, 1000);
  Watch := TStopwatch.StartNew;

  for Y := -10 to 100 do
    for X := -10 to 100 do
      Have.EllipseS(X * 10, Y * 10, X * 10 + 100, Y * 10 + 100, $66FF00FF);

  for Y := -10 to 100 do
    for X := -10 to 100 do
      Have.EllipseS(X * 10, Y * 10, X * 10 + 50, Y * 10 + 50, $55FF0000);

  for Y := -10 to 100 do
    for X := -10 to 100 do
      Have.EllipseS(X * 10, Y * 10, X * 10 + 10, Y * 10 + 10, $440000FF);

  Watch.Stop;
  Have.SaveToFile('EllipseS_Benchmark.bmp');
  Fail(Format('EllipseS took %d ms', [Watch.ElapsedMilliseconds]));
end;

procedure TTestEllipse.EllipseTS_Benchmark;
var
  Watch: TStopwatch;
  X, Y: Integer;
begin
  Have.SetSize(1000, 1000);
  Watch := TStopwatch.StartNew;

  for Y := -10 to 100 do
    for X := -10 to 100 do
      Have.EllipseTS(X * 10, Y * 10, X * 10 + 100, Y * 10 + 100, $66FF00FF);

  for Y := -10 to 100 do
    for X := -10 to 100 do
      Have.EllipseTS(X * 10, Y * 10, X * 10 + 50, Y * 10 + 50, $55FF0000);

  for Y := -10 to 100 do
    for X := -10 to 100 do
      Have.EllipseTS(X * 10, Y * 10, X * 10 + 10, Y * 10 + 10, $440000FF);

  Watch.Stop;
  Have.SaveToFile('EllipseTS_Benchmark.bmp');
  Fail(Format('EllipseTS took %d ms', [Watch.ElapsedMilliseconds]));
end;

procedure TTestEllipse.Compare_FillEllipse_And_TCanvas32_Ellipse;
var
  C: TCanvas32;
  Brush: TSolidBrush;
begin
  Have.SetSize(20, 20);
  Have.FillEllipse(1, 1, 19, 19, clRed32);

  Want.SetSize(20, 20);
  C := TCanvas32.Create(Want);
  Brush := C.Brushes.Add(TSolidBrush) as TSolidBrush;
  Brush.FillColor := clRed32;
  C.Ellipse(10, 10, 9, 9);
  C.Free;

  CheckBitmapsEqual(Want, Have);
end;

initialization

TestFrameWork.RegisterTest(TTestEllipse.Suite);

end.

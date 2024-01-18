unit resin_formdatau;

interface

uses Classes;

type
  TFormData = class(TObject)
  private
    FIncludeContinentValues: Boolean;
    FContinentValues: TStrings;
    FIncludeAreaValues: Boolean;
    FAreaValues: TStrings;
    FIncludeUnitValues: Boolean;
    FUnitValues: TStrings;
    FIncludeLithologyValues: Boolean;
    FLithologyValues: TStrings;
    FIncludeMaterialValues: Boolean;
    FMaterialValues: TStrings;
    FIncludeMethodValues: Boolean;
    FMethodValues: TStrings;
    FIncludeIsotopeSystemValues: Boolean;
    FIsotopeSystemValues: TStrings;
    FIncludeInterpretationValues: Boolean;
    FInterpretationValues: TStrings;
    FIncludeApproachValues: Boolean;
    FApproachValues: TStrings;
    FIncludeTechniqueValues: Boolean;
    FTechniqueValues: TStrings;
    FIncludeGroupValues: Boolean;
    FGroupValues: TStrings;
    FIncludeProvinceValues: Boolean;
    FProvinceValues: TStrings;
    FIncludeTerraneValues: Boolean;
    FTerraneValues: TStrings;
    FIncludeOrogenicPeriodValues: Boolean;
    FOrogenicPeriodValues: TStrings;
    FIncludeReferenceValues: Boolean;
    FReferenceValues: TStrings;
    FIncludeChemicalTypeValues: Boolean;
    FChemicalTypeValues: TStrings;
    FIncludeBoundaryPositionValues: Boolean;
    FBoundaryPositionValues: TStrings;
    FIncludeBoundaryValues: Boolean;
    FBoundaryValues: TStrings;
    FIncludeValidationValues: Boolean;
    FValidationValues: TStrings;
    FIncludeWhoForValues: Boolean;
    FWhoForValues: TStrings;
    FPreferenceLevelValue: string;
    FConfidentialValue: string;
    FIncludeIsochronOnlyValue: Boolean;
    FDecayUncertaintyValues: TStrings;
    FIncludeDateFromValue: Boolean;
    FDateFromField: string;
    FIncludeDateToValue: Boolean;
    FDateToField: string;
    FDateUnitsValue: string;
    FOrderByValue: string;
    FSQLMemoField: TStrings;
    FRecordChosen: string;
    FParameterChosen: string;
    FSampleStartFrom: string;
    FSampleEndWith: string;
    procedure SetContinentValues(const Value: TStrings);
    procedure SetAreaValues(const Value: TStrings);
    procedure SetUnitValues(const Value: TStrings);
    procedure SetLithologyValues(const Value: TStrings);
    procedure SetMaterialValues(const Value: TStrings);
    procedure SetMethodValues(const Value: TStrings);
    procedure SetIsotopeSystemValues(const Value: TStrings);
    procedure SetInterpretationValues(const Value: TStrings);
    procedure SetApproachValues(const Value: TStrings);
    procedure SetTechniqueValues(const Value: TStrings);
    procedure SetGroupValues(const Value: TStrings);
    procedure SetProvinceValues(const Value: TStrings);
    procedure SetTerraneValues(const Value: TStrings);
    procedure SetOrogenicPeriodValues(const Value: TStrings);
    procedure SetReferenceValues(const Value: TStrings);
    procedure SetChemicalTypeValues(const Value: TStrings);
    procedure SetBoundaryPositionValues(const Value: TStrings);
    procedure SetBoundaryValues(const Value: TStrings);
    procedure SetValidationValues(const Value: TStrings);
    procedure SetWhoForValues(const Value: TStrings);
    procedure SetDecayUncertaintyValues(const Value: TStrings);
    procedure SetSQLMemoField(const Value: TStrings);
    function GetXML: string;
    procedure SetXML(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    property IncludeContinentValues: Boolean read FIncludeContinentValues write FIncludeContinentValues;
    property ContinentValues: TStrings read FContinentValues write SetContinentValues;
    property IncludeAreaValues: Boolean read FIncludeAreaValues write FIncludeAreaValues;
    property AreaValues: TStrings read FAreaValues write SetAreaValues;
    property IncludeUnitValues: Boolean read FIncludeUnitValues write FIncludeUnitValues;
    property UnitValues: TStrings read FUnitValues write SetUnitValues;
    property IncludeLithologyValues: Boolean read FIncludeLithologyValues write FIncludeLithologyValues;
    property LithologyValues: TStrings read FLithologyValues write SetLithologyValues;
    property IncludeMaterialValues: Boolean read FIncludeMaterialValues write FIncludeMaterialValues;
    property MaterialValues: TStrings read FMaterialValues write SetMaterialValues;
    property IncludeMethodValues: Boolean read FIncludeMethodValues write FIncludeMethodValues;
    property MethodValues: TStrings read FMethodValues write SetMethodValues;
    property IncludeIsotopeSystemValues: Boolean read FIncludeIsotopeSystemValues write FIncludeIsotopeSystemValues;
    property IsotopeSystemValues: TStrings read FIsotopeSystemValues write SetIsotopeSystemValues;
    property IncludeInterpretationValues: Boolean read FIncludeInterpretationValues write FIncludeInterpretationValues;
    property InterpretationValues: TStrings read FInterpretationValues write SetInterpretationValues;
    property IncludeApproachValues: Boolean read FIncludeApproachValues write FIncludeApproachValues;
    property ApproachValues: TStrings read FApproachValues write SetApproachValues;
    property IncludeTechniqueValues: Boolean read FIncludeTechniqueValues write FIncludeTechniqueValues;
    property TechniqueValues: TStrings read FTechniqueValues write SetTechniqueValues;
    property IncludeGroupValues: Boolean read FIncludeGroupValues write FIncludeGroupValues;
    property GroupValues: TStrings read FGroupValues write SetGroupValues;
    property IncludeProvinceValues: Boolean read FIncludeProvinceValues write FIncludeProvinceValues;
    property ProvinceValues: TStrings read FProvinceValues write SetProvinceValues;
    property IncludeTerraneValues: Boolean read FIncludeTerraneValues write FIncludeTerraneValues;
    property TerraneValues: TStrings read FTerraneValues write SetTerraneValues;
    property IncludeOrogenicPeriodValues: Boolean read FIncludeOrogenicPeriodValues write FIncludeOrogenicPeriodValues;
    property OrogenicPeriodValues: TStrings read FOrogenicPeriodValues write SetOrogenicPeriodValues;
    property IncludeReferenceValues: Boolean read FIncludeReferenceValues write FIncludeReferenceValues;
    property ReferenceValues: TStrings read FReferenceValues write SetReferenceValues;
    property IncludeChemicalTypeValues: Boolean read FIncludeChemicalTypeValues write FIncludeChemicalTypeValues;
    property ChemicalTypeValues: TStrings read FChemicalTypeValues write SetChemicalTypeValues;
    property IncludeBoundaryPositionValues: Boolean read FIncludeBoundaryPositionValues write FIncludeBoundaryPositionValues;
    property BoundaryPositionValues: TStrings read FBoundaryPositionValues write SetBoundaryPositionValues;
    property IncludeBoundaryValues: Boolean read FIncludeBoundaryValues write FIncludeBoundaryValues;
    property BoundaryValues: TStrings read FBoundaryValues write SetBoundaryValues;
    property IncludeValidationValues: Boolean read FIncludeValidationValues write FIncludeValidationValues;
    property ValidationValues: TStrings read FValidationValues write SetValidationValues;
    property IncludeWhoForValues: Boolean read FIncludeWhoForValues write FIncludeWhoForValues;
    property WhoForValues: TStrings read FWhoForValues write SetWhoForValues;
    property PreferenceLevelValue: string read FPreferenceLevelValue write FPreferenceLevelValue;
    property ConfidentialValue: string read FConfidentialValue write FConfidentialValue;
    property IncludeIsochronOnlyValue: boolean read FIncludeIsochronOnlyValue write FIncludeIsochronOnlyValue;
    property DecayUncertaintyValues: TStrings read FDecayUncertaintyValues write SetDecayUncertaintyValues;
    property IncludeDateFromValue: boolean read FIncludeDateFromValue write FIncludeDateFromValue;
    property DateFromField: string read FDateFromField write FDateFromField;
    property IncludeDateToValue: boolean read FIncludeDateToValue write FIncludeDateToValue;
    property DateToField: string read FDateToField write FDateToField;
    property DateUnitsValue: string read FDateUnitsValue write FDateUnitsValue;
    property OrderByValue: string read FOrderByValue write FOrderByValue;
    property SQLMemoField: TStrings read FSQLMemoField write SetSQLMemoField;
    property RecordChosen: string read FRecordChosen write FRecordChosen;
    property ParameterChosen: string read FParameterChosen write FParameterChosen;
    property SampleStartFrom: string read FSampleStartFrom write FSampleStartFrom;
    property SampleEndWith: string read FSampleEndWith write FSampleEndWith;
    property XML: string read GetXML write SetXML;
  end;

implementation

uses XMLDoc, XMLIntf, SysUtils;

{ TFormData }

constructor TFormData.Create;
begin
  FContinentValues := TStringList.Create;
  FAreaValues := TStringList.Create;
  FUnitValues := TStringList.Create;
  FLithologyValues := TStringList.Create;
  FMaterialValues := TStringList.Create;
  FMethodValues := TStringList.Create;
  FIsotopeSystemValues := TStringList.Create;
  FInterpretationValues := TStringList.Create;
  FApproachValues := TStringList.Create;
  FTechniqueValues := TStringList.Create;
  FGroupValues := TStringList.Create;
  FProvinceValues := TStringList.Create;
  FTerraneValues := TStringList.Create;
  FOrogenicPeriodValues := TStringList.Create;
  FReferenceValues := TStringList.Create;
  FChemicalTypeValues := TStringList.Create;
  FBoundaryPositionValues := TStringList.Create;
  FBoundaryValues := TStringList.Create;
  FValidationValues := TStringList.Create;
  FWhoForValues := TStringList.Create;
  FDecayUncertaintyValues := TStringList.Create;
  FSQLMemoField := TStringList.Create;
end;

destructor TFormData.Destroy;
begin
  inherited;
  FContinentValues.Free;
  FAreaValues.Free;
  FUnitValues.Free;
  FLithologyValues.Free;
  FMaterialValues.Free;
  FMethodValues.Free;
  FIsotopeSystemValues.Free;
  FInterpretationValues.Free;
  FApproachValues.Free;
  FTechniqueValues.Free;
  FGroupValues.Free;
  FProvinceValues.Free;
  FTerraneValues.Free;
  FOrogenicPeriodValues.Free;
  FReferenceValues.Free;
  FChemicalTypeValues.Free;
  FBoundaryPositionValues.Free;
  FBoundaryValues.Free;
  FValidationValues.Free;
  FWhoForValues.Free;
  FDecayUncertaintyValues.Free;
  FSQLMemoField.Free;
end;

function TFormData.GetXML: string;
var
  XMLTop: IXMLNode;
  XMLDocument: IXMLDocument;
  XMLNode: IXMLNode;

  procedure WriteString(const TagName, Value: string);
  begin
    XMLNode := XMLTop.AddChild(TagName);
    XMLNode.SetText(Value);
  end;

  procedure WriteStrings(const TagName: string; Values: TStrings);
  var
    I: Integer;
  begin
    XMLNode := XMLTop.AddChild(TagName);
    for I := 0 to Values.Count - 1 do
      with XMLNode.AddChild('Item') do
        SetText(Values[I]);
  end;

  procedure WriteBoolean(const TagName: string; Value: Boolean);
  begin
    XMLNode := XMLTop.AddChild(TagName);
    if Value then
      XMLNode.SetText('TRUE')
    else
      XMLNode.SetText('FALSE');
  end;
begin
  XMLDocument := TXMLDocument.Create(nil);
  XMLDocument.Active := True;
  XMLTop := XMLDocument.AddChild('FormData');
  WriteBoolean('IncludeContinentValues', IncludeContinentValues);
  WriteStrings('ContinentValues', ContinentValues);
  WriteBoolean('IncludeAreaValues', IncludeAreaValues);
  WriteStrings('AreaValues', AreaValues);
  WriteBoolean('IncludeUnitValues', IncludeUnitValues);
  WriteStrings('UnitValues', UnitValues);
  WriteBoolean('IncludeLithologyValues', IncludeLithologyValues);
  WriteStrings('LithologyValues', LithologyValues);
  WriteBoolean('IncludeMaterialValues', IncludeMaterialValues);
  WriteStrings('MaterialValues', MaterialValues);
  WriteBoolean('IncludeMethodValues', IncludeMethodValues);
  WriteStrings('MethodValues', MethodValues);
  WriteBoolean('IncludeIsotopeSystemValues', IncludeIsotopeSystemValues);
  WriteStrings('IsotopeSystemValues', IsotopeSystemValues);
  WriteBoolean('IncludeInterpretationValues', IncludeInterpretationValues);
  WriteStrings('InterpretationValues', InterpretationValues);
  WriteBoolean('IncludeApproachValues', IncludeApproachValues);
  WriteStrings('ApproachValues', ApproachValues);
  WriteBoolean('IncludeTechniqueValues', IncludeTechniqueValues);
  WriteStrings('TechniqueValues', TechniqueValues);
  WriteBoolean('IncludeGroupValues', IncludeGroupValues);
  WriteStrings('GroupValues', GroupValues);
  WriteBoolean('IncludeProvinceValues', IncludeProvinceValues);
  WriteStrings('ProvinceValues', ProvinceValues);
  WriteBoolean('IncludeTerraneValues', IncludeTerraneValues);
  WriteStrings('TerraneValues', TerraneValues);
  WriteBoolean('IncludeOrogenicPeriodValues', IncludeOrogenicPeriodValues);
  WriteStrings('OrogenicPeriodValues', OrogenicPeriodValues);
  WriteBoolean('IncludeReferenceValues', IncludeReferenceValues);
  WriteStrings('ReferenceValues', ReferenceValues);
  WriteBoolean('IncludeChemicalTypeValues', IncludeChemicalTypeValues);
  WriteStrings('ChemicalTypeValues', ChemicalTypeValues);
  WriteBoolean('IncludeBoundaryPositionValues', IncludeBoundaryPositionValues);
  WriteStrings('BoundaryPositionValues', BoundaryPositionValues);
  WriteBoolean('IncludeBoundaryValues', IncludeBoundaryValues);
  WriteStrings('BoundaryValues', BoundaryValues);
  WriteBoolean('IncludeValidationValues', IncludeValidationValues);
  WriteStrings('ValidationValues', ValidationValues);
  WriteBoolean('IncludeWhoForValues', IncludeWhoForValues);
  WriteStrings('WhoForValues', WhoForValues);
  WriteBoolean('IncludeIsochronOnlyValue', IncludeIsochronOnlyValue);
  WriteStrings('DecayUncertaintyValues', DecayUncertaintyValues);
  WriteString('PreferenceLevelValue', PreferenceLevelValue);
  WriteString('ConfidentialValue', ConfidentialValue);
  WriteBoolean('IncludeDateFromValue', IncludeDateFromValue);
  WriteString('DateFromField', DateFromField);
  WriteBoolean('IncludeDateToValue', IncludeDateToValue);
  WriteString('DateToField', DateToField);
  WriteString('DateUnits', DateUnitsValue);
  WriteString('OrderByValue', OrderByValue);
  WriteStrings('SQLMemoField', SQLMemoField);
  WriteString('RecordChosen', RecordChosen);
  WriteString('ParameterChosen', ParameterChosen);
  WriteString('SampleStartFrom', SampleStartFrom);
  WriteString('SampleEndWith', SampleEndWith);
  Result := XMLDocument.XML.Text;
end;

procedure TFormData.SetXML(const Value: string);
var
  XMLDocument: IXMLDocument;
  XMLNode: IXMLNode;
  XMLTop: IXMLNode;
  S: TStrings;

  function ReadString(const TagName: string): string;
  begin
    XMLNode := XMLTop.ChildNodes.Nodes[TagName];
    Result := XMLNode.Text;
  end;

  function ReadStrings(const TagName: string): TStrings;
  var
    I: Integer;
  begin
    XMLNode := XMLTop.ChildNodes.Nodes[TagName];
    S.Clear;
    for I := 0 to XMLNode.ChildNodes.Count - 1 do
      S.Add(XMLNode.ChildNodes.Nodes[I].Text);
    Result := S;
  end;

  function ReadBoolean(const TagName: string): Boolean;
  begin
    XMLNode := XMLTop.ChildNodes.Nodes[TagName];
    if UpperCase(XMLNode.Text) = 'TRUE' then
      Result := True
    else
      Result := False;
  end;
begin
  S := TStringList.Create;
  try
    XMLDocument := TXMLDocument.Create(nil);
    XMLDocument.LoadFromXML(Value);
    XMLTop := XMLDocument.DocumentElement;
    IncludeContinentValues := ReadBoolean('IncludeContinentValues');
    ContinentValues := ReadStrings('ContinentValues');
    IncludeAreaValues := ReadBoolean('IncludeAreaValues');
    AreaValues := ReadStrings('AreaValues');
    IncludeUnitValues := ReadBoolean('IncludeUnitValues');
    UnitValues := ReadStrings('UnitValues');
    IncludeLithologyValues := ReadBoolean('IncludeLithologyValues');
    LithologyValues := ReadStrings('LithologyValues');
    IncludeMaterialValues := ReadBoolean('IncludeMaterialValues');
    MaterialValues := ReadStrings('MaterialValues');
    IncludeMethodValues := ReadBoolean('IncludeMethodValues');
    MethodValues := ReadStrings('MethodValues');
    IncludeIsotopeSystemValues := ReadBoolean('IncludeIsotopeSystemValues');
    IsotopeSystemValues := ReadStrings('IsotopeSystemValues');
    IncludeInterpretationValues := ReadBoolean('IncludeInterpretationValues');
    InterpretationValues := ReadStrings('InterpretationValues');
    IncludeApproachValues := ReadBoolean('IncludeApproachValues');
    ApproachValues := ReadStrings('ApproachValues');
    IncludeTechniqueValues := ReadBoolean('IncludeTechniqueValues');
    TechniqueValues := ReadStrings('TechniqueValues');
    IncludeGroupValues := ReadBoolean('IncludeGroupValues');
    GroupValues := ReadStrings('GroupValues');
    IncludeProvinceValues := ReadBoolean('IncludeProvinceValues');
    ProvinceValues := ReadStrings('ProvinceValues');
    IncludeTerraneValues := ReadBoolean('IncludeTerraneValues');
    TerraneValues := ReadStrings('TerraneValues');
    IncludeOrogenicPeriodValues := ReadBoolean('IncludeOrogenicPeriodValues');
    OrogenicPeriodValues := ReadStrings('OrogenicPeriodValues');
    IncludeReferenceValues := ReadBoolean('IncludeReferenceValues');
    ReferenceValues := ReadStrings('ReferenceValues');
    IncludeChemicalTypeValues := ReadBoolean('IncludeChemicalTypeValues');
    ChemicalTypeValues := ReadStrings('ChemicalTypeValues');
    IncludeBoundaryPositionValues := ReadBoolean('IncludeBoundaryPositionValues');
    BoundaryPositionValues := ReadStrings('BoundaryPositionValues');
    IncludeBoundaryValues := ReadBoolean('IncludeBoundaryValues');
    BoundaryValues := ReadStrings('BoundaryValues');
    IncludeValidationValues := ReadBoolean('IncludeValidationValues');
    ValidationValues := ReadStrings('ValidationValues');
    IncludeWhoForValues := ReadBoolean('IncludeWhoForValues');
    WhoForValues := ReadStrings('WhoForValues');
    IncludeIsochronOnlyValue := ReadBoolean('IncludeIsochronOnlyValue');
    DecayUncertaintyValues := ReadStrings('DecayUncertaintyValues');
    PreferenceLevelValue := ReadString('PreferenceLevelValue');
    ConfidentialValue := ReadString('ConfidentialValue');
    IncludeDateFromValue := ReadBoolean('IncludeDateFromValue');
    DateFromField := ReadString('DateFromField');
    IncludeDateToValue := ReadBoolean('IncludeDateToValue');
    DateToField := ReadString('DateToField');
    DateUnitsValue := ReadString('DateUnits');
    OrderByValue := ReadString('OrderByValue');
    SQLMemoField := ReadStrings('SQLMemoField');
    RecordChosen := ReadString('RecordChosen');
    ParameterChosen := ReadString('ParameterChosen');
    SampleStartFrom := ReadString('SampleStartFrom');
    SampleEndWith := ReadString('SampleEndWith');

    {need to set these false each time because of some error in code from Jim Tierney}
    IncludeContinentValues := false;
    IncludeAreaValues := false;
    IncludeUnitValues := false;
    IncludeLithologyValues := false;
    IncludeMaterialValues := false;
    IncludeMethodValues := false;
    IncludeIsotopeSystemValues := false;
    IncludeInterpretationValues := false;
    IncludeApproachValues := false;
    IncludeTechniqueValues := false;
    IncludeGroupValues := false;
    IncludeProvinceValues := false;
    IncludeTerraneValues := false;
    IncludeOrogenicPeriodValues := false;
    IncludeReferenceValues := false;
    IncludeChemicalTypeValues := false;
    IncludeBoundaryPositionValues := false;
    IncludeBoundaryValues := false;
    IncludeValidationValues := false;
    IncludeWhoForValues := false;
    IncludeIsochronOnlyValue := false;
    IncludeDateFromValue := false;
    IncludeDateToValue := false;
  finally
    S.Free;
  end;
end;

procedure TFormData.SetContinentValues(const Value: TStrings);
begin
  FContinentValues.Assign(Value);
end;

procedure TFormData.SetAreaValues(const Value: TStrings);
begin
  FAreaValues.Assign(Value);
end;

procedure TFormData.SetUnitValues(const Value: TStrings);
begin
  FUnitValues.Assign(Value);
end;

procedure TFormData.SetLithologyValues(const Value: TStrings);
begin
  FLithologyValues.Assign(Value);
end;

procedure TFormData.SetMaterialValues(const Value: TStrings);
begin
  FMaterialValues.Assign(Value);
end;

procedure TFormData.SetMethodValues(const Value: TStrings);
begin
  FMethodValues.Assign(Value);
end;

procedure TFormData.SetIsotopeSystemValues(const Value: TStrings);
begin
  FIsotopeSystemValues.Assign(Value);
end;

procedure TFormData.SetInterpretationValues(const Value: TStrings);
begin
  FInterpretationValues.Assign(Value);
end;

procedure TFormData.SetApproachValues(const Value: TStrings);
begin
  FApproachValues.Assign(Value);
end;

procedure TFormData.SetTechniqueValues(const Value: TStrings);
begin
  FTechniqueValues.Assign(Value);
end;

procedure TFormData.SetGroupValues(const Value: TStrings);
begin
  FGroupValues.Assign(Value);
end;

procedure TFormData.SetProvinceValues(const Value: TStrings);
begin
  FProvinceValues.Assign(Value);
end;

procedure TFormData.SetTerraneValues(const Value: TStrings);
begin
  FTerraneValues.Assign(Value);
end;

procedure TFormData.SetOrogenicPeriodValues(const Value: TStrings);
begin
  FOrogenicPeriodValues.Assign(Value);
end;

procedure TFormData.SetReferenceValues(const Value: TStrings);
begin
  FReferenceValues.Assign(Value);
end;

procedure TFormData.SetChemicalTypeValues(const Value: TStrings);
begin
  FChemicalTypeValues.Assign(Value);
end;

procedure TFormData.SetBoundaryPositionValues(const Value: TStrings);
begin
  FBoundaryPositionValues.Assign(Value);
end;

procedure TFormData.SetBoundaryValues(const Value: TStrings);
begin
  FBoundaryValues.Assign(Value);
end;

procedure TFormData.SetValidationValues(const Value: TStrings);
begin
  FValidationValues.Assign(Value);
end;

procedure TFormData.SetDecayUncertaintyValues(const Value: TStrings);
begin
  FDecayUncertaintyValues.Assign(Value);
end;

procedure TFormData.SetSQLMemoField(const Value: TStrings);
begin
  FSQLMemoField.Assign(Value);
end;

procedure TFormData.SetWhoForValues(const Value: TStrings);
begin
  FWhoForValues.Assign(Value);
end;

end.

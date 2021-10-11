unit XSDValidator;

interface

uses
  Classes, MSXML2_TLB;
  
type
  TXSDValidator = class(TObject)
  private
    _Async: Boolean;
    _XmlDocument: IXMLDOMDocument2;
    _SchemaCollection: IXMLDOMSchemaCollection2;

    ERROR_STR: WideString;
  protected
    function _Get_XMLDOC: IXMLDOMDocument2;
    procedure _Set_XMLDOC(xml: IXMLDOMDocument2);

    function _Get_SCHEMAS: IXMLDOMSchemaCollection2;
    procedure _Set_SCHEMAS(xsds: IXMLDOMSchemaCollection2);

    function _Get_ASYNC: Boolean;
    procedure _Set_ASYNC(value: Boolean);

    function _Get_ERROR: string;

    function GetNameSpaceURI(domdoc: IXMLDOMDocument2): string;
  public
    constructor Create;
    destructor Destroy; override;

    property Async: Boolean read _Get_ASYNC write _Set_ASYNC;
    property XmlDoc: IXMLDOMDocument2 read _Get_XMLDOC write _Set_XMLDOC;
    property Schemas: IXMLDOMSchemaCollection2 read _Get_SCHEMAS write _Set_SCHEMAS;

    property Error: string read _Get_ERROR;

    function AddXsdFile(const filename: string): Boolean;
    function AddXsd(const xsdtxt:WideString): Boolean;
    
    function ParseXmlFile(const filename: string): Boolean;
    function ParseXml(const xmltxt: WideString): Boolean;

    function Valid: Boolean;
  end;

implementation

uses
  Variants, SysUtils, ActiveX, ComObj;

constructor TXSDValidator.Create;
begin
  XmlDoc := CoDOMDocument40.Create();
  XmlDoc.validateOnParse := false;
  Schemas := CoXMLSchemaCache40.Create();
  Async := false;
end;

destructor TXSDValidator.Destroy;
begin
  FreeAndNil(_XmlDocument);
  FreeAndNil(_SchemaCollection);
  inherited;
end;

function TXSDValidator._Get_XMLDOC: IXMLDOMDocument2;
begin
  if not Assigned(_XmlDocument) then
    _XmlDocument := CoDOMDocument40.Create();
    
  result:= _XmlDocument;
end;

procedure TXSDValidator._Set_XMLDOC(xml: IXMLDOMDocument2);
begin
  if Assigned(_XmlDocument) then
    FreeAndNil(_XmlDocument);

  _XmlDocument := xml;
end;

function TXSDValidator._Get_SCHEMAS: IXMLDOMSchemaCollection2;
begin
  if not Assigned(_SchemaCollection) then
    _SchemaCollection := CoXMLSchemaCache40.Create();

  result:= _SchemaCollection;
end;

procedure TXSDValidator._Set_SCHEMAS(xsds: IXMLDOMSchemaCollection2);
begin
  if Assigned(_SchemaCollection) then
    FreeAndNil(_SchemaCollection);
    
  _SchemaCollection := xsds;
end;

function TXSDValidator._Get_ASYNC: Boolean;
begin
  result:= _Async;
end;

procedure TXSDValidator._Set_ASYNC(value: Boolean);
begin
  _Async:= value;
end;

function TXSDValidator._Get_ERROR: string;
begin
  if ERROR_STR <> null then
    result:= ERROR_STR
  else
    result:= '';
end;

function TXSDValidator.GetNameSpaceURI(domdoc: IXMLDOMDocument2): string;
var
  targetNamespaceNode: IXMLDOMNode;
begin
  targetNamespaceNode := domdoc.documentElement.attributes.getNamedItem('targetNamespace');
  
  if Assigned(targetNamespaceNode) then
    result := targetNamespaceNode.nodeValue
  else
    result := '';
end;

function TXSDValidator.Valid: Boolean;
var
  parseError: IXMLDOMParseError;
  Reason: WideString;
begin
  XmlDoc.schemas := Schemas;

  parseError := XmlDoc.validate();
  Reason := parseError.reason;

  if ( Reason <> null ) and ( Reason <> '' ) then
  begin
    ERROR_STR:= Reason;
    result:= false;
  end
  else
    result:= true;
end;

function TXSDValidator.AddXsdFile(const filename: string): Boolean;
var
  XsdDocument: IXMLDOMDocument2;
begin
  XsdDocument := CoDOMDocument40.Create();
  XsdDocument.async := Async;
  
  if XsdDocument.load(filename) then
  begin
    Schemas.Add( GetNameSpaceURI(XsdDocument), XsdDocument);
    result:= true;
  end
  else
  begin
    ERROR_STR:= XsdDocument.parseError.reason;
    result:= false;
  end;
end;

function TXSDValidator.AddXsd(const xsdtxt:WideString): Boolean;
var
  XsdDocument: IXMLDOMDocument2;
begin
  XsdDocument := CoDOMDocument40.Create();
  XsdDocument.async := Async;

  if XsdDocument.loadXML(xsdtxt) then
  begin
    Schemas.Add( GetNameSpaceURI(XsdDocument), XsdDocument);
    result:= true;
  end
  else
  begin
    ERROR_STR:= XsdDocument.parseError.reason;
    result:= false;
  end;
end;

function TXSDValidator.ParseXmlFile(const filename: string): Boolean;
begin
  XmlDoc.async := Async;
  if not XmlDoc.load(filename) then
  begin
    ERROR_STR:= XmlDoc.parseError.reason;
    result:= false;
  end
  else
    result:= true;
end;

function TXSDValidator.ParseXml(const xmltxt: WideString): Boolean;
begin
  XmlDoc.async := Async;
  if not XmlDoc.loadXML(xmltxt) then
  begin
    ERROR_STR:= XmlDoc.parseError.reason;
    result:= false;
  end
  else
    result:= true;
end;

initialization
  if Assigned(ComObj.CoInitializeEx) then
    ComObj.CoInitializeEx(nil, COINIT_MULTITHREADED)
  else
    CoInitialize(nil);
finalization
  CoUninitialize;
end.

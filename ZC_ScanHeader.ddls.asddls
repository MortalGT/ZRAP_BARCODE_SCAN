@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header Projection View'
@UI: {
  headerInfo: { 
    typeName: 'Scan Header', 
    typeNamePlural: 'Scan Headers', 
    title: { type: #STANDARD, value: 'Description' } 
  }
}
define root view entity ZC_ScanHeader as projection on ZI_ScanHeader
{
  key HeaderId,

      @UI.lineItem:       [ { position: 10 } ]
      @UI.identification: [ { position: 10 } ]
      @UI.selectionField: [ { position: 10 } ]
      Description,
      
      @UI.identification: [ { position: 20, label: 'Scan Batch Here' } ]
      ScannedBatch,

      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,

      /* Associations */
      _Item : redirected to composition child ZC_ScanItem
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Item Projection View'
@UI: {
  headerInfo: { 
    typeName: 'Scan Item', 
    typeNamePlural: 'Scan Items', 
    title: { type: #STANDARD, value: 'BatchNumber' } 
  }
}
define view entity ZC_ScanItem as projection on ZI_ScanItem
{
      @UI.facet: [ { id:            'Item',
                     purpose:       #STANDARD,
                     type:          #IDENTIFICATION_REFERENCE,
                     label:         'Item Detail',
                     position:      10 } ]
                     
      @UI.hidden: true
  key ItemId,
      @UI.hidden: true
  key HeaderId,

      @UI.lineItem:       [ { position: 10 } ]
      @UI.identification: [ { position: 10 } ]
      BatchNumber,

      @UI.lineItem:       [ { position: 20 } ]
      @UI.identification: [ { position: 20 } ]
      Quantity,

      LocalLastChangedAt,

      /* Associations */
      _Header : redirected to parent ZC_ScanHeader
}

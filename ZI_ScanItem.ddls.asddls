@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Item Interface View'
define view entity ZI_ScanItem as select from zscan_itm
  association to parent ZI_ScanHeader as _Header on $projection.HeaderId = _Header.HeaderId
{
  key item_id               as ItemId,
      header_id             as HeaderId,
      batch_number          as BatchNumber,
      quantity              as Quantity,
      
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      
      _Header
}

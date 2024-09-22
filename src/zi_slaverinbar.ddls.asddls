@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View für kind SLA_Vereinbar'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_SLAVERINBAR as select from zsla_vereinbar
association  to parent ZI_SLAKUNDE as _slakunda on 
$projection.VkundenId = _slakunda.KundenId
{

    key sla_id as SlaId,
   key vkunden_id as VkundenId,
    beschreibung as Beschreibung,
    vertragstrafen as Vertragstrafen,
    eskalationsstufen as Eskalationsstufen ,
     created_by as CreatedBy,
    created_at as CreatedAt,
    changed_by as ChangedBy,
    changed_at as ChangedAt,
    lastchangedate   as Lastchangedate,
  locallastchangedate as Locallastchangedate,
    _slakunda
}

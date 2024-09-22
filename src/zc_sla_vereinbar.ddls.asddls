@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View  für ZI_SLAVERINBAR'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions

define view entity ZC_SLA_Vereinbar
  as projection on ZI_SLAVERINBAR
{
      @EndUserText.label: 'SL Agrement'

  key SlaId,
      @EndUserText.label: 'Kunden Id'

  key VkundenId,

      @EndUserText.label: 'Beschreibung'
      Beschreibung,

      @EndUserText.label: 'Vertrag Strafen'
      Vertragstrafen,

      @EndUserText.label: 'Eskalation Stufen'
      Eskalationsstufen,

      CreatedBy,
      CreatedAt,
      ChangedBy,
      ChangedAt,
      /* Associations */
      _slakunda: redirected to parent ZC_SLAKUNDE
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View  für ZI_SLAKUNDE'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions
define root view entity ZC_SLAKUNDE
  as projection on ZI_SLAKUNDE
{
      @EndUserText.label: 'Kunden Id'
  key KundenId,
      @EndUserText.label: 'Kunden Name'

      Kundenname,
      @EndUserText.label: 'Vertag Beginn'

      Vertragsbeginn,
      @EndUserText.label: 'Vertag Ende'

      Vertragsende,
      @EndUserText.label: 'Ansprech Partner'

      Ansprechpartner,
      @EndUserText.label: 'Kontakt Info'

      Kontaktinfo,
      CreatedBy,
      CreatedAt,
      ChangedBy,
      ChangedAt,
     Lastchangedate    ,
  Locallastchangedate ,
      /* Associations */
      _sla_vereinbar:redirected to composition child ZC_SLA_Vereinbar
      
}

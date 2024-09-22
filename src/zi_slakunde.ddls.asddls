@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View für root SLA_Kunden'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_SLAKUNDE as select from zsla_kunden
composition [0..*]  of ZI_SLAVERINBAR as _sla_vereinbar
{
    key kunden_id as KundenId,
    kundenname as Kundenname,
    vertragsbeginn as Vertragsbeginn,
    vertragsende as Vertragsende,
    ansprechpartner as Ansprechpartner,
    kontaktinfo as Kontaktinfo ,
    created_by as CreatedBy,
    created_at as CreatedAt,
    changed_by as ChangedBy,
    changed_at as ChangedAt,
    lastchangedate as Lastchangedate,
    locallastchangedate as Locallastchangedate,
    
    _sla_vereinbar // Make association public
}

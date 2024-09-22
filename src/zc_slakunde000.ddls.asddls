@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Interface View für root SLA_Kunden'
}
@AccessControl.authorizationCheck: #CHECK
define root view entity ZC_SLAKUNDE000
  provider contract TRANSACTIONAL_QUERY
  as projection on ZI_SLAKUNDE
{
  @Endusertext: {
    Quickinfo: '16 Byte UUID in 16 Bytes (Raw Format)'
  }
  key KundenId,
  @Endusertext: {
    Quickinfo: 'Name des Kunden.'
  }
  Kundenname,
  @Endusertext: {
    Quickinfo: 'Vertragsbeginn des SLA'
  }
  Vertragsbeginn,
  @Endusertext: {
    Quickinfo: 'Vertragsende des SLA'
  }
  Vertragsende,
  @Endusertext: {
    Quickinfo: 'Ansprechpartner des Kunden'
  }
  Ansprechpartner,
  @Endusertext: {
    Quickinfo: 'Kontaktinformationen des Kunden'
  }
  Kontaktinfo,
  @Endusertext: {
    Quickinfo: 'User Name'
  }
  CreatedBy,
  @Endusertext: {
    Quickinfo: 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
  }
  CreatedAt,
  @Endusertext: {
    Quickinfo: 'User Name'
  }
  ChangedBy,
  @Endusertext: {
    Quickinfo: 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
  }
  ChangedAt,
  @Endusertext: {
    Quickinfo: 'UTC Time Stamp in Long Form (YYYYMMDDhhmmssmmmuuun)'
  }
  Lastchangedate,
  @Endusertext: {
    Quickinfo: 'UTC Time Stamp in Long Form (YYYYMMDDhhmmssmmmuuun)'
  }
  Locallastchangedate,
  _sla_vereinbar : redirected to composition child ZC_SLAVERINBAR
  
}

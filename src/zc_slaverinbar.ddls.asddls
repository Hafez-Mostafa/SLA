@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: 'Interface View für kind SLA_Vereinbar'
}
@Objectmodel: {
  Usagetype.Dataclass: #MIXED, 
  Usagetype.Servicequality: #X, 
  Usagetype.Sizecategory: #S
}
@AccessControl.authorizationCheck: #CHECK
define view entity ZC_SLAVERINBAR
  as projection on ZI_SLAVERINBAR
{
  @Endusertext: {
    Quickinfo: '16 Byte UUID in 16 Bytes (Raw Format)'
  }
  key SlaId,
  @Endusertext: {
    Quickinfo: '16 Byte UUID in 16 Bytes (Raw Format)'
  }
  key VkundenId,
  @Endusertext: {
    Quickinfo: 'Allgemeine Beschreibung für SLA oder Vorfall'
  }
  Beschreibung,
  @Endusertext: {
    Quickinfo: 'Vertragsstrafe bei Nichteinhaltung'
  }
  Vertragstrafen,
  @Endusertext: {
    Quickinfo: 'Eskalationsstufen bei Nichteinhaltung des SLA'
  }
  Eskalationsstufen,
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
  _slakunda : redirected to parent ZC_SLAKUNDE000
  
}

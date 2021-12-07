@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View forTravel'
@Search.searchable: true
@ObjectModel.semanticKey: ['TravelID']
define root view entity ZC_FE_TRAVEL_000136
  as projection on ZI_FE_TRAVEL_000136
{
  key TravelUUID,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.90
      @ObjectModel.text.element: ['Description']
      @EndUserText.label: 'Travel'
      @EndUserText.quickInfo: 'Travel ID'
      TravelID,

      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: '/DMO/I_Agency',
          element:'AgencyID'
        }
      } ]
      @ObjectModel.text.element: ['AgencyName']
      @EndUserText.label: 'Agency'
      @EndUserText.quickInfo: 'Agency ID'
      AgencyID,

      _Agency.Name                   as AgencyName,

      @Consumption.valueHelpDefinition: [{
            entity:{
                name: '/DMO/I_Customer',
                element: 'CustomerID'
                }
               }]
      @ObjectModel.text.element: ['LastName']
      @EndUserText.label: 'Customer'
      CustomerID,

      _Customer.LastName             as LastName,

      BeginDate,

      EndDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,

      @Consumption.valueHelpDefinition: [ {
        entity: {
          name: 'I_Currency',
          element: 'Currency'
        }
      } ]
      CurrencyCode,

      Description,

      @Consumption.valueHelpDefinition: [{entity:{ name: 'ZI_FE_STAT_000136', element: 'TravelStatusId'}}]
      @ObjectModel.text.element: ['StatusText']
      OverallStatus,

      OverallStatusCriticality,

      _TravelStatus.TravelStatusText as StatusText,


      CreatedBy,

      CreatedAt,

      LastChangedBy,

      LastChangedAt,

      LocalLastChangedAt,

      _Booking : redirected to composition child ZC_FE_BOOKING_000136,

      _Agency,

      _Currency,

      _Customer,

      _TravelStatus
}

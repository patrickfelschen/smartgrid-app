# SERVER ENDPOINTS
#### Vorschlag der GUI-Gruppe
#
### /customers/
#### POST Kunde erstellen
###### Request JSON
```json
{
  "id": 1000,
  "hubid": 2000,
  "street": "Musterstraße",
  "number": "42",
  "postalcode": "01234",
  "city": "Musterstadt"
}
```
###### Response (Code: 200)
```json
{
  "id": 1000,
  "hubid": 2000,
  "street": "Musterstraße",
  "number": "42",
  "postalcode": "01234",
  "city": "Musterstadt"
}
```
###### Response (Code: 400)
```json
{
  "message": "..."
}
```
#

### /customers/{customerId}
#### GET Kunde erhalten
###### Response (Code: 200)
```json
{
  "id": 1000,
  "hubid": 2000,
  "street": "Musterstraße",
  "number": "42",
  "postalcode": "01234",
  "city": "Musterstadt"
}
```
###### Response (Code: 400)
```json
{
  "message": "..."
}
```
#### PATCH Kunde bearbeiten
###### Request
```json
{
  "street": "Musterweg",
  "number": 122,
}
```
###### Response (Code: 200)
```json
{
  "id": 1000,
  "hubid": 2000,
  "street": "Musterweg",
  "number": "122",
  "postalcode": "01234",
  "city": "Musterstadt"
}
```
###### Response (Code: 400)
```json
{
  "message": "..."
}
```
#

### /customers/{customerId}/devices
#### GET Alle Geräte erhalten
###### Response (Code: 200)
```json
[
    {
        "id": 3000,
        "description": "E-Auto Ladegerät",
        "maxPower": 22.5
    },
    {...}
]
```
###### Response (Code: 400)
```json
{
  "message": "..."
}
```
#

### /customers/{customerId}/devices/{deviceId}
#### PATCH Gerät bearbeiten
###### Request
```json
{
    "description": "E-Auto Ladegerät",
    "maxPower": 30.5
}
```
###### Response (Code: 200)
```json
{
    "id": 3000,
    "description": "E-Auto Ladegerät",
    "maxPower": 30.5
}
```
###### Response (Code: 400)
```json
{
  "message": "..."
}
```
#

### /customers/{customerId}/devices/{deviceId}/charge-request
#### POST Ladeantrag erstellen
###### Request
```json
{
    "maxRequiredPower": 25.0,
    "requiredCapacity": 11.0,
    "deadline": "2012-04-23T18:25:43.511Z"
}
```
###### Response (Code: 200)
```json
{
    "id": 4000,
    "maxRequiredPower": 25.0,
    "requiredCapacity": 11.0,
    "deadline": "2012-04-23T18:25:43.511Z"
}
```
###### Response (Code: 400)
```json
{
  "message": "..."
}
```
#

### /customers/{customerId}/charge-plans
#### GET Alle Ladepläne erhalten
###### Response (Code: 200)
```json
[
  {
    "id": 5000,
    "device": {
      "id": 3000,
      "description": "E-Auto Ladegerät",
      "maxPower": 30.5
    },
    "request": {
      "id": 4000,
      "maxRequiredPower": 25.0,
      "requiredCapacity": 11.0,
      "deadline": "2012-04-23T18:25:43.511Z"
    },
    "co2ValueSmart": 100.22,
    "co2ValueNotSmart": 300.43,
    "status": "active",
    "times": []
  },
  {...}
]
```
###### Response (Code: 400)
```json
{
  "message": "..."
}
```
#

### /customers/{customerId}/charge-plans/{chargePlanId}
#### PATCH Ladeplan abbrechen
###### Request
```json
{
  "status": "cancel"
}
```
###### Response (Code: 200)
```json
[
  {
    "id": 5000,
    "device": {
      "id": 3000,
      "description": "E-Auto Ladegerät",
      "maxPower": 30.5
    },
    "request": {
      "id": 4000,
      "maxRequiredPower": 25.0,
      "requiredCapacity": 11.0,
      "deadline": "2012-04-23T18:25:43.511Z"
    },
    "co2ValueSmart": 100.22,
    "co2ValueNotSmart": 300.43,
    "status": "inactive",
    "times": [
      {
        "time": "2012-04-23T18:25:43.511Z",
        "power": 2.3,
        "gCO2eqPerkWh": 21.0,
        "powerGridCapacity": 20.0
      },
      {...}
    ]
  },
  {...}
]
```
###### Response (Code: 400)
```json
{
  "message": "..."
}
```
#

### /customers/{customerId}/dashboard
#### GET Dasboardinfo erhalten
###### Response (Code: 200)
```json
{
  "totalCo2ValueSmart": 1006.22,
  "totalCo2ValueNotSmart": 3004.43,
}
```
###### Response (Code: 400)
```json
{
  "message": "..."
}
```
#

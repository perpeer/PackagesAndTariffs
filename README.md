# Packages and Tariffs List
This application developed without using a storyboard. The first window starts by AppDelegate window property. All api request runs with Service singleton pattern.

## Screenshots
| Main Screen      | 
|:----------------:|
| ![main-screen][] |

## Sample of api json
{
  "name": "Platinum Maksi 6 GB",
  "desc": "Zengin içerikli Platinum Maksi Paketi ile Turkcell Uygulamalarının keyfini sürün!",
  "subscriptionType": "monthly",
  "didUseBefore": true,
  "benefits": [
    "TV+",
    "Fizy",
    "BiP",
    "lifebox",
    "Platinum",
    "Dergilik"
  ],
  "price": 109.90,
  "tariff": {
    "data": "6144",
    "talk": "2000",
    "sms": "100"
  },
  "availableUntil": "1558131150"
}

[main-screen]: https://github.com/perpeer/PackagesAndTariffs/blob/master/images/MainScreen.png=150x324?raw=true
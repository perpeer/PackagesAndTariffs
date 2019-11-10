# Packages and Tariffs List
This application developed without using a storyboard. The first window starts by AppDelegate window property. All api request runs with Service singleton pattern.

## Screenshots
| Main Screen      | Add Favorite      |       Cell         | 
|:----------------:|:-----------------:|:------------------:|
| ![main-screen][] | ![add-favorite][] |  ![cell][]         |

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

[main-screen]: <img src="https://github.com/perpeer/PackagesAndTariffs/blob/master/images/MainScreen.png?raw=true" width="200" />
[add-favorite]: <img src="https://github.com/perpeer/PackagesAndTariffs/blob/master/images/AddFavorite.png?raw=true" width="200" />
[cell]: <img src="https://github.com/perpeer/PackagesAndTariffs/blob/master/images/Cell.png?raw=true" width="200" />
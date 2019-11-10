# Packages and Tariffs List
This application developed without using a storyboard. The first window starts by AppDelegate window property. All api request runs with Service singleton pattern.

## Screenshots
|      Screen      | Main Screen      | Add Favorite      |       Cell         | 
|:-----------------|:-----------------|:-----------------:|-------------------:|
|    ![screen][]   | ![main-screen][] | ![add-favorite][] |  ![cell][]         |

## Sample of api json
```json
{
  "packages": [
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
  ]
}
```

[screen]: https://github.com/perpeer/PackagesAndTariffs/blob/master/images/screen.gif?raw=true
[main-screen]: https://github.com/perpeer/PackagesAndTariffs/blob/master/images/MainScreen.png?raw=true
[add-favorite]: https://github.com/perpeer/PackagesAndTariffs/blob/master/images/AddFavorite.png?raw=true
[cell]: https://github.com/perpeer/PackagesAndTariffs/blob/master/images/Cell.png?raw=true
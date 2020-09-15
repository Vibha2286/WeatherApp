# WeatherApp

Weather application to display the current weather at the user’s location and a 5-day forecast.

## Installation

### Openweathermap API

Weather App uses the [Open Weather Map API](https://openweathermap.org/) to fetch weather data. 
2. Open the project, and go to the `WeatherRepositoryImplementation.swift` file.
3. Replace  your own key with `let apiKey: String = ""`  but now currently for running this app you can you my key.

### Pod

Weather App uses **Cuckoo** pod framework for mocking data and testcases. 

### Require

Weather App requires **iOS 11.0**.

# Application Details
***

The app allows the user to view current weather and a 5-day forecast using current location lat and long. User can also view data offline if no internet connectivity found. In offline mode user can view last favorite saved data on dashboard  `WeatherDashboardViewController.swift`. User can also see favorite list in both online and offline mode `FavoriteWeatherViewController.swift`. User can see all annotation on map for all favorite list data `MapViewController.swift` 

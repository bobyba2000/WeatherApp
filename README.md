
# Weather App

## Run Locally

Clone the project

```bash
  git clone https://github.com/bobyba2000/WeatherApp.git
```

Go to the project directory
```bash
  cd WeatherApp
```

Install dependencies

```bash
  flutter pub get
```

Please make sure your Flutter version is above 3.7. To run the app, run this command

```bash
  flutter run --dart-define-from-file=api-keys.json
```

or if your Flutter version is below 3.7, run this command:
```bash
  flutter run --dart-define=WEATHER_API_KEY=6d5df640cbe945e8b66152950231710
```


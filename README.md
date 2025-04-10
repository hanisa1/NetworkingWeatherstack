# Networking With Weatherstack API ⏳⚡️
Networking with the Weatherstack API with (Async/ Await)

## Overview

This project demonstrates how to interact with the [Weatherstack API](https://weatherstack.com/) to fetch real-time weather data. It's designed to help developers understand the process of making network requests and handling responses from a weather data provider.

## Features

- **Current Weather Data**: Retrieve real-time weather information for any location worldwide.  
- **API Integration**: Learn how to integrate and authenticate with the Weatherstack API.  
- **JSON Parsing**: Understand how to parse JSON responses to extract relevant weather details.

## Getting Started

### Prerequisites

- [Swift](https://swift.org/) development environment  
- An active [Weatherstack API](https://weatherstack.com/) key

### Installation

```bash
git clone https://github.com/hanisa1/NetworkingWeatherstack.git
cd NetworkingWeatherstack
```

Then open `NetworkingWeatherstack.xcodeproj` in Xcode.

### Configuration

1. **Obtain an API Key**  
   Sign up at [Weatherstack](https://weatherstack.com/) to get a free API key.

2. **Configure the API Key**  
   In the project, locate the `Constants.swift` file. Replace the placeholder with your actual API key:

   ```swift
   let weatherstackAPIKey = "YOUR_API_KEY_HERE"
   ```


## Dependencies

This project uses Swift’s native `URLSession` for networking. No external libraries are required.


## License

This project is licensed under the [MIT License](https://github.com/hanisa1/NetworkingWeatherstack/blob/main/LICENSE).


> **Note**: Always keep your API keys safe. Avoid committing them directly to public repositories.


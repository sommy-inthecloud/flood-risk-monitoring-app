# 🌊 FloodGuard

A Flutter-based flood monitoring and reporting mobile application built with AWS serverless technologies.

FloodGuard helps users monitor weather conditions, assess flood risks, and report flood incidents with images, descriptions, and location information.

The project demonstrates the integration of mobile development with cloud services including AWS Lambda, Amazon S3, API Gateway, and DynamoDB.

---

# 📱 Features

## 🌦 Real-Time Weather Monitoring

- Fetches current weather information
- Displays:
  - Temperature
  - Humidity
  - Weather description
- Uses user location to retrieve weather data


## 🚨 Flood Risk Dashboard

- Displays current flood risk status
- Provides safety recommendations
- Helps users make informed decisions during severe weather conditions


## 📸 Flood Incident Reporting

Users can:

- Capture/select flood images
- Add incident descriptions
- Select severity level
- Submit reports


## ☁️ Cloud Image Upload

Flood images are securely uploaded using:

- Amazon S3
- AWS Lambda
- API Gateway
- Pre-signed upload URLs


## 📋 My Reports Dashboard

Users can:

- View submitted flood reports
- See report details
- Access previous incidents


## 👤 User Profile

Includes:

- User information
- Application settings
- Logout functionality


---

# 🏗 System Architecture
               FloodGuard App
            (Flutter Mobile App)
                    |
                    |
              API Gateway
                    |
                    |
               AWS Lambda
              /          \
             /            \
        Amazon S3       DynamoDB
      (Images)        (Reports Data)




          OpenWeather API
                |
                |
         Weather Dashboard



## Architecture Flow

1. User interacts with the Flutter mobile application.

2. Flutter communicates with AWS API Gateway endpoints.

3. AWS Lambda processes backend requests.

4. Amazon S3 stores uploaded flood images.

5. DynamoDB stores flood report information.

6. Weather data is retrieved from OpenWeather API.


---

# ☁️ AWS Services Used

## Amazon S3

Used for:

- Flood image storage
- Secure image upload using pre-signed URLs


## AWS Lambda

Used for:

- Generating S3 upload URLs
- Processing backend logic


## API Gateway

Used for:

- Creating secure REST API endpoints
- Connecting Flutter frontend with AWS services


## DynamoDB

Used for:

- Storing flood reports
- Managing report data


---

# 🛠 Technologies Used

## Mobile Development

- Flutter
- Dart

## Cloud Infrastructure

- AWS Lambda
- Amazon API Gateway
- Amazon S3
- Amazon DynamoDB

## APIs

- OpenWeather API

## Tools

- VS Code
- Android Studio
- Git & GitHub


---

# 📸 Screenshots


## Home Dashboard

![Dashboard](screenshots/dashboard.png)


## Flood Report

![Report](screenshots/report.png)


## My Reports

![My Reports](screenshots/my_reports.png)


## Profile

![Profile](screenshots/profile.png)


# 📂 Project Structure

```text
lib/
│
├── models/
│
├── screens/
│   ├── dashboard/
│   ├── report/
│   ├── profile/
│   └── my_reports/
│
├── services/
│   ├── weather_service.dart
│   ├── upload_service.dart
│   └── location_service.dart
│
└── main.dart
```


# 🚀 Installation

## Clone Repository

Clone the repository using:

```bash
git clone https://github.com/sommy-inthecloud/flood-monitoring-app.git
```

## Navigate into the Project

```bash
cd flood_monitoring_app
```

## Install Dependencies

Install all required Flutter packages:

```bash
flutter pub get
```

## Run the Application

Launch the application on your connected device or emulator:

```bash
flutter run
```

---

# 🔐 Environment Setup

Before running the application, configure the required environment settings:

### Required Configuration

- Weather API key
- AWS API endpoints
- Google Maps API key (if using map features)

⚠️ **Security Note:**  
Never expose private API keys or sensitive credentials in your source code or public repositories.

Use environment variables or secure configuration files when storing API credentials.

---

# 📈 Future Improvements

Future versions of FloodGuard may include:

- AI-powered flood prediction model
- Interactive flood risk maps
- Push emergency notifications
- User authentication system
- Admin monitoring dashboard
- Machine learning-based flood risk analysis
- Real-time community flood alerts

---

# 👩🏽‍💻 Developer

**Chisomaga Anyasodor**

Flutter Developer | Cloud / DevOps Engineer

Built with Flutter and AWS Serverless Architecture.

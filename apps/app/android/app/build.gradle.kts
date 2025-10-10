import java.util.Base64

plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val dartDefines = mutableMapOf<String, String>()
if (project.hasProperty("dart-defines")) {
  // カンマ区切りかつBase64でエンコードされている dart-defines をデコードして変数に格納します。
  val defines = project.property("dart-defines") as String
  defines.split(",").forEach { entry ->
    val decoded = String(Base64.getDecoder().decode(entry))
    val pair = decoded.split("=")
    if (pair.size == 2) {
      dartDefines[pair[0]] = pair[1]
    }
  }
}

// environmentに応じて、google-services.json をコピーする
val environment = dartDefines["ENVIRONMENT"]
if (environment == "production") {
  copy {
    from "environments/android/production.json"
    into "app"
  }
} else if (environment == "staging" || environment == "development") {
  copy {
    from "environments/android/staging.json"
    into "app"
  }
} else {
  throw IllegalArgumentException("ENVIRONMENT is not set")
}

android {
    namespace = "jp.flutterkaigi.conf2025"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "jp.flutterkaigi.conf2025"
        manifestPlaceholders["appLabel"] = dartDefines["APP_NAME"] ?: "FlutterKaigi 2025"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

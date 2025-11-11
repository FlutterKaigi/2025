import java.util.Base64
import java.util.Properties
import java.io.FileInputStream

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

val keystorePropertiesFile = rootProject.file("key.properties")
val keystoreProperties = Properties()
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

// flavorに応じて、google-services.json をコピー
val flavor = dartDefines["FLAVOR"]
when (flavor) {
    "prod" -> {
        copy {
            from("../../environments/android/production.json")
            into(".")
            rename { "google-services.json" }
        }
    }
    "stg", "dev" -> {
        copy {
            from("../../environments/android/staging.json")
            into(".")
            rename { "google-services.json" }
        }
    }
    else -> {
        throw IllegalArgumentException("FLAVOR is not set: $flavor")
    }
}

android {
    namespace = "jp.flutterkaigi.conf2025"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = "1.8"
    }

    defaultConfig {
        applicationId = "jp.flutterkaigi.conf2025"
        dartDefines["APP_ID_SUFFIX"]?.let {
            applicationIdSuffix = it
        }
        manifestPlaceholders["appLabel"] = dartDefines["APP_NAME"] ?: "FlutterKaigi 2025"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as String?
            keyPassword = keystoreProperties["keyPassword"] as String?
            storeFile = (keystoreProperties["storeFile"] as String?)?.let { file(it) }
            storePassword = keystoreProperties["storePassword"] as String?
        }
    }


    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = true
            isShrinkResources = true
            multiDexEnabled = true
            resValue("string", "app_name", "EQMonitor")
        }
        getByName("debug") {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}

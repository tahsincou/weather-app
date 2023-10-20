## Location service

On Android you'll need to add either the ACCESS_COARSE_LOCATION or the ACCESS_FINE_LOCATION permission to your Android Manifest. To do so open the AndroidManifest.xml file (located under android/app/src/main) and add one of the following two lines as direct children of the <manifest> tag (when you configure both permissions the ACCESS_FINE_LOCATION will be used by the geolocator plugin):

``` 
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />

```

## Make sure you are building with latest SDK version (compileSdkVersion in app/src/build.gradile)

## Make sure you have these in android/gradle.properties

```android.useAndroidX=true
    android.enableJetifier=true
```





# cordova-plugin-wkwebviewxhrfix
Cordova iOS plugin to fix local file access via XHR with WKWebView with Cordova iOS 6+ support. 

## Installation

```
cordova plugin add git+https://github.com/arahovakimyan/cordova-plugin-wkwebviewxhrfix.git#back-compatible
```

# Note for usage Cordova iOS versions below 6
This plugun usable also for Cordova iOS versions below 6.x.x(for example Cordova iOS 5.1.1).
To support WKWebView for iOS Cordova versions below 6, you need to add another plugin described bellow.
```
cordova plugin add https://github.com/apache/cordova-plugin-wkwebview-engine.git#master
```
### Required Permissions 
-----------
WKWebView may not fully launch (the deviceready event may not fire) unless if the following is included in config.xml. This should already be installed by Cordova in your platform config.xml when the plugin is installed.

#### config.xml

```xml
<feature name="CDVWKWebViewEngine">
  <param name="ios-package" value="CDVWKWebViewEngine" />
</feature>
<preference name="CordovaWebViewEngine" value="CDVWKWebViewEngine" />
```
If using `cordova-ios >= 5.1.0`, it is recommended to include the following `preference` tag to only use the `WKWebView` which is a requirement for new App submissions to the AppStore:

```xml
<preference name="WKWebViewOnly" value="true" />
```

More about usage for plugin [cordova-plugin-wkwebview-engin](https://github.com/apache/cordova-plugin-wkwebview-engine/blob/master/README.md)

Modified [TheMattRay](https://github.com/TheMattRay) plugin for Cordova iOS 6+
That's it! Seriously!

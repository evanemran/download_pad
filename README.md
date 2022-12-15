# download_pad

This is a flutter package to download files from url. All you need is to pass the file url, file name that you want to save as, and the download directory where you want to save the file.

* Github: https://github.com/evanemran/flutter_timer_widget

## Parameters

* url - of the file
* fileName - a name that you want to save as the downloaded file
* dir - the directory where you want to save the file

Don't forget to add these permissions to your manifest file.

```xml
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.INTERNET"/>
```

## How to Use

**Step 1:**

Add this line to your dependencies:

```
download_pad: ^0.0.1
```

```
import 'package:download_pad/download_pad.dart';
```

**Step 1:**

Call the DownloadPad class method downloadFile() and pass the parameters. Here is a quick example:

```dart
void startDownload() async {
  String url = "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg";
  Directory path = await getApplicationDocumentsDirectory();
  String dir = path.path;
  DownloadPad.downloadFile(url, "my_file", dir);
}
```

## Conclusion

This is an initial release of the package. If you find any issue please let me know I will fix it accordingly.
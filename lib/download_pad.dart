library download_pad;

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DownloadPad {

  static Future<String> downloadFile(String url, String fileName, String dir) async {

    void showToast(String message, bool isError) {
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: isError ? Colors.red : Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }

    HttpClient httpClient = HttpClient();
    File file;
    String filePath = '';
    String ext = url.split(".").last;

    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == 200) {
        var bytes = await consolidateHttpClientResponseBytes(response);
        filePath = '$dir/$fileName.$ext';
        file = File(filePath);
        await file.writeAsBytes(bytes);
        showToast("Download Complete!", false);
      } else {
        // filePath = 'Error code: ${response.statusCode}';
        filePath = 'NA';
        showToast("Download Failed!", true);
      }
    } catch (ex) {
      filePath = 'NA';
      showToast("Exception Occurred!", true);
    }

    return filePath;
  }
}

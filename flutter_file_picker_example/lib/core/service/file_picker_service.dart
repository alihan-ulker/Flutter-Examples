// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_file_picker_example/core/shared/ui_text.dart';
import 'package:flutter_file_picker_example/src/view/files_page.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
bool isLoading = false;
late String directoryPath;
bool userAborted = false;
late PlatformFile file;
bool pickFile = false;

//single file open
pickFileOpen() async {
  final result = await FilePicker.platform.pickFiles();
  if (result == null) return;

  //open file
  file = result.files.first;
  openFile(file);

  if (kDebugMode) {
    print("Name: ${file.name}");
    print("Bytes: ${file.bytes}");
    print("Size: ${file.size}");
    print("Extension: ${file.extension}");
    print("Path: ${file.path}");
  }

  final newFile = await saveFile(file);

  if (kDebugMode) {
    print("From Path: ${file.path!}");
    print("To Path: ${newFile.path}");
  }

  return file.path;
}

//multiple file pick
pickMultipleFileOpen(BuildContext context) async {
  final result = await FilePicker.platform.pickFiles(allowMultiple: true);
  if (result == null) return;

  openFiles(context, result.files);
}

//multiple files open
void openFiles(BuildContext context, List<PlatformFile> files) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => FilePage(
        onOpenedFile: openFile,
        files: files,
      ),
    ),
  );
}

//save file
Future<File> saveFile(PlatformFile file) async {
  final appStorage = await getApplicationDocumentsDirectory();
  final newFile = File("${appStorage.path}/${file.name}");
  return File(file.path!).copy(newFile.path);
}

//single file open
void openFile(PlatformFile file) {
  OpenFile.open(file.path);
}

//clear cache
void clearCachedFiles(BuildContext context) async {
  isLoading = true;
  try {
    bool? result = await FilePicker.platform.clearTemporaryFiles();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: result! ? Colors.green : Colors.red,
        content: Text(
          (result ? UIText.clearCache : UIText.clearCacheError),
        ),
      ),
    );
  } on PlatformException catch (e) {
    _logException("${UIText.logException}$e");
  } catch (e) {
    _logException(e.toString());
  } finally {
    isLoading = false;
  }
}

//select folder
void selectFolder() async {
  try {
    String? path = await FilePicker.platform.getDirectoryPath();

    directoryPath = path!;
    //userAborted = path == null;
  } on PlatformException catch (e) {
    _logException("${UIText.logException}$e");
  } catch (e) {
    _logException(e.toString());
  } finally {
    // isLoading = false;
    // pickFile = true;
  }
}

//log
void _logException(String message) {
  if (kDebugMode) {
    print(message);
  }
  _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
  _scaffoldMessengerKey.currentState?.showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

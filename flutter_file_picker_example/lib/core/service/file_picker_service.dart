import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_picker_example/src/view/files_page.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

//single file pick
pickFileOpen() async {
  final result = await FilePicker.platform.pickFiles();
  if (result == null) return;
  //open file
  final file = result.files.first;
  openFile(file);

  if (kDebugMode) {
    print("Name: ${file.name}");
  }
  if (kDebugMode) {
    print("Bytes: ${file.bytes}");
  }
  if (kDebugMode) {
    print("Size: ${file.size}");
  }
  if (kDebugMode) {
    print("Extension: ${file.extension}");
  }
  if (kDebugMode) {
    print("Path: ${file.path}");
  }

  final newFile = await saveFile(file);

  if (kDebugMode) {
    print("From Path: ${file.path!}");
  }
  if (kDebugMode) {
    print("To Path: ${newFile.path}");
  }
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

Future<File> saveFile(PlatformFile file) async {
  final appStorage = await getApplicationDocumentsDirectory();
  final newFile = File("${appStorage.path}/${file.name}");
  return File(file.path!).copy(newFile.path);
}

//single file open
void openFile(PlatformFile file) {
  OpenFile.open(file.path);
}

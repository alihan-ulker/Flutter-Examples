import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_picker_example/core/service/file_picker_service.dart';
import 'package:flutter_file_picker_example/core/shared/ui_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _multiPick = false;
  bool pickFile = false;

  bool _isLoading = false;
  String? _fileName;
  List<PlatformFile>? _paths;
  bool _userAborted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(UIText.appTitle),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: SwitchListTile.adaptive(
                    title: const Text("Pick Multiple Files"),
                    value: _multiPick,
                    onChanged: (value) {
                      setState(() => _multiPick = value);
                    },
                  ),
                ),
                const SizedBox(height: 16.0),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () => _multiPick
                          ? pickMultipleFileOpen(context)
                          : pickFileOpen(),
                      child: Text(_multiPick
                          ? UIText.pickFilesButton
                          : UIText.pickFileButton),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        selectFolder();
                      },
                      child: Text(UIText.pickFolderButton),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        clearCachedFiles(context);
                      },
                      child: Text(UIText.clearButton),
                    ),
                    ListTile(
                      title: Text(
                          pickFile ? file.path.toString() : "File not picked"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

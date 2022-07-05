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
                // const SizedBox(height: 16.0),
                // TextFormField(
                //   decoration:
                //       const InputDecoration(labelText: "File Extension"),
                // ),
                // const SizedBox(height: 16.0),
                // SwitchListTile.adaptive(
                //   title: const Text("Pick Multiple Files"),
                //   value: _multiPick,
                //   onChanged: (value) {
                //     setState(() => _multiPick = value);
                //   },
                // ),
                const SizedBox(height: 16.0),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () => pickMultipleFileOpen(context),
                      child: Text(_multiPick
                          ? UIText.pickFilesButton
                          : UIText.pickFileButton),
                    ),
                    const SizedBox(height: 16.0),
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   child: Text(UIText.pickFolderButton),
                    // ),
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

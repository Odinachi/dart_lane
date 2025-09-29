import 'dart:async';

import 'package:dart_eval/dart_eval.dart';
import 'package:dart_style/dart_style.dart';
import 'package:dartcoder/main.dart';
import 'package:dartcoder/shared/text_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_highlight/themes/atom-one-light.dart';
import 'package:flutter_highlight/themes/nord.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:highlight/languages/dart.dart';

class Editor extends StatefulWidget {
  const Editor({super.key});

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> with SingleTickerProviderStateMixin {
  final controller = CodeController(
    language: dart,
  );

  final _outputNotifier = ValueNotifier<String>("");
  late final TabController _tabController;

  void _listen() => setState(() {});

  Timer? _debounce;

  final baseCode = '''void main() {
  print("Hello, Dartic!");
}''';

  @override
  void initState() {
    controller.text = cacheService.getCode() ?? baseCode;
    editor.setText(controller.fullText);
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(_listen);

    controller.addListener(() {
      final text = controller.text;
      final selection = controller.selection;

      if (text.isNotEmpty &&
          selection.baseOffset > 1 &&
          selection.baseOffset <= text.length &&
          text[selection.baseOffset - 1] == '\n') {
        // Check for newline insertion
        final prevLine = getPreviousLine(text, selection.baseOffset);
        final leadingSpaces = getLeadingSpaces(prevLine);

        // Insert two spaces + whatever indent the previous line had
        final newText = text.replaceRange(
          selection.baseOffset,
          selection.baseOffset,
          '$leadingSpaces  ', // you can replace with '\t' if you prefer real tabs
        );

        controller.value = TextEditingValue(
          text: newText,
          selection: TextSelection.collapsed(
            offset: selection.baseOffset + 2,
          ),
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.removeListener(_listen);
    _debounce?.cancel();
    super.dispose();
  }

  bool _isSubstantialChange(String oldText, String newText) {
    if (newText.trim() == oldText.trim()) return false;
    if ((newText.length - oldText.length).abs() < 5) return false;
    return true;
  }

  void _onTextChanged(String newText) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (_isSubstantialChange(editor.text, newText)) {
        editor.setText(newText);
      }
    });
  }

  Future<void> _runCode() async {
    cacheService.saveCode(controller.fullText);
    _tabController.animateTo(1);
    _unfocus();
    _outputNotifier.value = "";

    try {
      final compiler = Compiler();
      final program = compiler.compileWriteAndLoad({
        'dart_coder': {
          'main.dart': controller.fullText,
        }
      });

      await runZoned(
        () async {
          final result =
              program.executeLib('package:dart_coder/main.dart', 'main');

          if (result is Future) {
            await result;
          }
        },
        zoneSpecification: ZoneSpecification(
          handleUncaughtError: (self, zone, error, _, stackTrace) {
            _outputNotifier.value += 'Uncaught Error: $error\n';
            _outputNotifier.value += 'Stack Trace: $stackTrace\n';
          },
          errorCallback: (self, zone, error, _, stackTrace) {
            _outputNotifier.value += 'Uncaught Error: $error\n';
            _outputNotifier.value += 'Stack Trace: $stackTrace\n';
            return null;
          },
          print: (self, parent, zone, line) {
            _outputNotifier.value += '$line\n';
          },
        ),
      );
    } catch (e) {
      _outputNotifier.value =
          e is CompileError ? e.message : "Error: ${e.toString()}";
    }
  }

  String beautify(String i) {
    final importRegex = RegExp(r'import\s+[^;]+;', multiLine: true);

    final imports =
        importRegex.allMatches(i).map((m) => m.group(0)!.trim()).toSet();

    String cleanedCode = i.replaceAll(importRegex, "").trim();

    String formattedCode;
    try {
      formattedCode = DartFormatter().format(cleanedCode);
    } catch (_) {
      formattedCode = cleanedCode;
    }

    return '${imports.join("\n")}${imports.isNotEmpty ? "\n\n" : ""}$formattedCode';
  }

  void _unfocus() => FocusScope.of(context).unfocus();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _tabController.index == 0
          ? GestureDetector(
              onTap: _runCode,
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    size: 50,
                    color: Theme.of(context).primaryColor,
                  )),
            )
          : null,
      appBar: AppBar(
        leadingWidth: 90,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: (_tabController.index != 0)
            ? GestureDetector(
                onTap: () {
                  _tabController.animateTo(0);
                },
                child: const Icon(Icons.arrow_back_ios),
              )
            : null,
        title: const Text('Dartic'),
        actions: [
          ValueListenableBuilder(
              valueListenable: editor.state,
              builder: (_, state, __) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: state.canUndo
                          ? () {
                              editor.undo();
                              controller.text = editor.text;
                            }
                          : null,
                      child: Icon(
                        color: state.canUndo
                            ? null
                            : Theme.of(context)
                                .iconTheme
                                .color
                                ?.withValues(alpha: .5),
                        Icons.undo,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: state.canRedo
                          ? () {
                              editor.redo();
                              controller.text = editor.text;
                            }
                          : null,
                      child: Icon(
                        color: state.canRedo
                            ? null
                            : Theme.of(context)
                                .iconTheme
                                .color
                                ?.withValues(alpha: .5),
                        Icons.redo,
                        size: 30,
                      ),
                    ),
                  ],
                );
              }),
          PopupMenuButton(
            initialValue: null,
            onSelected: (v) {
              if (v == "clear") {
                editor.setText(baseCode);
                controller.text = baseCode;
              } else if (v == "format") {
                controller.text = beautify(controller.text);
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(value: "clear", child: Text('Clear')),
              const PopupMenuItem(value: "format", child: Text('Beautify')),
            ],
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(
                Icons.more_vert,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.0, bottom: 10.h),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: TabBar(
                controller: _tabController,
                splashFactory: NoSplash.splashFactory,
                indicator: const BoxDecoration(),
                dividerColor: Colors.transparent,
                tabs: const [
                  Text("Code"),
                  Text("Output"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                ValueListenableBuilder(
                    valueListenable: isDarkTheme,
                    builder: (_, isDark, __) {
                      return CodeTheme(
                        data: CodeThemeData(
                            styles: isDark ? nordTheme : atomOneLightTheme),
                        child: Container(
                          color: isDark
                              ? const Color(0xff2E3440)
                              : const Color(0xfffafafa),
                          child: CodeField(
                            expands: true,
                            onChanged: _onTextChanged,
                            gutterStyle: const GutterStyle(
                              showFoldingHandles: false,
                              width: 70,
                            ),
                            controller: controller,
                          ),
                        ),
                      );
                    }),
                ValueListenableBuilder(
                    valueListenable: _outputNotifier,
                    builder: (_, output, __) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Text(output),
                        ),
                      );
                    })
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

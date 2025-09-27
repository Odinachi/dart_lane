import 'package:dartcoder/shared/theme.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({super.key, required this.question});
  final String question;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    print("kkkk ${widget.question}");

    return _buildQuestionContent();
  }

  Widget _buildQuestionContent() {
    final parts = _parseQuestionText(widget.question);

    return RichText(
      text: TextSpan(
        children: parts.map((part) {
          if (part['isCode'] == true) {
            return WidgetSpan(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: AppColors.grey[800],
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: _buildCodeContent(part['text'] ?? ""),
              ),
            );
          } else {
            return TextSpan(
                text: part['text'] ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 18));
          }
        }).toList(),
      ),
    );
  }

  Widget _buildCodeContent(String codeText) {
    final List<InlineSpan> codeSpans = [];
    final RegExp placeholderRegex = RegExp(r'(%order%|%fill%)');

    int lastEnd = 0;
    for (final match in placeholderRegex.allMatches(codeText)) {
      // Add text before placeholder
      if (match.start > lastEnd) {
        codeSpans.add(TextSpan(
          text: codeText.substring(lastEnd, match.start),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontFamily: 'Courier',
                color: Colors.green[300],
                fontSize: 16,
              ),
        ));
      }

      // Add interactive element for placeholder
      String placeholder = match.group(0)!;
      if (placeholder == '%order%') {
        codeSpans.add(WidgetSpan(
          child: Container(
            width: 30,
            height: 20,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey),
            ),
          ),
        ));
      } else if (placeholder == '%fill%') {
        codeSpans.add(WidgetSpan(
          child: Container(
            width: 60,
            height: 20,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            child: TextFormField(
              style: const TextStyle(fontSize: 12),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(4),
                isDense: true,
              ),
            ),
          ),
        ));
      }

      lastEnd = match.end;
    }

    // Add remaining text
    if (lastEnd < codeText.length) {
      codeSpans.add(TextSpan(
        text: codeText.substring(lastEnd),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontFamily: 'Courier',
              color: Colors.green[300],
              fontSize: 16,
            ),
      ));
    }

    return RichText(
      text: TextSpan(children: codeSpans),
    );
  }

  List<Map<String, dynamic>> _parseQuestionText(String text) {
    final List<Map<String, dynamic>> parts = [];
    final RegExp codeBlockRegex =
        RegExp(r'```(\w+)?\n(.*?)\n```', dotAll: true);

    int lastEnd = 0;
    for (final match in codeBlockRegex.allMatches(text)) {
      // Add text before code block
      if (match.start > lastEnd) {
        parts.add({
          'text': text.substring(lastEnd, match.start),
          'isCode': false,
        });
      }

      // Add code block without replacing placeholders
      String codeText = match.group(2)!;

      parts.add({
        'text': codeText,
        'isCode': true,
      });

      lastEnd = match.end;
    }

    // Add remaining text
    if (lastEnd < text.length) {
      parts.add({
        'text': text.substring(lastEnd),
        'isCode': false,
      });
    }

    return parts.isEmpty
        ? [
            {'text': text, 'isCode': false}
          ]
        : parts;
  }
}

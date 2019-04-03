import 'package:flutter_ui_challenge/model/writer.dart';

class News {

  final String title;
  final String message;
  final String imagePath;
  final Writer writer;

  News({this.title, this.message, this.imagePath, this.writer});

  String get titleText => this.title;

  String get messageText => this.message;

  String get imagePathText => this.imagePath;

  Writer get writerInfo => this.writer;
}
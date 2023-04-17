import 'dart:io';

abstract class UploadState {}

class UploadInit extends UploadState {}

class UploadLoad extends UploadState {
  List<File>? image;
  UploadLoad(this.image);
}

class UploadError extends UploadState {
  String error;
  UploadError(this.error);
}
class UploadSuccess extends UploadState{}

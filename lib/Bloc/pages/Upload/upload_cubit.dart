import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/Bloc/pages/Upload/upload_state.dart';

class UploadCubit extends Cubit<UploadState> {
  UploadCubit() : super(UploadInit());

  final ImagePicker _picker = ImagePicker();

  void imgFromGallery() async {
    List<File> selectedImages = [];
    List<XFile> image = await _picker.pickMultiImage(imageQuality: 50);
    for (var e in image) {
      selectedImages.add(File(e.path));
    }
    emit(UploadLoad(selectedImages));
  }

  void imgFromCamera() async {
    List<File> selectedImages = [];
    XFile? image =
        await _picker.pickImage(imageQuality: 50, source: ImageSource.camera);
    selectedImages.add(File(image!.path,),);
    emit(UploadLoad(selectedImages));
  }

  // void updateImage(File? newImage) {
  //   emit(UploadLoad(newImage != null ? File(newImage.path) : null));
  // }
}

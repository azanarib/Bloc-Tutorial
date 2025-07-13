import 'package:bloc_tutorial/Bloc/Image_picker_bloc/events.dart';
import 'package:bloc_tutorial/Bloc/Image_picker_bloc/state.dart';
import 'package:bloc_tutorial/Utils/image_picker_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvents, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraPickerEvent>(_imageFromCamera);
    on<GalleryPickerEvent>(_imageFromGallery);
  }

  void _imageFromCamera(
    CameraPickerEvent events,
    Emitter<ImagePickerState> emit,
  ) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void _imageFromGallery(
    GalleryPickerEvent events,
    Emitter<ImagePickerState> emit,
  ) async {
    XFile? file = await imagePickerUtils.galleryCapture();
    emit(state.copyWith(file: file));
  }
}

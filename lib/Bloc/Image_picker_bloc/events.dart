import 'package:equatable/equatable.dart';

abstract class ImagePickerEvents extends Equatable {
  const ImagePickerEvents();

  @override
  List<Object?> get props => [];
}

class CameraPickerEvent extends ImagePickerEvents {}

class GalleryPickerEvent extends ImagePickerEvents {}

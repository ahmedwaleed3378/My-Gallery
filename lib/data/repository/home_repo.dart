import 'package:bookly_app/core/errors/fauilers.dart';
import 'package:bookly_app/data/models/login_response.dart';
import 'package:bookly_app/data/models/my_gallery_response.dart';
import 'package:bookly_app/data/models/upload_image_response.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
    Future<Either<Failure, LoginResponse>> login({
    required String email,
    required String password,
  });
    Future<Either<Failure, UploadResponse>> uploadImage({
    required String img,
  });
    Future<Either<Failure, MyGalleryResponse>> getGallery(
  );
}
import 'package:bookly_app/core/errors/fauilers.dart';
import 'package:bookly_app/core/utls/api_dio_services.dart';
import 'package:bookly_app/core/utls/app_prefferences.dart';
import 'package:bookly_app/core/utls/service_locator.dart';
import 'package:bookly_app/data/models/login_response.dart';
import 'package:bookly_app/data/models/my_gallery_response.dart';
import 'package:bookly_app/data/models/upload_image_response.dart';
import 'package:bookly_app/data/repository/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation implements HomeRepo {
  final DioHelper dioHelper;
  final AppPreferences _appPreferences = getIt<AppPreferences>();

  HomeRepoImplementation(this.dioHelper);

  @override
  Future<Either<Failure, LoginResponse>> login(
      {required String email, required String password}) async {
    try {
      var respondData = await dioHelper.postData(
        url: 'api/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      LoginResponse? data;
      data = LoginResponse.fromJson(respondData);
      await _appPreferences.setUserToken(data.token);
      await _appPreferences.setUserLoggedIn();
      await _appPreferences.setUserId(data.user.id);
      await _appPreferences.setUserName(data.user.name);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.formDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, MyGalleryResponse>> getGallery() async {
    try {
      var respondData = await dioHelper.getData(
        url: 'api/my-gallery',
        token: _appPreferences.getUserToken(),
      );

      MyGalleryResponse? data;
      data = MyGalleryResponse.fromJson(respondData);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.formDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UploadResponse>> uploadImage(
      {required String img}) async {
    try {
      Map<String, dynamic> respondData;
      final formData = FormData.fromMap({});

      formData.files.add(
        MapEntry(
          'img',
          await MultipartFile.fromFile(
            img,
          ),
        ),
      );

      respondData = await dioHelper.postFormData(
        url: 'api/upload',
        formData: formData,
        token: _appPreferences.getUserToken(),
      );

      UploadResponse? data = UploadResponse.fromJson(respondData);

      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.formDioException(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}

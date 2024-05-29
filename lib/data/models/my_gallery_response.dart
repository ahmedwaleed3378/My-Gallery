
class MyGalleryResponse {
    String? status;
    Data? data;
    String? message;

    MyGalleryResponse({this.status, this.data, this.message});

    MyGalleryResponse.fromJson(Map<String, dynamic> json) {
        status = json["status"];
        data = json["data"] == null ? null : Data.fromJson(json["data"]);
        message = json["message"];
    }


}

class Data {
    List<String>? images;

    Data({this.images});

    Data.fromJson(Map<String, dynamic> json) {
        images = json["images"] == null ? null : List<String>.from(json["images"]);
    }

}
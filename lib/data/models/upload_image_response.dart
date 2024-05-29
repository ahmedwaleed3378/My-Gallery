
class UploadResponse {
    String? status;
    String? message;

    UploadResponse({this.status, this.message});

    UploadResponse.fromJson(Map<String, dynamic> json) {
        status = json["status"];
        message = json["message"];
    }
}
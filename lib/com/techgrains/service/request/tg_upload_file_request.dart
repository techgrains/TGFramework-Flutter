import 'package:http/http.dart';
import 'package:techgrains/com/techgrains/service/request/tg_request.dart';

abstract class TGUploadFileRequest extends TGRequest {
  List<MultipartFile> files();
  Map<String, String> body();
}

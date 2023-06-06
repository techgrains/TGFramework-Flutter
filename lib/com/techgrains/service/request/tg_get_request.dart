import 'package:techgrains/com/techgrains/service/request/tg_request.dart';

abstract class TGGetRequest extends TGRequest {
  Map<String, dynamic> params();
}

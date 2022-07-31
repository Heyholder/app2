import 'package:app/utils/logger.dart';
import 'package:dio/dio.dart';
import '../utils/network.dart';

class AgendasService {
  //TODO: Model 수정 할것
  Future<List> getAgendas(String stockCode) async {
    String ip = "";
    ip = ipAddress();

    final uri = Uri.parse('$ip/api/v1/$stockCode/agendas');
    final response = await Dio().getUri(uri);
    logger.d(response.data);
    List<dynamic> dataList = response.data["list"];

    return [];
  }
}

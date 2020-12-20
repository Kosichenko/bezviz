import 'dart:convert';
import 'dart:io';
import 'package:bez_viz_calculator/model/constants.dart';
import 'package:bez_viz_calculator/model/visit.dart';
import 'package:path_provider/path_provider.dart';

const String kFileName = 'visits.json';

class VisitProvider {
  // bool _fileExists = false;
  File _filePath;

  Map<String, dynamic> _json = {};
  String _jsonString;

  Future<List<Visit>> loadVisits() async {
    List<Visit> visitsList = List<Visit>();
    visitsList.add(
      Visit(
        title: "12345678901234567890123456789012345678901234567890",
        startDate: DateTime(2019, 5, 1),
        endDate: DateTime(2019, 5, 15),
      ),
    );

    visitsList.add(
      // с 01/12/2019 по 10/01/2020 = 10 дней, при старте отсчета 180 01/01/2020
      Visit(
        title: "2",
        startDate: DateTime(2019, 12, 01),
        endDate: DateTime(2020, 01, 10),
      ),
    );

    visitsList.add(
      // с 01/01/2020 по 10/01/2020 = 10 дней
      Visit(
        title: "3",
        startDate: DateTime(2020, 1, 1),
        endDate: DateTime(2020, 1, 10),
      ),
    );

    visitsList.add(
      // с 01/04/2020 по 10/04/2020 = 10 дней <= простой случай
      Visit(
        title: "4",
        startDate: DateTime(2020, 11, 1),
        endDate: DateTime(2020, 11, 10),
      ),
    );

    visitsList.add(
      // с 19/06/2020 по __/__/___ = 10 дней
      Visit(
        title: "5",
        startDate: DateTime(2020, 01, 19),
        endDate: globalMaxDate,
      ),
    );
    
    visitsList.sort((a,b)=>b.startDate.compareTo(a.startDate));

    var index = 0;
    for(final item in visitsList) {
      item.id = index;
      index++; 
    }
    
    return visitsList;
  }

  //   _filePath = await _localFile;
  //   _fileExists = await _filePath.exists();
  //   if (_fileExists) {
  //     try {
  //       _jsonString = await _filePath.readAsString();
  //     } catch (e) {
  //       throw Exception('Error while file reading.');
  //     }
  //   } else {
  //     throw Exception('File not found.');
  //   }
  //   final List<dynamic> _json = jsonDecode(_jsonString);
  //   return _json.map((json) => Visit.fromJson(json)).toList();
  // }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$kFileName');
  }

  Future writeJson() async { //String key, dynamic value
    _filePath = await _localFile;
    //  String json = jsonEncode();
    // Map<String, dynamic> _newJson = {key: value};

    // _json.addAll(_newJson);
    // print('2.(_writeJson) _json(updated): $_json');

    _jsonString = jsonEncode(_json);
    print('3.(_writeJson) _jsonString: $_jsonString\n - \n');

    _filePath.writeAsString(_jsonString);
  }
}

import 'package:bez_viz_calculator/model/visit.dart';
import 'package:bez_viz_calculator/model/configuration_data.dart';
import 'package:bez_viz_calculator/model/constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Test for Calculate days ", () {
    // int expectedResultDays = 40;

    // ConfigurationData cfg = ConfigurationData();
    // setTestData(cfg);
    // int actualResultDays = cfg.calcDaysInUEForLast180();

    // expect(actualResultDays, expectedResultDays);
  });
}

void setTestData(ConfigurationData cfg) {
  cfg.calculationDate =
      DateTime(2020, 06, 28); // период 180 начинается 01/01/2020

  cfg.visitsList.add(
    // до 01/01/2020 период не учитывается
    Visit(
      startDate: DateTime(2019, 5, 1),
      endDate: DateTime(2019, 5, 15),
    ),
  );

  cfg.visitsList.add(
    // с 01/12/2019 по 10/01/2020 = 10 дней, при старте отсчета 180 01/01/2020
    Visit(
      startDate: DateTime(2019, 12, 01),
      endDate: DateTime(2020, 01, 10),
    ),
  );

  cfg.visitsList.add(
    // с 01/01/2020 по 10/01/2020 = 10 дней
    Visit(
      startDate: DateTime(2020, 1, 1),
      endDate: DateTime(2020, 1, 10),
    ),
  );

  cfg.visitsList.add(
    // с 01/04/2020 по 10/04/2020 = 10 дней <= простой случай
    Visit(
      startDate: DateTime(2020, 4, 1),
      endDate: DateTime(2020, 4, 10),
    ),
  );

  cfg.visitsList.add(
    // с 19/06/2020 по __/__/___ = 10 дней
    Visit(
      startDate: DateTime(2020, 6, 19),
      endDate: globalMaxDate,
    ),
  );
}

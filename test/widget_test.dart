import 'package:flutter_test/flutter_test.dart';
import 'package:tut_care/core/di/service_locator.dart';

void main() {
  testWidgets('Service locator initialization test', (WidgetTester tester) async {
    setupServiceLocator();
    expect(getIt.isRegistered<Object>(), isFalse);
  });
}

// Bu temel bir Flutter widget testidir.
// Testinizdeki bir widget ile etkileşim kurmak için flutter_test paketindeki WidgetTester yardımcı programını kullanın. Örneğin, dokunma ve kaydırma hareketleri gönderebilirsiniz. WidgetTester'ı ayrıca widget ağacındaki alt widget'ları bulmak, metni okumak ve widget özelliklerinin değerlerinin doğru olduğunu doğrulamak için de kullanabilirsiniz.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
// Uygulamamızı derleyelim ve bir çerçeve tetikleyelim.
    await tester.pumpWidget(const MyApp());

// Sayacımızın 0'dan başladığını doğrulayalım.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

// '+' simgesine dokunun ve bir çerçeveyi tetikleyin.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

// Sayacımızın arttığını doğrulayalım.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

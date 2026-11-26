import 'package:flutter_test/flutter_test.dart';
import 'package:ccqsantos_portifolio/main.dart';

void main() {
  testWidgets('PortfolioApp renderiza a home com o título do AppBar', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();
    //Testes específicos
    // Verifica que o widget raiz foi montado
    expect(find.byType(PortfolioApp), findsOneWidget);

    // Verifica que a home foi renderizada
    expect(find.byType(PortfolioHome), findsOneWidget);

    // Verifica o título no AppBar
    expect(find.text('Cauã dos Santos'), findsWidgets);
  });
}

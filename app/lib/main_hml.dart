import 'core/config/flavors/f.dart';
import 'main.dart' as runner;

Future<void> main() async {
  F.appFlavor = Flavor.hml;
  await runner.main();
}
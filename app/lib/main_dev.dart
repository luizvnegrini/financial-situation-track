import 'core/config/flavors/f.dart';
import 'main.dart' as runner;

Future<void> main() async {
  F.appFlavor = Flavor.dev;
  await runner.main();
}

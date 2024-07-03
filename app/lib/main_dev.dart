import 'app.dart';
import 'core/config/flavors/f.dart';

Future<void> main() async {
  F.appFlavor = Flavor.dev;
  Startup.run();
}

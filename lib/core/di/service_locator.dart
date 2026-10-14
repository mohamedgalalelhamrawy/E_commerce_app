import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'service_locator.config.dart'; // الملف ده هيتولد تلقائي لوحده بعد شوية

final GetIt sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // اسم دالة التهيئة
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => init(sl);
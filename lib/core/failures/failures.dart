abstract class Failures {
  final String message;
  Failures(this.message);
}

// 2. كلاس فرعي لأخطاء السيرفر
class ServerFailure extends Failures {
  ServerFailure(super.message);
}

// 3. كلاس فرعي لأخطاء النت أو الاتصال
class NetworkFailure extends Failures {
  NetworkFailure(super.message);
}
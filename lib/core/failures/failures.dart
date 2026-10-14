abstract class Failures {
  final String errmessage;
  Failures(this.errmessage);
}

// 2. كلاس فرعي لأخطاء السيرفر
class ServerFailure extends Failures {
  ServerFailure(super.errmessage);
}

// 3. كلاس فرعي لأخطاء النت أو الاتصال
class NetworkFailure extends Failures {
  NetworkFailure(super.errmessage);
}
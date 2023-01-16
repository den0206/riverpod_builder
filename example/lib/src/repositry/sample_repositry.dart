abstract class SampleRepositry {
  Future<List<String>> getValues();
}

class SampleRepositryImpl extends SampleRepositry {
  @override
  Future<List<String>> getValues() async {
    try {
      // 非同期処理の再現
      await Future.delayed(const Duration(seconds: 1));

      // [0,1,2,3,4.....]
      return List.generate(5, (index) => "value $index");
    } catch (e) {
      rethrow;
    }
  }
}

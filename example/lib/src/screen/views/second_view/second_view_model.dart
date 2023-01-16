import 'package:example/src/common/base/base_extention.dart';
import 'package:example/src/common/providers/providers.dart';
import 'package:example/src/repositry/sample_repositry.dart';
import 'package:example/src/screen/views/second_view/second_view_state.dart';
import 'package:riverpod_builder/log/color_log';
import 'package:riverpod_builder/view_model/src/base_view_model.dart';

class SecondViewModel extends KeepBaseViewModel<SecondViewState> {
  @override
  SecondViewState get instanse => const SecondViewState();

  SampleRepositry get _repositry =>
      ref.read(RepositryProviders.sampleRepositryProvider);

  List<String> get list => state.list;

  @override
  void onInit() async {
    super.onInit();

    // also use Asynchronous processing
    await initList();
  }

  Future<void> initList() async {
    try {
      showLoading();

      final value = await _repositry.getValues();
      state = state.copyWith(list: [...state.list, ...value]);
    } catch (e) {
      logError(e.toString());
    } finally {
      hideLoading();
    }
  }

  void addList(String text) {
    state = state.copyWith(list: [...state.list, text]);
  }

  void removeList() {
    if (state.list.toList().isNotEmpty) {
      final removed = state.list.toList()..removeLast();
      state = state.copyWith(list: removed);
    }
  }
}

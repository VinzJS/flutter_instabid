import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_stores_controller.g.dart';


@riverpod
class FilteredStoresController extends _$FilteredStoresController {
  @override
  FutureOr<List<StoreFront>> build(String query) async {
    
    final repo = ref.read(storeRepositoryProvider);
    final result = await repo
        .list(query: query, pageSize: 500, pageNo: 1)
        .run();
    return result.fold(Future.error, (x) => Future.value(x.items));
  }
}

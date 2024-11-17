import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_orders_controller.g.dart';

@riverpod
class FilteredOrdersController extends _$FilteredOrdersController {
  @override
  Future<List<Order>> build(String filter) async {
    final repo = ref.read(orderRepositoryProvider);
    final result =
        await repo.list(pageSize: 500, pageNo: 1, query: filter).run();
    return result.fold(Future.error, (x) => Future.value(x.items));
  }
}

import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'orders_controller.g.dart';

@riverpod
class OrdersController extends _$OrdersController {
  @override
  FutureOr<List<Order>> build() async {
    final repo = ref.read(orderRepositoryProvider);
    final result = await repo.list(pageSize: 500, pageNo: 1).run();
    return result.fold(Future.error, (x) => Future.value(x.items));
  }
}

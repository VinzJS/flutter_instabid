import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_orders_controller.g.dart';

@riverpod
class MyOrdersController extends _$MyOrdersController {
  @override
  Future<List<Order>> build() async {
    final user = await ref.watch(authControllerProvider.future);

    final repo = ref.read(orderRepositoryProvider);
    final result = await repo
        .list(pageSize: 500, pageNo: 1, query: 'user = "${user.id}"')
        .run();
    return result.fold(Future.error, (x) => Future.value(x.items));
  }
}

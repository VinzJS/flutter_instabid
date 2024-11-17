import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bids_controller.g.dart';

@riverpod
class BidsController extends _$BidsController {
  @override
  FutureOr<List<Bid>> build() async {
    final repo = ref.read(bidRepositoryProvider);
    final result = await repo.list(pageSize: 500, pageNo: 1).run();
    return result.fold(Future.error, (x) => Future.value(x.items));
  }
}

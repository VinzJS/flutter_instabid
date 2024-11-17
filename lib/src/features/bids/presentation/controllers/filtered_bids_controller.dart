import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_bids_controller.g.dart';

@riverpod
class FilteredBidsController extends _$FilteredBidsController {
  @override
  Future<List<Bid>> build(String filter) async {
    final repo = ref.read(bidRepositoryProvider);
    final result =
        await repo.list(pageSize: 500, pageNo: 1, query: filter).run();
    return result.fold(Future.error, (x) => Future.value(x.items));
  }
}

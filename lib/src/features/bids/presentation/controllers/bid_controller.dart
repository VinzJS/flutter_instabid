import 'package:instabid/src/_index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bid_controller.g.dart';

@riverpod
class BidController extends _$BidController {
  @override
  FutureOr<Bid> build(String id) async {
    final repo = ref.read(bidRepositoryProvider);
    final result = await repo.get(id).run();
    return result.fold(Future.error, (x) => Future.value(x));
  }
}

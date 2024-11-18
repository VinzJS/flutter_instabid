import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ElapsedTimeView extends HookWidget {
  final DateTime startTime;
  final DateTime endTime;
  final DateTime currentTime;
  final TextStyle? style;

  const ElapsedTimeView({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.currentTime,
    this.style,
  });

  ///
  ///
  ///

  String _getTimeRemainingMessage(DateTime now) {
    if (now.isBefore(startTime)) {
      final duration = startTime.difference(now);
      return "Will start in ${_formatDuration(duration)}";
    } else if (now.isAfter(startTime) && now.isBefore(endTime)) {
      final duration = endTime.difference(now);
      return "${_formatDuration(duration)} left";
    } else {
      return "Bidding has ended";
    }
  }

  
  String _formatDuration(Duration duration) {
    final years = duration.inDays ~/ 365;
    final months = (duration.inDays % 365) ~/ 30;
    final days = (duration.inDays % 365) % 30;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;

    final List<String> parts = [];
    if (years > 0) parts.add('$years years');
    if (months > 0) parts.add('$months months');
    if (days > 0) parts.add('$days days');
    if (hours > 0) parts.add('$hours hrs');
    if (minutes > 0) parts.add('$minutes mins');
    // if (seconds > 0) parts.add('$seconds seconds');

    return parts.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    final now = useState(DateTime.now());

  
    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 1), (_) {
        now.value = DateTime.now();
      });
      return timer.cancel;
    }, []);

    return Text(
      _getTimeRemainingMessage(now.value),
      style: style,
      textAlign: TextAlign.start,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

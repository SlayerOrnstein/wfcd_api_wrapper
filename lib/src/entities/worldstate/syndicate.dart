import '../../../objects.dart';
import 'job.dart';

class Syndicate extends WorldstateObject {
  const Syndicate({
    required String id,
    required DateTime activation,
    required DateTime expiry,
    required this.name,
    required this.nameKey,
    required this.active,
    required this.jobs,
  }) : super(id: id, activation: activation, expiry: expiry);

  final String name;
  final String nameKey;
  final bool active;
  final List<Job> jobs;

  @override
  List<Object?> get props => super.props..addAll([name, nameKey, active, jobs]);
}

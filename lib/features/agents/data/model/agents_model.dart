class AgentsModel {
  final String id;
  final String displayName;

  AgentsModel({required this.id, required this.displayName});

  factory AgentsModel.fromJson({required Map<String, dynamic> json}) {
    return AgentsModel(id: json['uuid'], displayName: json['displayName']);
  }
}

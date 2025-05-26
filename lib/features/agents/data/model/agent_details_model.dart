import 'role_model.dart';
import 'abilities_model.dart';

class AgentDetailsModel {
  final String displayName;
  final String description;
  final String fullPortrait;
  final RoleModel roleModel;
  final List<AbilitiesModel> abilitiesModel;

  AgentDetailsModel({
    required this.displayName,
    required this.description,
    required this.fullPortrait,
    required this.roleModel,
    required this.abilitiesModel,
  });

  factory AgentDetailsModel.fromJson({required Map<String, dynamic> json}) {
    return AgentDetailsModel(
      displayName: json['displayName'] ?? "No Name",
      description: json['description'] ?? "No Description",
      fullPortrait: json['fullPortrait'] ?? "No Url",
      roleModel: RoleModel.fromJson(json: json['role']),
      abilitiesModel:
          (json['abilities'] as List<dynamic>)
              .map((x) => AbilitiesModel.fromJson(json: x))
              .toList(),
    );
  }
}

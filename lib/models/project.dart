class Project {
  String status;
  String id;
  String organisationId;
  String creator;
  String reference;
  String projectName;
  String type;
  String projectOwner;
  String projectClientContact;
  String scope;
  List<String> docs;
  List<dynamic> premises;
  Map<String, List<String>> assets = {};
  String createdAt;
  bool expanded;
  List<String> projectTypes() {
    return ['Specification of works', 'Follow up', 'Removal'];
  }

  Project({
    this.status,
    this.id,
    this.organisationId,
    this.creator,
    this.reference,
    this.projectName,
    this.type,
    this.projectOwner,
    this.projectClientContact,
    this.scope,
    this.docs,
    this.premises,
    this.assets,
    this.createdAt,
    this.expanded = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'id': id,
      'organisationId': organisationId,
      'creator': creator,
      'reference': reference,
      'projectName': projectName,
      'type': type,
      'projectOwner': projectOwner,
      'projectClientContact': projectClientContact,
      'scope': scope,
      'docs': docs,
      'premises': premises,
      'assets': assets,
      'createdAt': createdAt,
    };
  }

  static Project fromMap({Map<String, dynamic> map, String documentId}) {
    if (map == null) return null;

    return Project(
      status: map['status'],
      id: documentId,
      organisationId: map['organisationId'],
      creator: map['creator'],
      reference: map['reference'],
      projectName: map['projectName'],
      type: map['type'],
      projectOwner: map['projectOwner'],
      projectClientContact: map['projectClientContact'],
      scope: map['scope'],
      docs: map['docs'],
      premises: map['premises'],
      assets: map['assets'],
    );
  }
}

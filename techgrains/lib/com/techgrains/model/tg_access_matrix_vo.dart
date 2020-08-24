class TGAccessMatrixVO {
  String key;
  int roleId;
  String module;
  String access;
  bool create;
  bool delete;
  bool update;
  bool read;

  TGAccessMatrixVO(
      {this.key,
      this.roleId,
      this.module,
      this.access,
      this.create,
      this.delete,
      this.update,
      this.read});

  TGAccessMatrixVO.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    roleId = json['roleId'];
    module = json['module'];
    access = json['access'];
    create = json['create'];
    delete = json['delete'];
    update = json['update'];
    read = json['read'];
  }

  Map<String, dynamic> toJson() => {
        'key': key,
        'roleId': roleId,
        'module': module,
        'access': access,
        'create': create,
        'delete': delete,
        'update': update,
        'read': read,
      };

  bool operator ==(o) =>
      o is TGAccessMatrixVO && key == o.key && roleId == o.roleId;

  int get hashCode => (key + roleId.toString()).hashCode;
}

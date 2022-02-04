class ChatModel {
  String? name;
  bool? isGroup;
  String? message;
  String? icon;
  String? time;
  int id;

  ChatModel(
      {required this.id,
      this.name,
      this.message,
      this.isGroup,
      this.icon,
      this.time});
}

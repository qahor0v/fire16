class Message {
  String id;
  String senderID;
  String sendTime;
  bool readed;
  String image;
  String file;
  String text;

  Message({
    required this.id,
    required this.senderID,
    required this.text,
    required this.file,
    required this.image,
    required this.readed,
    required this.sendTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'senderID': senderID,
      'sendTime': sendTime,
      'readed': readed,
      'image': image,
      'file': file,
      'text': text,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'] as String,
      senderID: map['senderID'] as String,
      sendTime: map['sendTime'] as String,
      readed: map['readed'] as bool,
      image: map['image'] as String,
      file: map['file'] as String,
      text: map['text'] as String,
    );
  }
}

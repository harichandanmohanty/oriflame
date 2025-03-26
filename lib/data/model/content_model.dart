class Contents {
  final List<Content> contents;

  Contents({required this.contents});
  factory Contents.fromJson(Map<String, dynamic> json) {
    return Contents(
      contents: json['contents'] != null
          ? (json['contents'] as List).map((i) => Content.fromJson(i)).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contents'] = contents.map((v) => v.toJson()).toList();
    return data;
  }
}

class Content {
  final String artist;
  final String caption;
  final int contentIndex;
  final String imagePath;
  final String song;

  Content(
      {required this.artist,
      required this.caption,
      required this.contentIndex,
      required this.imagePath,
      required this.song});
  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      artist: json['artist'],
      caption: json['caption'],
      contentIndex: json['content_index'],
      imagePath: json['image_path'],
      song: json['song'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['artist'] = artist;
    data['caption'] = caption;
    data['content_index'] = contentIndex;
    data['image_path'] = imagePath;
    data['song'] = song;
    return data;
  }
}

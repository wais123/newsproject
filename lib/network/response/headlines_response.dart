class HeadlinesResponse {
  HeadlinesResponse({
    this.status,
    this.totalResults,
    this.articles,
    this.error,
  });

  String? status;
  int? totalResults;
  List<Article>? articles;
  String? error;

  HeadlinesResponse.fromJson(Map<String, dynamic> json):
    status = json["status"],
    totalResults = json["totalResults"],
    articles = List<Article>.from(json["articles"].map((x) => Article.fromJson(x)));

  HeadlinesResponse.withError(String errorValue):
      articles = null,
      error = errorValue;
}

class Article {
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: Source.fromJson(json["source"]),
    author: json["author"] == null ? null : json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: json["publishedAt"],
    content: json["content"] == null ? null : json["content"],
  );

  Map<String, dynamic> toJson() => {
    "source": source,
    "author": author == null ? null : author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt,
    "content": content == null ? null : content,
  };
}

class Source {
  Source({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

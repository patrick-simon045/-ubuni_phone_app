class Phone {
  final int phoneId;
  final String phoneName;
  final String phoneBrandName;
  final String phoneImageUrl;

  Phone({
    required this.phoneId,
    required this.phoneName,
    required this.phoneBrandName,
    required this.phoneImageUrl,
  });

  Phone.fromJson({required Map jsonData})
      : phoneId = jsonData['id'],
        phoneName = jsonData['name'],
        phoneBrandName = jsonData['Brand'],
        phoneImageUrl = jsonData['image_url'];
}

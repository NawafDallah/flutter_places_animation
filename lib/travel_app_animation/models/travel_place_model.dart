class TravelPlace {
  final String id;
  final String name;
  final TravelUser user;
  final StatusTag statusTag;
  final int shared;
  final int likes;
  final String locationDescription;
  final String description;
  final List<String> imagesUrl;

  TravelPlace({
    this.id = '',
    required this.name,
    required this.user,
    this.statusTag = StatusTag.popular,
    this.shared = 0,
    this.likes = 0,
    this.locationDescription = '',
    this.description = '',
    required this.imagesUrl,
  });

  // Static list of TravelPlace
  static final List<TravelPlace> places = [
    TravelPlace(
      id: '1',
      name: 'Santorio Rivira',
      user: TravelUser.alice,
      statusTag: StatusTag.popular,
      shared: 120,
      likes: 450,
      locationDescription: 'A beautiful island in the Aegean Sea.',
      description: 'Santorini, one of the Cyclades islands in the Aegean Sea,'
          'is known for its stunning views of the caldera, amazing sunsets, '
          'and charming villages. The islands whitewashed buildings and blue-domed '
          'churches are iconic features of its breathtaking landscape. It is a top '
          'destination for honeymooners, photographers, and history lovers alike.',
      imagesUrl: [
        'https://media.istockphoto.com/id/965686984/photo/main-street-nantucket-village.jpg?s=2048x2048&w=is&k=20&c=hIlq4ErGekxm-liX1IXvqKXIZSCHplQ0Epn3BQiVeNg=',
        'https://media.istockphoto.com/id/647333206/photo/small-town-street.jpg?s=2048x2048&w=is&k=20&c=FRNxoFi--7EVKM7d9pGTY720vpNXiRJe3sviU7GBvQs=',
        'https://plus.unsplash.com/premium_photo-1677355911326-8dffbc2962e3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8U2FudG9yaW98ZW58MHx8MHx8fDA%3D'
      ],
    ),
    TravelPlace(
      id: '2',
      name: 'Syria Homos',
      user: TravelUser.emma,
      statusTag: StatusTag.event,
      shared: 200,
      likes: 600,
      locationDescription: 'Historical temples and vibrant autumn foliage.',
      description:
          'Kyoto, once the capital of Japan, is a city famous for its classical'
          'Buddhist temples, gardens, imperial palaces, Shinto shrines, and '
          'traditional wooden houses. It is a cultural center that is particularly'
          'beautiful in the fall when the foliage turns vibrant shades of red and orange.'
          'Visitors flock to Kyoto to experience its rich history and heritage.',
      imagesUrl: [
        'https://images.unsplash.com/photo-1673558481548-502c8ad11b95?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'https://images.unsplash.com/photo-1723746271124-ce93677345dc?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHBsYWNlcyUyMHRvJTIwdmlzaXQlMjBzeXJpYXxlbnwwfHwwfHx8MA%3D%3D',
        'https://images.unsplash.com/photo-1662620883416-2b2854528b75?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fHBsYWNlcyUyMHRvJTIwdmlzaXQlMjBzeXJpYXxlbnwwfHwwfHx8MA%3D%3D',
        'https://images.unsplash.com/photo-1681152673277-9835450d4c9e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDY4fHx8ZW58MHx8fHx8',
        'https://images.unsplash.com/photo-1685693810612-08c18adb8152?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEzMXx8fGVufDB8fHx8fA%3D%3D'
      ],
    ),
    TravelPlace(
      id: '3',
      name: 'Saudi Riyadh',
      user: TravelUser.sophia,
      statusTag: StatusTag.popular,
      shared: 300,
      likes: 800,
      locationDescription: 'Ancient Inca city in the Andes mountains.',
      description:
          'Machu Picchu, located in southern Peru, is a 15th-century Inca citadel '
          'perched high in the Andes Mountains. Known as one of the New Seven Wonders '
          'of the World, this UNESCO World Heritage Site attracts travelers from around'
          'the globe. The ruins, surrounded by lush green peaks, offer an incredible '
          'glimpse into the ancient Inca civilization.',
      imagesUrl: [
        'https://images.unsplash.com/photo-1669529250752-9f5b54b30491?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8cGxhY2VzJTIwdG8lMjB2aXNpdCUyMHJpeWFkaHxlbnwwfHwwfHx8MA%3D%3D',
        'https://plus.unsplash.com/premium_photo-1697729683785-adfae2f6564b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cml5YWRofGVufDB8fDB8fHww',
        'https://media.istockphoto.com/id/2152909940/photo/sunny-facades-king-abdullah-financial-district.webp?a=1&b=1&s=612x612&w=0&k=20&c=lPvbtOBVgUe_WIsEpsNaNiEtucAyvyY9sTHbYYo-VkM=',
        'https://media.istockphoto.com/id/1395113900/photo/riyadh-illuminated-city-skyline-at-twilight.webp?a=1&b=1&s=612x612&w=0&k=20&c=JzuBwa8K5x8krt88KQtpPQ6Baat88g24Cv_4GpTriRQ=',
        'https://media.istockphoto.com/id/1391163275/photo/restored-salwa-palace-under-twilight-sky.webp?a=1&b=1&s=612x612&w=0&k=20&c=dgb6GlYnrK_rrDzId6IsQfwoFSHIhMiRhBhoOVfEUFM='
      ],
    ),
  ];
}

class TravelUser {
  final String name;
  final String urlPhoto;

  TravelUser({required this.name, required this.urlPhoto});

  static TravelUser alice = TravelUser(
    name: 'Alice Johnson',
    urlPhoto: 'assets/images/profile_images/profile_1.jpg',
  );
  static TravelUser david = TravelUser(
    name: 'David Lee',
    urlPhoto: 'assets/images/profile_images/profile_2.jpg',
  );
  static TravelUser sophia = TravelUser(
    name: 'Sophia Brown',
    urlPhoto: 'assets/images/profile_images/profile_3.jpg',
  );
  static TravelUser lucas = TravelUser(
    name: 'Lucas Martinez',
    urlPhoto: 'assets/images/profile_images/profile_4.jpg',
  );
  static TravelUser emma = TravelUser(
    name: 'Emma Wilson',
    urlPhoto: 'assets/images/profile_images/profile_5.jpg',
  );

  // Static list of TravelUser
  static final List<TravelUser> users = [alice, david, sophia, lucas, emma];
}

enum StatusTag { event, popular }

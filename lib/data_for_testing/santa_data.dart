// lib/data/santa_data.dart
import '../models/santa.dart';

List<Santa> generateSantas() {
  return List<Santa>.generate(15, (index) {
    return Santa(
      name: 'Santa Claus ${index + 1}',
      rating: (5 + index % 6) + 0.5,
      location: 'Location ${index + 1}',
      imageUrl:
          'https://media.elfontheshelf.com/wp-content/uploads/sites/23/2020/10/Learn-10-Fun-Facts-About-Santa_2.jpg', // Replace with actual URLs
      description:
          'Santa Claus ${index + 1} is known for delivering joy and gifts.',
    );
  });
}

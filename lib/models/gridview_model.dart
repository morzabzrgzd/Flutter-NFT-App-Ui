class DataGridView {
  final int id;
  final String title;
  final num price;
  final String image;

  DataGridView({required this.image, required this.price, required this.title,required this.id});
}

List<DataGridView> data = <DataGridView>[
  DataGridView(
    id: 1,
    image: 'assets/images/image1.png',
    price: 1.45,
    title: 'Discovery\nof the world',
  ),
  DataGridView(
    id: 2,
    image: 'assets/images/image2.png',
    price: 1.13,
    title: 'Lost space',
  ),
  DataGridView(
    id: 3,
    image: 'assets/images/image3.png',
    price: 2.45,
    title: 'The birth\nof the world',
  ),
  DataGridView(
    id: 4,
    image: 'assets/images/image4.png',
    price: 2.13,
    title: 'Galactic places',
  ),
  DataGridView(
    id: 5,
    image: 'assets/images/image6.png',
    price: 4.13,
    title: 'Find of the century',
  ),
  DataGridView(
    id: 6,
    image: 'assets/images/image7.png',
    price: 3.56,
    title: 'Alien',
  ),
  DataGridView(
    id: 7,
    image: 'assets/images/image5.png',
    price: 1.13,
    title: 'Galactic places',
  ),
  DataGridView(
    id: 8,
    image: 'assets/images/image1.png',
    price: 1.45,
    title: 'Discovery\nof the world',
  ),
  DataGridView(
    id: 9,
    image: 'assets/images/image2.png',
    price: 1.13,
    title: 'Lost space',
  ),
  DataGridView(
    id: 10,
    image: 'assets/images/image3.png',
    price: 2.45,
    title: 'The birth\nof the world',
  ),
];

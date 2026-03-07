import '../models/movie_model.dart';

class DisneyData {
  // ============================================================
  // ============================================================
  static final List<DisneyContent> allContent = [
    // --- TUS PELÍCULAS ORIGINALES ---
    DisneyContent(
      id: '1',
      title: 'Frozen II',
      year: '2019',
      poster:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNbm28EZhooHofMhqRbjqYXm58jMZo87-n1A&s',
      backdrop:
          'https://los40.com/resizer/v2/GMVVEZP26VMD5JQXDYU3JL5MZQ.jpg?auth=4a012cab3376474029128855b4473d2a5d3044d1f2774325ab9bb4c864b45032&quality=70&width=1200&height=675&smart=true',
      type: 'movie',
      description:
          'Elsa, Anna, Kristoff, Olaf y Sven viajan más allá de Arendelle.',
      genres: ['Animación', 'Aventura', 'Familia'],
      rating: 7.2,
      director: 'Chris Buck',
    ),
    DisneyContent(
      id: '3',
      title: 'Encanto',
      year: '2021',
      poster:
          'https://lumiere-a.akamaihd.net/v1/images/encanto_ka_las_pay1_92ad7410.jpeg',
      backdrop:
          'https://www.infobae.com/resizer/v2/TGR7MGNDXBHG3BOOTPWKEY6WRA.png?auth=2f23fc348ab5ef1e08d34e19739e45f64b3d732b95464375009d7b6d2ec896fa&smart=true&width=1024&height=512&quality=85',
      type: 'movie',
      description: 'La historia de los Madrigal, una familia extraordinaria.',
      genres: ['Animación', 'Familia', 'Musical'],
      rating: 7.7,
      director: 'Byron Howard',
    ),
    DisneyContent(
      id: '4',
      title: 'Moana 2',
      year: '2024',
      poster:
          'https://lumiere-a.akamaihd.net/v1/images/p_moana_20530_214883e3.jpeg?region=0%2C0%2C540%2C810',
      backdrop: 'https://ichef.bbci.co.uk/images/ic/480xn/p04j6nxk.jpg.webp',
      type: 'movie',
      description: 'Moana recibe un inesperado aviso de sus ancestros.',
      genres: ['Animación', 'Aventura'],
      rating: 8.3,
      director: 'David G. Derrick Jr.',
    ),
    DisneyContent(
      id: '5',
      title: 'Avatar: El Sentido del Agua',
      year: '2022',
      poster:
          'https://http2.mlstatic.com/D_NQ_NP_820377-MLU70799697688_082023-O.webp',
      backdrop:
          'https://media.gqmagazine.fr/photos/63dce1f582e384fe4d7ac7ef/master/pass/raw.jpeg',
      type: 'movie',
      description: 'Jake Sully y Ney\'tiri han formado una familia en Pandora.',
      genres: ['Acción', 'Aventura', 'Ciencia Ficción'],
      rating: 7.6,
      director: 'James Cameron',
    ),
    DisneyContent(
      id: '6',
      title: 'Deadpool & Wolverine',
      year: '2024',
      poster:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNYOexsRNcZp1Fr-ZGwBoUxOg6-29ALKpJmA&s',
      backdrop:
          'https://lumiere-a.akamaihd.net/v1/images/mobile_89eef737.jpeg?region=0,0,1239,1001',
      type: 'movie',
      description:
          'Una misión que cambiará la historia del Universo Cinematográfico de Marvel.',
      genres: ['Acción', 'Comedia', 'Ciencia Ficción'],
      rating: 8.1,
      director: 'Shawn Levy',
    ),
    DisneyContent(
      id: '7',
      title: 'Elementos',
      year: '2023',
      poster:
          'https://purodiseno.lat/wp-content/uploads/2023/09/ELEMENTOS-POSTER-.jpg',
      backdrop:
          'https://cadenaser.com/resizer/v2/6DOR626ASZGEDLHFVDOTP2EJT4.jpg?auth=fe54a80cc9512727e7d748ecf2217b5192cd875aef342b1b24f0b1ad4d902932',
      type: 'movie',
      description: 'En una ciudad donde los elementos conviven.',
      genres: ['Animación', 'Familia', 'Comedia'],
      rating: 7.7,
      director: 'Peter Sohn',
    ),
    DisneyContent(
      id: '10',
      title: 'Toy Story 4',
      year: '2019',
      poster:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwDIjEoDK0n7sWZHGWJlrLqfq8v6OqWX_Wig&s',
      backdrop:
          'https://lumiere-a.akamaihd.net/v1/images/toy-story-4-background_ab0c7920.jpeg',
      type: 'movie',
      description:
          'Woody y su pandilla emprenden una nueva aventura cuando Bonnie entra a la escuela.',
      genres: ['Animación', 'Aventura', 'Familia'],
      rating: 7.8,
      director: 'Josh Cooley',
    ),
    DisneyContent(
      id: '11',
      title: 'Coco',
      year: '2017',
      poster:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSL_k7lXNJ5J5B5B5B5B5B5B5B5B5B5B5B5B5B&s',
      backdrop:
          'https://lumiere-a.akamaihd.net/v1/images/coco-background_3ab6c8d5.jpeg',
      type: 'movie',
      description:
          'Miguel persigue su pasión por la música en el colorido mundo de Coco.',
      genres: ['Animación', 'Aventura', 'Familia'],
      rating: 8.4,
      director: 'Lee Unkrich',
    ),
    DisneyContent(
      id: '12',
      title: 'Aladdin',
      year: '2019',
      poster:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0lZ1X1X1X1X1X1X1X1X1X1X1X1X1X1X1X1X&s',
      backdrop:
          'https://lumiere-a.akamaihd.net/v1/images/aladdin-background_c9b9c9d9.jpeg',
      type: 'movie',
      description:
          'Un joven ladrón descubre un poder mágico y se enamora de una princesa.',
      genres: ['Aventura', 'Acción', 'Familia'],
      rating: 7.0,
      director: 'Guy Ritchie',
    ),
    DisneyContent(
      id: '13',
      title: 'La Reina de las Nieves',
      year: '2013',
      poster:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_T_T_T_T_T_T_T_T_T_T_T_T_T_T_T_T_T&s',
      backdrop:
          'https://lumiere-a.akamaihd.net/v1/images/frozen-background_a9a8c8d8.jpeg',
      type: 'movie',
      description:
          'La primera aventura de Elsa, Anna y Olaf en un reino helado.',
      genres: ['Animación', 'Aventura', 'Familia'],
      rating: 7.4,
      director: 'Chris Buck',
    ),
    DisneyContent(
      id: '14',
      title: 'Raya y el Último Dragón',
      year: '2021',
      poster:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcX_X_X_X_X_X_X_X_X_X_X_X_X_X_X_X_X_X&s',
      backdrop:
          'https://lumiere-a.akamaihd.net/v1/images/raya-background_b9b8c8d8.jpeg',
      type: 'movie',
      description: 'Raya busca el último dragón para salvar su mundo.',
      genres: ['Animación', 'Aventura', 'Acción'],
      rating: 7.8,
      director: 'Don Hall',
    ),
    DisneyContent(
      id: '15',
      title: 'Mundo de Pixar',
      year: '2020',
      poster:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcY_Y_Y_Y_Y_Y_Y_Y_Y_Y_Y_Y_Y_Y_Y_Y_Y_Y&s',
      backdrop:
          'https://lumiere-a.akamaihd.net/v1/images/pixar-background_c9c8c8d8.jpeg',
      type: 'movie',
      description:
          'Un alma viaja a través de mundos extraordinarios descubriendo su propósito.',
      genres: ['Animación', 'Aventura', 'Familia'],
      rating: 8.2,
      director: 'Pete Docter',
    ),
    DisneyContent(
      id: '16',
      title: 'Hercules',
      year: '1997',
      poster:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcZ_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z_Z&s',
      backdrop:
          'https://lumiere-a.akamaihd.net/v1/images/hercules-background_d9d8d8d8.jpeg',
      type: 'movie',
      description:
          'Hércules descubre su verdadero origen y se convierte en un héroe.',
      genres: ['Animación', 'Aventura', 'Familia'],
      rating: 7.5,
      director: 'Ron Clements',
    ),
    DisneyContent(
      id: '17',
      title: 'La Bella y la Bestia',
      year: '1991',
      poster:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcA_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A&s',
      backdrop:
          'https://lumiere-a.akamaihd.net/v1/images/beauty-background_e9e8e8d8.jpeg',
      type: 'movie',
      description: 'Bella se enamora de la Bestia en su castillo encantado.',
      genres: ['Animación', 'Aventura', 'Familia'],
      rating: 7.4,
      director: 'Gary Trousdale',
    ),

    // --- NUEVAS 15 SERIES (Diferentes a películas) ---
    DisneyContent(
      id: 's1',
      title: 'Loki',
      year: '2021',
      poster:
          'https://m.media-amazon.com/images/M/MV5BZDU0MTQ0YWQtMmM0Yy00Y2FmLWI5OTktZWM1ODg5MGY4OTQ4XkEyXkFqcGc@._V1_QL75_UY281_CR18,0,190,281_.jpg',
      backdrop:
          'https://m.media-amazon.com/images/M/MV5BZDU0MTQ0YWQtMmM0Yy00Y2FmLWI5OTktZWM1ODg5MGY4OTQ4XkEyXkFqcGc@._V1_QL75_UY281_CR18,0,190,281_.jpg',
      type: 'series',
      description: 'El Dios del Engaño sale de la sombra de su hermano.',
      genres: ['Acción', 'Aventura', 'Fantasía'],
      rating: 8.2,
      director: 'Kate Herron',
    ),
    DisneyContent(
      id: 's2',
      title: 'The Mandalorian',
      year: '2019',
      poster:
          'https://m.media-amazon.com/images/M/MV5BNjgxZGM0OWUtZGY1MS00MWRmLTk2N2ItYjQyZTI1OThlZDliXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
      backdrop:
          'https://m.media-amazon.com/images/M/MV5BNjgxZGM0OWUtZGY1MS00MWRmLTk2N2ItYjQyZTI1OThlZDliXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
      type: 'series',
      description: 'Un pistolero solitario en los confines de la galaxia.',
      genres: ['Acción', 'Ciencia Ficción'],
      rating: 8.7,
      director: 'Jon Favreau',
    ),
    DisneyContent(
      id: 's3',
      title: 'WandaVision',
      year: '2021',
      poster:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqShyFAaVR_74PKEs35Ba8kZn2nDHh7P36QQ&s',
      backdrop:
          'https://media.gq.com.mx/photos/5ffa01f49274cd36fe35680f/16:9/w_2560%2Cc_limit/WandaVision-disney.jpg',
      type: 'series',
      description: 'Wanda y Visión viven una vida suburbana ideal.',
      genres: ['Drama', 'Misterio', 'Ciencia Ficción'],
      rating: 7.9,
      director: 'Matt Shakman',
    ),
    DisneyContent(
      id: 's4',
      title: 'Ahsoka',
      year: '2023',
      poster:
          'https://es.web.img2.acsta.net/pictures/23/09/19/11/27/3320024.jpg',
      backdrop:
          'https://es.web.img2.acsta.net/pictures/23/09/19/11/27/3320024.jpg',
      type: 'series',
      description: 'Ahsoka Tano investiga una amenaza emergente.',
      genres: ['Acción', 'Aventura', 'Ciencia Ficción'],
      rating: 7.8,
      director: 'Dave Filoni',
    ),
    DisneyContent(
      id: 's5',
      title: 'Moon Knight',
      year: '2022',
      poster:
          'https://m.media-amazon.com/images/M/MV5BNDAzNmYwZjgtNDc3YS00ZDMyLTk0MjktMTg4MGNmNGU3MjlhXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
      backdrop:
          'https://m.media-amazon.com/images/M/MV5BNDAzNmYwZjgtNDc3YS00ZDMyLTk0MjktMTg4MGNmNGU3MjlhXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
      type: 'series',
      description: 'Un empleado de una tienda padece trastorno de identidad.',
      genres: ['Acción', 'Aventura', 'Fantasía'],
      rating: 7.3,
      director: 'Mohamed Diab',
    ),
    DisneyContent(
      id: 's6',
      title: 'Bluey',
      year: '2018',
      poster:
          'https://es.web.img2.acsta.net/pictures/21/01/19/15/30/3519161.jpg',
      backdrop:
          'https://es.web.img2.acsta.net/pictures/21/01/19/15/30/3519161.jpg',
      type: 'series',
      description: 'Una perrita de seis años vive con su familia.',
      genres: ['Animación', 'Familia', 'Comedia'],
      rating: 9.4,
      director: 'Joe Brumm',
    ),
    DisneyContent(
      id: 's7',
      title: 'Andor',
      year: '2022',
      poster:
          'https://lumiere-a.akamaihd.net/v1/images/andor_poster_eb4ef19e.jpeg?region=0,0,1080,1350',
      backdrop:
          'https://lumiere-a.akamaihd.net/v1/images/andor_poster_eb4ef19e.jpeg?region=0,0,1080,1350',
      type: 'series',
      description: 'Explora una nueva perspectiva de la galaxia de Star Wars.',
      genres: ['Acción', 'Aventura', 'Drama'],
      rating: 8.4,
      director: 'Tony Gilroy',
    ),
    DisneyContent(
      id: 's8',
      title: 'The Bear',
      year: '2022',
      poster:
          'https://es.web.img3.acsta.net/pictures/22/06/10/16/53/5259982.jpg',
      backdrop:
          'https://es.web.img3.acsta.net/pictures/22/06/10/16/53/5259982.jpg',
      type: 'series',
      description:
          'Un joven chef regresa a Chicago para dirigir la tienda de su familia.',
      genres: ['Drama', 'Comedia'],
      rating: 8.6,
      director: 'Christopher Storer',
    ),
    DisneyContent(
      id: 's9',
      title: 'Shogun',
      year: '2024',
      poster:
          'https://hips.hearstapps.com/hmg-prod/images/shogun-105-04461r-65f89ad62c488.jpg?crop=1xw:0.8438222079589217xh;0.157xw,0.0433xh',
      backdrop:
          'https://hips.hearstapps.com/hmg-prod/images/shogun-105-04461r-65f89ad62c488.jpg?crop=1xw:0.8438222079589217xh;0.157xw,0.0433xhg',
      type: 'series',
      description: 'En el Japón de 1600, Lord Toranaga lucha por su vida.',
      genres: ['Drama', 'Historia', 'Aventura'],
      rating: 8.8,
      director: 'Rachel Kondo',
    ),
    DisneyContent(
      id: 's10',
      title: 'The Simpsons',
      year: '1989',
      poster:
          'https://wallpapers.com/images/featured/simpsons-h3y2bvkczepf50dr.jpg',
      backdrop:
          'https://wallpapers.com/images/featured/simpsons-h3y2bvkczepf50dr.jpg',
      type: 'series',
      description:
          'Las aventuras satíricas de una familia de clase trabajadora.',
      genres: ['Animación', 'Comedia'],
      rating: 8.7,
      director: 'Matt Groening',
    ),
  ];

  // ============================================================
  // 3. FILTROS Y LÓGICA
  // ============================================================
  static final List<ContentFilter> filters = [
    ContentFilter(name: 'Todo', value: 'all'),
    ContentFilter(name: 'Películas', value: 'movie'),
    ContentFilter(name: 'Series', value: 'series'),
    ContentFilter(name: 'Animación', value: 'Animación'),
    ContentFilter(name: 'Aventura', value: 'Aventura'),
    ContentFilter(name: 'Familia', value: 'Familia'),
  ];

  static List<DisneyContent> getFeatured() => allContent.take(15).toList();
  static List<DisneyContent> getComingSoon() => allContent.skip(15).toList();

  static List<DisneyContent> getContentByType(String type) {
    if (type == 'all') return allContent;
    return allContent.where((c) => c.type == type).toList();
  }

  static List<DisneyContent> getContentByGenre(String genre) {
    if (genre == 'all') return allContent;
    return allContent.where((c) => c.genres.contains(genre)).toList();
  }

  static List<DisneyContent> searchContent(String query) {
    if (query.isEmpty) return allContent;
    return allContent
        .where((c) => c.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}

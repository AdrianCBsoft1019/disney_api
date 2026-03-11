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
          'https://image.tmdb.org/t/p/w500/qdfARIhgpgZOBh3vfNhWS4hmSo3.jpg',
      backdrop:
          'https://image.tmdb.org/t/p/w1280/xJWPZIYOEFIjZpBL7SVBGnzRLeV.jpg',
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
          'https://image.tmdb.org/t/p/w500/4j0PNHkMr5ax3IA8tjtxcmPU3QT.jpg',
      backdrop:
          'https://image.tmdb.org/t/p/w1280/3G1Q5xF40HkUBJXxt2DQgQzKTp5.jpg',
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
          'https://image.tmdb.org/t/p/w1280/s16H6tpK2utvwpazeGkIWt3NvAq.jpg',
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
          'https://image.tmdb.org/t/p/w500/8poVB7at3b4PcPHAn498gANDQAH.jpg',
      backdrop:
          'https://image.tmdb.org/t/p/w1280/fA3JFnlDHFuPnOsX8iO8lNK7YxS.jpg',
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
          'https://image.tmdb.org/t/p/w500/w9kR8qbmQ01HwnvK4alvnQ2ca0L.jpg',
      backdrop:
          'https://image.tmdb.org/t/p/w1280/5yGSaJGwsMFosBXpZA8JaXaFLdI.jpg',
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
          'https://image.tmdb.org/t/p/w500/gGEsBPAijhVUFoiNpgZXqRVWJt2.jpg',
      backdrop:
          'https://image.tmdb.org/t/p/w1280/askg3SMvhqEl4OL52YuvdtY40Yb.jpg',
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
          'https://image.tmdb.org/t/p/w500/zcuz9tchQ2ygJbBq4UxQLWYuSFG.jpg',
      backdrop:
          'https://image.tmdb.org/t/p/w1280/v4yVTbbl8dE1UP2dWu5CLyaXOku.jpg',
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
          'https://image.tmdb.org/t/p/w500/iG1sE1dkpzCjMiLDCQrEfI2BVPQ.jpg',
      backdrop:
          'https://image.tmdb.org/t/p/w1280/yMzT4RXhOEY3pOhXAbZnC4JWksk.jpg',
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
          'https://image.tmdb.org/t/p/w500/lPsD10PP4rgUGiGR4CCXA6iY0QQ.jpg',
      backdrop:
          'https://image.tmdb.org/t/p/w1280/8ZEpbFbG4EJH3YVkl7JHs3mGcvp.jpg',
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
          'https://image.tmdb.org/t/p/w500/kf456ZqeC45XTvo6W9pXooreBYc.jpg',
      backdrop:
          'https://image.tmdb.org/t/p/w1280/dFpqnFzCpwWr5wFKhZNkI1VqCDm.jpg',
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
          'https://image.tmdb.org/t/p/w500/4iVCMbAMTgHVlbGDRijRBePSUJJ.jpg',
      backdrop:
          'https://image.tmdb.org/t/p/w1280/bHm8MZZyXVtKFBaJCltqtgszRiS.jpg',
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
          'https://image.tmdb.org/t/p/w500/tWqifoYuwLETmmasnGHO7xBjEtt.jpg',
      backdrop:
          'https://image.tmdb.org/t/p/w1280/lQpOAMR5iQJDjFqnVIEqXRSHBMu.jpg',
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
-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  ven. 15 oct. 2021 à 11:43
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `catalogue`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom`, `slug`) VALUES
(19, 'Sci-fi', 'scifi'),
(2, 'Drame', 'drame'),
(21, 'Documentaire', 'documentaire'),
(4, 'Policier', 'policier'),
(5, 'Historique', 'historique'),
(6, 'Humour', 'humour'),
(12, 'Romance', 'romance'),
(17, 'Sentimental', 'sentimental'),
(18, 'Horreur', 'horreur');

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_film` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `note` int(11) NOT NULL,
  `commentaire` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `id_film`, `id_user`, `note`, `commentaire`) VALUES
(1, 4, 2, 3, 'cwwxcwxc'),
(2, 4, 3, 3, 'joachim note'),
(3, 4, 2, 2, 'bienn'),
(4, 4, 2, 5, 'Genial'),
(5, 4, 2, 4, 'meilleur film du monde'),
(6, 8, 2, 5, 'etest'),
(7, 4, 4, 5, 'test');

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

DROP TABLE IF EXISTS `film`;
CREATE TABLE IF NOT EXISTS `film` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date_sortie` date DEFAULT NULL,
  `prix` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`id`, `titre`, `slug`, `image`, `description`, `date_sortie`, `prix`) VALUES
(4, 'Ben-hur', 'benhur', '4aa4be1fb7e1ee7d8ad5bd8ab9cd5e7a.jpg', 'Monument du cinéma', '1959-06-03', 200),
(5, 'Saw', 'saw', '16e0bfc6d66472c4306c565eeb874df6.jpg', 'Si tu devines la fin, t\'es fort', '2005-12-07', 18),
(7, 'Mud', 'mud', '87a3ff66ef8abef37076307a5fb0f3ea.jpg', 'L\'histoire de deux enfants qui trouvent un bateau dans les arbres et qui découvrent que ce bateau est habité...', '2013-04-18', 204.85),
(8, 'dirk gently\'s holistic detective agency', 'dirk-gently-s-holistic-detective-agency', '342086d0868e9ebb45d4de3ea0d92135.jpg', 'L\'histoire d\'un détective super nul et de boucles temporelles', '2016-02-10', 15.15),
(9, 'The Straight Story', 'the-straight-story', '51392802ba0a21cde9311dd1f2359f1a.jpg', 'L\'histoire vraie d\'un vieil homme qui fit plus de 300km sur sa tondeuse à gazon pour retrouver son frère', '1999-07-14', 180),
(10, 'Lost in translation', 'lost-in-translation', 'f20a459d7787d0ddd369fb7a0ddc5cd8.jpg', 'Lost in Translation est un film américano-japonais de Sofia Coppola, sorti en 2003. Cette comédie dramatique est le deuxième film de la réalisatrice, qui en a également écrit le scénario en s\'inspirant de ses séjours au Japon. Le film a pour thème la rencontre dans un hôtel de Tokyo de deux Américains, interprétés par Bill Murray et Scarlett Johansson, perdus au sein d\'une culture qui leur est totalement étrangère ainsi que dans leurs propres vies et qui nouent un lien particulier. À travers leurs expériences, le film propose une réflexion sur l\'isolement, le mal-être, la culture japonaise et le langage.\r\n\r\nLe film, financé de manière indépendante, est tourné au Japon en un peu plus d\'un mois. Le scénario laisse beaucoup de liberté aux acteurs pour improviser, notamment à Bill Murray pour qui Sofia Coppola a spécifiquement écrit le rôle principal masculin. À sa sortie, le film est plébiscité par la critique et obtient un important succès commercial au vu de son modeste budget. Il remporte de nombreux prix, dont l\'Oscar du meilleur scénario original, le Golden Globe du meilleur film musical ou de comédie, les British Academy Film Awards du meilleur acteur et de la meilleure actrice, et le César du meilleur film étranger.', '2004-03-11', 20);

-- --------------------------------------------------------

--
-- Structure de la table `films_categs`
--

DROP TABLE IF EXISTS `films_categs`;
CREATE TABLE IF NOT EXISTS `films_categs` (
  `id_film` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=277 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `films_categs`
--

INSERT INTO `films_categs` (`id_film`, `id_categorie`, `id`) VALUES
(4, 17, 247),
(4, 12, 246),
(4, 5, 245),
(4, 21, 244),
(4, 2, 243),
(5, 18, 227),
(5, 4, 226),
(6, 2, 8),
(6, 5, 9),
(6, 12, 10),
(1, 2, 167),
(1, 4, 166),
(1, 2, 165),
(1, 19, 14),
(1, 2, 15),
(1, 4, 16),
(1, 19, 17),
(1, 2, 18),
(1, 4, 19),
(1, 19, 20),
(1, 2, 21),
(1, 4, 22),
(1, 19, 23),
(1, 2, 24),
(1, 4, 25),
(1, 19, 26),
(1, 2, 27),
(1, 4, 28),
(1, 2, 29),
(1, 4, 30),
(1, 19, 31),
(1, 2, 32),
(1, 4, 33),
(1, 19, 34),
(1, 2, 35),
(1, 4, 36),
(1, 2, 37),
(1, 4, 38),
(1, 2, 39),
(1, 4, 40),
(1, 2, 41),
(1, 4, 42),
(1, 2, 43),
(1, 4, 44),
(1, 19, 45),
(1, 2, 46),
(1, 4, 47),
(1, 19, 48),
(1, 2, 49),
(1, 4, 50),
(1, 19, 51),
(1, 2, 52),
(1, 4, 53),
(1, 19, 54),
(1, 2, 55),
(1, 4, 56),
(1, 19, 57),
(1, 2, 58),
(1, 4, 59),
(1, 19, 60),
(1, 2, 61),
(1, 4, 62),
(1, 19, 63),
(1, 2, 64),
(1, 4, 65),
(1, 19, 66),
(1, 2, 67),
(1, 4, 68),
(1, 19, 69),
(1, 2, 70),
(1, 4, 71),
(1, 19, 72),
(1, 2, 73),
(1, 4, 74),
(1, 19, 75),
(1, 2, 76),
(1, 4, 77),
(1, 19, 78),
(1, 2, 79),
(1, 4, 80),
(1, 19, 81),
(1, 2, 82),
(1, 4, 83),
(1, 19, 84),
(1, 2, 85),
(1, 4, 86),
(1, 19, 87),
(1, 2, 88),
(1, 4, 89),
(1, 19, 90),
(1, 2, 91),
(1, 4, 92),
(1, 19, 93),
(1, 2, 94),
(1, 4, 95),
(1, 19, 96),
(1, 2, 97),
(1, 4, 98),
(1, 19, 99),
(1, 2, 100),
(1, 4, 101),
(1, 19, 102),
(1, 2, 103),
(1, 4, 104),
(1, 19, 105),
(1, 2, 106),
(1, 4, 107),
(1, 19, 108),
(1, 2, 109),
(1, 4, 110),
(1, 19, 111),
(1, 2, 112),
(1, 4, 113),
(1, 19, 114),
(1, 2, 115),
(1, 4, 116),
(1, 19, 117),
(1, 2, 118),
(1, 4, 119),
(1, 19, 120),
(1, 2, 121),
(1, 4, 122),
(1, 19, 123),
(1, 2, 124),
(1, 4, 125),
(1, 19, 126),
(1, 2, 127),
(1, 4, 128),
(1, 19, 129),
(1, 2, 130),
(1, 4, 131),
(1, 19, 132),
(1, 2, 133),
(1, 4, 134),
(1, 19, 135),
(1, 2, 136),
(1, 4, 137),
(1, 19, 138),
(1, 2, 139),
(1, 4, 140),
(1, 19, 141),
(1, 2, 142),
(1, 4, 143),
(1, 2, 144),
(1, 4, 145),
(1, 2, 146),
(1, 4, 147),
(1, 2, 148),
(1, 4, 149),
(1, 2, 150),
(1, 4, 151),
(1, 2, 152),
(1, 4, 153),
(1, 2, 154),
(1, 4, 155),
(1, 2, 156),
(1, 4, 157),
(1, 2, 158),
(1, 4, 159),
(1, 19, 160),
(1, 2, 161),
(1, 4, 162),
(1, 2, 163),
(1, 4, 164),
(1, 4, 168),
(1, 5, 169),
(8, 6, 223),
(7, 4, 225),
(7, 2, 224),
(8, 4, 222),
(8, 19, 221),
(9, 17, 229),
(9, 2, 228),
(10, 12, 251),
(10, 2, 250);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  `avatar` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`login`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `login`, `email`, `password`, `role`, `avatar`) VALUES
(1, 'joachim', 'joachim_thibout@yahoo.fr', 'afc5bd9d18aba20a5a9ef04805e9aa28', 1, 'default.jpg'),
(2, 'admin', 'moneo.house.atreides@gmail.com', 'afc5bd9d18aba20a5a9ef04805e9aa28', 2, 'default.jpg'),
(3, 'nouveaulogin', 'joachim_thibout@yahoo.fr', 'afc5bd9d18aba20a5a9ef04805e9aa28', 1, 'add2a425b78c75b668d5fd329e8752e9.png'),
(4, 'essai', 'essai@essai.fr', '4d8fc38123455b12879a07703234bda2', 1, 'default.jpg');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

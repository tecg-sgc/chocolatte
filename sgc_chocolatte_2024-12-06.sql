# ************************************************************
# Sequel Ace SQL dump
# Version 20077
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# Hôte: 127.0.0.1 (MySQL 8.0.27)
# Base de données: sgc_chocolatte
# Temps de génération: 2024-12-06 15:59:44 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump de la table employees
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;

INSERT INTO `employees` (`id`, `name`, `job`, `description`, `img`, `created_at`, `updated_at`)
VALUES
	(1,'Toon','Boss','Il veille au bon fonctionnement du café.','images/team/portrait-elegant-old-man-wearing-suit.jpg','2024-11-23 11:15:57','2024-11-23 11:15:57'),
	(2,'Adrien','Manager','Il gère à l\'organisation du café.','images/team/cute-korean-barista-girl-pouring-coffee-prepare-filter-batch-brew-pour-working-cafe.jpg','2024-11-23 11:18:53','2024-11-23 11:18:53'),
	(3,'Edyta','Serveur','Accueillir les clients, prendre les commandes et assurer un service rapide et courtois.','images/team/small-business-owner-drinking-coffee.jpg','2024-11-23 11:20:05','2024-11-23 11:20:05'),
	(4,'Seren','Barista','Préparer et servir des cafés, thés et boissons spécialisées avec une présentation soignée.','images/team/smiley-business-woman-working-cashier.jpg','2024-11-23 11:20:49','2024-11-23 11:20:49');

/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de la table menu_page
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu_page`;

CREATE TABLE `menu_page` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned NOT NULL,
  `page_id` int unsigned NOT NULL,
  `section_id` int unsigned DEFAULT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `target` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `menu_page_menu_id_menus_id` (`menu_id`),
  KEY `menu_page_page_id_pages_id` (`page_id`),
  KEY `menu_page_section_id_sections_id` (`section_id`),
  CONSTRAINT `menu_page_menu_id_menus_id` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menu_page_page_id_pages_id` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menu_page_section_id_sections_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump de la table menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_location_unique` (`location`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;

INSERT INTO `menus` (`id`, `location`, `created_at`, `updated_at`)
VALUES
	(1,'header','2024-11-23 12:01:33','2024-11-23 12:01:33');

/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de la table messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;

INSERT INTO `messages` (`id`, `name`, `email`, `content`, `created_at`, `updated_at`)
VALUES
	(1,'Jean','Jeanroyen@gmail.com','Bonjour, c\'était pour savoir quand était ouvert le café.','2024-11-23 11:25:24','2024-11-23 11:25:24'),
	(2,'Pierre','Pierreduriz@gmail.com','Bonsoir, j\'aimerais organisé une reunion dans votre café, serait-il possible de m\'envoyer vos tarifs ?','2024-11-23 11:26:33','2024-11-23 11:26:33'),
	(3,'Laura','Lauratoire@gmail.com','J\'ai oublié mon sac, l\'auriez-vous retrouver','2024-11-23 11:27:41','2024-11-23 11:27:41');

/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de la table pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pages`;

CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `template` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;

INSERT INTO `pages` (`id`, `slug`, `template`, `created_at`, `updated_at`)
VALUES
	(1,'accueil','Accueil','2024-11-23 12:03:31','2024-11-23 12:03:31'),
	(2,'à-propos','À propos','2024-11-23 12:08:21','2024-11-23 12:08:21'),
	(3,'menu','Menu','2024-11-23 12:08:34','2024-11-23 12:08:34'),
	(4,'avis','Avis','2024-11-23 12:08:48','2024-11-23 12:08:48'),
	(5,'contact','Contact','2024-11-23 12:09:04','2024-11-23 12:09:04');

/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de la table product_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_categories`;

CREATE TABLE `product_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `order` int unsigned NOT NULL,
  `pre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_categories_parent_id_product_categories_id` (`parent_id`),
  CONSTRAINT `product_categories_parent_id_product_categories_id` FOREIGN KEY (`parent_id`) REFERENCES `product_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;

INSERT INTO `product_categories` (`id`, `parent_id`, `order`, `pre`, `title`, `created_at`, `updated_at`)
VALUES
	(1,NULL,0,'Menu delicieux','Déjeuner','2024-11-23 11:31:03','2024-11-23 11:31:03'),
	(2,NULL,1,'Menu favori','Boissons','2024-11-23 11:32:23','2024-11-23 11:32:23'),
	(3,1,0,'Commençons par quelques','Toasts','2024-11-29 09:11:54','2024-11-29 09:11:54'),
	(4,1,1,'Et pourquoi pas des','Oeufs','2024-11-29 09:12:14','2024-11-29 09:12:14'),
	(5,1,2,'Gourmandise !','Desserts','2024-11-29 09:12:36','2024-11-29 09:12:36'),
	(6,2,0,'Bien commencer la journée','Café','2024-11-29 09:13:25','2024-11-29 09:13:25'),
	(7,2,1,'Les incontournables','Thés & Tisanes','2024-11-29 09:14:07','2024-11-29 09:14:07'),
	(8,2,2,'Du chocolat!','Chocolats chauds','2024-11-29 09:14:29','2024-11-29 09:14:29');

/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de la table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_category_id` int unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` int NOT NULL,
  `discount` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_product_category_id_product_categories_id` (`product_category_id`),
  CONSTRAINT `products_product_category_id_product_categories_id` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `product_category_id`, `name`, `description`, `tag`, `price`, `discount`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,5,'Pancake nature','Un pancake est une crêpe épaisse et moelleuse.',NULL,1250,NULL,'2024-11-23 11:35:28','2024-11-23 11:35:28',NULL),
	(2,5,'Gaufre grillée','C\'est une gaufre croustillante à l\'extérieur, moelleuse à l\'intérieur,',NULL,1650,1200,'2024-11-23 11:37:26','2024-11-23 11:37:26',NULL),
	(3,5,'Gateau au chocolat','Dessert moelleux et riche.','Recommandé',1800,NULL,'2024-11-23 11:39:10','2024-11-23 11:39:10',NULL),
	(4,5,'Mousse au chocolat','Dessert léger et aérien',NULL,1700,1400,'2024-11-23 11:40:25','2024-11-23 11:40:25',NULL),
	(5,5,'Cake nature','Dessert moelleux',NULL,1400,NULL,'2024-11-23 11:41:09','2024-11-23 11:41:09',NULL),
	(6,6,'Latte','Café fraîchement préparé avec du lait vapeur.','Recommandé',1250,NULL,'2024-11-23 11:42:30','2024-11-23 11:42:30',NULL),
	(7,6,'Café blanc','Café infusé et lait vapeur.',NULL,590,NULL,'2024-11-23 11:44:08','2024-11-23 11:44:08',NULL),
	(8,8,'Chocolat chaud classique','Boisson crémeuse et réconfortante.',NULL,550,NULL,'2024-11-23 11:45:23','2024-11-23 11:45:23',NULL),
	(9,7,'Thé vert','Infusion légère et délicate.',NULL,750,NULL,'2024-11-23 11:46:18','2024-11-23 11:46:18',NULL),
	(10,8,'Cappuccino','Mélange d\'espresso, de lait chaud et de mousse de lait.',NULL,650,NULL,'2024-11-23 11:47:51','2024-11-23 11:47:51',NULL);

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de la table reviews
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reviews`;

CREATE TABLE `reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cover_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `avatar_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rating` int unsigned NOT NULL,
  `certified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;

INSERT INTO `reviews` (`id`, `customer`, `cover_img`, `avatar_img`, `content`, `rating`, `certified_at`, `created_at`, `updated_at`)
VALUES
	(1,'Sandra','https://img.freepik.com/photos-premium/tasse-cafe-table-fond-marron_192217-787.jpg','images/reviews/young-woman-with-round-glasses-yellow-sweater.jpg','\"Excellente boisson gourmande !\"\nSi vous aimez le chocolat et le café, vous allez adorer cette boisson. Le goût est riche, la texture est parfaite, et ça vous donne un bon boost.',40,NULL,'2024-11-23 11:50:29','2024-11-23 11:50:29'),
	(2,'Don','https://img.freepik.com/photos-premium/tasse-cafe-table-fond-marron_192217-787.jpg','images/reviews/senior-man-white-sweater-eyeglasses.jpg','\"Parfait pour les après-midis\"\nIdéal pour une pause-café, ce chococafé combine bien l\'amertume du café avec la douceur du chocolat, une véritable invitation à la relaxation.',45,'2024-11-23 11:50:29','2024-11-23 11:50:29','2024-11-23 11:50:29'),
	(3,'Olivia','https://img.freepik.com/photos-premium/tasse-cafe-table-fond-marron_192217-787.jpg','images/reviews/young-beautiful-woman-pink-warm-sweater-natural-look-smiling-portrait-isolated-long-hair.jpg','\"Trop léger pour un chococafé\"\nJe m\'attendais à quelque chose de plus corsé, mais le goût est un peu trop doux à mon goût. Ce n\'est pas assez caféiné pour moi.',30,NULL,'2024-11-23 11:50:29','2024-11-23 11:50:29');

/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;


# Dump de la table sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `page_id` int unsigned NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` json DEFAULT NULL,
  `order` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `sections_page_id_pages_id` (`page_id`),
  CONSTRAINT `sections_page_id_pages_id` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

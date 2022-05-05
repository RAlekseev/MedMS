-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: medms
-- ------------------------------------------------------
-- Server version	5.7.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_public` tinyint(4) NOT NULL DEFAULT '1',
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `icon_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_category_id_foreign` (`category_id`),
  KEY `categories_icon_id_foreign` (`icon_id`),
  CONSTRAINT `categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_icon_id_foreign` FOREIGN KEY (`icon_id`) REFERENCES `icons` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Исследования',1,NULL,19),(2,'Функциональные исследования',1,1,18),(3,'Эндоскопические исследования',1,1,22),(4,'Ультразвуковая диагностика',1,1,20),(5,'Исследование крови',1,1,26),(6,'Исследование мочи',1,1,21),(7,'Биохимиеские исследования',1,1,5),(8,'Исследование на ПЦР',1,1,6),(9,'Иммунологические исследования',1,1,NULL),(10,'Определение гормонов в сыворотке крови ИФА ',1,1,8),(11,'Диагностика гепатита',1,1,9),(12,'Цитологические Исследования ',1,1,10),(13,'Услуги',1,NULL,24),(14,'Лазерная терапия',1,13,25),(15,'Гинекология ',1,13,NULL),(16,'Урология',1,13,NULL),(17,'Физиотерапия ',1,13,11),(18,'Инъекции',1,13,26),(19,'Отоларингология ',1,13,13),(20,'Офтальмология',1,13,14),(21,'Стоматология',1,13,17),(22,'Хирургия ',1,13,16),(23,'Массаж',1,13,22),(24,'Диагностическая обследование на дому ',1,13,18),(25,'Медицинские осмотры с выездом на предприятия ',1,13,NULL),(26,'Медицинских  осмотры в клинике «Авиценна медикал:',1,13,NULL),(27,'Рентгенологические исследование',1,1,25),(28,'Стационарные услуги',1,18,NULL),(29,'Процедурные услуги',1,18,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configs`
--

DROP TABLE IF EXISTS `configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `configs_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configs`
--

LOCK TABLES `configs` WRITE;
/*!40000 ALTER TABLE `configs` DISABLE KEYS */;
INSERT INTO `configs` VALUES (1,'org_com_email','Почта для коммерческих предложений','avicenna@avicen.na','2022-04-24 15:05:34','2022-04-24 15:05:35'),(2,'org_address','Адрес организации','город Бишкек, ул. Исакеева 1/17','2022-04-24 15:05:34','2022-04-24 15:05:35'),(3,'org_email','Почта организации','avicenna@avicen.na','2022-04-24 15:05:34','2022-04-24 15:05:35'),(4,'org_name','Название организации','Авиценна-Медикал','2022-04-24 15:05:34','2022-04-24 15:05:35'),(5,'org_phone','Телефон организации','+996 (551) 911 900','2022-04-24 15:05:34','2022-04-24 15:05:35'),(6,'ambulance','Номер телефона скорой','1250','2022-04-28 12:28:40','2022-04-28 09:32:41'),(7,'second_org_phone','Второй Телефон организации','+996 (551) 911 911','2022-04-28 20:47:50','2022-04-28 20:47:50'),(8,'third_org_phone','Третий Телефон организации','+996 (551) 911 922','2022-04-28 20:47:50','2022-04-28 20:47:50'),(9,'facebook_link','Ссылка на Facebook аккаунт организации','https://facebook.com','2022-04-28 20:47:50','2022-04-28 20:47:50'),(10,'instagram_link','Ссылка на Instagram аккаунт организации','https://instagram.com','2022-04-28 20:47:50','2022-04-28 20:47:50'),(11,'telegram_link','Ссылка на Telegram аккаунт организации','https://telegram.org','2022-04-28 20:47:50','2022-04-28 20:47:50'),(12,'vk_link','Ссылка на VK аккаунт организации','https://vk.com','2022-04-28 20:47:50','2022-04-28 20:47:50'),(13,'whatsapp_link','Ссылка на WhatsApp аккаунт организации','https://www.whatsapp.com','2022-04-28 20:47:50','2022-04-28 20:47:50');
/*!40000 ALTER TABLE `configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_service`
--

DROP TABLE IF EXISTS `contract_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_service` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `contract_id` bigint(20) unsigned NOT NULL,
  `service_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contract_service_contract_id_foreign` (`contract_id`),
  KEY `contract_service_service_id_foreign` (`service_id`),
  CONSTRAINT `contract_service_contract_id_foreign` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `contract_service_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_service`
--

LOCK TABLES `contract_service` WRITE;
/*!40000 ALTER TABLE `contract_service` DISABLE KEYS */;
INSERT INTO `contract_service` VALUES (3,2,1,'2022-03-23 09:21:05','2022-03-23 09:21:05'),(4,2,4,'2022-03-23 09:21:05','2022-03-23 09:21:05'),(5,2,7,'2022-03-23 09:21:05','2022-03-23 09:21:05'),(6,3,2,'2022-03-23 11:23:00','2022-03-23 11:23:00'),(7,3,6,'2022-03-23 11:23:00','2022-03-23 11:23:00'),(8,3,8,'2022-03-23 11:23:00','2022-03-23 11:23:00'),(9,3,10,'2022-03-23 11:23:00','2022-03-23 11:23:00'),(10,4,2,'2022-03-23 19:32:36','2022-03-23 19:32:36'),(11,4,4,'2022-03-23 19:32:36','2022-03-23 19:32:36'),(12,4,64,'2022-03-23 19:32:36','2022-03-23 19:32:36'),(13,4,5,'2022-03-23 19:32:36','2022-03-23 19:32:36'),(14,4,7,'2022-03-23 19:32:36','2022-03-23 19:32:36'),(15,5,5,'2022-03-23 20:46:45','2022-03-23 20:46:45'),(16,6,2,'2022-03-23 20:56:02','2022-03-23 20:56:02'),(17,6,4,'2022-03-23 20:56:02','2022-03-23 20:56:02'),(18,6,6,'2022-03-23 20:56:02','2022-03-23 20:56:02'),(19,6,8,'2022-03-23 20:56:02','2022-03-23 20:56:02'),(20,7,2,'2022-03-24 09:34:29','2022-03-24 09:34:29'),(21,7,4,'2022-03-24 09:34:29','2022-03-24 09:34:29'),(22,8,2,'2022-03-24 09:40:08','2022-03-24 09:40:08'),(23,8,5,'2022-03-24 09:40:08','2022-03-24 09:40:08'),(24,8,7,'2022-03-24 09:40:08','2022-03-24 09:40:08');
/*!40000 ALTER TABLE `contract_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracts`
--

DROP TABLE IF EXISTS `contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contracts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contracts_patient_id_foreign` (`patient_id`),
  CONSTRAINT `contracts_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracts`
--

LOCK TABLES `contracts` WRITE;
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
INSERT INTO `contracts` VALUES (2,2,'2022-03-23 09:21:05','2022-03-23 09:21:05'),(3,2,'2022-03-23 11:23:00','2022-03-23 11:23:00'),(4,2,'2022-03-23 19:32:36','2022-03-23 19:32:36'),(5,2,'2022-03-23 20:46:45','2022-03-23 20:46:45'),(6,2,'2022-03-23 20:56:02','2022-03-23 20:56:02'),(7,6,'2022-03-24 09:34:29','2022-03-24 09:34:29'),(8,5,'2022-03-24 09:40:08','2022-03-24 09:40:08');
/*!40000 ALTER TABLE `contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doc_templates`
--

DROP TABLE IF EXISTS `doc_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doc_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `html` longtext COLLATE utf8mb4_unicode_ci,
  `table` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doc_templates`
--

LOCK TABLES `doc_templates` WRITE;
/*!40000 ALTER TABLE `doc_templates` DISABLE KEYS */;
INSERT INTO `doc_templates` VALUES (1,'Согласие на обработку данных','<p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: 15.6933px; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><a name=\"_Toc1037262\"></a><a name=\"_Toc1122082\"><span style=\"font-size: 12pt; line-height: 17.12px; font-family: &quot;Times New Roman&quot;, serif;\">МИНИСТЕРСТВО ОБРАЗОВАНИЯ И НАУКИ РОССИЙСКОЙ ФЕДЕРАЦИИ<o:p></o:p></span></a></p><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: 15.6933px; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 6pt; line-height: 8.56px; font-family: &quot;Times New Roman&quot;, serif; text-transform: uppercase;\">ФЕДЕРАЛЬНОЕ ГОСУДАРСТВЕННОЕ АВТОНОМНОЕ ОБРАЗОВАТЕЛЬНОЕ УЧРЕЖДЕНИЕ ВЫСШЕГО ОБРАЗОВАНИЯ</span><span style=\"font-family: &quot;Times New Roman&quot;, serif;\"><o:p></o:p></span></p><div style=\"font-size: medium; border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1.5pt solid windowtext; padding: 0cm 0cm 1pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: 15.6933px; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center; border: none; padding: 0cm;\"><b><span style=\"font-family: &quot;Times New Roman&quot;, serif;\">Национальный исследовательский ядерный университет «МИФИ»</span></b><b><span style=\"font-size: 12pt; line-height: 17.12px; font-family: &quot;Times New Roman&quot;, serif;\"><o:p></o:p></span></b></p></div><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><table class=\"MsoTableGrid\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border: none;\"><tbody><tr style=\"height: 27.55pt;\"><td width=\"648\" colspan=\"2\" style=\"width: 485.65pt; padding: 0cm 5.4pt; height: 27.55pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td></tr><tr style=\"height: 42.8pt;\"><td width=\"177\" rowspan=\"2\" valign=\"top\" style=\"width: 133pt; padding: 0cm 5.4pt; height: 42.8pt;\"><p class=\"MsoNormal\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif;\"><br></p></td><td width=\"470\" valign=\"top\" style=\"width: 352.65pt; padding: 0cm 5.4pt; height: 42.8pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><b><span style=\"font-size: 15pt; font-family: &quot;Times New Roman&quot;, serif;\">Институт<br>интеллектуальных кибернетических систем<o:p></o:p></span></b></p></td></tr><tr style=\"height: 34.95pt;\"><td width=\"470\" valign=\"top\" style=\"width: 352.65pt; padding: 0cm 5.4pt; height: 34.95pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><b><span style=\"font-size: 15pt; font-family: &quot;Times New Roman&quot;, serif;\">Кафедра №22 «Кибернетика»<o:p></o:p></span></b></p></td></tr><tr style=\"height: 29.6pt;\"><td width=\"648\" colspan=\"2\" style=\"width: 485.65pt; padding: 0cm 5.4pt; height: 29.6pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-family: &quot;Times New Roman&quot;, serif;\">Направление подготовки 09.04.04 Программная инженерия<o:p></o:p></span></p></td></tr><tr style=\"height: 35pt;\"><td width=\"648\" colspan=\"2\" style=\"width: 485.65pt; padding: 0cm 5.4pt; height: 35pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><b><span style=\"font-size: 20pt; font-family: &quot;Times New Roman&quot;, serif;\">Пояснительная записка</span></b><span style=\"font-family: &quot;Times New Roman&quot;, serif;\"><o:p></o:p></span></p></td></tr><tr><td width=\"648\" colspan=\"2\" valign=\"top\" style=\"width: 485.65pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-family: &quot;Times New Roman&quot;, serif;\">к научно-исследовательской работе на тему:</span><b><span style=\"font-size: 20pt; font-family: &quot;Times New Roman&quot;, serif;\"><o:p></o:p></span></b></p></td></tr></tbody></table><p class=\"MsoNormal\" style=\"margin: 0cm; line-height: 15.6933px; font-size: 11pt; font-family: Calibri, sans-serif;\"><u><span style=\"font-size: 16pt; line-height: 22.8267px; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></u></p><div style=\"font-size: medium; border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1.5pt double windowtext; padding: 0cm 0cm 1pt; margin-left: -7.1pt; margin-right: 0cm;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm 0cm 8pt; line-height: 15.6933px; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center; border: none; padding: 0cm;\">Модуль автоматической генерации расписания автоматизированной образовательной системы LMS.<u><span style=\"font-size: 16pt; line-height: 22.8267px; font-family: &quot;Times New Roman&quot;, serif;\"><o:p></o:p></span></u></p></div><p class=\"MsoNormal\" style=\"margin: 0cm; line-height: 15.6933px; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><span style=\"font-size: medium;\"></span><table class=\"MsoTableGrid\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"border: none;\"><tbody><tr><td width=\"216\" colspan=\"2\" valign=\"top\" style=\"width: 161.85pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">Группа<o:p></o:p></span></p></td><td width=\"216\" colspan=\"4\" valign=\"top\" style=\"width: 161.9pt; border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt solid windowtext; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-family: &quot;Times New Roman&quot;, serif;\">Б18-514<o:p></o:p></span></p></td><td width=\"216\" colspan=\"4\" valign=\"top\" style=\"width: 161.9pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td></tr><tr><td width=\"216\" colspan=\"2\" valign=\"bottom\" style=\"width: 161.85pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p><p class=\"MsoNormal\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">Студент<o:p></o:p></span></p></td><td width=\"216\" colspan=\"4\" valign=\"top\" style=\"width: 161.9pt; border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt solid windowtext; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"16\" valign=\"top\" style=\"width: 11.8pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"200\" colspan=\"3\" valign=\"top\" style=\"width: 150.1pt; border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt solid windowtext; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 12pt;\">Алексеев Роман Максимович</span><span style=\"font-family: &quot;Times New Roman&quot;, serif;\"><o:p></o:p></span></p></td></tr><tr><td width=\"216\" colspan=\"2\" valign=\"bottom\" style=\"width: 161.85pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"216\" colspan=\"4\" valign=\"top\" style=\"width: 161.9pt; border: none; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">(подпись)</span><span style=\"font-family: &quot;Times New Roman&quot;, serif;\"><o:p></o:p></span></p></td><td width=\"216\" colspan=\"4\" valign=\"top\" style=\"width: 161.9pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">(ФИО)</span><span style=\"font-family: &quot;Times New Roman&quot;, serif;\"><o:p></o:p></span></p></td></tr><tr><td width=\"216\" colspan=\"2\" valign=\"bottom\" style=\"width: 161.85pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">Руководитель<o:p></o:p></span></p></td><td width=\"216\" colspan=\"4\" valign=\"top\" style=\"width: 161.9pt; border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt solid windowtext; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"16\" valign=\"top\" style=\"width: 11.8pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"200\" colspan=\"3\" valign=\"top\" style=\"width: 150.1pt; border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt solid windowtext; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 12pt;\">Тихомирова Дарья Валерьевна</span><span style=\"font-family: &quot;Times New Roman&quot;, serif;\"><o:p></o:p></span></p></td></tr><tr><td width=\"216\" colspan=\"2\" valign=\"bottom\" style=\"width: 161.85pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"216\" colspan=\"4\" valign=\"top\" style=\"width: 161.9pt; border: none; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">(подпись)</span><span style=\"font-family: &quot;Times New Roman&quot;, serif;\"><o:p></o:p></span></p></td><td width=\"216\" colspan=\"4\" valign=\"top\" style=\"width: 161.9pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">(ФИО)</span><span style=\"font-family: &quot;Times New Roman&quot;, serif;\"><o:p></o:p></span></p></td></tr><tr><td width=\"216\" colspan=\"2\" valign=\"bottom\" style=\"width: 161.85pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">Научный консультант<o:p></o:p></span></p></td><td width=\"216\" colspan=\"4\" valign=\"top\" style=\"width: 161.9pt; border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt solid windowtext; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"16\" valign=\"top\" style=\"width: 11.8pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"200\" colspan=\"3\" valign=\"top\" style=\"width: 150.1pt; border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt solid windowtext; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td></tr><tr><td width=\"216\" colspan=\"2\" valign=\"bottom\" style=\"width: 161.85pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"216\" colspan=\"4\" valign=\"top\" style=\"width: 161.9pt; border: none; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">(подпись)<o:p></o:p></span></p></td><td width=\"216\" colspan=\"4\" valign=\"top\" style=\"width: 161.9pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">(ФИО)<o:p></o:p></span></p></td></tr><tr><td width=\"162\" valign=\"bottom\" style=\"width: 121.4pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">Оценка руководителя<o:p></o:p></span></p></td><td width=\"162\" colspan=\"2\" valign=\"bottom\" style=\"width: 121.4pt; border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt solid windowtext; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"162\" colspan=\"5\" valign=\"bottom\" style=\"width: 121.4pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">Оценка консультанта<o:p></o:p></span></p></td><td width=\"162\" colspan=\"2\" valign=\"bottom\" style=\"width: 121.45pt; border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt solid windowtext; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td></tr><tr><td width=\"162\" valign=\"bottom\" style=\"width: 121.4pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"162\" colspan=\"2\" valign=\"bottom\" style=\"width: 121.4pt; border: none; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">(0-15 баллов)</span><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\"><o:p></o:p></span></p></td><td width=\"162\" colspan=\"5\" valign=\"bottom\" style=\"width: 121.4pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"162\" colspan=\"2\" valign=\"bottom\" style=\"width: 121.45pt; border: none; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">(0-15 баллов)</span><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\"><o:p></o:p></span></p></td></tr><tr><td width=\"162\" valign=\"bottom\" style=\"width: 121.4pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"162\" colspan=\"2\" valign=\"bottom\" style=\"width: 121.4pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"162\" colspan=\"5\" valign=\"bottom\" style=\"width: 121.4pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"162\" colspan=\"2\" valign=\"bottom\" style=\"width: 121.45pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td></tr><tr><td width=\"162\" valign=\"bottom\" style=\"width: 121.4pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">Итоговая оценка<o:p></o:p></span></p></td><td width=\"162\" colspan=\"2\" valign=\"bottom\" style=\"width: 121.4pt; border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt solid windowtext; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"162\" colspan=\"5\" valign=\"bottom\" style=\"width: 121.4pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span lang=\"EN-US\" style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">ECTS<o:p></o:p></span></p></td><td width=\"162\" colspan=\"2\" valign=\"bottom\" style=\"width: 121.45pt; border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt solid windowtext; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td></tr><tr><td width=\"162\" valign=\"bottom\" style=\"width: 121.4pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"162\" colspan=\"2\" valign=\"bottom\" style=\"width: 121.4pt; border: none; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">(0-1</span><span lang=\"EN-US\" style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">00</span><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\"> баллов)</span><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\"><o:p></o:p></span></p></td><td width=\"162\" colspan=\"5\" valign=\"bottom\" style=\"width: 121.4pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"162\" colspan=\"2\" valign=\"bottom\" style=\"width: 121.45pt; border: none; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td></tr><tr><td width=\"648\" colspan=\"10\" valign=\"bottom\" style=\"width: 485.65pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span lang=\"EN-US\" style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span lang=\"EN-US\" style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">Комиссия<o:p></o:p></span></p></td></tr><tr><td width=\"162\" valign=\"bottom\" style=\"width: 121.4pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">Председатель<o:p></o:p></span></p></td><td width=\"186\" colspan=\"3\" valign=\"bottom\" style=\"width: 139.15pt; border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt solid windowtext; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 18pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"19\" valign=\"bottom\" style=\"width: 14.2pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 18pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"200\" colspan=\"4\" valign=\"bottom\" style=\"width: 150.15pt; border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt solid windowtext; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 18pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"81\" valign=\"bottom\" style=\"width: 60.75pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td></tr><tr><td width=\"162\" valign=\"bottom\" style=\"width: 121.4pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"186\" colspan=\"3\" valign=\"bottom\" style=\"width: 139.15pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">(подпись)<o:p></o:p></span></p></td><td width=\"19\" valign=\"bottom\" style=\"width: 14.2pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"200\" colspan=\"4\" valign=\"bottom\" style=\"width: 150.15pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">(ФИО)<o:p></o:p></span></p></td><td width=\"81\" valign=\"bottom\" style=\"width: 60.75pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td></tr><tr><td width=\"162\" valign=\"top\" style=\"width: 121.4pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"186\" colspan=\"3\" valign=\"top\" style=\"width: 139.15pt; border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt solid windowtext; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 18pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"19\" valign=\"top\" style=\"width: 14.2pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 18pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"200\" colspan=\"4\" valign=\"top\" style=\"width: 150.15pt; border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt solid windowtext; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 18pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"81\" valign=\"top\" style=\"width: 60.75pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td></tr><tr><td width=\"162\" valign=\"top\" style=\"width: 121.4pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"186\" colspan=\"3\" valign=\"top\" style=\"width: 139.15pt; border: none; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">(подпись)<o:p></o:p></span></p></td><td width=\"19\" valign=\"top\" style=\"width: 14.2pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"200\" colspan=\"4\" valign=\"top\" style=\"width: 150.15pt; border: none; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">(ФИО)<o:p></o:p></span></p></td><td width=\"81\" valign=\"top\" style=\"width: 60.75pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td></tr><tr><td width=\"162\" valign=\"top\" style=\"width: 121.4pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"186\" colspan=\"3\" valign=\"top\" style=\"width: 139.15pt; border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt solid windowtext; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 18pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"19\" valign=\"top\" style=\"width: 14.2pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 18pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"200\" colspan=\"4\" valign=\"top\" style=\"width: 150.15pt; border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt solid windowtext; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 18pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"81\" valign=\"top\" style=\"width: 60.75pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td></tr><tr><td width=\"162\" valign=\"top\" style=\"width: 121.4pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"186\" colspan=\"3\" valign=\"top\" style=\"width: 139.15pt; border: none; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">(подпись)<o:p></o:p></span></p></td><td width=\"19\" valign=\"top\" style=\"width: 14.2pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"200\" colspan=\"4\" valign=\"top\" style=\"width: 150.15pt; border: none; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">(ФИО)<o:p></o:p></span></p></td><td width=\"81\" valign=\"top\" style=\"width: 60.75pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td></tr><tr><td width=\"162\" valign=\"top\" style=\"width: 121.4pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"186\" colspan=\"3\" valign=\"top\" style=\"width: 139.15pt; border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt solid windowtext; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 18pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"19\" valign=\"top\" style=\"width: 14.2pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 18pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"200\" colspan=\"4\" valign=\"top\" style=\"width: 150.15pt; border-top: none; border-right: none; border-left: none; border-image: initial; border-bottom: 1pt solid windowtext; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 18pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"81\" valign=\"top\" style=\"width: 60.75pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 13pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td></tr><tr><td width=\"162\" valign=\"top\" style=\"width: 121.4pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"186\" colspan=\"3\" valign=\"top\" style=\"width: 139.15pt; border: none; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">(подпись)<o:p></o:p></span></p></td><td width=\"19\" valign=\"top\" style=\"width: 14.2pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td><td width=\"200\" colspan=\"4\" valign=\"top\" style=\"width: 150.15pt; border: none; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">(ФИО)<o:p></o:p></span></p></td><td width=\"81\" valign=\"top\" style=\"width: 60.75pt; padding: 0cm 5.4pt;\"><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><span style=\"font-size: 9pt; font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></p></td></tr><tr height=\"0\"><td width=\"162\" style=\"border: none;\"></td><td width=\"54\" style=\"border: none;\"></td><td width=\"108\" style=\"border: none;\"></td><td width=\"24\" style=\"border: none;\"></td><td width=\"19\" style=\"border: none;\"></td><td width=\"65\" style=\"border: none;\"></td><td width=\"16\" style=\"border: none;\"></td><td width=\"38\" style=\"border: none;\"></td><td width=\"81\" style=\"border: none;\"></td><td width=\"81\" style=\"border: none;\"></td></tr></tbody></table><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: 15.6933px; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><b><span style=\"font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></b></p><p class=\"MsoNormal\" style=\"margin: 0cm; line-height: 15.6933px; font-size: 11pt; font-family: Calibri, sans-serif;\"><b><span lang=\"EN-US\" style=\"font-family: &quot;Times New Roman&quot;, serif;\">&nbsp;</span></b></p><p class=\"MsoNormal\" align=\"center\" style=\"margin: 0cm; line-height: 15.6933px; font-size: 11pt; font-family: Calibri, sans-serif; text-align: center;\"><b><span style=\"font-family: &quot;Times New Roman&quot;, serif;\">Москва 2021<o:p></o:p></span></b></p><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 8pt; line-height: 22px; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12pt; line-height: 24px;\">Студенты всегда должны знать где у кого и когда у них проходит занятие, а преподаватели должны знать где, у кого и когда они проводят занятия. На блок расписание накладывается ряд требований сформулированных из [1],[2],[3] и ученного совета ММУ(Международного медицинского университета) и ЕММУ(Евразийского международного медицинского университета):<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 8pt; line-height: 22px; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12pt; line-height: 24px;\">1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Реализовать создание, редактирование и хранение учебных планов в системе&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>(1.1, 2.1).</b><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 8pt; line-height: 22px; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12pt; line-height: 24px;\">2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Реализовать алгоритм генерации расписания обеспечивающего проведение занятий согласно учебному плану <b>(3.2).</b><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 8pt; line-height: 22px; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12pt; line-height: 24px;\">3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Расписание должно генерироваться без накладок. <b>(3.3.1, 1.4, 2.3)</b><br>Данное требование означает то, что во всей сетке расписания должны отсутствовать пересечения, т.е. преподаватель не может вести больше 1го занятия одновременно, ровно как и студенческая группа не может присутствовать более чем на 1 занятии одновременно.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 8pt; line-height: 22px; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12pt; line-height: 24px;\">4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; У студента должно быть не больше 5 занятий (10 академ. часов) в день <b>(1.4, 2.3)</b><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 8pt; line-height: 22px; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12pt; line-height: 24px;\">5.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Необходимо реализовать инструменты мониторинга и исправления накладок. <b>(3.3.1)</b><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 8pt; line-height: 22px; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12pt; line-height: 24px;\">6.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Необходимо реализовать инструмент мониторинга нагрузки преподавателей. <b>(3.3.2)</b><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 8pt; line-height: 22px; font-size: 11pt; font-family: Calibri, sans-serif;\"><span style=\"font-size: 12pt; line-height: 24px;\">7.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Обеспечить возможность экспорта расписания для его дальнейшей печати. <b>(3.4)</b><o:p></o:p></span></p><span style=\"font-size: 11pt; line-height: 15.6933px; font-family: Calibri, sans-serif;\"><br clear=\"all\" style=\"break-before: page;\"></span><span style=\"font-size: medium;\"></span><p class=\"MsoNormal\" style=\"margin: 0cm 0cm 8pt; line-height: 15.6933px; font-size: 11pt; font-family: Calibri, sans-serif;\"><o:p>&nbsp;</o:p></p>','App\\Modules\\Contracts\\Models\\Contract','2022-04-24 22:35:19','2022-04-24 22:38:29'),(2,'Договор об оказании платных мед услуг',NULL,'App\\Modules\\Contracts\\Models\\Contract','2022-04-24 22:41:18','2022-04-24 22:41:18');
/*!40000 ALTER TABLE `doc_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docs`
--

DROP TABLE IF EXISTS `docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `doc_template_id` bigint(20) unsigned NOT NULL,
  `owner_id` bigint(20) unsigned NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `docs_doc_template_id_foreign` (`doc_template_id`),
  CONSTRAINT `docs_doc_template_id_foreign` FOREIGN KEY (`doc_template_id`) REFERENCES `doc_templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docs`
--

LOCK TABLES `docs` WRITE;
/*!40000 ALTER TABLE `docs` DISABLE KEYS */;
/*!40000 ALTER TABLE `docs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icon_types`
--

DROP TABLE IF EXISTS `icon_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icon_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_list` json DEFAULT NULL,
  `template` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icon_types`
--

LOCK TABLES `icon_types` WRITE;
/*!40000 ALTER TABLE `icon_types` DISABLE KEYS */;
INSERT INTO `icon_types` VALUES (1,'Font Awesome 5','https://fontawesome.com','[\"address-book\", \"address-card\", \"angry\", \"arrow-alt-circle-down\", \"arrow-alt-circle-left\", \"arrow-alt-circle-right\", \"arrow-alt-circle-up\", \"bell\", \"bell-slash\", \"bookmark\", \"building\", \"calendar\", \"calendar-alt\", \"calendar-check\", \"calendar-minus\", \"calendar-plus\", \"calendar-times\", \"caret-square-down\", \"caret-square-left\", \"caret-square-right\", \"caret-square-up\", \"chart-bar\", \"check-circle\", \"check-square\", \"circle\", \"clipboard\", \"clock\", \"clone\", \"closed-captioning\", \"comment\", \"comment-alt\", \"comment-dots\", \"comments\", \"compass\", \"copy\", \"copyright\", \"credit-card\", \"dizzy\", \"dot-circle\", \"edit\", \"envelope\", \"envelope-open\", \"eye\", \"eye-slash\", \"file\", \"file-alt\", \"file-archive\", \"file-audio\", \"file-code\", \"file-excel\", \"file-image\", \"file-pdf\", \"file-powerpoint\", \"file-video\", \"file-word\", \"flag\", \"flushed\", \"folder\", \"folder-open\", \"font-awesome-logo-full\", \"frown\", \"frown-open\", \"futbol\", \"gem\", \"grimace\", \"grin\", \"grin-alt\", \"grin-beam\", \"grin-beam-sweat\", \"grin-hearts\", \"grin-squint\", \"grin-squint-tears\", \"grin-stars\", \"grin-tears\", \"grin-tongue\", \"grin-tongue-squint\", \"grin-tongue-wink\", \"grin-wink\", \"hand-lizard\", \"hand-paper\", \"hand-peace\", \"hand-point-down\", \"hand-point-left\", \"hand-point-right\", \"hand-point-up\", \"hand-pointer\", \"hand-rock\", \"hand-scissors\", \"hand-spock\", \"handshake\", \"hdd\", \"heart\", \"hospital\", \"hourglass\", \"id-badge\", \"id-card\", \"image\", \"images\", \"keyboard\", \"kiss\", \"kiss-beam\", \"kiss-wink-heart\", \"laugh\", \"laugh-beam\", \"laugh-squint\", \"laugh-wink\", \"lemon\", \"life-ring\", \"lightbulb\", \"list-alt\", \"map\", \"meh\", \"meh-blank\", \"meh-rolling-eyes\", \"minus-square\", \"money-bill-alt\", \"moon\", \"newspaper\", \"object-group\", \"object-ungroup\", \"paper-plane\", \"pause-circle\", \"play-circle\", \"plus-square\", \"question-circle\", \"registered\", \"sad-cry\", \"sad-tear\", \"save\", \"share-square\", \"smile\", \"smile-beam\", \"smile-wink\", \"snowflake\", \"square\", \"star\", \"star-half\", \"sticky-note\", \"stop-circle\", \"sun\", \"surprise\", \"thumbs-down\", \"thumbs-up\", \"times-circle\", \"tired\", \"trash-alt\", \"user\", \"user-circle\", \"window-close\", \"window-maximize\", \"window-minimize\", \"window-restore\"]','<i class=\"icon fa fa-$source\"/>\r'),(2,'Material Icons','https://fonts.google.com/icons?selected=Material+Icons','[\"home\", \"search\", \"settings\", \"done\"]','<span class=\"icon material-icons\">$source</span>\r'),(3,'Custom','Your personal custom icons',NULL,'<img class=\"icon\" src=\"storage/icons/$source\">');
/*!40000 ALTER TABLE `icon_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icons`
--

DROP TABLE IF EXISTS `icons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `icon_type_id` bigint(20) unsigned NOT NULL,
  `source` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `icons_icon_type_id_foreign` (`icon_type_id`),
  CONSTRAINT `icons_icon_type_id_foreign` FOREIGN KEY (`icon_type_id`) REFERENCES `icon_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icons`
--

LOCK TABLES `icons` WRITE;
/*!40000 ALTER TABLE `icons` DISABLE KEYS */;
INSERT INTO `icons` VALUES (1,1,'address-book'),(2,1,'angry'),(3,1,'calendar'),(4,2,'search'),(5,2,'home'),(6,3,'aviato.svg'),(8,3,'3333.svg'),(9,3,'user.svg'),(10,3,'viruses.svg'),(11,3,'castom_bar.png'),(12,3,'smile.png'),(13,3,'electron.svg'),(14,3,'IMU.png'),(15,3,'bootstrap.png'),(16,3,'Скальпель.svg'),(17,3,'Зуб.svg'),(18,3,'Кардиограмма.svg'),(19,3,'Поиск.svg'),(20,3,'УЗИ.svg'),(21,3,'Колбы.svg'),(22,1,'address-card'),(23,2,'settings'),(24,3,'Планшет.svg'),(25,3,'Лазер.svg'),(26,3,'Шприц.svg'),(27,1,'file');
/*!40000 ALTER TABLE `icons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (39,'2014_10_12_000000_create_users_table',1),(40,'2014_10_12_100000_create_password_resets_table',1),(41,'2019_08_19_000000_create_failed_jobs_table',1),(42,'2019_12_14_000001_create_personal_access_tokens_table',1),(43,'2022_02_13_142722_create_roles_table',1),(44,'2022_02_13_142728_create_permissions_table',1),(45,'2022_02_13_142734_create_role_user_table',1),(46,'2022_02_13_142739_create_role_permission_table',1),(53,'2022_03_20_142848_create_categories_table',2),(54,'2022_03_20_142916_create_services_table',2),(55,'2022_03_20_142944_create_service_service_table',2),(56,'2022_03_22_112139_create_contracts_table',3),(57,'2022_03_23_082836_create_contract_service_table',3),(58,'2022_04_12_102615_create_configs_table',3),(59,'2022_04_18_082928_create_working_hours_table',3),(60,'2022_04_24_163151_create_doc_templates_table',3),(61,'2022_04_24_163232_create_docs_table',3),(66,'2022_05_02_214448_create_icon_types_table',4),(67,'2022_05_02_214453_create_icons_table',4),(68,'2022_05_04_021052_connect_categories_icons',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'Права доступа','permissions-index',NULL),(2,'Просмотр ролей','roles-index',NULL),(3,'Редактирование роли','roles-update',NULL),(4,'Просмотр роли','roles-show',NULL),(5,'Создание роли','roles-create',NULL),(6,'Удаление роли','roles-delete',NULL),(7,'Просмотр пользователей','users-index',NULL),(8,'Проосмотр пользователя','users-show',NULL),(9,'Создание пользователя','users-create',NULL),(10,'Редактирование пользователя','users-update',NULL),(11,'Уудаление пользователя','users-delete',NULL),(12,'Просмотр всех услуг','services-index',NULL),(13,'Просмотр услуги','services-show',NULL),(14,'Создание услуги','services-create',NULL),(15,'Редактирование услуги','services-update',NULL),(16,'Удаление услуги','services-delete',NULL),(17,'Проосмотр оформленных услуг','contracts-index',NULL),(18,'Оформление услуг','contracts-create',NULL),(19,'Сотрудник','employee',NULL),(20,'Просмотр расписания','schedules-index',NULL),(21,'Редактирование расписания','schedules-update',NULL),(22,'Просмотр заказа','contracts-show',NULL),(23,'Просмотр шаблонов документов','doc-templates-index',NULL),(24,'Сооздание шаблона документов','doc-templates-create',NULL),(25,'Редактирование шаблона документа','doc-templates-update',NULL),(26,'Удаление шаблона документа','doc-templates-delete',NULL),(27,'Просмотр шаблона документа','doc-templates-show',NULL),(28,'Просмотр параметров системы','settings-index',NULL),(29,'Редактирование параметров системы','settings-update',NULL),(30,'Просмотр всех категорий услуг','categories-index',NULL),(31,'Просмотр выбранной категории услуги','categories-show',NULL),(32,'Создание категории услуг','categories-create',NULL),(33,'Реадктирование категории услуг','categories-update',NULL),(34,'Удаление категории услуг','categories-delete',NULL),(35,'Просмотр икоонок системы','icons-index',NULL),(36,'Добавление иконок системы','icons-create',NULL),(37,'Редактирование иконок системы','icons-update',NULL),(38,'Удаление иконок системы','icons-delete',NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (5,'App\\Models\\User',6,'api','350eb47d27c72cdd5bfaa064023c11a969752d1d9092c62469ca4ef02952659c','[\"*\"]',NULL,'2022-03-20 23:44:47','2022-03-20 23:44:47'),(14,'App\\Models\\User',2,'api','91450af773e1045cf2c5b5a9df57017aad81b929077ff440cdb4dfa67cbb5f81','[\"*\"]',NULL,'2022-05-04 04:01:38','2022-05-04 04:01:38');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permission` (
  `role_id` bigint(20) unsigned NOT NULL,
  `permission_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `role_permission_permission_id_foreign` (`permission_id`),
  CONSTRAINT `role_permission_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_permission_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,33),(1,35),(1,36),(1,37),(1,38);
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_user`
--

DROP TABLE IF EXISTS `role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_user` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_user`
--

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` VALUES (1,1),(2,1),(2,2),(5,3);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'SuperAdmin','super-admin',NULL,NULL),(2,'Administrator','administrator',NULL,NULL),(3,'Registry','registry',NULL,NULL),(4,'Doctor','doctor',NULL,NULL),(5,'Patient','patient',NULL,NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_service`
--

DROP TABLE IF EXISTS `service_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_service` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL,
  `child_id` bigint(20) unsigned NOT NULL,
  `is_stacks` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `service_service_parent_id_foreign` (`parent_id`),
  KEY `service_service_child_id_foreign` (`child_id`),
  CONSTRAINT `service_service_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `services` (`id`) ON DELETE CASCADE,
  CONSTRAINT `service_service_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `services` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_service`
--

LOCK TABLES `service_service` WRITE;
/*!40000 ALTER TABLE `service_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_category_id_foreign` (`category_id`),
  CONSTRAINT `services_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Электрокардиография (ЭКГ)',350,'Электрокардиография (ЭКГ)',2,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(2,'Эзофагогастродуоденоскопия',700,'Эзофагогастродуоденоскопия',3,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(3,'Взятие материала на биопсию',250,'Взятие материала на биопсию',3,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(4,'Комплексно (печень +желчного пузырь+поджелудочная железа+селезенка)',500,'Комплексно (печень +желчного пузырь+поджелудочная железа+селезенка)',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(5,'УЗИ Почек',300,'УЗИ Почек',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(6,'УЗИ Почек + Мочевого пузыря',400,'УЗИ Почек + Мочевого пузыря',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(7,'УЗИ Надпочечников',300,'УЗИ Надпочечников',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(8,'УЗИ Предстательной железы + мочевого пузыря',450,'УЗИ Предстательной железы + мочевого пузыря',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(9,'УЗИ Мочевого пузыря с определением остаточной мочи',400,'УЗИ Мочевого пузыря с определением остаточной мочи',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(10,'УЗИ При беременности',450,'УЗИ При беременности',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(11,'УЗИ При гинекологических заболеваниях + мочевого пузыря',500,'УЗИ При гинекологических заболеваниях + мочевого пузыря',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(12,'УЗИ Органов малого таза вагинальным датчиком',400,'УЗИ Органов малого таза вагинальным датчиком',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(13,'УЗИ Забрюшинных лимфоузлов',450,'УЗИ Забрюшинных лимфоузлов',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(14,'УЗИ Периферических лимфоузлов',450,'УЗИ Периферических лимфоузлов',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(15,'Слюнных желез',350,'Слюнных желез',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(16,'УЗИ Определение функции желчного пузыря',700,'УЗИ Определение функции желчного пузыря',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(17,'УЗИ Мягких тканей',300,'УЗИ Мягких тканей',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(18,'УЗИ Щитовидной железы',300,'УЗИ Щитовидной железы',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(19,'УЗИ Плевральной полости',300,'УЗИ Плевральной полости',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(20,'Беременность I триместр до 12 недель',500,'Беременность I триместр до 12 недель',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(21,'Беременность II-III  ТРИМЕСТР',500,'Беременность II-III  ТРИМЕСТР',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(22,'Первое скрининговое иссл (11-12 нед)',650,'Первое скрининговое иссл (11-12 нед)',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(23,'Второе скрининговое иссл (18-22 нед)',650,'Второе скрининговое иссл (18-22 нед)',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(24,'Фолликулометрия',250,'Фолликулометрия',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(25,'Ультразвуковая допплерография маточно-плацетарного и плодового кровотока',550,'Ультразвуковая допплерография маточно-плацетарного и плодового кровотока',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(26,'Ультразвуковая допплерография мужских половых органов',550,'Ультразвуковая допплерография мужских половых органов',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(27,'Органов мошонки (яички + придатки + семенной канатик)',550,'Органов мошонки (яички + придатки + семенной канатик)',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(28,'Полового члена (пещеристых тел)',550,'Полового члена (пещеристых тел)',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(29,'Ультразвуковая допплерография головного мозга у детей',550,'Ультразвуковая допплерография головного мозга у детей',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(30,'Ультразвуковая допплерография щитовидной железы',550,'Ультразвуковая допплерография щитовидной железы',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(31,'Ультразвуковая допплерография молочной железы',550,'Ультразвуковая допплерография молочной железы',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(32,'Ультразвуковая допплерография почек',550,'Ультразвуковая допплерография почек',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(33,'Ультразвуковая допплерография печени и желчного пузыря',550,'Ультразвуковая допплерография печени и желчного пузыря',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(34,'Ультразвуковая допплерография поджелудочной железы',550,'Ультразвуковая допплерография поджелудочной железы',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(35,'Ультразвуковая допплерография селезенки',550,'Ультразвуковая допплерография селезенки',4,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(36,'Общий анализ крови',250,'Общий анализ крови',5,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(37,'Анализ крови на тромбоциты',200,'Анализ крови на тромбоциты',5,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(38,'Анализ крови на LE-клетки',400,'Анализ крови на LE-клетки',5,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(39,'Анализ крови на базофильную зернистость',250,'Анализ крови на базофильную зернистость',5,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(40,'Анализ крови на ретикулоциты',200,'Анализ крови на ретикулоциты',5,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(41,'Функции тромбоцитов (агрегация и одгезия)',300,'Функции тромбоцитов (агрегация и одгезия)',5,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(42,'Исследование крови на наличие паразитов (малярия)',250,'Исследование крови на наличие паразитов (малярия)',5,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(43,'Исследование крови на протромбированный (комплекс)',350,'Исследование крови на протромбированный (комплекс)',5,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(44,'Исследование крови на свертываемость',200,'Исследование крови на свертываемость',5,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(45,'Исследование времени кровотечения по Дюке',200,'Исследование времени кровотечения по Дюке',5,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(46,'Гемостазиограмма',1100,'Гемостазиограмма',5,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(47,'Определение фибриногена',200,'Определение фибриногена',5,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(48,'Миелограмма (подсч.клеток костного мозга)',550,'Миелограмма (подсч.клеток костного мозга)',5,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(49,'Исследование желудочного содержания на наличие хеликобактер. пилори',200,'Исследование желудочного содержания на наличие хеликобактер. пилори',5,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(50,'Определение группы крови (резус-фактор)',300,'Определение группы крови (резус-фактор)',5,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(51,'Общий анализ мочи',200,'Общий анализ мочи',6,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(52,'Исследование мочи по Нечипоренко',200,'Исследование мочи по Нечипоренко',6,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(53,'Исследование мочи по Зимницкому (8проб)',200,'Исследование мочи по Зимницкому (8проб)',6,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(54,'Исследование мочи на желчные пигменты',150,'Исследование мочи на желчные пигменты',6,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(55,'Исследование на Белок в моче',200,'Исследование на Белок в моче',6,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(56,'Общий анализ мокроты',200,'Общий анализ мокроты',6,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(57,'Соскоб на чесоточного клеща',200,'Соскоб на чесоточного клеща',6,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(58,'Соскоб на демодекс',200,'Соскоб на демодекс',6,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(59,'Соскоб на лептотрикс',200,'Соскоб на лептотрикс',6,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(60,'Соскоб с поверхности кожи и ногтей на споры и мицелии грибов',200,'Соскоб с поверхности кожи и ногтей на споры и мицелии грибов',6,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(61,'Анализ мочи на диастазу',300,'Анализ мочи на диастазу',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(62,'Исследование на Общий белок',200,'Исследование на Общий белок',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(63,'Исследование на Белковые фракции',400,'Исследование на Белковые фракции',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(64,'Сахар крови (кривая)',400,'Сахар крови (кривая)',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(65,'Сахар крови (без нагруз)',200,'Сахар крови (без нагруз)',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(66,'Сахар мочи (количеств)',200,'Сахар мочи (количеств)',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(67,'Мочевина',200,'Мочевина',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(68,'Креатинин',200,'Креатинин',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(69,'Билирубин общий и прямой',250,'Билирубин общий и прямой',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(70,'Трансаминазы',350,'Трансаминазы',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(71,'Амилаза в крови',300,'Амилаза в крови',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(72,'Фосфатаза(кислая)',250,'Фосфатаза(кислая)',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(73,'Фозфотаза(щелочная)',300,'Фозфотаза(щелочная)',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(74,'Холестерин',250,'Холестерин',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(75,'HDL-холестерин',250,'HDL-холестерин',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(76,'LDL-холестерин',250,'LDL-холестерин',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(77,'Общие липиды',200,'Общие липиды',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(78,'Триглицириды',250,'Триглицириды',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(79,'Липопротеиды (фракции на электрофорез)',350,'Липопротеиды (фракции на электрофорез)',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(80,'Калий',200,'Калий',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(81,'Кальций',200,'Кальций',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(82,'Фосфор',200,'Фосфор',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(83,'Железо',300,'Железо',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(84,'Медь',350,'Медь',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(85,'Церулоплазмин',200,'Церулоплазмин',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(86,'Гаптоглобин',250,'Гаптоглобин',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(87,'Мочевая кислота',200,'Мочевая кислота',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(88,'17-кетостероидов в моче',900,'17-кетостероидов в моче',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(89,'Определение железосвязывающей способности белков в сыворотке крови',300,'Определение железосвязывающей способности белков в сыворотке крови',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(90,'Печеночные пробы (тимоловая)',200,'Печеночные пробы (тимоловая)',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(91,'Анализ крови на хлориды',200,'Анализ крови на хлориды',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(92,'Липаза',300,'Липаза',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(93,'Магний',200,'Магний',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(94,'Гликозилированный гемоглобин',500,'Гликозилированный гемоглобин',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(95,'Креатин кеназа',300,'Креатин кеназа',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(96,'Гаммаглутаминтранспептидаза',300,'Гаммаглутаминтранспептидаза',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(97,'Лактатдгидрогеназа',300,'Лактатдгидрогеназа',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(98,'Альбумин',200,'Альбумин',7,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(99,'Хламидии',380,'Хламидии',8,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(100,'Микоплазма Хоминиз',380,'Микоплазма Хоминиз',8,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(101,'Микоплазма Геиниталиум',380,'Микоплазма Геиниталиум',8,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(102,'Уреаплазма',380,'Уреаплазма',8,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(103,'ВПГ 1+2',400,'ВПГ 1+2',8,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(104,'Цитомигаловирус',400,'Цитомигаловирус',8,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(105,'Трихоманады',380,'Трихоманады',8,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(106,'Гонококки',380,'Гонококки',8,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(107,'Гарднереллы',380,'Гарднереллы',8,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(108,'Папиллома 16,18',380,'Папиллома 16,18',8,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(109,'Гепатит В качественный',1600,'Гепатит В качественный',8,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(110,'Гепатит В количественный',2000,'Гепатит В количественный',8,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(111,'Гепатит С качественный',1600,'Гепатит С качественный',8,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(112,'Гепатит С количественный',2000,'Гепатит С количественный',8,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(113,'Определение иммунного статуса: Т.В. клетки',1300,'Определение иммунного статуса: Т.В. клетки',9,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(114,'Иммуноглобулина A,M,G,E',700,'Иммуноглобулина A,M,G,E',9,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(115,'Анализы на бруцеллёз',300,'Анализы на бруцеллёз',9,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(116,'Кортизол',400,'Кортизол',10,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(117,'Тиреотропный гормон (ТТГ)',400,'Тиреотропный гормон (ТТГ)',10,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(118,'Антитела к тиреоглобулин',400,'Антитела к тиреоглобулин',10,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(119,'Трийодтиранин (ТЗ)',350,'Трийодтиранин (ТЗ)',10,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(120,'Пролактин',350,'Пролактин',10,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(121,'Тестостерон',350,'Тестостерон',10,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(122,'ФСГ',350,'ФСГ',10,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(123,'Лютотропин',350,'Лютотропин',10,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(124,'Определение антител хламидиям иммуноферментным методом',400,'Определение антител хламидиям иммуноферментным методом',10,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(125,'Определение антител к уреаплазме',400,'Определение антител к уреаплазме',10,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(126,'Определение антител к трихомониязу',400,'Определение антител к трихомониязу',10,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(127,'Определение антител цитомегаловирусу иммуноферментным методом (ЦМВ ИФА)',400,'Определение антител цитомегаловирусу иммуноферментным методом (ЦМВ ИФА)',10,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(128,'Антитела к вирусу простого герпеса (ИФА)',400,'Антитела к вирусу простого герпеса (ИФА)',10,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(129,'Антитела к лямблиям',400,'Антитела к лямблиям',10,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(130,'Определение ранней диагностики беременности   (хорионический гонатропин)',400,'Определение ранней диагностики беременности   (хорионический гонатропин)',10,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(131,'Исследование крови на токсоплазмоз',400,'Исследование крови на токсоплазмоз',10,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(132,'Антитела к эхинококкозу',450,'Антитела к эхинококкозу',10,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(133,'Диагностика сифилиса',400,'Диагностика сифилиса',10,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(134,'Микрореакция на сифилис',200,'Микрореакция на сифилис',10,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(135,'Гепатит А',400,'Гепатит А',11,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(136,'Гепатит В',370,'Гепатит В',11,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(137,'Гепатит С',400,'Гепатит С',11,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(138,'Определение вируса Эпштейна-Бара',400,'Определение вируса Эпштейна-Бара',11,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(139,'Цитологические исследование на наличие злокачественных элементов',450,'Цитологические исследование на наличие злокачественных элементов',12,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(140,'Лабараторное исследование (спермограмма)',1450,'Лабараторное исследование (спермограмма)',12,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(141,'Анализ Мокроты',600,'Анализ Мокроты',12,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(142,'Определение гарднерелл в мазке',250,'Определение гарднерелл в мазке',12,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(143,'Определение хламидий',450,'Определение хламидий',12,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(144,'Вирус простого герпеса',250,'Вирус простого герпеса',12,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(145,'Исследование гинекологических мазков (на гонококки, трихомоноз, молочницы, флоры)',400,'Исследование гинекологических мазков (на гонококки, трихомоноз, молочницы, флоры)',12,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(146,'Исследование простаты',220,'Исследование простаты',12,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(147,'Лазерная терапия',450,'Лазерная терапия',15,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(148,'Кольпоскопия',250,'Кольпоскопия',15,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(149,'Введение тампонов с лекарственными веществами',200,'Введение тампонов с лекарственными веществами',15,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(150,'Ванночки влагалищные',200,'Ванночки влагалищные',15,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(151,'Взятие аспирата из полости матки',300,'Взятие аспирата из полости матки',15,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(152,'Введение спирали',250,'Введение спирали',15,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(153,'Удаление внутриматочных противозаточных средст',200,'Удаление внутриматочных противозаточных средст',15,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(154,'Инструментальное исследование полости матки с последующим удалением ВМС',450,'Инструментальное исследование полости матки с последующим удалением ВМС',15,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(155,'Диатермокоагуляция эрозии шейки матки',300,'Диатермокоагуляция эрозии шейки матки',15,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(156,'Удаление диатермокоагуляции кондилом наружных половых органов',300,'Удаление диатермокоагуляции кондилом наружных половых органов',15,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(157,'Удаление полипа',200,'Удаление полипа',15,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(158,'Прижигание эрозии шейки матки',350,'Прижигание эрозии шейки матки',15,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(159,'Биопсия эрозии шейки матки',200,'Биопсия эрозии шейки матки',15,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(160,'Биопсия эндометрия',200,'Биопсия эндометрия',15,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(161,'Взятие мазка',200,'Взятие мазка',15,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(162,'Блокада новокаиновая семенного канатика',350,'Блокада новокаиновая семенного канатика',15,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(163,'Уретроскопия',300,'Уретроскопия',15,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(164,'Пункция при водянке оболочек яичка',300,'Пункция при водянке оболочек яичка',15,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(165,'Инстилляция уретры',300,'Инстилляция уретры',15,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(166,'Бужирование мочеиспускательного канала',300,'Бужирование мочеиспускательного канала',15,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(167,'Массаж предстательной железы',400,'Массаж предстательной железы',15,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(168,'Цистоскопия',450,'Цистоскопия',15,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(169,'Инстилляция мочевого пузыря  (у мужчин)',400,'Инстилляция мочевого пузыря  (у мужчин)',16,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(170,'Инстилляция мочевого пузыря (у женщин)',350,'Инстилляция мочевого пузыря (у женщин)',16,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(171,'М\\цистография',450,'М\\цистография',16,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(172,'Взятие мазка (мочевой канал)',150,'Взятие мазка (мочевой канал)',16,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(173,'Кататеризация мочевого пузыря',350,'Кататеризация мочевого пузыря',16,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(174,'Электрокоагуляция полипа мочевого пузыря и уретры',550,'Электрокоагуляция полипа мочевого пузыря и уретры',16,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(175,'Электроэкцизия полипа мочевого пузыря и уретры',550,'Электроэкцизия полипа мочевого пузыря и уретры',16,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(176,'Удаление диатермокоагуляций кондилом наружный половых органов',300,'Удаление диатермокоагуляций кондилом наружный половых органов',16,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(177,'Электрофорез',200,'Электрофорез',17,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(178,'СМТ-терапия',150,'СМТ-терапия',17,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(179,'УЧ- терапия',150,'УЧ- терапия',17,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(180,'КУФ',100,'КУФ',17,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(181,'Магнитотерапия',250,'Магнитотерапия',17,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(182,'Дарсенваль',200,'Дарсенваль',17,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(183,'Индуктотермия',200,'Индуктотермия',17,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(184,'Парафин',250,'Парафин',17,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(185,'Дециметровая волна-терапия(ДМВ)',200,'Дециметровая волна-терапия(ДМВ)',17,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(186,'Внутримышечная',100,'Внутримышечная',28,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(187,'Внутривенная',100,'Внутривенная',28,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(188,'Капельница',200,'Капельница',29,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(189,'Лечебная блокада',250,'Лечебная блокада',29,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(190,'Забор крови',100,'Забор крови',29,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(191,'Промывание небных миндалин',200,'Промывание небных миндалин',19,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(192,'Удаление серной пробки',200,'Удаление серной пробки',19,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(193,'Продувание слуховых труб',200,'Продувание слуховых труб',19,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(194,'Пневмомассаж барабанных перепонок',200,'Пневмомассаж барабанных перепонок',19,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(195,'Пункции верхних челюстных пазух',350,'Пункции верхних челюстных пазух',19,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(196,'Аудиограмма',350,'Аудиограмма',19,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(197,'Исследование проходимости слезных канальцев',300,'Исследование проходимости слезных канальцев',20,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(198,'Периметрия на цветные объекты',300,'Периметрия на цветные объекты',20,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(199,'Подбор очков',300,'Подбор очков',20,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(200,'Гоннеоскопия',250,'Гоннеоскопия',20,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(201,'Взятие мазка (офтальмолог)',150,'Взятие мазка (офтальмолог)',20,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(202,'Удаление инородных тел',300,'Удаление инородных тел',20,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(203,'Первичное обследование',250,'Первичное обследование',21,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(204,'Наложение пломбы при поверхностном или среднем кариесе',350,'Наложение пломбы при поверхностном или среднем кариесе',21,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(205,'Наложение пломбы при глубоком кариесе',450,'Наложение пломбы при глубоком кариесе',21,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(206,'Лечение пульпита однокоренного зуба',450,'Лечение пульпита однокоренного зуба',21,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(207,'Лечение пульпита двух коренного зуба',600,'Лечение пульпита двух коренного зуба',21,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(208,'Лечение пульпита трехкоренного зуба',750,'Лечение пульпита трехкоренного зуба',21,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(209,'Удаление зуба под местным обезболиванием одно удаление',300,'Удаление зуба под местным обезболиванием одно удаление',21,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(210,'Рентгенография костей (1 проекция)',400,'Рентгенография костей (1 проекция)',27,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(211,'Рентгенография костей (2 проекция)',450,'Рентгенография костей (2 проекция)',27,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(212,'Рентгенография ребер (2 проекции)',500,'Рентгенография ребер (2 проекции)',27,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(213,'Рентгенография органов грудной клетки (1 проекция)',400,'Рентгенография органов грудной клетки (1 проекция)',27,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(214,'Обзорный снимок мочевыводящих путей и брюшной полости',400,'Обзорный снимок мочевыводящих путей и брюшной полости',27,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(215,'Экскреторная урограмма (4 снимка)',950,'Экскреторная урограмма (4 снимка)',27,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(216,'Экскреторная урограмма (5 снимков)',1000,'Экскреторная урограмма (5 снимков)',27,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(217,'Уретрография',600,'Уретрография',27,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(218,'Компьютерная томография',3400,'Компьютерная томография',27,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(219,'Консультация врача-рентгенолога (разовое посещение)',500,'Консультация врача-рентгенолога (разовое посещение)',27,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(220,'Консультация врача-рентгенолога (второе посещение)',250,'Консультация врача-рентгенолога (второе посещение)',27,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(221,'Флюорография',250,'Флюорография',27,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(222,'Первичная хирургическая обработка раны каждого пораженного участка',400,'Первичная хирургическая обработка раны каждого пораженного участка',22,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(223,'Перевязка каждого пораженного участка',400,'Перевязка каждого пораженного участка',22,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(224,'Наложение гипса',600,'Наложение гипса',22,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(225,'Вскрытие фурункула, карбункула',300,'Вскрытие фурункула, карбункула',22,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(226,'Вскытие  панариция',300,'Вскытие  панариция',22,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(227,'Удаление легатурного свища',800,'Удаление легатурного свища',22,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(228,'Вскрытие абцесса (все виды)',400,'Вскрытие абцесса (все виды)',22,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(229,'Удаление вросшего ногтя',500,'Удаление вросшего ногтя',22,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(230,'Удаление атеромы',650,'Удаление атеромы',22,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(231,'Удаление липомы',650,'Удаление липомы',22,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(232,'Гидродент',350,'Гидродент',22,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(233,'Хирургическая блокада всех видов',300,'Хирургическая блокада всех видов',22,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(234,'Лечебная гимнастика при индивидуальном методе занятий',300,'Лечебная гимнастика при индивидуальном методе занятий',22,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(235,'Лечебная гимнастика при групповых занятиях',200,'Лечебная гимнастика при групповых занятиях',22,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(236,'Массаж головы',150,'Массаж головы',23,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(237,'Массаж лица',150,'Массаж лица',23,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(238,'Массаж шеи',150,'Массаж шеи',23,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(239,'Массаж воротниковой зоны',200,'Массаж воротниковой зоны',23,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(240,'Массаж верхней конечности надплечья и области лопатки',200,'Массаж верхней конечности надплечья и области лопатки',23,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(241,'Массаж верхней конечности',200,'Массаж верхней конечности',23,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(242,'Массаж плечевого сустава',150,'Массаж плечевого сустава',23,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(243,'Массаж локтевого сустава',150,'Массаж локтевого сустава',23,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(244,'Массаж лучезапястного сустава',150,'Массаж лучезапястного сустава',23,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(245,'Массаж кисти и предплечья',150,'Массаж кисти и предплечья',23,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(246,'Массаж области грудной клетки',200,'Массаж области грудной клетки',23,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(247,'Массаж спины',200,'Массаж спины',23,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(248,'Массаж мышц передней брюшной стенки',150,'Массаж мышц передней брюшной стенки',23,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(249,'Массаж поясничного-крестцовой области',150,'Массаж поясничного-крестцовой области',23,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(250,'Сегментарный массаж пояснично-крестцовой области',200,'Сегментарный массаж пояснично-крестцовой области',23,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(251,'Массаж спины и поясницы',200,'Массаж спины и поясницы',23,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(252,'Массаж шейно-грудного отдела позвоночника',200,'Массаж шейно-грудного отдела позвоночника',23,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(253,'Массаж области позвоночника',200,'Массаж области позвоночника',23,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(254,'Массаж нижней конечности',200,'Массаж нижней конечности',23,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(255,'Массаж нижней конечности и поясницы',200,'Массаж нижней конечности и поясницы',23,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(256,'Массаж тазобедренного сустава',150,'Массаж тазобедренного сустава',23,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(257,'Массаж голенного сустава',150,'Массаж голенного сустава',23,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(258,'Массаж стопы и голени',150,'Массаж стопы и голени',23,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(259,'Общий массаж (у детей до школьного возраста)',250,'Общий массаж (у детей до школьного возраста)',23,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(260,'Мануальная  терапия',650,'Мануальная  терапия',23,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(261,'Консультация врача',700,'Консультация врача',24,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(262,'Электрокардиография ЭКГ',250,'Электрокардиография ЭКГ',24,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(263,'Ультразвуковая диагностика',750,'Ультразвуковая диагностика',24,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(264,'Эзофагогастродуоденоскопия (на дому)',1000,'Эзофагогастродуоденоскопия (на дому)',24,'2022-03-21 01:27:51','2022-03-21 01:27:51'),(265,'Забор анализов',350,'Забор анализов',24,'2022-03-21 01:27:51','2022-03-21 01:27:51');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'roma99@bk.ru','Роман','Алексеев','Максимович','1999-01-08','79241171690',NULL,'$2y$10$Ov5NedDpZc2acH2Q/zhGPOZ9psTw/biOtCyQAYHOLbPTcWbG8B/1e',NULL,NULL,NULL),(2,'11@11.11','Роман','Алексеев','Максимович','1999-01-08','+996(111)111-1111',NULL,'$2y$10$de4JqTcYOZK2.qL2r2mVq.1KEuhsa3VpNG4RboatMY3UHl8QxYSoe',NULL,NULL,'2022-03-18 23:27:30'),(5,'man@dd.dd','newwww','mannnnn',NULL,'2012-02-01','+996(333)333-1111',NULL,'$2y$10$6gH5mV7ZQg1dTtkf4QpIi..Y.eTcRmHp4OfnFoIgIZNuPy9mC1oD6',NULL,'2022-03-18 23:23:25','2022-03-18 23:27:08'),(6,'s@s.s','Серафим','Петренко',NULL,NULL,'+996(111)111-1111',NULL,'$2y$10$7uEVdpjy903tWwdKqmlP3e5vtJO7M3oTrJa.NSfWTyTN0ESIFi3I2',NULL,'2022-03-20 23:44:35','2022-03-20 23:44:35');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `working_hours`
--

DROP TABLE IF EXISTS `working_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `working_hours` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `working_hours_user_id_foreign` (`user_id`),
  CONSTRAINT `working_hours_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `working_hours`
--

LOCK TABLES `working_hours` WRITE;
/*!40000 ALTER TABLE `working_hours` DISABLE KEYS */;
INSERT INTO `working_hours` VALUES (1,'2022-04-18 07:00:00','2022-04-18 13:30:00',1),(2,'2022-04-19 01:00:00','2022-04-19 07:30:00',1),(3,'2022-04-22 02:30:00','2022-04-22 12:00:00',1);
/*!40000 ALTER TABLE `working_hours` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-04  8:07:43

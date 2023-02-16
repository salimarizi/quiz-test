/*
 Navicat Premium Data Transfer

 Source Server         : MYSQL
 Source Server Type    : MySQL
 Source Server Version : 100421
 Source Host           : localhost:3306
 Source Schema         : db_quizzes

 Target Server Type    : MySQL
 Target Server Version : 100421
 File Encoding         : 65001

 Date: 16/02/2023 23:29:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answers
-- ----------------------------
DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `questionId` bigint(20) unsigned NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `isCorrectAnswer` tinyint(1) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `deletedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `answers_questionid_index` (`questionId`),
  CONSTRAINT `answers_questionid_foreign` FOREIGN KEY (`questionId`) REFERENCES `questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of answers
-- ----------------------------
BEGIN;
INSERT INTO `answers` (`id`, `questionId`, `content`, `order`, `isCorrectAnswer`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (1, 8, 'option 1', 1, 0, '2023-02-16 14:36:47', '2023-02-16 14:36:47', NULL);
INSERT INTO `answers` (`id`, `questionId`, `content`, `order`, `isCorrectAnswer`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (2, 8, 'option 2', 2, 1, '2023-02-16 14:36:47', '2023-02-16 14:36:47', NULL);
INSERT INTO `answers` (`id`, `questionId`, `content`, `order`, `isCorrectAnswer`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (3, 9, 'option 1', 1, 0, '2023-02-16 14:36:47', '2023-02-16 14:36:47', NULL);
INSERT INTO `answers` (`id`, `questionId`, `content`, `order`, `isCorrectAnswer`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (4, 9, 'option 2', 2, 1, '2023-02-16 14:36:47', '2023-02-16 14:36:47', NULL);
INSERT INTO `answers` (`id`, `questionId`, `content`, `order`, `isCorrectAnswer`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (5, 10, 'option 1', 1, 0, '2023-02-16 14:37:54', '2023-02-16 14:37:54', NULL);
INSERT INTO `answers` (`id`, `questionId`, `content`, `order`, `isCorrectAnswer`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (6, 10, 'option 2', 2, 1, '2023-02-16 14:37:54', '2023-02-16 14:37:54', NULL);
INSERT INTO `answers` (`id`, `questionId`, `content`, `order`, `isCorrectAnswer`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (7, 11, 'option 1', 1, 0, '2023-02-16 14:37:54', '2023-02-16 14:37:54', NULL);
INSERT INTO `answers` (`id`, `questionId`, `content`, `order`, `isCorrectAnswer`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (8, 11, 'option 2', 2, 1, '2023-02-16 14:37:54', '2023-02-16 14:37:54', NULL);
INSERT INTO `answers` (`id`, `questionId`, `content`, `order`, `isCorrectAnswer`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (9, 12, 'option 1', 1, 0, '2023-02-16 14:38:42', '2023-02-16 14:38:42', NULL);
INSERT INTO `answers` (`id`, `questionId`, `content`, `order`, `isCorrectAnswer`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (10, 12, 'option 2', 2, 1, '2023-02-16 14:38:42', '2023-02-16 14:38:42', NULL);
INSERT INTO `answers` (`id`, `questionId`, `content`, `order`, `isCorrectAnswer`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (11, 13, 'option 1', 1, 0, '2023-02-16 14:38:42', '2023-02-16 14:38:42', NULL);
INSERT INTO `answers` (`id`, `questionId`, `content`, `order`, `isCorrectAnswer`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (12, 13, 'option 2', 2, 1, '2023-02-16 14:38:42', '2023-02-16 14:38:42', NULL);
INSERT INTO `answers` (`id`, `questionId`, `content`, `order`, `isCorrectAnswer`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (13, 14, 'option 1', 1, 0, '2023-02-16 14:39:11', '2023-02-16 14:39:11', NULL);
INSERT INTO `answers` (`id`, `questionId`, `content`, `order`, `isCorrectAnswer`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (14, 14, 'option 2', 2, 1, '2023-02-16 14:39:11', '2023-02-16 14:39:11', NULL);
INSERT INTO `answers` (`id`, `questionId`, `content`, `order`, `isCorrectAnswer`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (15, 15, 'option 1', 1, 0, '2023-02-16 14:39:11', '2023-02-16 14:39:11', NULL);
INSERT INTO `answers` (`id`, `questionId`, `content`, `order`, `isCorrectAnswer`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (16, 15, 'option 2', 2, 1, '2023-02-16 14:39:11', '2023-02-16 14:39:11', NULL);
COMMIT;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (25, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (26, '2014_10_12_100000_create_password_reset_tokens_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (27, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (28, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (29, '2023_02_16_090423_create_quizzes_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (30, '2023_02_16_090618_create_questions_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (31, '2023_02_16_091204_create_answers_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (32, '2023_02_16_092737_create_submissions_table', 1);
COMMIT;

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quizId` bigint(20) unsigned NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `isMandatory` tinyint(1) NOT NULL,
  `order` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `deletedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questions_quizid_index` (`quizId`),
  CONSTRAINT `questions_quizid_foreign` FOREIGN KEY (`quizId`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of questions
-- ----------------------------
BEGIN;
INSERT INTO `questions` (`id`, `quizId`, `content`, `isMandatory`, `order`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (8, 13, 'What is your name', 1, 1, '2023-02-16 14:36:47', '2023-02-16 14:36:47', NULL);
INSERT INTO `questions` (`id`, `quizId`, `content`, `isMandatory`, `order`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (9, 13, 'Question number 2', 1, 2, '2023-02-16 14:36:47', '2023-02-16 14:36:47', NULL);
INSERT INTO `questions` (`id`, `quizId`, `content`, `isMandatory`, `order`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (10, 14, 'What is your name', 1, 1, '2023-02-16 14:37:54', '2023-02-16 14:37:54', NULL);
INSERT INTO `questions` (`id`, `quizId`, `content`, `isMandatory`, `order`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (11, 14, 'Question number 2', 1, 2, '2023-02-16 14:37:54', '2023-02-16 14:37:54', NULL);
INSERT INTO `questions` (`id`, `quizId`, `content`, `isMandatory`, `order`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (12, 15, 'What is your name', 1, 1, '2023-02-16 14:38:42', '2023-02-16 14:38:42', NULL);
INSERT INTO `questions` (`id`, `quizId`, `content`, `isMandatory`, `order`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (13, 15, 'Question number 2', 1, 2, '2023-02-16 14:38:42', '2023-02-16 14:38:42', NULL);
INSERT INTO `questions` (`id`, `quizId`, `content`, `isMandatory`, `order`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (14, 16, 'What is your name', 1, 1, '2023-02-16 14:39:11', '2023-02-16 14:39:11', NULL);
INSERT INTO `questions` (`id`, `quizId`, `content`, `isMandatory`, `order`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (15, 16, 'Question number 2', 1, 2, '2023-02-16 14:39:11', '2023-02-16 14:39:11', NULL);
COMMIT;

-- ----------------------------
-- Table structure for quizzes
-- ----------------------------
DROP TABLE IF EXISTS `quizzes`;
CREATE TABLE `quizzes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `isPublished` tinyint(1) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `deletedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of quizzes
-- ----------------------------
BEGIN;
INSERT INTO `quizzes` (`id`, `name`, `description`, `isPublished`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (1, 'test 3', 'test', 1, '2023-02-16 12:44:31', '2023-02-16 13:50:18', NULL);
INSERT INTO `quizzes` (`id`, `name`, `description`, `isPublished`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (13, 'test 3', 'test with question', 1, '2023-02-16 14:36:47', '2023-02-16 14:36:47', NULL);
INSERT INTO `quizzes` (`id`, `name`, `description`, `isPublished`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (14, 'test 3', 'test with question', 1, '2023-02-16 14:37:54', '2023-02-16 14:37:54', NULL);
INSERT INTO `quizzes` (`id`, `name`, `description`, `isPublished`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (15, 'test 3', 'test with question', 1, '2023-02-16 14:38:42', '2023-02-16 14:38:42', NULL);
INSERT INTO `quizzes` (`id`, `name`, `description`, `isPublished`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (16, 'test 3', 'test with question', 1, '2023-02-16 14:39:11', '2023-02-16 14:39:11', NULL);
COMMIT;

-- ----------------------------
-- Table structure for submissions
-- ----------------------------
DROP TABLE IF EXISTS `submissions`;
CREATE TABLE `submissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) unsigned NOT NULL,
  `questionId` bigint(20) unsigned NOT NULL,
  `answerId` bigint(20) unsigned NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `deletedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `submissions_userid_index` (`userId`),
  KEY `submissions_questionid_index` (`questionId`),
  KEY `submissions_answerid_index` (`answerId`),
  CONSTRAINT `submissions_answerid_foreign` FOREIGN KEY (`answerId`) REFERENCES `answers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `submissions_questionid_foreign` FOREIGN KEY (`questionId`) REFERENCES `questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of submissions
-- ----------------------------
BEGIN;
INSERT INTO `submissions` (`id`, `userId`, `questionId`, `answerId`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (5, 1, 8, 1, '2023-02-16 16:04:14', '2023-02-16 16:04:37', NULL);
INSERT INTO `submissions` (`id`, `userId`, `questionId`, `answerId`, `createdAt`, `updatedAt`, `deletedAt`) VALUES (6, 1, 9, 4, '2023-02-16 16:05:11', '2023-02-16 16:05:11', NULL);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 24 juil. 2024 à 22:22
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `chefs`
--

CREATE TABLE `chefs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nomCD` varchar(255) NOT NULL,
  `emailCD` varchar(255) NOT NULL,
  `mdpCD` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `chefs`
--

INSERT INTO `chefs` (`id`, `nomCD`, `emailCD`, `mdpCD`, `created_at`, `updated_at`) VALUES
(1, 'Chef', 'chef@gmail.com', '$2y$12$0Kpowg9OelbtJ0fFYkikZOsgf8c8Rzyj./Nbb.BmF/qfkYYvOTf1W', '2024-06-03 06:20:54', '2024-06-03 06:20:54');

-- --------------------------------------------------------

--
-- Structure de la table `classes`
--

CREATE TABLE `classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE `cours` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codeUE` varchar(255) NOT NULL,
  `intituleUE` varchar(255) NOT NULL,
  `niveau_id` bigint(20) UNSIGNED NOT NULL,
  `semestre_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id`, `codeUE`, `intituleUE`, `niveau_id`, `semestre_id`, `created_at`, `updated_at`) VALUES
(1, 'ICT101', 'Introduction to Business Information Systems', 1, 1, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(2, 'ICT102', 'Object-Oriented Programming', 1, 2, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(3, 'ICT103', 'Introduction to Programming', 1, 1, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(4, 'ICT104', 'Computer systems', 1, 2, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(5, 'ICT105', 'Introduction to algorithms', 1, 1, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(6, 'ICT106', 'Data Structures and Patterns I', 1, 2, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(7, 'ICT107', 'Mathematics for computer science I', 1, 1, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(8, 'ICT108', 'Creating Web Application', 1, 2, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(9, 'ICT109', 'Discrete Mathematics I', 1, 1, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(10, 'ICT110', 'Database Analysis and Design', 1, 2, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(11, 'ICT111', 'Data Coding', 1, 1, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(12, 'ENG104', 'English I', 1, 2, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(13, 'FRA104', 'Français I', 1, 2, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(14, 'ICT201', 'Introduction to Software Engineering', 2, 1, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(15, 'ICT202', 'Software Development for Mobile devices', 2, 2, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(16, 'ICT203', 'Database Systems', 2, 1, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(17, 'ICT204', 'Introduction to Operating System', 2, 2, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(18, 'ICT205', 'Introduction to Programming in .NET', 2, 1, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(19, 'ICT206', 'Introduction to Computer Network', 2, 2, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(20, 'ICT207', 'Software Development in Java I', 2, 1, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(21, 'ICT208', 'Computer Architecture', 2, 2, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(22, 'ICT213', 'Introduction to Computer Security and Risk Management', 2, 1, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(23, 'ICT214', 'Introduction to Cryptography', 2, 2, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(24, 'ICT215', 'Introduction to Computer Networking', 2, 1, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(25, 'ICT216', 'Network Administration', 2, 2, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(26, 'ICT217', 'Software Engineering', 2, 1, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(27, 'ICT218', 'Advanced Mobile Application Development', 2, 2, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(28, 'ENG203', 'English II', 2, 1, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(29, 'FRA203', 'Français II', 2, 1, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(30, 'ICT300', 'Internship', 3, 2, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(31, 'ICT301', 'Software Architectures and Design', 3, 1, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(32, 'ICT302', 'Introduction to Artificial Intelligence', 3, 2, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(33, 'ICT303', 'Data Communication and Security', 3, 1, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(34, 'ICT304', 'Software Testing and Deployment', 3, 2, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(35, 'ICT305', 'Web Application Development', 3, 1, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(36, 'ICT306', 'Business Intelligence', 3, 2, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(37, 'ICT307', 'Computer Systems Engineering', 3, 1, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(38, 'ICT308', 'Software Development in Java II', 3, 2, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(39, 'ICT310', 'Professional Issues in IT', 3, 2, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(40, 'ICT313', 'Cyber and Internet Security', 3, 1, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(41, 'ICT314', 'Computer Forensics and Incident Response', 3, 2, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(42, 'ICT315', 'Network Application Development', 3, 1, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(43, 'ICT316', 'Digital communication', 3, 2, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(44, 'ICT317', 'Information system', 3, 1, '2024-06-03 06:21:04', '2024-06-03 06:21:04'),
(45, 'ICT318', 'Java Enterprise Edition', 3, 2, '2024-06-03 06:21:04', '2024-06-03 06:21:04');

-- --------------------------------------------------------

--
-- Structure de la table `delegues`
--

CREATE TABLE `delegues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nameDel` varchar(255) NOT NULL,
  `emailDel` varchar(255) NOT NULL,
  `matDel` varchar(255) NOT NULL,
  `nivDel` varchar(255) NOT NULL,
  `mdpDel` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `delegues`
--

INSERT INTO `delegues` (`id`, `nameDel`, `emailDel`, `matDel`, `nivDel`, `mdpDel`, `created_at`, `updated_at`) VALUES
(1, 'Pierrick', 'pierrick@gmail.com', '21Q2493', 'L3', '$2y$12$IqLhbnIKusWbVvCUKeArqO12uyasdnNBflbZYx82YJdi7iy3xLHOG', '2024-06-20 05:20:59', '2024-06-20 05:20:59');

-- --------------------------------------------------------

--
-- Structure de la table `enseignants`
--

CREATE TABLE `enseignants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nomEns` varchar(255) NOT NULL,
  `emailEns` varchar(255) NOT NULL,
  `mdpEns` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `enseignants`
--

INSERT INTO `enseignants` (`id`, `nomEns`, `emailEns`, `mdpEns`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test@gmail.com', '$2y$12$tFgznl8oqNnGYoD/OytvNeZWxYzxzTakAb54joevJVp4bcMlE.ciK', '2024-06-03 06:21:19', '2024-06-03 06:21:19'),
(2, 'Dr Nzekon', 'armelnzekon@gmail.com', '$2y$12$yutqFoDxvcVNvTsqAGUfpeY3JUMlruEUbVBdIiVpAa2A5VYwfXICu', '2024-06-27 20:22:39', '2024-06-27 20:22:39'),
(3, 'Dr Messi', 'messi@gmail.com', '$2y$12$V8BxA8NPbD6uhk6i5KqXWuo1rJyX3uuI1jVEoTTNRMcVizdw2uyum', '2024-06-28 13:08:45', '2024-06-28 13:08:45');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fiches`
--

CREATE TABLE `fiches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `semestre` int(11) NOT NULL,
  `date` date NOT NULL,
  `codeCours` varchar(255) NOT NULL,
  `enseignant` varchar(255) NOT NULL,
  `heureDebut` time NOT NULL,
  `heureFin` time NOT NULL,
  `totalHeures` varchar(255) NOT NULL DEFAULT '',
  `salle` varchar(255) NOT NULL,
  `typeSeance` varchar(255) NOT NULL,
  `titreSeance` varchar(255) NOT NULL,
  `niveau` text NOT NULL,
  `contenu` text NOT NULL,
  `signatureDelegue` text DEFAULT NULL,
  `signatureProf` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `confidentialite` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fiches`
--

INSERT INTO `fiches` (`id`, `semestre`, `date`, `codeCours`, `enseignant`, `heureDebut`, `heureFin`, `totalHeures`, `salle`, `typeSeance`, `titreSeance`, `niveau`, `contenu`, `signatureDelegue`, `signatureProf`, `created_at`, `updated_at`, `confidentialite`) VALUES
(1, 1, '2024-06-03', 'ICT101', 'test', '14:34:00', '16:34:00', '', 'R101', 'CM', 'Test', '1', 'Test d\'intégrité', NULL, NULL, '2024-06-03 12:34:43', '2024-06-03 12:34:43', 1),
(2, 1, '2024-06-03', 'ICT201', 'test', '14:35:00', '20:35:00', '', 'R101', 'CM', 'Test', '2', 'test', NULL, NULL, '2024-06-03 12:35:43', '2024-06-03 12:35:43', 1),
(3, 2, '2024-07-19', 'ICT300', 'Dr Messi', '08:32:00', '11:32:00', '', 'S107', 'CM', 'Test', '3', '- Vérification des fonctionnalités de l\'application\r\n- Test et débogage\r\n- Analyse\r\n- Observations', NULL, NULL, '2024-07-19 20:33:33', '2024-07-19 20:33:33', 1);

-- --------------------------------------------------------

--
-- Structure de la table `fiche_surveillances`
--

CREATE TABLE `fiche_surveillances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chefdesalle` varchar(255) NOT NULL,
  `salle` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `session` varchar(255) NOT NULL,
  `codeCours` varchar(255) NOT NULL,
  `intituleUE` varchar(255) NOT NULL,
  `presence_confirmee` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fiche_surveillances`
--

INSERT INTO `fiche_surveillances` (`id`, `chefdesalle`, `salle`, `date`, `session`, `codeCours`, `intituleUE`, `presence_confirmee`, `created_at`, `updated_at`) VALUES
(1, 'Moi', 'zzzzzzz', '2024-06-08', 'aaaaaa', 'ICT300', 'Internship', 0, '2024-06-08 12:09:52', '2024-06-08 12:09:52'),
(2, 'Dr Nzekon', 'S107', '2024-06-28', '2024', 'ICT101', 'Introduction to Business Information Systems', 0, '2024-06-28 13:06:12', '2024-06-28 13:06:12'),
(3, 'Dr Nzekon', 'S107', '2024-07-20', '2024', 'ICT310', 'Professional Issues in IT', 0, '2024-07-20 04:14:00', '2024-07-20 04:14:00');

-- --------------------------------------------------------

--
-- Structure de la table `fiche_travaux_pratiques`
--

CREATE TABLE `fiche_travaux_pratiques` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `titreSeanceTP` varchar(255) NOT NULL,
  `enseignant` varchar(255) NOT NULL,
  `codeCours` varchar(255) NOT NULL,
  `heureDebut` time NOT NULL,
  `heureFin` time NOT NULL,
  `objectifsTP` text NOT NULL,
  `materielNecessaire` text NOT NULL,
  `procedureTP` text NOT NULL,
  `observations` text DEFAULT NULL,
  `resultatsAttendus` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fiche_travaux_pratiques`
--

INSERT INTO `fiche_travaux_pratiques` (`id`, `titreSeanceTP`, `enseignant`, `codeCours`, `heureDebut`, `heureFin`, `objectifsTP`, `materielNecessaire`, `procedureTP`, `observations`, `resultatsAttendus`, `created_at`, `updated_at`) VALUES
(1, 'Analyse', 'Dr Nzekon', 'ICT300', '10:35:00', '15:36:00', '- Test', '- Ordinateur\r\n- Connexion internet', '- Cloner le projet sur GitHub', '- Parfaite compréhension des étudiants', '- Démarrage de l\'application', '2024-07-19 20:39:07', '2024-07-19 20:39:07');

-- --------------------------------------------------------

--
-- Structure de la table `filieres`
--

CREATE TABLE `filieres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codeFil` varchar(255) NOT NULL,
  `intFil` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_11_16_102557_create_enseignants_table', 1),
(7, '2023_11_16_103129_create_fiches_table', 1),
(8, '2023_11_16_103139_create_filieres_table', 1),
(9, '2023_11_16_113916_create_chefs_table', 2),
(10, '2024_06_03_045326_create_semestres_table', 3),
(11, '2024_04_22_174758_create_niveaux_etude_table', 4),
(12, '2024_04_25_074617_create_fiche_surveillances_table', 5),
(13, '2024_04_25_151335_create_surveillants_table', 6),
(14, '2024_05_17_095432_create_fiche_travaux_pratiques_table', 7),
(15, '2023_12_07_091738_add_confidentialite_to_fiches_table', 8),
(16, '2024_06_08_112631_create_classes_table', 9),
(17, '2023_11_16_103040_create_delegues_table', 10);

-- --------------------------------------------------------

--
-- Structure de la table `niveaux_etude`
--

CREATE TABLE `niveaux_etude` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codeNiveau` varchar(255) NOT NULL,
  `intituleNiveau` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `niveaux_etude`
--

INSERT INTO `niveaux_etude` (`id`, `codeNiveau`, `intituleNiveau`, `created_at`, `updated_at`) VALUES
(1, 'L1', 'Licence 1', '2024-06-03 06:20:42', '2024-06-03 06:20:42'),
(2, 'L2', 'Licence 2', '2024-06-03 06:20:42', '2024-06-03 06:20:42'),
(3, 'L3', 'Licence 3', '2024-06-03 06:20:42', '2024-06-03 06:20:42'),
(4, 'M1', 'Master 1', '2024-06-03 06:20:42', '2024-06-03 06:20:42'),
(5, 'M2', 'Master 2', '2024-06-03 06:20:42', '2024-06-03 06:20:42');

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `semestres`
--

CREATE TABLE `semestres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `numSemestre` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `semestres`
--

INSERT INTO `semestres` (`id`, `numSemestre`, `created_at`, `updated_at`) VALUES
(1, '1', '2024-06-03 06:21:30', '2024-06-03 06:21:30'),
(2, '2', '2024-06-03 06:21:30', '2024-06-03 06:21:30');

-- --------------------------------------------------------

--
-- Structure de la table `surveillants`
--

CREATE TABLE `surveillants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fiche_surveillance_id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `surveillants`
--

INSERT INTO `surveillants` (`id`, `fiche_surveillance_id`, `nom`, `created_at`, `updated_at`) VALUES
(1, 1, 'sssssssss', '2024-06-08 12:09:52', '2024-06-08 12:09:52'),
(2, 2, 'MR Pierrick', '2024-06-28 13:06:12', '2024-06-28 13:06:12'),
(3, 2, 'Mr Kamfouo', '2024-06-28 13:06:12', '2024-06-28 13:06:12'),
(4, 3, 'Mr Jules', '2024-07-20 04:14:00', '2024-07-20 04:14:00'),
(5, 3, 'John', '2024-07-20 04:14:00', '2024-07-20 04:14:00'),
(6, 3, 'Abena', '2024-07-20 04:14:00', '2024-07-20 04:14:00'),
(7, 3, 'Marc', '2024-07-20 04:14:00', '2024-07-20 04:14:00');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `chefs`
--
ALTER TABLE `chefs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `delegues`
--
ALTER TABLE `delegues`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `enseignants`
--
ALTER TABLE `enseignants`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `fiches`
--
ALTER TABLE `fiches`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fiche_surveillances`
--
ALTER TABLE `fiche_surveillances`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fiche_travaux_pratiques`
--
ALTER TABLE `fiche_travaux_pratiques`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `filieres`
--
ALTER TABLE `filieres`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `niveaux_etude`
--
ALTER TABLE `niveaux_etude`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `semestres`
--
ALTER TABLE `semestres`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `surveillants`
--
ALTER TABLE `surveillants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `surveillants_fiche_surveillance_id_foreign` (`fiche_surveillance_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `chefs`
--
ALTER TABLE `chefs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cours`
--
ALTER TABLE `cours`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT pour la table `delegues`
--
ALTER TABLE `delegues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `enseignants`
--
ALTER TABLE `enseignants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fiches`
--
ALTER TABLE `fiches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `fiche_surveillances`
--
ALTER TABLE `fiche_surveillances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `fiche_travaux_pratiques`
--
ALTER TABLE `fiche_travaux_pratiques`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `filieres`
--
ALTER TABLE `filieres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `niveaux_etude`
--
ALTER TABLE `niveaux_etude`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `semestres`
--
ALTER TABLE `semestres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `surveillants`
--
ALTER TABLE `surveillants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `surveillants`
--
ALTER TABLE `surveillants`
  ADD CONSTRAINT `surveillants_fiche_surveillance_id_foreign` FOREIGN KEY (`fiche_surveillance_id`) REFERENCES `fiche_surveillances` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

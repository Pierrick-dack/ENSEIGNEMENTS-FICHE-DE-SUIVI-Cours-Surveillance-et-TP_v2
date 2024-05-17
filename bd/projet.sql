-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 17 mai 2024 à 14:01
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
(1, 'Chef', 'chef@gmail.com', '$2y$12$iLYDodo108GG35ioXqJYU.idviHDcfHuE4reFYfJJHG8huU.lyhaS', '2024-05-17 10:59:25', '2024-05-17 10:59:25');

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE `cours` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codeUE` varchar(255) NOT NULL,
  `intituleUE` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`id`, `codeUE`, `intituleUE`, `created_at`, `updated_at`) VALUES
(1, 'ICT101', 'Introduction to Business Information Systems', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(2, 'ICT102', 'Object-Oriented Programming', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(3, 'ICT103', 'Introduction to Programming', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(4, 'ICT104', 'Computer systems', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(5, 'ICT105', 'Introduction to algorithms', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(6, 'ICT106', 'Data Structures and Patterns I', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(7, 'ICT107', 'Mathematics for computer science I', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(8, 'ICT108', 'Creating Web Application', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(9, 'ICT109', 'Discrete Mathematics I', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(10, 'ICT110', 'Database Analysis and Design', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(11, 'ICT111', 'Data Coding', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(12, 'ICT201', 'Introduction to Software Engineering', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(13, 'ICT202', 'Software Development for Mobile devices', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(14, 'ICT203', 'Database Systems', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(15, 'ICT204', 'Introduction to Operating System', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(16, 'ICT205', 'Introduction to Programming in .NET', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(17, 'ICT206', 'Introduction to Computer Network', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(18, 'ICT207', 'Software Development in Java I', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(19, 'ICT208', 'Computer Architecture', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(20, 'ICT214', 'Introduction to Cryptography', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(21, 'ICT216', 'Network Administration', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(22, 'ICT218', 'Advanced Mobile Application Development', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(23, 'ICT301', 'Software Architectures and Design', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(24, 'ICT302', 'Introduction to Artificial Intelligence', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(25, 'ICT303', 'Data Communication and Security', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(26, 'ICT304', 'Software Testing and Deployment', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(27, 'ICT305', 'Web Application Development', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(28, 'ICT306', 'Business Intelligence', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(29, 'ICT307', 'Computer Systems Engineering', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(30, 'ICT308', 'Software Development in Java II', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(31, 'ICT310', 'Professional Issues in IT', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(32, 'ICT313', 'Cyber and Internet Security', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(33, 'ICT314', 'Computer Forensics and Incident Response', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(34, 'ICT315', 'Network Application Development', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(35, 'ICT316', 'Digital communication', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(36, 'ICT317', 'Information system', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(37, 'ICT318', 'Java Enterprise Edition', '2024-05-17 10:59:24', '2024-05-17 10:59:24');

-- --------------------------------------------------------

--
-- Structure de la table `delegues`
--

CREATE TABLE `delegues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nameDel` varchar(255) NOT NULL,
  `matDel` varchar(255) NOT NULL,
  `mdpDel` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `delegues`
--

INSERT INTO `delegues` (`id`, `nameDel`, `matDel`, `mdpDel`, `created_at`, `updated_at`) VALUES
(1, 'Pierrick', '21Q2493', '$2y$12$Z.oEY4i.IWg5l3v8Cmj57uanwuDrAdSCD9u9yKOVWFfRFQ3uiBe7K', '2024-05-17 10:59:24', '2024-05-17 10:59:24');

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
(1, 'test', 'test@gmail.com', '$2y$12$xKAbu0.TC.oa9/VBYNRySuem8NMKWOPti04qNGHNVF0dcXL1oOoD6', '2024-05-17 10:59:24', '2024-05-17 10:59:24');

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
(23, '2023_11_16_103149_create_niveaux_table', 1),
(217, '2014_10_12_000000_create_users_table', 2),
(218, '2014_10_12_100000_create_password_reset_tokens_table', 2),
(219, '2019_08_19_000000_create_failed_jobs_table', 2),
(220, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(221, '2023_11_16_102557_create_enseignants_table', 2),
(222, '2023_11_16_103040_create_delegues_table', 2),
(223, '2023_11_16_103129_create_fiches_table', 2),
(224, '2023_11_16_103139_create_filieres_table', 2),
(225, '2023_11_16_103156_create_cours_table', 2),
(226, '2023_11_16_113916_create_chefs_table', 2),
(227, '2023_12_07_091738_add_confidentialite_to_fiches_table', 2),
(228, '2024_02_08_192945_notifications', 2),
(229, '2024_04_22_174758_create_niveaux_etude_table', 2),
(230, '2024_04_25_074617_create_fiche_surveillances_table', 2),
(231, '2024_04_25_151335_create_surveillants_table', 2),
(232, '2024_05_17_095432_create_fiche_travaux_pratiques_table', 2);

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
(1, 'L1', 'Licence 1', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(2, 'L2', 'Licence 2', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(3, 'L3', 'Licence 3', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(4, 'M1', 'Master 1', '2024-05-17 10:59:24', '2024-05-17 10:59:24'),
(5, 'M2', 'Master 2', '2024-05-17 10:59:24', '2024-05-17 10:59:24');

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

CREATE TABLE `notifications` (
  `id` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `data` varchar(255) NOT NULL,
  `read_at` varchar(255) DEFAULT NULL,
  `notifiable` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Structure de la table `surveillants`
--

CREATE TABLE `surveillants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fiche_surveillance_id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Index pour la table `notifications`
--
ALTER TABLE `notifications`
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
-- AUTO_INCREMENT pour la table `cours`
--
ALTER TABLE `cours`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `delegues`
--
ALTER TABLE `delegues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `enseignants`
--
ALTER TABLE `enseignants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fiches`
--
ALTER TABLE `fiches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fiche_surveillances`
--
ALTER TABLE `fiche_surveillances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fiche_travaux_pratiques`
--
ALTER TABLE `fiche_travaux_pratiques`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `filieres`
--
ALTER TABLE `filieres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;

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
-- AUTO_INCREMENT pour la table `surveillants`
--
ALTER TABLE `surveillants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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

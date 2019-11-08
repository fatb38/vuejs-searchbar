-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le :  ven. 08 nov. 2019 à 14:04
-- Version du serveur :  5.7.26
-- Version de PHP :  7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `itemselector`
--

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

CREATE TABLE `customers` (
                             `id` int(10) UNSIGNED NOT NULL,
                             `firstname` varchar(40) NOT NULL,
                             `lastname` varchar(60) NOT NULL,
                             `email` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `customers`
--

INSERT INTO `customers` (`id`, `firstname`, `lastname`, `email`) VALUES
(1, 'John', 'Doe', 'john@doe.fr'),
(2, 'David', 'Reese', 'DavidGReese@teleworm.us'),
(3, 'Rosario', 'Boyce', 'RosarioKBoyce@dayrep.com'),
(4, 'Adam', 'Dawson', 'AdamKDawson@jourrapide.com'),
(5, 'Mathew', 'Doe', 'mathew@doe.fr'),
(6, 'David', 'Sparkle', 'dspk@tel.net'),
(7, 'Kyle', 'Reese', 'kyle@reese.net');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `customers`
--
ALTER TABLE `customers`
    ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `customers`
--
ALTER TABLE `customers`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

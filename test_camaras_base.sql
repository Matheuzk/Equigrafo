-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-01-2025 a las 02:52:31
-- Versión del servidor: 11.5.2-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `camaras_base`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_interface_theme`
--

CREATE TABLE `admin_interface_theme` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_visible` tinyint(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `logo_visible` tinyint(1) NOT NULL,
  `css_header_background_color` varchar(10) NOT NULL,
  `title_color` varchar(10) NOT NULL,
  `css_header_text_color` varchar(10) NOT NULL,
  `css_header_link_color` varchar(10) NOT NULL,
  `css_header_link_hover_color` varchar(10) NOT NULL,
  `css_module_background_color` varchar(10) NOT NULL,
  `css_module_text_color` varchar(10) NOT NULL,
  `css_module_link_color` varchar(10) NOT NULL,
  `css_module_link_hover_color` varchar(10) NOT NULL,
  `css_module_rounded_corners` tinyint(1) NOT NULL,
  `css_generic_link_color` varchar(10) NOT NULL,
  `css_generic_link_hover_color` varchar(10) NOT NULL,
  `css_save_button_background_color` varchar(10) NOT NULL,
  `css_save_button_background_hover_color` varchar(10) NOT NULL,
  `css_save_button_text_color` varchar(10) NOT NULL,
  `css_delete_button_background_color` varchar(10) NOT NULL,
  `css_delete_button_background_hover_color` varchar(10) NOT NULL,
  `css_delete_button_text_color` varchar(10) NOT NULL,
  `list_filter_dropdown` tinyint(1) NOT NULL,
  `related_modal_active` tinyint(1) NOT NULL,
  `related_modal_background_color` varchar(10) NOT NULL,
  `related_modal_rounded_corners` tinyint(1) NOT NULL,
  `logo_color` varchar(10) NOT NULL,
  `recent_actions_visible` tinyint(1) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `related_modal_background_opacity` varchar(5) NOT NULL,
  `env_name` varchar(50) NOT NULL,
  `env_visible_in_header` tinyint(1) NOT NULL,
  `env_color` varchar(10) NOT NULL,
  `env_visible_in_favicon` tinyint(1) NOT NULL,
  `related_modal_close_button_visible` tinyint(1) NOT NULL,
  `language_chooser_active` tinyint(1) NOT NULL,
  `language_chooser_display` varchar(10) NOT NULL,
  `list_filter_sticky` tinyint(1) NOT NULL,
  `form_pagination_sticky` tinyint(1) NOT NULL,
  `form_submit_sticky` tinyint(1) NOT NULL,
  `css_module_background_selected_color` varchar(10) NOT NULL,
  `css_module_link_selected_color` varchar(10) NOT NULL,
  `logo_max_height` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_height` >= 0),
  `logo_max_width` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_width` >= 0),
  `foldable_apps` tinyint(1) NOT NULL,
  `language_chooser_control` varchar(20) NOT NULL,
  `list_filter_highlight` tinyint(1) NOT NULL,
  `list_filter_removal_links` tinyint(1) NOT NULL,
  `show_fieldsets_as_tabs` tinyint(1) NOT NULL,
  `show_inlines_as_tabs` tinyint(1) NOT NULL,
  `css_generic_link_active_color` varchar(10) NOT NULL,
  `collapsible_stacked_inlines` tinyint(1) NOT NULL,
  `collapsible_stacked_inlines_collapsed` tinyint(1) NOT NULL,
  `collapsible_tabular_inlines` tinyint(1) NOT NULL,
  `collapsible_tabular_inlines_collapsed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `admin_interface_theme`
--

INSERT INTO `admin_interface_theme` (`id`, `name`, `active`, `title`, `title_visible`, `logo`, `logo_visible`, `css_header_background_color`, `title_color`, `css_header_text_color`, `css_header_link_color`, `css_header_link_hover_color`, `css_module_background_color`, `css_module_text_color`, `css_module_link_color`, `css_module_link_hover_color`, `css_module_rounded_corners`, `css_generic_link_color`, `css_generic_link_hover_color`, `css_save_button_background_color`, `css_save_button_background_hover_color`, `css_save_button_text_color`, `css_delete_button_background_color`, `css_delete_button_background_hover_color`, `css_delete_button_text_color`, `list_filter_dropdown`, `related_modal_active`, `related_modal_background_color`, `related_modal_rounded_corners`, `logo_color`, `recent_actions_visible`, `favicon`, `related_modal_background_opacity`, `env_name`, `env_visible_in_header`, `env_color`, `env_visible_in_favicon`, `related_modal_close_button_visible`, `language_chooser_active`, `language_chooser_display`, `list_filter_sticky`, `form_pagination_sticky`, `form_submit_sticky`, `css_module_background_selected_color`, `css_module_link_selected_color`, `logo_max_height`, `logo_max_width`, `foldable_apps`, `language_chooser_control`, `list_filter_highlight`, `list_filter_removal_links`, `show_fieldsets_as_tabs`, `show_inlines_as_tabs`, `css_generic_link_active_color`, `collapsible_stacked_inlines`, `collapsible_stacked_inlines_collapsed`, `collapsible_tabular_inlines`, `collapsible_tabular_inlines_collapsed`) VALUES
(1, 'Equigrafo', 1, 'Administración de EquiGrafo', 1, 'admin-interface/logo/Diseño_sin_título_17Qdvqs.png', 1, '#303030', '#F5F5F5', '#FFFFFF', '#FFFFFF', '#F05D9B', '#9687CA', '#FFFFFF', '#FFFFFF', '#CDF0EF', 1, '#303030', '#3E89A2', '#5F5F68', '#845A87', '#FFFFFF', '#BA2121', '#A41515', '#FFFFFF', 1, 1, '#000000', 1, '#FFFFFF', 1, 'admin-interface/favicon/Diseño_sin_títulos.png', '0.3', 'EquiGrafo', 1, '#FFFEF1', 0, 1, 1, 'code', 1, 0, 0, '#EAE4FF', '#FFFFFF', 50, 200, 1, 'default-select', 1, 0, 0, 0, '#29B864', 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add camaras_base', 7, 'add_camaras_base'),
(26, 'Can change camaras_base', 7, 'change_camaras_base'),
(27, 'Can delete camaras_base', 7, 'delete_camaras_base'),
(28, 'Can view camaras_base', 7, 'view_camaras_base'),
(29, 'Can add user', 8, 'add_empleado'),
(30, 'Can change user', 8, 'change_empleado'),
(31, 'Can delete user', 8, 'delete_empleado'),
(32, 'Can view user', 8, 'view_empleado'),
(33, 'Can add usuario', 9, 'add_usuario'),
(34, 'Can change usuario', 9, 'change_usuario'),
(35, 'Can delete usuario', 9, 'delete_usuario'),
(36, 'Can view usuario', 9, 'view_usuario'),
(37, 'Can add factura', 10, 'add_factura'),
(38, 'Can change factura', 10, 'change_factura'),
(39, 'Can delete factura', 10, 'delete_factura'),
(40, 'Can view factura', 10, 'view_factura'),
(41, 'Can add detalle factura', 11, 'add_detallefactura'),
(42, 'Can change detalle factura', 11, 'change_detallefactura'),
(43, 'Can delete detalle factura', 11, 'delete_detallefactura'),
(44, 'Can view detalle factura', 11, 'view_detallefactura'),
(45, 'Can add Theme', 12, 'add_theme'),
(46, 'Can change Theme', 12, 'change_theme'),
(47, 'Can delete Theme', 12, 'delete_theme'),
(48, 'Can view Theme', 12, 'view_theme'),
(49, 'Can add producto factura', 13, 'add_productofactura'),
(50, 'Can change producto factura', 13, 'change_productofactura'),
(51, 'Can delete producto factura', 13, 'delete_productofactura'),
(52, 'Can view producto factura', 13, 'view_productofactura');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, '1649', '2024-09-16 16:00:49.314894', 1, 'matheuzkm', '', '', 'valenciarojakm@gmail.com', 1, 1, '2024-09-16 15:59:03.575029');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_uca1400_ai_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-09-25 20:13:09', '2', 'Titulo: Panasonic Descripcion: ñ', 1, '[{\"added\": {}}]', 7, 2),
(2, '2024-09-25 20:13:33', '2', 'Titulo: Panasonic Descripcion: ñ', 3, '', 7, 2),
(3, '2024-09-25 20:30:30', '4', 'Titulo: Nikon Descripcion: klj', 1, '[{\"added\": {}}]', 7, 2),
(4, '2024-09-25 20:32:15', '4', 'Titulo: Nikon Descripcion: klj', 3, '', 7, 2),
(5, '2024-09-25 22:01:32', '5', 'Titulo: Kodak Descripcion: lkuu', 1, '[{\"added\": {}}]', 7, 2),
(6, '2024-09-26 02:09:23', '5', 'Titulo: Kodak 24343w Descripcion: lkuu', 2, '[{\"changed\": {\"fields\": [\"Titulo\"]}}]', 7, 2),
(7, '2024-09-26 23:04:33', '13', 'Titulo: Sony Descripcion: oiu', 1, '[{\"added\": {}}]', 7, 2),
(8, '2024-10-09 17:58:38', '33', 'Titulo: Canon EOS Rebel T8i Descripcion: DSLR de 24.1 MP con video 4K y enfoque automático de 45 puntos. Ideal para principiantes que buscan facilidad de uso y calidad de imagen​', 2, '[]', 7, 2),
(9, '2024-10-11 14:58:36', '10', 'valenciarojasmatheuzantonio@gmail.com', 3, '', 9, 2),
(10, '2024-10-11 14:58:47', '1', 'mateo_valencia23212@elpoli.edu.co', 3, '', 9, 2),
(11, '2024-10-11 14:59:00', '11', 'maria@gmail.com', 3, '', 9, 2),
(12, '2024-10-11 15:02:24', '9', 'roberto@gmail.com', 2, '[{\"changed\": {\"fields\": [\"Cargo\"]}}]', 9, 2),
(13, '2024-10-11 15:02:34', '5', 'mary@gmail.com', 3, '', 9, 2),
(14, '2024-10-11 15:03:10', '4', 'lala@gmail.com', 3, '', 9, 2),
(15, '2024-10-11 15:03:20', '3', 'alfredo@gmail.com', 3, '', 9, 2),
(16, '2024-10-11 15:10:41', '2', 'valenciarojaskm@gmail.com', 2, '[{\"changed\": {\"fields\": [\"Cargo\"]}}]', 9, 2),
(17, '2024-10-12 01:22:47', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 12, 2),
(18, '2024-10-12 01:23:25', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Color\"]}}]', 12, 2),
(19, '2024-10-12 01:26:26', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 12, 2),
(20, '2024-10-12 01:32:41', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Color\"]}}]', 12, 2),
(21, '2024-10-12 01:33:34', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Link hover color\"]}}]', 12, 2),
(22, '2024-10-12 01:34:22', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Link hover color\", \"Background hover color\"]}}]', 12, 2),
(23, '2024-10-12 01:35:20', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Background color\"]}}]', 12, 2),
(24, '2024-10-12 01:37:05', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Logo\"]}}]', 12, 2),
(25, '2024-10-12 01:40:50', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Logo\"]}}]', 12, 2),
(26, '2024-10-12 01:42:22', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Logo\"]}}]', 12, 2),
(27, '2024-10-12 01:48:28', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Logo\"]}}]', 12, 2),
(28, '2024-10-12 01:49:18', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Max width\", \"Max height\"]}}]', 12, 2),
(29, '2024-10-12 01:49:42', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Background color\"]}}]', 12, 2),
(30, '2024-10-12 01:53:53', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Color\"]}}]', 12, 2),
(31, '2024-10-12 01:54:06', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Color\"]}}]', 12, 2),
(32, '2024-10-12 01:55:23', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Visible in favicon (marker)\"]}}]', 12, 2),
(33, '2024-10-12 02:02:21', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Favicon\"]}}]', 12, 2),
(34, '2024-10-12 02:04:02', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Visible\"]}}]', 12, 2),
(35, '2024-10-12 02:04:32', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Max width\", \"Max height\"]}}]', 12, 2),
(36, '2024-10-12 02:16:35', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Max width\", \"Max height\"]}}]', 12, 2),
(37, '2024-10-12 02:16:49', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Max height\"]}}]', 12, 2),
(38, '2024-10-12 02:17:25', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Text color\", \"Link hover color\"]}}]', 12, 2),
(39, '2024-10-12 02:17:51', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Visible\"]}}]', 12, 2),
(40, '2024-10-12 02:18:47', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Background color\"]}}]', 12, 2),
(41, '2024-10-12 02:19:57', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Background color\"]}}]', 12, 2),
(42, '2024-10-12 02:20:30', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Text color\"]}}]', 12, 2),
(43, '2024-10-12 02:21:05', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Background color\", \"Text color\"]}}]', 12, 2),
(44, '2024-10-12 02:21:43', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Background selected color\"]}}]', 12, 2),
(45, '2024-10-12 02:22:07', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Background selected color\"]}}]', 12, 2),
(46, '2024-10-12 02:22:26', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Background selected color\"]}}]', 12, 2),
(47, '2024-10-12 02:22:47', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Background selected color\"]}}]', 12, 2),
(48, '2024-10-12 02:23:04', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Background color\"]}}]', 12, 2),
(49, '2024-10-12 02:23:44', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Background color\"]}}]', 12, 2),
(50, '2024-10-12 02:24:39', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Background color\"]}}]', 12, 2),
(51, '2024-10-12 02:27:13', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Link hover color\"]}}]', 12, 2),
(52, '2024-10-12 02:27:56', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Link hover color\"]}}]', 12, 2),
(53, '2024-10-12 02:28:11', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Link hover color\"]}}]', 12, 2),
(54, '2024-10-12 02:29:09', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Background color\", \"Background hover color\"]}}]', 12, 2),
(55, '2024-10-12 02:30:07', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Background hover color\"]}}]', 12, 2),
(56, '2024-10-12 02:30:53', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Background color\"]}}]', 12, 2),
(57, '2024-10-12 02:31:25', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Background hover color\"]}}]', 12, 2),
(58, '2024-10-12 02:33:35', '1', 'Equigrafo', 2, '[{\"changed\": {\"fields\": [\"Link color\", \"Link hover color\"]}}]', 12, 2),
(59, '2024-12-17 16:03:31', '21', 'jose@gmail.com', 3, '', 9, 2),
(60, '2024-12-17 16:04:19', '19', 'pablo@gmail.com', 3, '', 9, 2),
(61, '2024-12-17 16:04:38', '20', 'minex@gmail.com', 3, '', 9, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(12, 'admin_interface', 'theme'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'libreria', 'camaras_base'),
(11, 'libreria', 'detallefactura'),
(8, 'libreria', 'empleado'),
(10, 'libreria', 'factura'),
(13, 'libreria', 'productofactura'),
(9, 'libreria', 'usuario'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(29, 'libreria', '0001_initial', '2024-09-25 19:26:20.430607'),
(30, 'contenttypes', '0001_initial', '2024-09-25 19:42:26.541568'),
(31, 'auth', '0001_initial', '2024-09-25 19:42:27.079785'),
(32, 'admin', '0001_initial', '2024-09-25 19:42:27.687664'),
(33, 'sessions', '0001_initial', '2024-09-25 19:42:28.252653'),
(36, 'contenttypes', '0002_remove_content_type_name', '2024-09-25 19:44:39.331298'),
(37, 'auth', '0002_alter_permission_name_max_length', '2024-09-25 19:44:39.341302'),
(38, 'auth', '0003_alter_user_email_max_length', '2024-09-25 19:44:39.345305'),
(39, 'auth', '0004_alter_user_username_opts', '2024-09-25 19:44:39.348304'),
(40, 'auth', '0005_alter_user_last_login_null', '2024-09-25 19:44:39.352304'),
(41, 'auth', '0006_require_contenttypes_0002', '2024-09-25 19:44:39.354306'),
(42, 'auth', '0007_alter_validators_add_error_messages', '2024-09-25 19:44:39.359401'),
(43, 'auth', '0008_alter_user_username_max_length', '2024-09-25 19:44:39.362299'),
(44, 'auth', '0009_alter_user_last_name_max_length', '2024-09-25 19:44:39.366304'),
(45, 'auth', '0010_alter_group_name_max_length', '2024-09-25 19:44:39.377300'),
(46, 'auth', '0011_update_proxy_permissions', '2024-09-25 19:44:39.382317'),
(47, 'auth', '0012_alter_user_first_name_max_length', '2024-09-25 19:44:39.387305'),
(48, 'admin', '0002_logentry_remove_auto_add', '2024-09-25 19:53:34.855591'),
(49, 'admin', '0003_logentry_add_action_flag_choices', '2024-09-25 19:53:34.859572'),
(50, 'libreria', '0002_camaras_base_cantidad', '2024-09-26 00:20:32.703118'),
(51, 'libreria', '0003_usuario_cedula_usuario_celular_usuario_direccion_and_more', '2024-09-26 14:21:53.411163'),
(52, 'libreria', '0004_usuario_apellido_usuario_nombre', '2024-09-26 14:33:04.964456'),
(53, 'libreria', '0005_remove_usuario_celular', '2024-09-26 16:09:32.351907'),
(54, 'libreria', '0006_usuario_celular_alter_usuario_cedula', '2024-09-26 16:16:23.650962'),
(55, 'libreria', '0007_camaras_base_precio', '2024-09-26 21:11:58.749255'),
(56, 'libreria', '0008_alter_camaras_base_precio', '2024-09-26 22:55:27.623649'),
(57, 'libreria', '0009_usuario_cargo', '2024-10-11 13:47:54.407086'),
(58, 'libreria', '0010_remove_usuario_cargo', '2024-10-11 14:10:20.972272'),
(59, 'libreria', '0011_usuario_cargo', '2024-10-11 14:41:16.535153'),
(60, 'libreria', '0012_alter_usuario_cargo', '2024-10-11 15:11:03.497489'),
(61, 'libreria', '0013_factura', '2024-10-11 16:10:00.949692'),
(62, 'libreria', '0014_delete_factura', '2024-10-11 16:18:50.825075'),
(63, 'libreria', '0015_factura_detallefactura', '2024-10-11 17:01:28.623258'),
(64, 'admin_interface', '0001_initial', '2024-10-12 01:20:50.111049'),
(65, 'admin_interface', '0002_add_related_modal', '2024-10-12 01:20:50.171141'),
(66, 'admin_interface', '0003_add_logo_color', '2024-10-12 01:20:50.187141'),
(67, 'admin_interface', '0004_rename_title_color', '2024-10-12 01:20:50.195147'),
(68, 'admin_interface', '0005_add_recent_actions_visible', '2024-10-12 01:20:50.210654'),
(69, 'admin_interface', '0006_bytes_to_str', '2024-10-12 01:20:50.254734'),
(70, 'admin_interface', '0007_add_favicon', '2024-10-12 01:20:50.270659'),
(71, 'admin_interface', '0008_change_related_modal_background_opacity_type', '2024-10-12 01:20:50.292670'),
(72, 'admin_interface', '0009_add_enviroment', '2024-10-12 01:20:50.321811'),
(73, 'admin_interface', '0010_add_localization', '2024-10-12 01:20:50.332813'),
(74, 'admin_interface', '0011_add_environment_options', '2024-10-12 01:20:50.387810'),
(75, 'admin_interface', '0012_update_verbose_names', '2024-10-12 01:20:50.390811'),
(76, 'admin_interface', '0013_add_related_modal_close_button', '2024-10-12 01:20:50.404815'),
(77, 'admin_interface', '0014_name_unique', '2024-10-12 01:20:50.414837'),
(78, 'admin_interface', '0015_add_language_chooser_active', '2024-10-12 01:20:50.429838'),
(79, 'admin_interface', '0016_add_language_chooser_display', '2024-10-12 01:20:50.445845'),
(80, 'admin_interface', '0017_change_list_filter_dropdown', '2024-10-12 01:20:50.448839'),
(81, 'admin_interface', '0018_theme_list_filter_sticky', '2024-10-12 01:20:50.464843'),
(82, 'admin_interface', '0019_add_form_sticky', '2024-10-12 01:20:50.494838'),
(83, 'admin_interface', '0020_module_selected_colors', '2024-10-12 01:20:50.534203'),
(84, 'admin_interface', '0021_file_extension_validator', '2024-10-12 01:20:50.541202'),
(85, 'admin_interface', '0022_add_logo_max_width_and_height', '2024-10-12 01:20:50.572227'),
(86, 'admin_interface', '0023_theme_foldable_apps', '2024-10-12 01:20:50.617725'),
(87, 'admin_interface', '0024_remove_theme_css', '2024-10-12 01:20:50.631726'),
(88, 'admin_interface', '0025_theme_language_chooser_control', '2024-10-12 01:20:50.650732'),
(89, 'admin_interface', '0026_theme_list_filter_highlight', '2024-10-12 01:20:50.666724'),
(90, 'admin_interface', '0027_theme_list_filter_removal_links', '2024-10-12 01:20:50.682725'),
(91, 'admin_interface', '0028_theme_show_fieldsets_as_tabs_and_more', '2024-10-12 01:20:50.711843'),
(92, 'admin_interface', '0029_theme_css_generic_link_active_color', '2024-10-12 01:20:50.728942'),
(93, 'admin_interface', '0030_theme_collapsible_stacked_inlines_and_more', '2024-10-12 01:20:50.789937'),
(94, 'libreria', '0016_remove_factura_empleado_delete_detallefactura_and_more', '2024-10-15 21:59:48.592634'),
(95, 'libreria', '0017_factura_productofactura_factura_productos', '2024-10-15 22:03:04.510080'),
(96, 'libreria', '0018_camaras_base_precio_oferta', '2024-10-16 23:09:02.667671'),
(97, 'libreria', '0019_rename_precio_oferta_camaras_base_precio_compra', '2024-10-16 23:18:06.490972'),
(98, 'libreria', '0020_alter_factura_total_pagado_and_more', '2024-10-24 13:53:24.208377'),
(99, 'libreria', '0021_alter_camaras_base_precio_and_more', '2024-10-24 14:22:52.587074');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('996d11sj00qdcdwrwuhzconxmi2zf1gk', '.eJxVjMEOwiAQRP-Fc0MWii149O43kIVdpGogKe3J-O-2SQ82mdO8N_MRHtcl-7Xx7CcSV6EG0f2XAeOLy07oieVRZaxlmacgd0UetMl7JX7fDvd0kLHlbc3ACoHT6FATKm1YWUojp8hAaC_BBA24pTc9RMcJwRo1QLLGaU1RfH8wODim:1t1ATx:AmK4YzPEMbq3ZO6pULTBPvO6DjL8QDCNyT--o5eexCk', '2024-10-30 20:18:57.533189'),
('g0zxcsz6rwxr9z8iokqevvrqv4gf8ck3', 'e30:1stre3:4CeBiVXBGQOrKCbxM1aVfdq4aTR6FP7uoQQGZeUghA8', '2024-10-10 16:47:11.134731'),
('tlq67zquysyxh31wzk8di9qybwxs4ogl', '.eJxVjDsOwjAQBe_iGln24l8o6XMGa7324gBypDipEHeHSCmgfTPzXiLitta49bLEKYuLAHH63RLSo7Qd5Du22yxpbusyJbkr8qBdjnMuz-vh_h1U7PVbMzgolFU5B7RstGUEMgEHpZgdEFlOoXjUiZMndsgwZEha-eC8NVa8Pwi9OJQ:1svmDS:WVo-F-Is4H76SR6u-nFD98v04GZtOJgKutTRCVxeuas', '2024-10-15 23:23:38.290317'),
('u7dvfg7mbejyq2xirmqust74mmh75gd5', '.eJxVjEEOwiAQRe_C2hCYTim4dN8zkIEBqRqalHZlvLtt0oVu_3vvv4WnbS1-a2nxE4urAHH53QLFZ6oH4AfV-yzjXNdlCvJQ5EmbHGdOr9vp_h0UamWvDbo-OgQbSFlGyBwi6cFmdDkDd1pbiLtgULO1xiVFJifsgBTRkHrx-QLeEzfe:1tPtjr:I6OdMndWE6xs8uOUKlp0wAi5IihZiEaP5qbbG-__hxU', '2025-01-07 01:29:35.547453'),
('vzh1n5huvbi8pj9eovv0rd6xcp09njnz', '.eJxVjDsOwjAQBe_iGln24l8o6XMGa7324gBypDipEHeHSCmgfTPzXiLitta49bLEKYuLAHH63RLSo7Qd5Du22yxpbusyJbkr8qBdjnMuz-vh_h1U7PVbMzgolFU5B7RstGUEMgEHpZgdEFlOoXjUiZMndsgwZEha-eC8NVa8Pwi9OJQ:1t9ZMK:BfZKLXRszpUzj0aehn7uCOqzZF2tdAUt5lPYhw3eLms', '2024-11-23 00:29:48.747009');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libreria_camaras_base`
--

CREATE TABLE `libreria_camaras_base` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `descripcion` longtext DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `precio_compra` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libreria_camaras_base`
--

INSERT INTO `libreria_camaras_base` (`id`, `titulo`, `image`, `descripcion`, `cantidad`, `precio`, `precio_compra`) VALUES
(1, 'Panasonic', 'imagenes/2.jpg', 'funciona', 0, 3300000.00, 2000000.00),
(3, 'Nikon Z5: Entrada a lo Profesional', 'imagenes/3_K6w9WVH.jpg', 'Cámara mirrorless full-frame con resolución de 24.3 MP y estabilización de imagen, perfecta para explorar la fotografía de formato completo.', 1, 4500000.00, 3000000.00),
(5, 'Kodak PIXPRO AZ901', 'imagenes/6.jpg', 'Cámara bridge con zoom óptico de 90x y sensor de 20.68 MP, perfecta para paisajes y sujetos lejanos. Graba en Full HD y tiene Wi-Fi.', 3, 4500000.00, 3000000.00),
(6, 'Hasselblad X2D 100C', 'imagenes/450_1000.jpg', 'Cámara mirrorless de formato medio con sensor de 100 MP, estabilización en 5 ejes y enfoque automático preciso.', 3, 2000000.00, 1000000.00),
(7, 'Sony Alpha 1: El Tope de la Tecnología', 'imagenes/4.jpg', 'Cámara full-frame con sensor de 50.1 MP, disparo continuo de 30 fps y grabación en 8K. Diseñada para profesionales que necesitan lo mejor en cada aspecto.', 0, 2300000.00, 1200000.00),
(9, 'Sony Alpha 7 IV', 'imagenes/9.jpg', 'Cámara mirrorless full-frame de 33 MP con grabación en 4K, enfoque automático avanzado y excelente rendimiento en poca luz.', 1, 4500000.00, 3300000.00),
(10, 'Fujifilm X-T4', 'imagenes/11.jpg', 'Cámara mirrorless APS-C de 26.1 MP con estabilización en 5 ejes y grabación en 4K. Perfecta para quienes buscan un diseño retro y calidad de imagen vibran', 3, 4500000.00, 3300000.00),
(11, 'Kodak DCS Pro SLR/n', 'imagenes/12.jpg', 'Cámara DSLR full-frame de 14 MP, ideal para fotógrafos profesionales que buscan alta resolución y compatibilidad con lentes Nikon F, ofreciendo excelente calidad de imagen y control avanzado.', 1, 6000000.00, 5000000.00),
(12, 'Canon EOS 7D Mark II', 'imagenes/10.jpg', 'DSLR de 20.2 MP con ráfaga de 10 fps y enfoque rápido. Ideal para fotografía deportiva y de acción', 3, 4500000.00, 3300000.00),
(15, 'Nikon D5600 Creatividad Sin Límites', 'imagenes/2_y5uFZkq.jpg', 'Una DSLR compacta con un sensor de 24.2 MP y pantalla táctil abatible para explorar ángulos creativos y capturar cada momento.', 3, 5000000.00, 4000000.00),
(16, 'Nikon Z50: Ligera y Versátil', 'imagenes/3.jpg', 'Cámara mirrorless con sensor APS-C de 20.9 MP, perfecta para viajes y fotografía diaria con su diseño compacto y conectividad fácil.', 2, 2300000.00, 1500000.00),
(17, 'Nikon D850: Máxima Resolución', 'imagenes/9_TarZXOv.jpg', 'DSLR de fotograma completo con sensor de 45.7 MP y rendimiento profesional para fotografía de paisajes y retratos detallados.', 3, 4500000.00, 3300000.00),
(18, 'Nikon Z7 II: Detalles de Alto Nivel', 'imagenes/10_BSyFgwp.jpg', 'Mirrorless con sensor de 45.7 MP y enfoque preciso. Ideal para quienes buscan calidad de imagen y rendimiento en un cuerpo compacto.', 2, 4500000.00, 3000000.00),
(19, 'Nikon D750: Equilibrio Perfecto', 'imagenes/12_hiXSBaB.jpg', 'DSLR de fotograma completo con sensor de 24.3 MP y gran rendimiento en fotografía y video, ideal para entusiastas avanzados.', 0, 2300000.00, 1500000.00),
(20, 'Nikon Coolpix W300 Aventura en Cualquier Lugar', 'imagenes/4_qI9hf4u.jpg', 'Compacta resistente al agua, golpes y congelación, con sensor de 16 MP y capacidad para video en 4K, ideal para aventuras extremas.', 1, 5000000.00, 4100000.00),
(21, 'Sony Alpha 7 III: El Nuevo Estándar', 'imagenes/12_8SsoARg.jpg', 'Cámara mirrorless full-frame con sensor de 24.2 MP, enfoque rápido y grabación en 4K. Perfecta para profesionales que buscan versatilidad.', 1, 5000000.00, 4000000.00),
(22, 'Sony Alpha 7R IV: Resolución Suprema', 'imagenes/13.jpg', 'Sensor de 61 MP para imágenes detalladas y rango dinámico impresionante. Ideal para fotografía de paisajes y estudios.', 4, 5300000.00, 4000000.00),
(23, 'Sony Alpha 6400: Potencia en un Tamaño Compacto', 'imagenes/14.jpg', 'Cámara APS-C con enfoque automático ultrarrápido y video 4K. Ideal para vlogs y fotografía de viajes.', 4, 4500000.00, 3000000.00),
(24, 'Sony RX10 IV: Superzoom Todo en Uno', 'imagenes/15.jpg', 'Cámara puente con lente de 24-600mm y sensor de 20.1 MP, combinando zoom extremo y rendimiento profesional.', 5, 2000000.00, 1500000.00),
(27, 'Canon EOS 6D Mark II', 'imagenes/8.jpg', 'DSLR full-frame de 26.2 MP con video Full HD y GPS integrado. Excelente para fotógrafos de paisaje y retrato', 4, 2000000.00, 1500000.00),
(29, 'Canon EOS R6', 'imagenes/3_oBmLUmE.jpg', 'Cámara mirrorless con sensor de 20 MP y estabilización de imagen de 5 ejes. Captura en 4K a 60 fps y tiene enfoque automático avanzado, ideal para fotografía y video de alta calidad​', 0, 4500000.00, 3300000.00),
(30, 'Canon EOS M6 Mark II', 'imagenes/5.jpg', 'Compacta y ligera, con sensor APS-C de 32.5 MP. Graba video en 4K y tiene ráfaga de 14 fps. Perfecta para fotografía cotidiana y viajes​', 3, 5000000.00, 4000000.00),
(31, 'Canon EOS R5', 'imagenes/7.jpg', 'Cámara sin espejo con sensor de 45 MP y grabación en 8K. Sistema de enfoque avanzado y estabilización incorporada, ideal para profesionale', 2, 5000000.00, 4100000.00),
(32, 'Canon EOS 90D', 'imagenes/11_5s5Bdn6.jpg', 'DSLR con sensor APS-C de 32.5 MP, ráfaga de 10 fps y video 4K. Versátil y potente para fotografía deportiva y de naturaleza​', 1, 4500000.00, 3300000.00),
(33, 'Canon EOS Rebel T8i', 'imagenes/6_N4Cv6Gc.jpg', 'DSLR de 24.1 MP con video 4K y enfoque automático de 45 puntos. Ideal para principiantes que buscan facilidad de uso y calidad de imagen​', 0, 2300000.00, 1000000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libreria_factura`
--

CREATE TABLE `libreria_factura` (
  `id` bigint(20) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `total_pagado` decimal(12,2) NOT NULL,
  `total_vendido` decimal(12,2) NOT NULL,
  `restante` decimal(10,2) NOT NULL,
  `empleado_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libreria_factura`
--

INSERT INTO `libreria_factura` (`id`, `fecha`, `total_pagado`, `total_vendido`, `restante`, `empleado_id`) VALUES
(69, '2024-10-24 23:59:24.880055', 12600000.00, 12500000.00, 100000.00, 17),
(70, '2024-10-25 00:38:47.419734', 10000000.00, 9500000.00, 500000.00, 2),
(71, '2024-10-25 01:59:27.992967', 4500000.00, 4500000.00, 0.00, 15),
(72, '2024-10-25 14:30:34.741395', 15000000.00, 15000000.00, 0.00, 15),
(73, '2024-10-25 14:45:49.906609', 10600000.00, 10500000.00, 100000.00, 2),
(74, '2024-10-27 15:37:51.013205', 5000000.00, 4500000.00, 500000.00, 2),
(75, '2024-10-27 15:52:28.468302', 8400000.00, 8300000.00, 100000.00, 18),
(76, '2024-10-28 14:33:37.593943', 2300000.00, 2300000.00, 0.00, 15),
(77, '2024-10-29 13:46:28.369793', 8000000.00, 7800000.00, 200000.00, 2),
(97, '2024-10-30 02:03:38.686057', 9000000.00, 8500000.00, 500000.00, 2),
(98, '2024-10-30 02:07:39.632592', 5000000.00, 4500000.00, 500000.00, 2),
(99, '2024-10-31 22:50:34.021979', 4500000.00, 4500000.00, 0.00, 2),
(102, '2024-11-08 14:28:21.334942', 4600000.00, 4500000.00, 100000.00, 2),
(103, '2024-11-11 08:16:28.410371', 5000000.00, 4500000.00, 500000.00, 2),
(104, '2024-11-15 02:33:03.763846', 7000000.00, 6800000.00, 200000.00, 2),
(106, '2024-11-18 15:55:10.701184', 4500000.00, 4500000.00, 0.00, 2),
(107, '2024-11-27 16:27:17.209024', 5000000.00, 5000000.00, 0.00, 2),
(108, '2024-12-10 02:29:34.698304', 4000000.00, 3300000.00, 700000.00, 2),
(110, '2024-12-17 16:06:23.608170', 6000000.00, 6000000.00, 0.00, 2),
(111, '2024-12-17 16:06:39.111780', 2000000.00, 2000000.00, 0.00, 2),
(112, '2024-12-18 13:49:43.732000', 5000000.00, 4500000.00, 500000.00, 22),
(113, '2024-12-24 01:31:05.402109', 5000000.00, 4500000.00, 500000.00, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libreria_productofactura`
--

CREATE TABLE `libreria_productofactura` (
  `id` bigint(20) NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL CHECK (`cantidad` >= 0),
  `precio_unitario` decimal(10,2) NOT NULL,
  `factura_id` bigint(20) NOT NULL,
  `producto_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libreria_productofactura`
--

INSERT INTO `libreria_productofactura` (`id`, `cantidad`, `precio_unitario`, `factura_id`, `producto_id`) VALUES
(82, 1, 4500000.00, 69, 3),
(83, 1, 2000000.00, 69, 6),
(84, 1, 6000000.00, 69, 11),
(85, 1, 5000000.00, 70, 21),
(86, 1, 4500000.00, 70, 23),
(87, 1, 4500000.00, 71, 3),
(88, 1, 4500000.00, 72, 10),
(89, 1, 4500000.00, 72, 12),
(90, 1, 6000000.00, 72, 11),
(91, 1, 4500000.00, 73, 5),
(92, 1, 6000000.00, 73, 11),
(93, 1, 4500000.00, 74, 3),
(94, 1, 2300000.00, 75, 7),
(95, 1, 6000000.00, 75, 11),
(96, 1, 2300000.00, 76, 7),
(97, 1, 4500000.00, 77, 9),
(98, 1, 3300000.00, 77, 1),
(119, 1, 4500000.00, 97, 3),
(120, 2, 2000000.00, 97, 6),
(121, 1, 4500000.00, 98, 5),
(122, 1, 4500000.00, 99, 3),
(125, 1, 4500000.00, 102, 5),
(126, 1, 4500000.00, 103, 3),
(127, 1, 2300000.00, 104, 7),
(128, 1, 4500000.00, 104, 9),
(131, 1, 4500000.00, 106, 3),
(132, 1, 5000000.00, 107, 21),
(133, 1, 3300000.00, 108, 1),
(135, 1, 6000000.00, 110, 11),
(136, 1, 2000000.00, 111, 24),
(137, 1, 4500000.00, 112, 5),
(138, 1, 4500000.00, 113, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libreria_usuario`
--

CREATE TABLE `libreria_usuario` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `cargo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libreria_usuario`
--

INSERT INTO `libreria_usuario` (`id`, `password`, `last_login`, `email`, `username`, `is_active`, `is_admin`, `cedula`, `direccion`, `fecha_nacimiento`, `apellido`, `nombre`, `celular`, `cargo`) VALUES
(2, 'pbkdf2_sha256$720000$eMJfFO47F8aat79XZEP00X$qqk/0WKoQ4BeFGVgoqkOaLo+3tbM6ndi9RCpa8ASGPs=', '2024-12-24 01:29:35.545442', 'valenciarojaskm@gmail.com', 'mateo', 1, 1, '12345678', 'Carrera 53 #60-10', '2003-05-07', 'Valencia Rojas', 'Mateo Antonio', '3106794916', 'Gerente'),
(9, 'pbkdf2_sha256$870000$Exxams6GTdH1eLASk1KZcY$od5iYm2z9ihUc7fiURB96LYON7RanxKeKBJICdrj+0I=', '2024-10-25 02:00:58.378033', 'roberto@gmail.com', 'roberto', 1, 0, '1000900381', 'Carrera 53 # 60 -10', '2009-05-14', 'lopez', 'roberto', '123213', 'Atención al cliente'),
(15, 'pbkdf2_sha256$870000$cSnODd2qrawK8ow1PHiSfZ$xQW6/RWfbL4vFdOzkU6nEhjNxQLWZxcRisVL7WOx5pM=', '2024-11-08 14:29:34.868347', 'mariavqs@gmail.com', 'mary', 1, 0, '198575437', 'Calle 48 # 10-30', '1998-01-08', 'quiñones saez', 'maria victoria', '23432423', 'Cajero'),
(17, 'pbkdf2_sha256$870000$dj7t21hzp0OpKk7w5sFIJO$UT0iNin/RNhl1JW/fbKihdcPRusaaFgKpZ+9q+yXvhc=', '2024-11-14 18:47:30.888847', 'juliana@gamil.com', 'july', 1, 0, '1000900388', 'Calle 53 # 60 -10', '2024-10-15', 'gonzales', 'juliana', '123213', 'Gerente'),
(18, 'pbkdf2_sha256$870000$OXpgyFjhDbpeAY5eyFQxbs$9dVSHtzG4gYZ7ESYiSXA9qs8hWEgH0MP7dkN1cNkayI=', '2024-10-27 15:51:21.193229', 'gambino123@gmail.com', 'gambi', 1, 0, '1000900380', 'Carrera 78 # 30-10', '2024-10-03', 'gambino', 'Cucuta', '123213', 'Asistente'),
(22, 'pbkdf2_sha256$870000$6sjMZDvZN5EpSXilHHGIZt$ureLEN7rNQVoxh0D4VB9k+P97HvOmJHLr6uMeGnFbJQ=', '2024-12-18 13:48:49.447394', 'pablo@gmail.com', 'pablo', 1, 0, '100090034', 'Avenida Carrera 53 # 60 -10', '2024-12-08', 'valencia', 'lopez', '123213', 'Cajero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_interface_theme_name_30bda70f_uniq` (`name`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `libreria_camaras_base`
--
ALTER TABLE `libreria_camaras_base`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `libreria_factura`
--
ALTER TABLE `libreria_factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `libreria_factura_empleado_id_0029829a_fk_libreria_usuario_id` (`empleado_id`);

--
-- Indices de la tabla `libreria_productofactura`
--
ALTER TABLE `libreria_productofactura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `libreria_productofac_factura_id_6f583d90_fk_libreria_` (`factura_id`),
  ADD KEY `libreria_productofac_producto_id_5f20a300_fk_libreria_` (`producto_id`);

--
-- Indices de la tabla `libreria_usuario`
--
ALTER TABLE `libreria_usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `libreria_usuario_cedula_4524453a_uniq` (`cedula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de la tabla `libreria_camaras_base`
--
ALTER TABLE `libreria_camaras_base`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `libreria_factura`
--
ALTER TABLE `libreria_factura`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT de la tabla `libreria_productofactura`
--
ALTER TABLE `libreria_productofactura`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT de la tabla `libreria_usuario`
--
ALTER TABLE `libreria_usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `libreria_factura`
--
ALTER TABLE `libreria_factura`
  ADD CONSTRAINT `libreria_factura_empleado_id_0029829a_fk_libreria_usuario_id` FOREIGN KEY (`empleado_id`) REFERENCES `libreria_usuario` (`id`);

--
-- Filtros para la tabla `libreria_productofactura`
--
ALTER TABLE `libreria_productofactura`
  ADD CONSTRAINT `libreria_productofac_factura_id_6f583d90_fk_libreria_` FOREIGN KEY (`factura_id`) REFERENCES `libreria_factura` (`id`),
  ADD CONSTRAINT `libreria_productofac_producto_id_5f20a300_fk_libreria_` FOREIGN KEY (`producto_id`) REFERENCES `libreria_camaras_base` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

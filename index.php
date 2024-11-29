<?php

require_once('config.php');
require_once('controllers/BaseController.php');
require_once('controllers/HomeController.php');

// Charger toutes les dépendances de code

$controller = new HomeController();

$controller->handle();
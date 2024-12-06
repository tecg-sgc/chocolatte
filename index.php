<?php

require_once('config.php');

// Charger toutes les dépendances de code
require_once('controllers/BaseController.php');
require_once('controllers/HomeController.php');
require_once('models/BaseModel.php');
require_once('models/Employee.php');
require_once('models/Review.php');

$controller = new HomeController();

$controller->handle();
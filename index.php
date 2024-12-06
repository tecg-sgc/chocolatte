<?php

require_once('config.php');
require_once('controllers/BaseController.php');
require_once('controllers/HomeController.php');
require_once('models/BaseModel.php');
require_once('models/Employee.php');
require_once('models/Review.php');

// Charger toutes les dépendances de code

$controller = new HomeController();

$controller->handle();
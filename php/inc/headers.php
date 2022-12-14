<?php

if (isset($_SERVER['HTTP_ORIGIN'])) {

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Credentials:true');
header('Access-Control-Allow-Headers: Content-Type');
header('Access-Control-Max-Age: 86400');
header('Content-Type: application/json');
header('Access-Control-Allow-Headers: Content-Type, X-Auth-Token, Origin, Authorization');
}
if ($_SERVER['REQUEST_METHOD']=='OPTIONS') {

    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, DELETE, PUT");

if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
    header("Access-Control-Allow-Headers:, {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");
}

?>

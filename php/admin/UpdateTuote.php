<?php

require_once 'inc/functions.php';
require_once 'inc/headers.php';

$input = json_decode(file_get_contents('php://input'));
$tuotenimi = filter_var($input->tuotenimi,FILTER_SANITIZE_SPECIAL_CHARS);
$hinta = filter_var($input->$hinta,FILTER_SANITIZE_SPECIAL_CHARS);
$saldo = filter_var($input->saldo,FILTER_SANITIZE_SPECIAL_CHARS);
$trnro = filter_var($input->trnro,FILTER_SANITIZE_SPECIAL_CHARS);
$tuotekuvaus = filter_var($input->tuotekuvaus,FILTER_SANITIZE_SPECIAL_CHARS);
$img = filter_var($input->img,FILTER_SANITIZE_SPECIAL_CHARS);

try {
    $db = openDb();

    $query = $db->prepare('update tuote set tuotenimi=:tuotenimi where tuoteid=:tuoteid');
    $query->bindValue(':tuotenimi',$tuotenimi,PDO::PARAM_STR);
    $query->bindValue(':hinta',$hinta,PDO::PARAM_INT);
    $query->bindValue(':tarjoushinta',$hinta,PDO::PARAM_INT);
    $query->bindValue(':saldo',$saldo,PDO::PARAM_INT);
    $query->bindValue(':trnro',$trnro,PDO::PARAM_INT);
    $query->bindValue(':tuotekuvaus',$tuotekuvaus,PDO::PARAM_INT);
    $query->bindValue(':img',$img,PDO::PARAM_INT);
    $query->execute();

    header('HTTP/1.1 200 OK');
    $data = array('tuotenimi' => $tuotenimi,'hinta' => $hinta,'tarjoushinta' => $tarjoushinta,'saldo' => $saldo,'trnro' => $trnro,'tuotekuvaus' => $tuotekuvaus,'img' => $img);
    print json_encode($data);
    
}   catch (PDOException $pdoex) {
    returnError($pdoex);
}
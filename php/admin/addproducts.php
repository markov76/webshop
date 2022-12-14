<?php

require_once '../inc/functions.php';
require_once '../inc/headers.php';

$input = json_decode(file_get_contents('php://input'));
$tuotenimi = filter_var($input->tuotenimi,FILTER_SANITIZE_SPECIAL_CHARS);
$hinta = filter_var($input->hinta,FILTER_SANITIZE_NUMBER_FLOAT,FILTER_FLAG_ALLOW_FRACTION);
$tarjoushinta = filter_var($input->tarjoushinta,FILTER_SANITIZE_NUMBER_FLOAT,FILTER_FLAG_ALLOW_FRACTION);
$saldo = filter_var($input->saldo,FILTER_SANITIZE_NUMBER_INT);
$trnro = filter_var($input->trnro,FILTER_SANITIZE_NUMBER_INT);
$tuotekuvaus = filter_var($input->tuotekuvaus,FILTER_SANITIZE_SPECIAL_CHARS);
$img = filter_var($input->img,FILTER_SANITIZE_SPECIAL_CHARS);

try {
  $db=openDb();
  $query = $db->prepare('insert into tuote(tuotenimi,hinta,tarjoushinta,saldo,trnro,tuotekuvaus,img)
  values (:tuotenimi,:hinta,:tarjoushinta,:saldo,:trnro,:tuotekuvaus,:img)');
  $query->bindValue(':tuotenimi', $tuotenimi,PDO::PARAM_STR);
  $query->bindValue(':hinta', $hinta,PDO::PARAM_STR);
  $query->bindValue(':tarjoushinta', $tarjoushinta,PDO::PARAM_STR);
  $query->bindValue(':saldo', $saldo,PDO::PARAM_INT);
  $query->bindValue(':trnro', $trnro,PDO::PARAM_INT);
  $query->bindValue(':tuotekuvaus', $tuotekuvaus,PDO::PARAM_STR);
  $query->bindValue(':img', $img,PDO::PARAM_STR);
  $query->execute();
  header('HTTP/1.1 200 OK');
  $data = array('id' => $db->lastInsertId(),'tuotenimi' => $tuotenimi,'hinta' => $hinta,'tarjoushinta' => $tarjoushinta,
  'saldo' => $saldo, 'trnro' => $trnro,'tuotekuvaus'=> $tuotekuvaus,'img' => $img);
  print json_encode($data);
  
} catch (PDOException $pdoex) {
  returnError($pdoex);
  }

  ?>
<?php
    session_start();
    require_once "config.php";
    $userid = $_SESSION["userid"];
    if($userid!=NULL){
        $getdata = mysqli_query($link,"SELECT * FROM asiakas WHERE id='$userid'");
        $userdata = mysqli_fetch_array($getdata);
?>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <div className="container">
   
    <h2>Retrogamershaven odottaa!</h2>
    
    <h3> Tervetuloa <?php echo $userdata['astunnus']; ?> ! </h3>
    <p> Olet kirjautunut sisään <?php echo $userdata['created_at']; ?> ! </p>
    <h6> <a href="logout.php"> Kirjaudu ulos. </a> </h6>
    <h6> <a href="http://localhost:3000/"> Siirry etusivulle. </a> </h6>
    </div>
</html>
<?php } else {
    echo "Kirjaudu sisään";
} ?>
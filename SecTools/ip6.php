<html>
<body>
<?php

$curl = curl_init();
curl_setopt($curl, CURLOPT_URL, 'http://netping.io/checks/ping6.php?host=8.8.8.8');
curl_setopt($curl, CURLOPT_HEADER, 0);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
$result = curl_exec($curl);
echo $result;
?>

</body>
</html>
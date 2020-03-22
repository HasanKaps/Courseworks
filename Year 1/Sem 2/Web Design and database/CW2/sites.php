<?php

include "pdo.php";

$selected_site_type = $_POST["site_type"];

echo "<html><body>";
echo "<form action='sites.php' method='post'>";
echo "<select name='site_type'>";

$result = $pdo->query("SELECT DISTINCT name FROM sites ORDER BY name");

while ($row = $result->fetch()) {
  $type = $row["name"];
  if ($type == $selected_site_type) {
    $option = "<option selected>";
  } else {
    $option = "<option>";
  }
  echo $option . $type . "</option>";
}

echo "</select>";
echo "<input type='submit' value='Submit'>";
echo "</form>";

if ($selected_site_type) {
  echo "<table border = 1>";
  echo "<tr><th align='left'>Site Name</th><th align='left'>City</th><th align='left'>Id</th><th align='left'>country_location</th><th align='left'>Visa_Needed</th></tr>";

  $stmt = $pdo->prepare("SELECT name, city_location,category_ID,country_name,visa_needed_uae_passport_holders FROM Sites,cities,countries where sites.city_location = cities.city_name and cities.country_location = countries.country_name and sites.Name = ?");
  $stmt->execute([$selected_site_type]);

  while ($row = $stmt->fetch()) {
    echo "<tr><td>" . $row["name"] . "</td><td>" . $row["city_location"] . "</td> <td>". $row["category_ID"] ."</td> <td>" .$row["country_name"]."</td><td>".$row["visa_needed_uae_passport_holders"]. "</td></tr>";
  }
}

echo "</table>";
echo "</body></html>";

?>

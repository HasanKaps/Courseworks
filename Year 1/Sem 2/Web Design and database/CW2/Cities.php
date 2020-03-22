<?php

include "pdo.php";

$selected_cities_type = $_POST["cities_type"];

echo "<html><body>";
echo "<form action='Cities.php' method='post'>";
echo "<select name='cities_type'>";

$result = $pdo->query("SELECT DISTINCT City_Name FROM Cities ORDER BY City_Name");

while ($row = $result->fetch()) {
  $type = $row["City_Name"];
  if ($type == $selected_cities_type) {
    $option = "<option selected>";
  } else {
    $option = "<option>";
  }
  echo $option . $type . "</option>";
}

echo "</select>";
echo "<input type='submit' value='Submit'>";
echo "</form>";

if ($selected_cities_type) {
  echo "<table border = 1>";
  echo "<tr><th align='left'>Site Name</th><th align='left'>Cities</th><th align='left'>Ratings</th><th align='left'>Reviews</th></tr>";

  $stmt = $pdo->prepare("SELECT sites.name AS Sites, sites.city_location AS Cities, AVG(Visit.Rating) AS Ratings, Visit.Reviews AS Reviews FROM sites,visit WHERE sites.name=visit.site AND sites.city_location = ?");
  $stmt->execute([$selected_cities_type]);

  while ($row = $stmt->fetch()) {
    echo "<tr><td>" . $row["Sites"] . "</td><td>" . $row["Cities"] . "</td><td>" . $row["Ratings"] . "</td><td>" . $row["Reviews"] . "</td></tr>";
  }
}

echo "</table>";
echo "</body></html>";

?>

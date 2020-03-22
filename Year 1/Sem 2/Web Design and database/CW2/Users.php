<?php

include "pdo.php";

$selected_Users_type = $_POST["Users_type"];

echo "<html><body>";
echo "<form action='Users.php' method='post'>";
echo "<select name='Users_type'>";

$result = $pdo->query("SELECT DISTINCT User_name as User_name FROM users ORDER BY User_name");

while ($row = $result->fetch()) {
  $type = $row["User_name"];
  if ($type == $selected_Users_type) {
    $option = "<option selected>";
  } else {
    $option = "<option>";
  }
  echo $option . $type . "</option>";
}

echo "</select>";
echo "<input type='submit' value='Submit'>";
echo "</form>";

if ($selected_Users_type) {
  echo "<table border = 1>";
  echo "<tr><th align='left'>User</th><th align='left'>Site</th><th align='left'> Rating</th><th align='left'> Reviews</th></tr>";

  $stmt = $pdo->prepare("SELECT DISTINCT Site AS Site,User AS User, Rating AS Rating,Reviews AS Reviews FROM visit WHERE Visit.User=? ORDER BY Rating");
  $stmt->execute([$selected_Users_type]);

  while ($row = $stmt->fetch()) {
    echo "<tr><td>" . $row["Site"] . "</td> <td>". $row["User"] ."</td><td>" .$row["Rating"]."</td><td>" .$row["Reviews"]."</td></tr>";
  }
}

echo "</table>";
echo "</body></html>";

?>
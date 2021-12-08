<html>

<body>
  <?php
  $HOSTNAME = "localhost";
  $USERNAME = "root";
  $PASSWORD = "";
  $DBNAME = "term_project";

  if (isset($_POST['classes'])) {

    $link = mysqli_connect($HOSTNAME, $USERNAME, $PASSWORD, $DBNAME);
    if (!$link) {
      die('ERROR: Could not connect to MySQL ' . mysqli_connect_error());
    }

    $ssn = $_POST['ssn'];

    $query = "SELECT S.CLASSROOM, S.DAYS, S.BEGIN_TIME, S.END_TIME, C.TITLE
              FROM SECTION S, PROFESSOR P, COURSE C
              WHERE S.PROFESSOR=P.SSN AND P.SSN=$ssn AND C.CNUM=S.CNUM";
    $result = $link->query($query);
    $rows = $result->num_rows;

    echo '<link rel="stylesheet" type="text/css" href="style.css">';
    echo "<title>cs32t13 | $ssn</title>";
    echo '<button><a href="index.html"> Home </a></button>';
    echo '<button><a href="professor.html"> Professor </a></button>';
    echo "<h1>Classes for $ssn:</h1><br>";
    echo '<div style="display: flex;">';
    for ($i = 0; $i < $rows; $i++) {
      $row = $result->fetch_assoc();
      echo '<div class="box">';
      echo "<h4>" . $row['TITLE'] . ":</h4>";
      echo "<p>";
      echo "Room: " . $row['CLASSROOM'] . "<br>";
      echo "Days: " . $row['DAYS'] . "<br>";
      echo "Begin Time: " . $row['BEGIN_TIME'] . "<br>";
      echo "End Time: " . $row['END_TIME'] . "<br>";
      echo "</p>";
      echo "</div>";
      echo "<br>";
    }
    echo "</div>";

    $result->free();
    $link->close();
  } else if (isset($_POST['grades'])) {
    $link = mysqli_connect($HOSTNAME, $USERNAME, $PASSWORD, $DBNAME);
    if (!$link) {
      die('ERROR: Could not connect to MySQL ' . mysqli_connect_error());
    }

    $cnum = $_POST['cnum'];
    $snum = $_POST['snum'];

    $query = "SELECT E.Grade, COUNT(*)
              FROM SECTION S, COURSE C, ENROLL E
              WHERE C.CNUM=$cnum AND S.SNUM=$snum AND
                    S.CNUM=C.CNUM AND S.SNUM=E.SNUM AND S.CNUM=E.CNUM
              GROUP BY E.Grade";
    $result = $link->query($query);
    $rows = $result->num_rows;

    $cnum = substr($cnum, 1, -1);

    echo '<link rel="stylesheet" type="text/css" href="style.css">';
    echo "<title>cs32t13 | $cnum-$snum</title>";
    echo '<button><a href="index.html"> Home </a></button>';
    echo '<button><a href="professor.html"> Professor </a></button>';
    echo "<h1>Grades for $cnum-$snum:</h1><br>";
    echo '<table class="center">';
    echo '<tr><th>Grade</th><th>Count</th></tr>';
    for ($i = 0; $i < $rows; $i++) {
      $row = $result->fetch_assoc();
      echo "<tr>";
      echo "<td>" . $row['Grade'] . "</td>";
      echo "<td>" . $row['COUNT(*)'] . "</td>";
      echo "</tr>";
    }
    echo "</table>";

    $result->free();
    $link->close();
  } else {
    echo "<title>cs32t13 | ERROR</title>";
    echo '<a href="index.html"> Home </a>';
    echo '<a href="professor.html"> Professor </a> <br>';
    echo "ERROR: Forms not submitted correctly <br>";
    print_r($_POST);
  }
  ?>

</body>

</html>
<html>

<body>
  <?php
  $HOSTNAME = "localhost";
  $USERNAME = "root";
  $PASSWORD = "";
  $DBNAME = "term_project";

  if (isset($_POST['section'])) {

    $link = mysqli_connect($HOSTNAME, $USERNAME, $PASSWORD, $DBNAME);
    if (!$link) {
      die('ERROR: Could not connect to MySQL ' . mysqli_connect_error());
    }

    $cnum = $_POST['cnum'];

    $query = "SELECT S.SNUM, S.CLASSROOM, S.BEGIN_TIME, S.END_TIME, COUNT(*)
              FROM SECTION S, ENROLL E
              WHERE S.CNUM=$cnum AND S.SNUM=E.SNUM AND S.CNUM=E.CNUM
              GROUP BY S.SNUM";
    $result = $link->query($query);
    $rows = $result->num_rows;

    $cnum = substr($cnum, 1, -1);

    echo '<link rel="stylesheet" type="text/css" href="style.css">';
    echo "<title>cs32t13 | $cnum</title>";
    echo '<button><a href="index.html"> Home </a></button>';
    echo '<button><a href="student.html"> Student </a></button>';
    echo "<h1>Sections for $cnum:</h1><br>";
    echo '<div class="box">';
    for ($i = 0; $i < $rows; $i++) {
      $row = $result->fetch_assoc();
      echo '<div class="box">';
      echo "<h4>Section " . $row['SNUM'] . ":</h4>";
      echo "<p>";
      echo "Classroom: " . $row['CLASSROOM'] . "<br>";
      echo "Begin Time: " . $row['BEGIN_TIME'] . "<br>";
      echo "End Time: " . $row['END_TIME'] . "<br>";
      echo "Number of Students: " . $row['COUNT(*)'] . "<br>";
      echo "</p>";
      echo "</div>";
      echo "<br>";
    }
    echo "</div>";

    $result->free();
    $link->close();
  } else if (isset($_POST['transcript'])) {
    $link = mysqli_connect($HOSTNAME, $USERNAME, $PASSWORD, $DBNAME);
    if (!$link) {
      die('ERROR: Could not connect to MySQL ' . mysqli_connect_error());
    }

    $cwid = $_POST['cwid'];

    $query = "SELECT C.TITLE, E.GRADE
              FROM ENROLL E, COURSE C
              WHERE E.CWID=$cwid AND E.CNUM=C.CNUM";
    $result = $link->query($query);
    $rows = $result->num_rows;

    echo '<link rel="stylesheet" type="text/css" href="style.css">';
    echo "<title>cs32t13 | $cwid</title>";
    echo '<button><a href="index.html"> Home </a></button>';
    echo '<button><a href="student.html"> Student </a></button>';
    echo "<h1>Transcript for $cwid:</h1><br>";
    echo '<div class="box">';
    for ($i = 0; $i < $rows; $i++) {
      $row = $result->fetch_assoc();
      echo '<div>';
      echo "<p>";
      echo "<h3>" . $row['TITLE'] . "</h3>";
      echo "Grade: " . $row['GRADE'] . "<br>";
      echo "</div>";
      echo "<br>";
    }
    echo "</div>";

    $result->free();
    $link->close();
  } else {
    echo "<title>cs32t13 | ERROR</title>";
    echo '<a href="index.html"> Home </a>';
    echo '<a href="student.html"> Student </a>';
    echo "ERROR: Forms not submitted correctly <br>";
    print_r($_POST);
  }
  ?>

</body>

</html>
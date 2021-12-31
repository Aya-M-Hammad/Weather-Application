
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css" integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd" crossorigin="anonymous">


<style type="text/css" media="all">
   html { 
   direction:rtl;

          background: url(background.jpg) no-repeat center center fixed; 
          -webkit-background-size: cover;
          -moz-background-size: cover;
          -o-background-size: cover;
          background-size: cover;
          }
         
          body {
               
              background: none;
               
          }
           
          .container {
               
              text-align: center;
              margin-top: 100px;
              width: 450px;
               
          }
           
          input {
               
              margin: 20px 0;
               
          }
          label {
    display: inline-block;
    margin-bottom: 0.5rem;
    font-family: cairo;
}
.form-control {
    display: block;
    width: 100%;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    line-height: 1.5;
    color: #55595c;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 0.25rem;
    font-family: cairo;
}
.btn-primary {
    color: #fff;
    background-color: #0275d8;
    border-color: #0275d8;
    font-family: cairo;
}
          h1 {
    font-size: 2.5rem;
    font-family: cairo;
}
           .alert {
              padding: 15px;
              margin-bottom: 1rem;
              border: 1px solid transparent;
              border-radius: 0.25rem;
              font-family: cairo;
              text-align: right;
}
          #weather {
               
              margin-top:15px;
               
          }
</style>
  <title>Aya Hsoub Weather App</title>
</head>
<body>
    <div class="container">
      
          <h1>ماهي حالة الطقس؟</h1>
          
          
          
          <form>
  <fieldset class="form-group">
    <label for="city">اكتب اسم المدينة</label>
<input type="text" class="form-control" name="city" id="city" placeholder="مثال : القاهرة ، الاسكندرية" value = "<?php echo $_GET['city']; ?>">  </fieldset>
  
  <button type="submit" class="btn btn-primary">ابحث</button>
</form>
      
          <div id="weather"></div>
      </div>
<?php

    $weather = "";
    $error = "";
     
    if ($_GET['city']) {
         
     $urlContents = file_get_contents("https://api.openweathermap.org/data/2.5/weather?q=".urlencode($_GET['city'])."&appid=2268dd8d2c3a2307ecd4894265f0f478&lang=ar");
         
        $weatherArray = json_decode($urlContents, true);
         
        if ($weatherArray['cod'] == 200) {
         
            $weather = "حالة الطقس الان في ".$_GET['city']." هي :  '".$weatherArray['weather'][0]['description']."' <br>";
 
            $tempInCelcius = intval($weatherArray['main']['temp'] - 273);
 
            $weather .= " درجة الحرارة الان  :  ".$tempInCelcius."c <br > سروعة الرياح الان ".$weatherArray['wind']['speed']." ميل/ساعة بزاوية ميل ".$weatherArray['wind']['deg']." درجة <br >الضغط الجوي  :  ".$weatherArray['main']['pressure']." بار <br >الرطوبة  :  ".$weatherArray['main']['humidity']." درجة"  ;
           


        } else {
             
            $error = "لم نتمكن من العثور علي المدينة حاول مرة اخري";
             
        }
         
    }
                    if ($weather) {
                  
                  echo '<div class="alert alert-success" role="alert">
  '.$weather.'
</div>';
                  
              } else if ($error) {
                  
                  echo '<div class="alert alert-danger" role="alert">
  '.$error.'
</div>';
                  
              }
 ?>

    <!-- jQuery first, then Bootstrap JS. -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js" integrity="sha384-vZ2WRJMwsjRMW/8U7i6PWi6AlO1L79snBrmgiDpgIWJ82z8eA5lenwvxbMV1PAh7" crossorigin="anonymous"></script>
</body>
</html>

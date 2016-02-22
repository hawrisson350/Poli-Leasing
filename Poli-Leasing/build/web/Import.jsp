        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Poli-Leasing</title>
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="materialize/css/materialize.min.css"  media="screen,projection"/>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link type="text/css" rel="stylesheet" href="new-style.css"/>
        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="materialize/js/jquery-1.11.3.min.js"></script>
        <script type="text/javascript" src="materialize/js/materialize.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.button-collapse').sideNav({
                    menuWidth: 300, // Default is 240
                    edge: 'left', // Choose the horizontal origin
                    closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
                }
                );
                $('.slider').slider({full_width: true});
            });
            
        </script>
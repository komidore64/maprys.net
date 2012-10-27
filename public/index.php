<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <title>M. Adam Price</title>
  <link rel="stylesheet" type="text/css" href="resources/style/main.css" />
  <script type="text/javascript" src="resources/js/jquery.js"></script>
  <script type="text/javascript" src="resources/js/jquery_ui.js"></script>
  <script type="text/javascript" src="resources/js/animations.js"></script>
  <?php
    $page_files = array();
    $names = array();
    $content_dir = scandir('./content/');
    $page_index = 0;
    for ($i = 0; $i < count($content_dir); $i++) {
      if (strpos($content_dir[$i], '.') != 0) {
        $page_files[$page_index] = $content_dir[$i];
        $names[$page_index++] = str_replace(array('.html', '.php'), '', $content_dir[$i]);
      }
    }
    unset($page_index);
    unset($content_dir);
  ?>
  <script>

  var open_pane = null; // current open content

  $(document).ready(function() {

    // navigation bar open animation
    nav_bar = function() { $("#navigation").show('drop', { direction: 'down' }, 1300); };

    // main header open animation
    $("#header").show('fold', {}, 1500, nav_bar);

    // click events ///////////////////////////////////////

    <?php foreach ($names as $n) { ?>
      $("#<?php echo $n; ?>").click(function() {
        switch_to(this.id + '_content');
      });
    <?php } ?>

    $(".title-link").click(function() {
      close_all();
    });
    ///////////////////////////////////////////////////////

  });
  </script>
</head>
<body>
  <!-- Begin Wrapper -->
  <div id="wrapper">

    <!-- Begin Header -->
    <div id="header" class="nodisplay">

      <span style="padding-left: 25px;" class="title-link">Michael "Adam" Price</span>

    </div>
    <!-- End Header -->

    <!-- Begin Naviagtion -->
    <div id="navigation" class="nodisplay">

      <?php
            foreach ($names as $n) {
            $no_num = preg_replace('/(\d){1,2}_/i', '', $n);
            $add_space = str_replace('_', ' ', $no_num);
      ?>
        <span id="<?php echo $n; ?>"
            class="nav-link"><?php echo $add_space; ?></span>
      <?php } ?>

    </div>
    <!-- End Naviagtion -->

    <!-- Begin Content -->
    <?php for ($i = 0; $i < count($names); $i++) { ?>
      <div class="content nodisplay" id="<?php echo $names[$i] . '_content'; ?>">
      <?php include('content/' . $page_files[$i]); ?>
      </div>
    <?php } ?>
    <!-- End Content -->

  </div>
  <!-- End Wrapper -->

</body>
</html>

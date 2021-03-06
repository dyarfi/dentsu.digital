<?php if (!defined('BASEPATH')) exit('No direct script access allowed'); ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="author" content="Dentsu Digital" />
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><?php echo $page_title; ?></title>
  <script type="text/javascript">var base_URL = '<?php echo base_url();?>';</script>
  <?php
    /*
    * MINIFY CSS
    * ----------------------
    * Add css files that want to be minify
    */
    // Add / Change default dir
    $this->minify->assets_dir = 'assets/public/css';
    // Add Stylesheet
    $this->minify->css([
      "public/css/bootstrap.min.css",
      "public/css/fancybox/jquery.fancybox.css",
      "public/font-awesome/css/font-awesome.min.css",
      "public/css/animate.css",
      "public/css/style.css",
   	  "public/css/gallery.css",
      "public/color/default.css"
    ]);
    /*
     * Adding additional stylesheet from controller
     */
    if (!empty($css_files)) {
        foreach ($css_files as $sheet => $css):
          // Add js to minified
          $this->minify->add_css($css, $sheet);
        endforeach;
    }
    /*
     * ----------------- BEWARE OF DEPLOYING | ALWAYS SET TO FALSE AFTER RECOMPILE ------------------
     * Recompile css!!! Set this to true every times you add css library from anywhere
     * delete assets/public/css/styles.min.css to recompile again
     */
    echo $this->minify->deploy_css(FALSE);
  ?>
</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-custom">
	<div id="wrapper">
			<?php $this->load->view('template/public/header'); ?>
			<div id="navigation">
				<?php $this->load->view('template/public/navigation'); ?>
			</div>
			<div id="main">
				<div class="messageFlash">
					<?php $this->load->view('flashdata'); ?>
				</div>
				<div class="content marginbot-30">
					<?php $this->load->view($main); ?>
				</div>
			</div>
	<?php $this->load->view('template/public/footer'); ?>
	</div>
	<!-- Core JavaScript Files -->
  <?php
    /*
    * MINIFY JS
    * ----------------------
    * Add js files that want to be minify
    */
    // Add / Change default dir
    $this->minify->assets_dir = 'assets/public/js';

    // Add javascripts
    $this->minify->js([
      "public/js/jquery.min.js",
	  "public/js/jquery.easing.min.js",
      "public/js/jquery.cookie.js",
      "public/js/jquery.fancybox.pack.js",
	  "public/js/bootstrap.min.js",
      "admin/plugins/bootbox/bootbox.min.js",
      "public/js/jquery.scrollTo.js",
    ]);
    /*
     * Adding additional javascript from controller
     */
    if (!empty($js_files)) {
        foreach ($js_files as $group => $file):
          // Add js to minified
          $this->minify->add_js($file, $group);
        endforeach;
    }
    /*
     * ----------------- BEWARE OF DEPLOYING | ALWAYS SET TO FALSE AFTER RECOMPILE ------------------
     * Recompile javascript!!! Set this to true every times you add javascripts library from anywhere
     * delete assets/public/js/scripts.min.js to recompile again
     */
    echo $this->minify->deploy_js(FALSE);
  ?>
  <?php
    /*
     * Debugging information only
     *
     */
	 /*
    if (!empty($js_files)) { foreach ($js_files as $file => $jses): ?>
    <script rel="<?php echo $file;?>" src="<?php echo $jses; ?>"></script>
    <?php endforeach; }
	*/
  ?>
  <script src="<?php echo base_url("assets/public/js/jquery.jqplot.1.0.8/jquery.jqplot.js"); ?>"></script>
  <script src="<?php echo base_url("assets/public/js/jquery.jqplot.1.0.8/plugins/jqplot.highlighter.js"); ?>"></script>
  <script src="<?php echo base_url("assets/public/js/jquery.jqplot.1.0.8/plugins/jqplot.cursor.js"); ?>"></script>
  <script src="<?php echo base_url("assets/public/js/jquery.jqplot.1.0.8/plugins/jqplot.dateAxisRenderer.js"); ?>"></script>
  <script src="<?php echo base_url("assets/public/js/jquery.jqplot.1.0.8/plugins/jqplot.pieRenderer.js"); ?>"></script>
  <script src="<?php echo base_url("assets/public/js/jquery.jqplot.1.0.8/plugins/jqplot.json2.js"); ?>"></script>
  <script src="<?php echo base_url('assets/public/js/circle-progress.js');?>"></script>
  <script src="<?php echo base_url('assets/public/js/custom.js');?>"></script>
  <script type="text/javascript">
  $(document).ready(function() {
  <?php
    // Write the javascript inline in the controller
    echo ($js_inline) ? "\t".$js_inline."\n" : "";
  ?>
  });
  </script>
</body>
</html>
<?php //echo $this->benchmark->memory_usage();?>

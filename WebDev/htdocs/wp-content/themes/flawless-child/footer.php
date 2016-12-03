	<?php global $theme_option; ?>
	<div class="clear" ></div>
	</div><!-- content wrapper -->




	<?php
		// page style
		global $gdlr_post_option;
		if( empty($gdlr_post_option) || empty($gdlr_post_option['page-style']) ||
			  $gdlr_post_option['page-style'] == 'normal' ||
			  $gdlr_post_option['page-style'] == 'no-header'){
	?>
	<footer class="footer-wrapper" >




<div class="container">
<div class="register">
    <form id="mc-embedded-subscribe-form" class="validate" action="//codeclan.us11.list-manage.com/subscribe/post?u=4306adab46bd31b4018568a06&amp;id=451e993463" method="post" name="mc-embedded-subscribe-form" novalidate="" target="_blank">
      <div class="register-label"><label for="mce-EMAIL">Register for updates </label></div>
      <div class="register-email">

        <input id="mce-EMAIL" class="required email" name="EMAIL" type="email" value="" placeholder="Email address" />
        <div id="mce-responses" class="clear"></div>
        <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
        <div style="position: absolute; left: -5000px;"><input tabindex="-1" name="b_4306adab46bd31b4018568a06_451e993463" type="text" value="" /></div>
      </div>
      <div class="register-submit"><button class="cta filled blue joined-left small" title="Submit" type="submit">Get Updates</button></div>
    </form>
  </div>
</div>





		<?php if( $theme_option['show-footer'] != 'disable' ){ ?>
		<div class="footer-container container">
			<?php
				$i = 1;
				$theme_option['footer-layout'] = empty($theme_option['footer-layout'])? '1': $theme_option['footer-layout'];
				$gdlr_footer_layout = array(
					'1'=>array('twelve columns'),
					'2'=>array('three columns', 'three columns', 'three columns', 'three columns'),
					'3'=>array('three columns', 'three columns', 'six columns',),
					'4'=>array('four columns', 'four columns', 'four columns'),
					'5'=>array('four columns', 'four columns', 'eight columns'),
					'6'=>array('eight columns', 'four columns', 'four columns'),
				);
			?>
			<?php foreach( $gdlr_footer_layout[$theme_option['footer-layout']] as $footer_class ){ ?>
				<div class="footer-column <?php echo $footer_class; ?>" id="footer-widget-<?php echo $i; ?>" >
					<?php dynamic_sidebar('Footer ' . $i); ?>
				</div>
			<?php $i++; ?>
			<?php } ?>
			<div class="clear"></div>
		</div>
		<?php } ?>

		<?php if( $theme_option['show-copyright'] != 'disable' ){ ?>
		<div class="copyright-wrapper">
			<div class="copyright-container container">
				<div class="copyright-left">
					<?php echo $theme_option['copyright-left-text']; ?>
				</div>
				<div class="copyright-right">
					<?php echo $theme_option['copyright-right-text']; ?>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<?php } ?>
	</footer>
	<?php } // page style ?>
</div> <!-- body-wrapper -->
<?php wp_footer(); ?>
</body>
</html>

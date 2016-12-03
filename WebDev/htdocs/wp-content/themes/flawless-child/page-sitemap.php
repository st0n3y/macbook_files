<?php
/**
 * Template Name: Site Map
 */ ?>


 <?php get_header(); ?>

	<div class="gdlr-content">

		<!-- Above Sidebar Section-->
		<?php global $gdlr_post_option, $above_sidebar_content, $with_sidebar_content, $below_sidebar_content; ?>
		<?php if(!empty($above_sidebar_content)){ ?>
			<div class="above-sidebar-wrapper"><?php gdlr_print_page_builder($above_sidebar_content); ?></div>
		<?php } ?>

		<!-- Sidebar With Content Section-->
		<?php
			if( !empty($gdlr_post_option['sidebar']) && ($gdlr_post_option['sidebar'] != 'no-sidebar' )){
				global $gdlr_sidebar;

				$gdlr_sidebar = array(
					'type'=>$gdlr_post_option['sidebar'],
					'left-sidebar'=>$gdlr_post_option['left-sidebar'],
					'right-sidebar'=>$gdlr_post_option['right-sidebar']
				);
				$gdlr_sidebar = gdlr_get_sidebar_class($gdlr_sidebar);
		?>
			<div class="with-sidebar-wrapper">
				<div class="with-sidebar-container container">
					<div class="with-sidebar-left <?php echo $gdlr_sidebar['outer']; ?> columns">
						<div class="with-sidebar-content <?php echo $gdlr_sidebar['center']; ?> columns">
							<?php
								if( !empty($with_sidebar_content) ){
									gdlr_print_page_builder($with_sidebar_content, false);
								}
								if( !empty($gdlr_post_option['show-content']) && $gdlr_post_option['show-content'] != 'disable' ){
									get_template_part('single/content', 'page');
								}
							?>
						</div>
						<?php get_sidebar('left'); ?>
						<div class="clear"></div>
					</div>
					<?php get_sidebar('right'); ?>
					<div class="clear"></div>
				</div>
			</div>
		<?php
			}else{
				if( !empty($with_sidebar_content) ){
					echo '<div class="with-sidebar-wrapper">';
					gdlr_print_page_builder($with_sidebar_content);
					echo '</div>';
				}
				if( empty($gdlr_post_option['show-content']) || $gdlr_post_option['show-content'] != 'disable' ){
					get_template_part('single/content', 'page');
				}
			}
		?>


<section id="content-section-map">
	<div class="section-container container">
		<div class="six columns">


			<h2 id="pages">Pages</h2>
			<ul>
			<?php
			// Add pages you'd like to exclude in the exclude here
			wp_list_pages(
			  array(
			    'exclude' => '',
			    'title_li' => '',
			  )
			);
			?>
			</ul>

		</div>


		<div class="six columns">



			<h2 id="posts">Posts</h2>
			<ul>
			<?php
			// Add categories you'd like to exclude in the exclude here
			$cats = get_categories('exclude=');
			foreach ($cats as $cat) {
			  echo "<li><h3>".$cat->cat_name."</h3>";
			  echo "<ul>";
			  query_posts('posts_per_page=-1&cat='.$cat->cat_ID);
			  while(have_posts()) {
			    the_post();
			    $category = get_the_category();
			    // Only display a post link once, even if it's in multiple categories
			    if ($category[0]->cat_ID == $cat->cat_ID) {
			      echo '<li><a href="'.get_permalink().'">'.get_the_title().'</a></li>';
			    }
			  }
			  echo "</ul>";
			  echo "</li>";
			}
			?>
			</ul>




		</div>
	</div>
</section>




		<!-- Below Sidebar Section-->
		<?php if(!empty($below_sidebar_content)){ ?>
			<div class="below-sidebar-wrapper"><?php gdlr_print_page_builder($below_sidebar_content); ?></div>
		<?php } ?>


	</div><!-- gdlr-content -->
<?php get_footer(); ?>
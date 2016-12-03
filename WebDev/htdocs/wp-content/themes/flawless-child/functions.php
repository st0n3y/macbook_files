<?php


// CHILD THEME CSS
//------------------------------------------------------------------------------------
function theme_enqueue_styles() {

    $parent_style = 'parent-style';

    wp_enqueue_style( $parent_style, get_template_directory_uri() . '/style.css' );
    wp_enqueue_style( 'child-style',
        get_stylesheet_directory_uri() . '/style.css',
        array( $parent_style )
    );
}
add_action( 'wp_enqueue_scripts', 'theme_enqueue_styles' );





// IF TREE
//------------------------------------------------------------------------------------

function is_tree($pid) {      // $pid = The ID of the page we're looking for pages underneath
	global $post;         // load details about this page
	if(is_page()&&($post->post_parent==$pid||is_page($pid)))
               return true;   // we're at the page or at a sub page
	else
               return false;  // we're elsewhere
};




// MENUS
//------------------------------------------------------------------------------------

function register_my_menu() {
  register_nav_menu('course-menu',__( 'Course Menu' ));
}
add_action( 'init', 'register_my_menu' );




	// personnel item
	if( !function_exists('gdlr_get_personnel_item') ){
		function gdlr_get_personnel_item( $settings ){
			if( $settings['personnel-style'] == 'box-style' ){
				$settings['thumbnail-size'] == 'medium';
			}

			if( $settings['personnel-type'] == 'carousel' ){
				return gdlr_get_carousel_personnel_item($settings);
			}else{
				return gdlr_get_static_personnel_item($settings);
			}
		}
	}


?>
---
layout: page
title: OKV
subtitle: OKV
keyword: ['okv']
---

single.php

```html
<div class="row row-large">
	<?php echo do_shortcode('[rank_math_breadcrumb]');  ?>
</div>
```

page.php
```html
<div class="row row-main">
	<?php echo do_shortcode('[rank_math_breadcrumb]');  ?>
</div>
```

```css
.rank-math-breadcrumb {
  display: flex;
}
```

/template-parts/posts/partials/archive-title.php

```php
function get_flatsome_blog_breadcrumbs(){
    if(!is_front_page()){
        echo '<div class="row row-main"><div class="breadcrumbs-wrapper">';
            if (function_exists('rank_math_the_breadcrumbs')) rank_math_the_breadcrumbs();
        echo '</div></div>';
    }
}
add_action( 'flatsome_before_page' , 'get_flatsome_blog_breadcrumbs', 0 );
add_action( 'flatsome_before_blog' , 'get_flatsome_blog_breadcrumbs', 0 );
```

```css
.breadcrumbs-wrapper {
	padding-top: 30px;
}

.page-wrapper {
    padding-top: 0;
}
```

```html
DMCA <a href="https://www.dmca.com/Protection/Status.aspx?ID=604c2146-cdb0-4e4f-a6f4-309bc612f575&amp;refurl=https://kubet77shop.com/" title="DMCA.com Protection Status" class="dmca-badge"> <img src="https://images.dmca.com/Badges/_dmca_premi_badge_5.png?ID=b2f1779f-587a-4441-a7a1-112f8539438b" alt="DMCA.com Protection Status" data-lazy-src="https://images.dmca.com/Badges/_dmca_premi_badge_5.png?ID=b2f1779f-587a-4441-a7a1-112f8539438b" data-ll-status="loaded" class="entered lazyloaded"><noscript><img src ="https://images.dmca.com/Badges/_dmca_premi_badge_5.png?ID=b2f1779f-587a-4441-a7a1-112f8539438b"  alt="DMCA.com Protection Status" /></noscript></a>
```
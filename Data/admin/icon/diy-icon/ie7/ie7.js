/* To avoid CSS expressions while still supporting IE 7 and IE 6, use this script */
/* The script tag referencing this file must be placed before the ending body tag. */

/* Use conditional comments in order to target IE 7 and older:
	<!--[if lt IE 8]><!-->
	<script src="ie7/ie7.js"></script>
	<!--<![endif]-->
*/

(function() {
	function addIcon(el, entity) {
		var html = el.innerHTML;
		el.innerHTML = '<span style="font-family: \'styleicon\'">' + entity + '</span>' + html;
	}
	var icons = {
		'diyicon-import': '&#xe90a;',
		'diyicon-view': '&#xe90b;',
		'diyicon-t-change-pwd': '&#xe90c;',
		'diyicon-down-1': '&#xe909;',
		'diyicon-save': '&#xe907;',
		'diyicon-checked-2': '&#xe908;',
		'diyicon-search': '&#xe905;',
		'diyicon-export': '&#xe904;',
		'diyicon-sort-asc': '&#xe902;',
		'diyicon-sort-desc': '&#xe903;',
		'diyicon-menu-icon-xtgk': '&#xe901;',
		'diyicon-checked': '&#xe900;',
		'diyicon-clear-cache': '&#xe96b;',
		'diyicon-menu-icon-bbgl': '&#xe96c;',
		'diyicon-menu-icon-czfgl': '&#xe96d;',
		'diyicon-menu-icon-fwgl': '&#xe96e;',
		'diyicon-menu-icon-hygl': '&#xe96f;',
		'diyicon-menu-icon-khgl': '&#xe970;',
		'diyicon-menu-icon-tzjl': '&#xe971;',
		'diyicon-menu-icon-xtsz': '&#xe972;',
		'diyicon-menu-icon-yggl': '&#xe973;',
		'diyicon-menu-icon-zdgl': '&#xe974;',
		'diyicon-menu-icon-zngl': '&#xe975;',
		'diyicon-menu-icon-zwgl': '&#xe976;',
		'diyicon-menu-icon-zxgl': '&#xe977;',
		'diyicon-password': '&#xe978;',
		'diyicon-phone': '&#xe979;',
		'diyicon-sign-out': '&#xe97a;',
		'diyicon-right': '&#xe927;',
		'0': 0
		},
		els = document.getElementsByTagName('*'),
		i, c, el;
	for (i = 0; ; i += 1) {
		el = els[i];
		if(!el) {
			break;
		}
		c = el.className;
		c = c.match(/diyicon-[^\s'"]+/);
		if (c && icons[c[0]]) {
			addIcon(el, icons[c[0]]);
		}
	}
}());

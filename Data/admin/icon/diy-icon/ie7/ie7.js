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
		el.innerHTML = '<span style="font-family: \'yqicon\'">' + entity + '</span>' + html;
	}
	var icons = {
		'yqicon-view': '&#xe90b;',
		'yqicon-t-change-pwd': '&#xe90c;',
		'yqicon-down-1': '&#xe909;',
		'yqicon-save': '&#xe907;',
		'yqicon-checked-2': '&#xe908;',
		'yqicon-search': '&#xe905;',
		'yqicon-export': '&#xe904;',
		'yqicon-building': '&#xe906;',
		'yqicon-sort-asc': '&#xe902;',
		'yqicon-sort-desc': '&#xe903;',
		'yqicon-menu-icon-xtgk': '&#xe901;',
		'yqicon-checked': '&#xe900;',
		'yqicon-clear-cache': '&#xe96b;',
		'yqicon-menu-icon-bbgl': '&#xe96c;',
		'yqicon-menu-icon-czfgl': '&#xe96d;',
		'yqicon-menu-icon-fwgl': '&#xe96e;',
		'yqicon-menu-icon-hygl': '&#xe96f;',
		'yqicon-menu-icon-khgl': '&#xe970;',
		'yqicon-menu-icon-tzjl': '&#xe971;',
		'yqicon-menu-icon-xtsz': '&#xe972;',
		'yqicon-menu-icon-yggl': '&#xe973;',
		'yqicon-menu-icon-zdgl': '&#xe974;',
		'yqicon-menu-icon-zngl': '&#xe975;',
		'yqicon-menu-icon-zwgl': '&#xe976;',
		'yqicon-menu-icon-zxgl': '&#xe977;',
		'yqicon-password': '&#xe978;',
		'yqicon-phone': '&#xe979;',
		'yqicon-sign-out': '&#xe97a;',
		'yqicon-right': '&#xe927;',
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
		c = c.match(/yqicon-[^\s'"]+/);
		if (c && icons[c[0]]) {
			addIcon(el, icons[c[0]]);
		}
	}
}());

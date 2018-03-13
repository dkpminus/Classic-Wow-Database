/*
 * GX - Full-Featured Javascript Animations Framework - Extra v1.1
 *
 * Copyright (c) 2009 Riccardo Degni (http://www.riccardodegni.net/)
 * MIT-Style License
 */

(function($) {
jQuery.fn.extend({
	// Internal Methods
	saveStyles: function(css, el) {
		var styles = {};
		Fns.Each(css, function(style, i) {
			if(!el.data('gxSave_' + style)) el.data('gxSave_' + style, el.css(style));
			styles[style] = el.data('gxSave_' + style);
		});
		return styles;
	},
				 
	parseArgs: function(args) {
		var opts = {};
		if(!args) return opts;
		Fns.Each(args, function(arg, i) {
			if(arg == null) return;
			switch(typeof arg) {
				case 'number': opts.duration = arg; break;
				case 'string': (GX.Transitions && GX.Transitions[arg.split(':')[0]]) ? opts.easing = arg : ((GX.durations[Fns.Camelize(arg)]) ? opts.duration = arg : opts.mode = arg); break;
				case 'function': opts.callback = arg; break;
				case 'object': opts.callback = {start: arg.start, complete: arg.complete}; break;
			}
		});
		return opts;
	},
	
	setTo: function(cases, mode) {
		return cases[mode];
	},
	
	gxCall: function(el, to, opts) {
		return el.gx(to, opts.duration, opts.easing, opts.callback);
	},
	
	// Public Methods
	fadeIn: function() {
		var opts = this.parseArgs(arguments), el = $(this);
		return this.gxCall(el, {opacity: 1}, opts);
	},
	
	fadeOut: function() {
		var opts = this.parseArgs(arguments), el = $(this);
		return this.gxCall(el, {opacity: 0}, opts);
	},
	
	fadeToggle: function() {
		var opts = this.parseArgs(arguments), el = $(this);
		return this.gxCall(el, {opacity: "toggle"}, opts);
	},
	
	fade: function(mode, args) {
		if(Fns.Contains(['in', 'out', 'toggle']), mode) return this[Fns.Camelize('fade-' + mode)].apply(this, args || []);
	},
	
	slideIn: function() {
		var opts = this.parseArgs(arguments), el = $(this), styles = this.saveStyles(['height', 'width'], el), mode = opts.mode || 'vertical';
		var to = this.setTo({'vertical': {height: styles.height}, 'horizontal': {width: styles.width}}, mode);
		return this.gxCall(el, to, opts);
	},
	
	slideOut: function() {
		var opts = this.parseArgs(arguments), el = $(this), styles = this.saveStyles(['height', 'width'], el), mode = opts.mode || 'vertical';
		var to = this.setTo({'vertical': {height: 0}, 'horizontal': {width: 0}}, mode);
		return this.gxCall(el, to, opts);
	},
	
	slideToggle: function() {
		var opts = this.parseArgs(arguments), el = $(this), styles = this.saveStyles(['height', 'width'], el), mode = opts.mode || 'vertical';
		var to = this.setTo({'vertical': {height: "toggle"}, 'horizontal': {width: "toggle"}}, mode);
		return this.gxCall(el, to, opts);
	},
	
	slide: function(mode, args) {
		if(Fns.Contains(['in', 'out', 'toggle']), mode) return this[Fns.Camelize('slide-' + mode)].apply(this, args || []);
	},
	
	show: function() {
		var opts = this.parseArgs(arguments), el = $(this), styles = this.saveStyles(['height', 'width', 'opacity', 'display'], el);
		var to = {width: styles.width, height: styles.height, opacity: styles.opacity};
		return (opts.duration) ? this.gxCall(el, to, opts) : el.css('display', styles.display);
	},
	
	hide: function() {
		var opts = this.parseArgs(arguments), el = $(this), styles = this.saveStyles(['height', 'width', 'opacity', 'display'], el);
		var to = {width: 0, height: 0, opacity: 0};
		return (opts.duration) ? this.gxCall(el, to, opts) : el.css('display', 'none');
	},
	
	gradient: function(color, args) {
		var opts = this.parseArgs(args), el = $(this), mode = opts.mode || 'bg';
		var to = this.setTo({'bg': {'background-color': color}, 'fg': {'color': color}}, mode);
		return this.gxCall(el, to, opts);
	},
	
	move: function(x, y, args) {
		var opts = this.parseArgs(args), el = $(this);
		return this.gxCall(el, {'top': y, 'left': x}, opts);
	},
	
	scale: function(w, h, args) {
		var opts = this.parseArgs(args), el = $(this);
		return this.gxCall(el, {'width': w, 'height': h}, opts);
	}
});
})(jQuery);
$(document).ready(function() {
	
	$('a.fancy').fancybox({
		'titlePosition' 	: 'inside',
		'titleFormat'		: formatTitle
	});
	
});

function formatTitle(title, currentArray, currentIndex, currentOpts) {
    return '<div id="work-title">' + (title && title.length ? '<b>' + title + '</b>' : '' ) + 'Image ' + (currentIndex + 1) + ' of ' + currentArray.length + '</div>';
}
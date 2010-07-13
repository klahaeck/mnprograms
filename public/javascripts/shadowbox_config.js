if (navigator.userAgent.search("Mobile") != -1) {
	var customExt = {
          img:["png","jpg","jpeg","gif","bmp"],
          swf:["swf"],
          flv:["flv","mp3"],
          qt:["dv","moov","movie","mp4","mov","m4v"],
          wmp:["asf","wm","wmv"],
          qtwmp:["avi","mpg","mpeg"],
          iframe:["asp","aspx","cgi","cfm","htm","html",
                  "jsp","pl","php","php3","php4","php5",
                  "phtml","rb","rhtml","shtml","txt","vbs"]
	};
	var modalStat = true;
} else {
	var customExt = {
          img:["png","jpg","jpeg","gif","bmp"],
          swf:["swf"],
          flv:["flv","mp3","mp4","mov","m4v"],
          qt:["dv","moov","movie"],
          wmp:["asf","wm","wmv"],
          qtwmp:["avi","mpg","mpeg"],
          iframe:["asp","aspx","cgi","cfm","htm","html",
                  "jsp","pl","php","php3","php4","php5",
                  "phtml","rb","rhtml","shtml","txt","vbs","pdf"]
	};
	var modalStat = false;
};

Shadowbox.init({
	adapter: 'prototype',
	players: ["qt","html","img","iframe","swf","flv"],
	resizeDuration: .5,
	viewportPadding: 20,
	displayCounter: false,
	modal: modalStat,
	ext: customExt
});
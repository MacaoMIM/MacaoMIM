window.onload = function(){
	waterfall('main','box');
}
function waterfall(parent,box){
	var oParent=document.getElementById(parent);
	var oBox=getByClass(oParent,box);
	console.log(oBox.length);
}
function getByClass(parent,clsName){
	var boxArr = new Array(),
		oElements=parent.getElementsByTagName('*')
	for (var i = 0; i <oElements.length; i++) {
		if(oElements[i].className == clsName){
			boxArr.push(oElements[i]);
		}
	}
	return boxArr;
}
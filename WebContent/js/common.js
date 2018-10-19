/* ****************************/
/* 共通JavaScript             */
/*    common.js               */
/* ****************************/
function getNow(objId) {
	var nowDate = new Date();
    if (document.getElementById(objId) != null) {
        document.getElementById(objId).innerText = nowDate.toLocaleString();
    }
    setTimeout("getNow("+objId+")", 1000);
}

function logout() {
	if(!confirm("ログアウトしますか?")){
		return false;
	}
	var form = document.getElementById("headForm");
	form.action = "Login";
	form.submit();
	return true;
}

//英数字記号チェック
function alphaNumChk(value){
	//if(value.match(/[^0-9a-zA-Z]+/)){
	if(value.match("/[0-9a-zA-Z_\s!-/:-@[-`{-~]+/")){
		return false;
	}
	return true;
}

//半角数字チェック
function numChk(value){
	if(value.match(/[^0-9]+/)){
		return false;
	}
	return true;
}

//特定文字列チェック
function specificStrChk(targetStr, chkStr){
	var cnt;
	//特定文字数分ループ
	for(cnt=0; cnt<chkStr.length; cnt++){
		//チェック対象文字が特定文字の場合
		if(targetStr == chkStr[cnt]){
			return true;
		}
	}
	return false;
}

//同一入力チェック
function sameChk(value1, value2){
	if(value1 != value2){
		return false;
	}
	return true;
}

//同一入力エラーチェック
function sameErrChk(value1, value2){
	if(value1 == value2){
		return false;
	}
	return true;
}

//半角英数チェック
//return
//全て半角英数　　：false
//半角英数以外あり：true
function halfAlphaNumChk(value){
	if(value.match("^[0-9a-zA-Z]+$")){
		return false;
	}
	return true;
}

//メールチェック
//return
//全て半角英数　　：false
//半角英数以外あり：true
function mailChk(value){
	if(!value.match("^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$")){
		return false;
	}
	return true;
}

//読込んだファイル名の長さをチェック
function checkFileNameLength(filePathName){
	if(filePathName==""){
		return true;
	}
	var array = filePathName.split('\\');
	var fileName = array[array.length - 1];

	if (fileName.length - 5 > 70) {
	    return false;
	}
	return true;
}

//読込んだファイル名の拡張子（.xlsx）をチェック
function checkFileExtName(filePathName){
	if(filePathName==""){
		return true;
	}
	var array = filePathName.split('\\');
	var fileName = array[array.length - 1];
	var type = fileName.split('.');
	if (type[type.length - 1].toLowerCase()!='xlsx') {
	    return false;
	}
	return true;
}

//ボタン活性／非活性設定
function enableControl(enable,btnName){
	if(enable==false){
		document.getElementById(btnName).removeAttribute('disabled');
	}else{
		document.getElementById(btnName).setAttribute('disabled',true);
	}
}
//直近履歴戻る
function pullBack(){
	window.history.back(-1);
}

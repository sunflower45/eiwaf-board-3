/* sample.file.js | 관리자 파일처리 공통 */
function smff_FileUpload(fobj, params, url, tar) {
	cmf_ShowLoading("파일업로드");
	fobj.method = "post";
	fobj.encoding = "multipart/form-data";
	fobj.target = cmf_Iframe(utlf_Nvl2(tar, "upload"));
	fobj.action = utlf_Nvl2(url, "/app/common/HMZZ100100.etc") + "?" + params;
	fobj.submit();
}

function smff_FileUploadCallback(status, data) {
	cmf_HideLoading();
	fnFileUploadCallback(true, status, data);
}

function smff_FileUploadInfoHtml(data) {
	var tags = [];
	tags.push("<input type='text' name='fileType' value='"+ data.fileType +"'/>");
	var list = data.fileList;
	for (var ii = 0; ii < list.length; ++ii) {
		tags.push("<input type='text' name='inputFieldName' value='"+ list[ii].inputFieldName +"'/>");
		tags.push("<input type='text' name='inputFileName' value='"+ list[ii].inputFileName +"'/>");
		tags.push("<input type='text' name='saveFileName' value='"+ list[ii].saveFileName +"'/>");
		tags.push("<input type='text' name='fileSize' value='"+ list[ii].fileSize +"'/>");
	}
	return tags.join("");
}

function smff_FileFilter(f, filters) {
	return $("input:file", f).filter(filters.join(","));
}

function smff_IsFileModified(array) {
	var result = false;
	$(array).map(function() {
		if (!utlf_IsNullOrEmpty(this.value)) {
			result = true;
			return false;
		}
	});
	return result;
}

function smff_IsFileExtension(jObj, extensions, isCheckAll) {
	if (jObj.length == 0) {
		alert("검증할 파일이 없습니다.");
		return false;
	}
	var checkAll = utlf_Nvl(isCheckAll, true);
	var result = true;
	jObj.each(function() {
		if (utlf_IsNullOrEmpty(this.value)) {
			if (checkAll) {
				result = false;
				uif_AlertMsg("파일을 선택하십시오.", this);
				return false;
			} else {
				return true;
			}
		}
		if (!utlf_IsFileExtension(this.value, extensions)) {
			result = false;
			uif_AlertMsg("허용된 파일확장자 아닙니다.\n\n=> [허용 확장자:" +  extensions + "]", this);
			return false;
		}
	});
	return result;
}
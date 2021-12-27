<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div>색상</div>
<div class="option-colors-div">
<c:forEach items="${searchColorList}" var="color" varStatus="vs">
	<div class="color-box radio-wrap colorChage">
		<input type="radio" id="${color.optionColor}" data-goods-id="${goods.PId}" name="optionColor" ${vs.first ? 'checked' : ''}><br />
		<label for="${color.optionColor}">${color.optionColor}</label>
	</div>
</c:forEach>
</div>

<script>
$(() => {
	fn_searchImg();
	fn_colorChange();
	
	/* $(".colorChage input[type='radio']").change((e) => {
		fn_searchImg();
	}); */
});

</script>
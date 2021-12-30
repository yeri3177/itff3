package com.kh.spring.goods.model.vo;

public enum OptionColor {
	
	화이트("#f8f8f8"),
	연핑크("#f8d6d5"),
	블랙("#000000"),
	그린("#d8ebd5"),
	레드("#C71019"),
	블루("#2052a3"),
	골드("#fdd0a7"),
	로즈골드("#f8d6d5"),
	옐로우("#ffe276"),
	퍼플("#cbc6d6");
 
	private final String rgbValue; 
 
	OptionColor(String rgbValue) { 
		this.rgbValue = rgbValue; 
	}
 
	public String getRgbValue() { 
		return rgbValue; 
	}
}

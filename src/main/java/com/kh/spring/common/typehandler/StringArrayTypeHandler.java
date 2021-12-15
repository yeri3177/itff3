package com.kh.spring.common.typehandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.StringTokenizer;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
 * getter 3개 (쿼리결과 -> vo필드 세팅)
 * 	- ResultSet에서 column name으로 가져오기
 * 	- ResultSet에서 column index로 가져오기
 * 	- CallableStatement(프로시져)에서 index로 가져오기
 * setter 1개 (vo필드 -> 쿼리값 세팅)
 *	- setNonNullParameter String[] -> pstmt.setString
 *
 */
@MappedTypes(String[].class)
@MappedJdbcTypes(JdbcType.VARCHAR)
public class StringArrayTypeHandler extends BaseTypeHandler<String[]> {

	public static Logger log = LoggerFactory.getLogger(StringArrayTypeHandler.class);
	
	// setter : select같은거 할때
	@Override
	public void setNonNullParameter(PreparedStatement pstmt, int i, String[] parameter, JdbcType jdbcType)
			throws SQLException {
		String value = String.join(", ", parameter);  // 어제 숙제처럼 배열을 쿼리로 던질때, 안에 든 것들을 ,로 연결해서 String으로 만들어 줌
		pstmt.setString(i, value);
		log.debug("{} -> {} 변환완료", Arrays.toString(parameter), value);
	}

	// getter
	@Override
	public String[] getNullableResult(ResultSet rset, String columnName) throws SQLException {
		String columnValue = rset.getString(columnName);
		columnValue = columnValue.replaceAll("\\s", "");
		String[] value = null;
		if(columnValue != null) {
			StringTokenizer tokenizer = new StringTokenizer(columnValue, ", ");
			value = new String[tokenizer.countTokens()];   // db에서 가져온 문자열을 콤마로 나눠서 배열에 담을 건데, tokenizer.countTokens로 총 몇개인지를 구해서 배열의 크기로 한다.(이거 배열 선언문임. value = new String[3] 이런식으로)
			for(int i = 0; tokenizer.hasMoreTokens(); i++) {   // 토큰 있는 만큼(총 갯수만큼) 반복
				value[i] = tokenizer.nextToken();
			}
		}
		
		log.debug(
				"{} -> {} 변환완료", 
				columnValue, 
				value != null ? Arrays.toString(value) : null
				);
		return value;
	}

	@Override
	public String[] getNullableResult(ResultSet rset, int columnIndex) throws SQLException {
		String columnValue = rset.getString(columnIndex);
		columnValue = columnValue.replaceAll("\\s", "");
		String[] value = null;
		if(columnValue != null) {
			StringTokenizer tokenizer = new  StringTokenizer(columnValue, ", ");
			value = new String[tokenizer.countTokens()];
			for(int i = 0; tokenizer.hasMoreTokens(); i++) {
				value[i] = tokenizer.nextToken();
			}
		}
		
		log.debug(
				"{} -> {} 변환완료", 
				columnValue, 
				value != null ? Arrays.toString(value) : null
				);
		return value;
	}

	@Override
	public String[] getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		String columnValue = cs.getString(columnIndex);
		columnValue = columnValue.replaceAll("\\s", "");
		String[] value = null;
		if(columnValue != null) {
			StringTokenizer tokenizer = new  StringTokenizer(columnValue, ", ");
			value = new String[tokenizer.countTokens()];
			for(int i = 0; tokenizer.hasMoreTokens(); i++) {
				value[i] = tokenizer.nextToken();
			}
		}
		
		log.debug(
				"{} -> {} 변환완료", 
				columnValue, 
				value != null ? Arrays.toString(value) : null
				);
		return value;
	}



}

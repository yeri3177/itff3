package com.kh.spring.notify.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.notice.model.vo.Notice;
import com.kh.spring.notify.model.vo.SaveNotify;
import com.kh.spring.sharing.model.vo.Attachment;

public interface NotifyService {

	int insertSaveNotify(Map<String, Object> param);

	int selectCompareTime(String regTime);

	List<SaveNotify> searchNewNotifyList(String id);
}

package dao;

import java.util.List;

import entity.TitleInfo;

public interface TitleInfoDao {
	//通过考卷id查找考卷相关试题
		public List<TitleInfo> getTitleByPaperId(int paperId);
}

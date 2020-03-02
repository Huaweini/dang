package com.service.impl;

import com.dao.ParentArticleDao;
import com.pojo.ParentArticle;
import com.service.ParentArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ParentArticleSericeImpl implements ParentArticleService {
    @Autowired
    private ParentArticleDao parentArticleDao;

    @Override
    public List<ParentArticle> selectList() {
        return null;
    }

    @Override
    public int insert(ParentArticle param) {
        return 0;
    }

    @Override
    public ParentArticle selectById(Integer id) {
        return parentArticleDao.selectById(id);
    }

    @Override
    public int del(Integer id) {
        return parentArticleDao.del(id);
    }

    @Override
    public int update(ParentArticle parentArticle) {
        return parentArticleDao.updateSelective(parentArticle);
    }

    @Override
    public List<ParentArticle> searchParentArticle(String keyword) {
        return parentArticleDao.searchParentArticle(keyword);
    }

    @Override
    public List<ParentArticle> myTeacher(Integer classNum) {
        return null;
    }

    @Override
    public List<ParentArticle> myLeader(String unit) {
        return null;
    }
}


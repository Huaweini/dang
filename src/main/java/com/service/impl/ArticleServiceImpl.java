package com.service.impl;

import com.dao.ArticleDao;
import com.pojo.Article;
import com.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService{
    @Autowired
    private ArticleDao articleDao;

    @Override
    public int insert(Article param) {
        return 0;
    }

    @Override
    public int update(Article param) {
        return articleDao.updateSelective(param);
    }

    @Override
    public Article selectById(Integer id) {
        return articleDao.selectById(id);
    }

    @Override
    public int del(Integer param) {
        return articleDao.del(param);
    }

    @Override
    public List<Article> selectByParentId(Integer id) {
        return articleDao.selectByParentId(id);
    }

    @Override
    public List<Article> searchArticle(String keyword) {
        return articleDao.searchArticle(keyword);
    }

    @Override
    public Article checkLogin(String loginName, String password) {
        return null;
    }
}

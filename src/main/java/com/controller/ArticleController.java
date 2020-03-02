package com.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.pojo.Article;
import com.pojo.ParentArticle;
import com.service.ParentArticleService;
import com.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
@RequestMapping("/article")
public class ArticleController {
    @Autowired
    private ArticleService articleService;
    @Autowired
    private ParentArticleService parentArticleService;


    @RequestMapping("/index")
    public String index(Model model, String keyword) {
        //在查询之前需要调用，传入页码，以及每页的大小
        List<ParentArticle> list = parentArticleService.searchParentArticle(keyword);
        model.addAttribute("list",list);
        model.addAttribute("keyword",keyword);
        return "index";
    }

    @RequestMapping("editParentTitleList")
    @ResponseBody
    public  Object editParentTitleList(Integer id){
        return parentArticleService.selectById(id);
    }

    @RequestMapping("editParentTitle")
    @ResponseBody
    public  Object editParentTitle(ParentArticle parentArticle){
        parentArticleService.update(parentArticle);
        return parentArticle;
    }

    @RequestMapping("/del")
    @ResponseBody
    public Object del(Integer id) {
        return parentArticleService.del(id);
    }


    @RequestMapping("/article")
    public String list(Model model, Page<Article> page, @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize, String keyword) {
        List<Article> list = articleService.searchArticle(keyword);
        model.addAttribute("list",list);
        model.addAttribute("keyword",keyword);
        return "article";
    }

    @RequestMapping("editArticleList")
    @ResponseBody
    public  Object editArticleList(Integer id){
        return articleService.selectById(id);
    }

    @RequestMapping("editArticle")
    @ResponseBody
    public  Object editArticle(Article article){
        articleService.update(article);
        return article;
    }

    @RequestMapping("/delArticle")
    @ResponseBody
    public Object delArticle(Integer id) {
        return articleService.del(id);
    }

}

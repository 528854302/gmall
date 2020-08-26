package com.a528854302.gmall.provider.service.impl;

import com.a528854302.gmall.provider.vo.Catelog2Vo;
import com.a528854302.gmall.provider.vo.Catelog3Vo;
import com.alibaba.fastjson.JSON;
import io.lettuce.core.RedisClient;
import org.apache.commons.lang.StringUtils;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.BoundValueOperations;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.a528854302.common.utils.PageUtils;
import com.a528854302.common.utils.Query;
import com.a528854302.gmall.provider.dao.CategoryDao;
import com.a528854302.gmall.provider.entity.CategoryEntity;
import com.a528854302.gmall.provider.service.CategoryService;


@Service("categoryService")
public class CategoryServiceImpl extends ServiceImpl<CategoryDao, CategoryEntity> implements CategoryService {

    @Autowired
    RedissonClient redissonClient;

    @Autowired
    StringRedisTemplate redisTemplate;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<CategoryEntity> page = this.page(
                new Query<CategoryEntity>().getPage(params),
                new QueryWrapper<CategoryEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public List<CategoryEntity> listTree() {
        List<CategoryEntity> list = this.list();
        return list.stream().filter(i->i.getParentCid()==0)
                .map(i->{
                    i.setChildren(getChildren(i,list));
                    return i;
                })
                .collect(Collectors.toList());

    }

    @Override
    public List<CategoryEntity> listLevel1Categories() {
        return this.list(new QueryWrapper<CategoryEntity>().eq("parent_cid",0));
    }

    @Override
    public Map getCatelogJsonStringFromRedis(){
        BoundValueOperations<String, String> ops = redisTemplate.boundValueOps("catelogJson");
        String s = ops.get();
        if (StringUtils.isEmpty(s)){
            RLock lock = redissonClient.getLock("catelogLock");
            lock.lock();
            Map<Long, List<Catelog2Vo>> catelog = getCatelogJson();
            lock.unlock();
            s=JSON.toJSONString(catelog);
            ops.set(s,12, TimeUnit.HOURS);
        }
        return JSON.parseObject(s,Map.class);
    }

    @Override
    public Map<Long, List<Catelog2Vo>> getCatelogJson() {
        List<CategoryEntity> list = this.list();
        HashMap<Long, List<Catelog2Vo>> map = new HashMap<>();
        list.stream().filter(item->item.getParentCid()==0).forEach(item->{
            List<CategoryEntity> level2Children = getChildren(item, list);
            List<Catelog2Vo> vos = level2Children.stream().map(level2Child -> {
                Catelog2Vo catelog2Vo = new Catelog2Vo();
                catelog2Vo.setId(level2Child.getCatId());
                catelog2Vo.setCatalog1Id(item.getCatId());
                catelog2Vo.setName(level2Child.getName());
                catelog2Vo.setCatelog3List(getChildren(level2Child,list).stream().map(level3Child->{
                    Catelog3Vo catelog3Vo = new Catelog3Vo();
                    catelog3Vo.setCatelog2Id(level2Child.getCatId());
                    catelog3Vo.setId(level3Child.getCatId());
                    catelog3Vo.setName(level3Child.getName());
                    return catelog3Vo;
                }).collect(Collectors.toList()));
                return catelog2Vo;
            }).collect(Collectors.toList());
            map.put(item.getCatId(),vos);
        });
        return map;
    }

    private List<CategoryEntity> getChildren(CategoryEntity i, List<CategoryEntity> list) {
        return list.stream().filter(item->item.getParentCid()==i.getCatId())
                .map(item->{
                    item.setChildren(getChildren(item,list));
                    return item;
                }).collect(Collectors.toList());
    }


}
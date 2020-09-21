<?php
/**
 * Created by PhpStorm.
 * User: hjun
 * Date: 2018/4/18
 * Time: 17:03
 */

namespace Common\Interfaces;

interface Cache
{
    /**
     * 设置信息缓存
     * User: hjun
     * Date: 2018-04-18 16:56:12
     * Update: 2018-04-18 16:56:12
     * Version: 1.00
     */
    public function setInfoCache();

    /**
     * 获取信息缓存
     * @return array
     * User: hjun
     * Date: 2018-04-18 16:56:19
     * Update: 2018-04-18 16:56:19
     * Version: 1.00
     */
    public function getInfoCache();

    /**
     * 清除信息缓存
     * User: hjun
     * Date: 2018-04-18 16:57:23
     * Update: 2018-04-18 16:57:23
     * Version: 1.00
     */
    public function clearInfoCache();

    /**
     * 设置列表缓存
     * @param string $key
     * @param array $list
     * User: hjun
     * Date: 2018-04-18 16:57:34
     * Update: 2018-04-18 16:57:34
     * Version: 1.00
     */
    public function setListCache($key = '', $list = []);

    /**
     * 获取列表缓存
     * @param string $key
     * @return array
     * User: hjun
     * Date: 2018-04-18 16:57:41
     * Update: 2018-04-18 16:57:41
     * Version: 1.00
     */
    public function getListCache($key = '');

    /**
     * 清除列表缓存
     * User: hjun
     * Date: 2018-04-18 16:57:49
     * Update: 2018-04-18 16:57:49
     * Version: 1.00
     */
    public function clearListCache();

    /**
     * 新增记录之前清除缓存的操作
     * User: hjun
     * Date: 2018-04-18 16:57:58
     * Update: 2018-04-18 16:57:58
     * Version: 1.00
     */
    public function beforeAddClearCache();

    /**
     * 更新记录之前清除缓存的操作
     * User: hjun
     * Date: 2018-04-18 16:58:08
     * Update: 2018-04-18 16:58:08
     * Version: 1.00
     */
    public function beforeUpdateClearCache();

    /**
     * 删除记录之前清除缓存的操作
     * User: hjun
     * Date: 2018-04-18 16:58:16
     * Update: 2018-04-18 16:58:16
     * Version: 1.00
     */
    public function beforeDelClearCache();
}
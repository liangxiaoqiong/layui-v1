<?php

namespace Common\Service;

/**
 * 园区服务类
 * Class GardenService
 * @package Common\Service
 * User: hjun
 * Date: 2018-04-29 14:51:50
 * Update: 2018-04-29 14:51:50
 * Version: 1.00
 */
class GardenService extends BaseService implements \Common\Service\interfaces\GardenService
{
    /**
     * 获取某个园区的信息
     * @param int $gardenId 园区ID
     * @return array 返回园区信息的数组 结构:
     *   [
     *     'garden_id' => '', 园区ID
     *     'garden_name' => '', 园区名称
     *     'manager_name' => '', 负责人姓名
     *     'manager_mobile' => '', 负责人电话
     *     'admin_name' => '', 登录账号
     *     'end_time' => '', 结束日期时间戳
     *     'end_time_str' => '', 结束日期格式化
     *     'remark' => '', 备注
     *     'garden_status' => '', 园区状态 0-暂停 1-开启
     *   ]
     * User: hjun
     * Date: 2018-04-29 15:30:45
     * Update: 2018-04-29 15:30:45
     * Version: 1.00
     */
    public function get($gardenId = 0)
    {
        // TODO: Implement get() method.
    }

    /**
     * 获取园区管理页面数据
     * @param int $page 页数
     * @param int $limit 限制条数
     * @param array $options 查询的附加条件
     * @return array 返回数据对象 结构为:
     *   [
     *     'list' => [
     *       [
     *         'garden_id' => '', 园区ID
     *         'garden_name' => '', 园区名称
     *         'manager_name' => '', 负责人姓名
     *         'manager_mobile' => '', 负责人电话
     *         'admin_name' => '', 登录账号
     *         'end_time' => '', 结束日期时间戳
     *         'end_time_str' => '', 结束日期格式化
     *         'remark' => '', 备注
     *         'garden_status' => '', 园区状态 0-暂停 1-开启
     *         'garden_status_str' => '', 园区状态的字符串描述
     *         'create_time' => '', 园区的开通时间戳
     *         'create_time_str' => '', 开始时间格式化
     *       ]
     *     ],
     *     'meta' => [
     *       'total' => '', 总数
     *       'stop' => '', 暂停数量
     *       'normal' => '', 正常数量
     *       'end' => '', 到期数量
     *     ]
     *   ]
     * User: hjun
     * Date: 2018-04-29 15:04:06
     * Update: 2018-04-29 15:04:06
     * Version: 1.00
     */
    public function getManageViewData($page = 1, $limit = 20, $options = [])
    {
        // TODO: Implement getManageViewData() method.
    }

    /**
     * 新增园区
     * @param array $request 请求参数
     * @return array 返回新增后的园区数据数组
     * User: hjun
     * Date: 2018-04-29 14:58:27
     * Update: 2018-04-29 14:58:27
     * Version: 1.00
     */
    public function insert($request = [])
    {
        // TODO: Implement insert() method.
    }

    /**
     * 编辑园区信息
     * @param array $request 请求参数
     * @return array 返回修改后的园区数据数组
     * User: hjun
     * Date: 2018-04-29 15:00:22
     * Update: 2018-04-29 15:00:22
     * Version: 1.00
     */
    public function update($request = [])
    {
        // TODO: Implement update() method.
    }

    /**
     * 开启园区
     * @param int $gardenId 园区ID
     * @return int 返回园区状态
     * User: hjun
     * Date: 2018-04-29 15:11:11
     * Update: 2018-04-29 15:11:11
     * Version: 1.00
     */
    public function startById($gardenId = 0)
    {
        // TODO: Implement startById() method.
    }

    /**
     * 暂停园区
     * @param int $gardenId 园区ID
     * @return int 返回园区状态
     * User: hjun
     * Date: 2018-04-29 15:11:54
     * Update: 2018-04-29 15:11:54
     * Version: 1.00
     */
    public function stopById($gardenId = 0)
    {
        // TODO: Implement stopById() method.
    }

}
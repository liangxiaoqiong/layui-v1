<?php

return array(

    //配置RBAC权限
    //'RBAC_SUPERADMIN' => 'mengj',		//超级管理员名称(非系统带),
    'ADMIN_AUTH_KEY' => 'yang_adm_superadmin',    //超级管理员识别
    'USER_AUTH_ON' => true,            //开启验证
    'USER_AUTH_TYPE' => 1,                //验证类型(1:登录验证,2:实时验证[每步操作都去读数据库])
    'USER_AUTH_KEY' => 'yang_adm_uid',            //用户认证识别号
    'NOT_AUTH_MODULE' => 'Index,Public,Test,WxPay,Wxpaynotify',            //无需认证的模块(控制器)
    //退出不需要验证//安装的时候表前缀一定要更改(yy_)//debug
    'NOT_AUTH_ACTION' => 'logout',        //无需认证的动作方法
    'RBAC_ROLE_TABLE' => C('DB_PREFIX') . 'role',        //数据库角色表名称
    'RBAC_USER_TABLE' => C('DB_PREFIX') . 'role_user',//角色与用户的中间表名,不是用户表名
    'RBAC_ACCESS_TABLE' => C('DB_PREFIX') . 'access',    //权限表名
    'RBAC_NODE_TABLE' => C('DB_PREFIX') . 'node',    //节点表名称

    //'VAR_SESSION_ID' => 'PHPSESSID',//post方式 提交 session_id//Public uploadFile
    'TMPL_TEMPLATE_SUFFIX' => '.html',//模板后缀

    //去掉伪静态后缀
    'URL_HTML_SUFFIX' => '',

    //禁止静态缓存
    'HTML_CACHE_ON' => false,

    'TMPL_PARSE_STRING' => array(
        '__PUBLIC2__' => '/system/product',
        '__PUBLIC__' => __ROOT__ . '/' . APP_PATH_NAME . '/' . MODULE_NAME . '/View/Public',
        '__DATA__' => __ROOT__ . '/Data',
        '__ADMIN__' => __ROOT__ . '/Data/admin',
        '__VUE__' => VUE,
        '__APP_UTIL__' => APP_UTIL,
        '__CITY_JS__' => CITY_JS,
        '__MOMENT__' => __ROOT__ . '/Data/static/jq_plugins/moment/moment.js?v=' . EXTRA_VERSION
    ),

    /* SESSION设置 */
    'SESSION_PREFIX' => 'TGMANAGE_', // session 前缀

    /* Cookie设置 */
    'COOKIE_PREFIX' => 'TGMANAGE_', // Cookie前缀 避免冲突

    'URL_MODEL' => 3, //URL模式
    // 开启路由
    'URL_ROUTER_ON' => true,
    // 路由定义
    'URL_ROUTE_RULES' => array(
        // 登录
        'loginUp' => 'Login/login',

        // 园区组
        'choiceList' => 'GardenGroup/getChoiceList', // 获取园区选择列表
        'selectGarden' => 'GardenGroup/selectGarden', // 选择园区

        // 园区
        'authInfo' => 'Garden/getAdmin', // 获取当前管理员信息

        // region 公共
        'getLeftData' => 'Public/getLeftData', // 获取左侧楼宇列表
        'getRightData' => 'Public/getRightData', // 获取左侧楼宇列表
        'getBuildingDetail' => 'Public/getBuildingDetail', // 获取楼宇详情
        'getSundryData' => 'Public/getSundryData', // 获取杂项数据
        'getFloor' => 'Public/getFloor', // 获取楼层数据
        'getRoomInfoBeforeSign' => 'Public/getRoomInfoBeforeSign', // 签约之前获取房间的基础信息
        'getContractActionData' => 'Public/getContractActionData', // 获取签约页面的数据
        'getContract' => 'Public/getContract', // 获取合同数据
        'previewContract' => 'Public/previewContract', // 获取预览的数据合同
        'getPublicBillList' => 'Public/getPublicBillList', // 获取公摊列表
        'getPublicBillSelectList' => 'Public/getPublicBillSelectList', // 获取公摊的房间选择列表
        'getPublicBillInfo' => 'Public/getPublicBillInfo', // 获取公摊数据
        'getBillDetail' => 'Public/getBillDetail', // 账单详细数据
        'getBillBeforeCollect' => 'Public/getBillBeforeCollect', // 收租时获取账单
        'billPrint' => 'Public/billPrint', // 打印账单页面
        'publicBillRoom' => 'Public/publicBillRoom', // 公摊房间选择页面
        'contractPrint' => 'Public/contractPrint', // 合同打印预览
        'getBuildingList' => 'Public/getBuildingList', // 获取楼宇列表选择项
        'getNews' => 'Public/getNews', // 获取资讯数据
        'signContract' => 'Public/showContractAction', // 签约页面
        'evictionDetail' => 'Index/evictionDetail', // 退租账单详情
        'getEvictionDetail' => 'Public/getEvictionDetail', // 获取退租账单详情
        'evictionContract' => 'Public/evictionContract', // 退租页面
        // endregion

        // region 楼宇
        'addBuilding' => 'Building/addBuilding', // 添加园区（楼宇）
        'updateBuilding' => 'Building/updateBuilding', // 编辑园区（楼宇）
        'delBuilding' => 'Building/delBuilding', // 删除园区（楼宇）
        'exportList' => 'Building/exportList', // 导出列表
        // endregion

        // region 楼层

        'addFloor' => 'Floor/addFloor', // 添加楼层
        'updateFloor' => 'Floor/updateFloor', // 编辑楼层
        'delFloor' => 'Floor/delFloor', // 删除楼层
        // endregion

        // region 房间
        'addRoom' => 'Room/addRoom', // 添加房间
        'updateRoom' => 'Room/updateRoom', // 编辑房间
        'updateRoomFacility' => ['Room/updateRoom', 'action=facility'], // 编辑设施
        'delRoom' => 'Room/delRoom', // 删除房间
        'getRoomDetail' => 'Room/getRoomDetail', // 房间详情
        'mergeRoom' => 'Room/mergeRoom', // 合并房间
        'cancelMerge' => 'Room/cancelMerge', // 解除合并
        // endregion

        // region 合同
        'draftContract' => 'Contract/draftContract', // 拟稿
        'auditContract' => 'Contract/auditContract', // 核对
        'confirmContract' => 'Contract/confirmContract', // 批准
        'rejectContract' => 'Contract/rejectContract', // 退回
        'updateContract' => ['Contract/draftContract', 'status=confirmed'], // 批准后更新合同
        'delContract' => 'Contract/delContract', // 删除合同
        'relet' => ['Contract/relet', 'type=1'], // 续租
        // endregion

        // region 公摊
        'addPublicBill' => 'PublicBill/add', // 创建公摊
        'publicBillDetail' => 'PublicBill/detail', // 公摊明细
        'exportPublicBillDetail' => 'PublicBill/exportDetail', // 导出公摊明细
        // endregion

        // region 账单
        'needCollectList' => 'Bill/index', // 应收账单列表
        'collectedList' => 'Bill/index2', // 已收账单列表
        'sendBillMessage' => 'Bill/sendBillMessage', // 催租
        'collectBill' => 'Bill/collectBill', // 收租
        'addBill' => 'Bill/addBill', // 添加账单
        'addMeterBill' => ['Bill/addBill', 'type=meter_bill'], // 添加抄表账单
        'updateBill' => 'Bill/updateBill', // 更新账单
        'delBill' => 'Bill/delBill', // 删除账单
        // endregion

        // region 收支明细
        'tradeList' => 'Trade/index', // 收支明细
        'delTrade' => 'Trade/delTrade', // 删除收支明细
        // endregion 收支

        // region 会员管理
        'getMemberListData' => 'Member/index', // 获取会员列表数据
        // endregion

        // region 报表
        'statementDay' => ['Statement/index', 'action=query'], // 获取日数据
        'statementMonth' => ['Statement/index', 'action=query'], // 获取月数据
        'statementExport' => ['Statement/index', 'action=export'], // 导出报表
        // endregion

        // region 资讯
        'getNewsIndexData' => 'GardenNews/index', // 获取资讯列表
        'getNewsClassIndexData' => 'GardenNews/newsClass', // 获取分类列表
        'addNews' => 'GardenNews/addNews', // 新增资讯
        'updateNews' => 'GardenNews/updateNews', // 修改资讯
        'updateNewsSort' => 'GardenNews/updateNewsSort', // 修改资讯排序
        'updateNewsShow' => 'GardenNews/updateNewsShow', // 修改资讯显示状态
        'deleteNews' => 'GardenNews/deleteNews', // 删除资讯
        'batchDeleteNews' => 'GardenNews/batchDeleteNews', // 批量删除资讯
        'addNewsClass' => 'GardenNews/addNewsClass', // 新增资讯分类
        'updateNewsClass' => 'GardenNews/updateNewsClass', // 新增资讯分类
        'updateNewsClassSort' => 'GardenNews/updateNewsClassSort', // 修改资讯分类排序
        'updateNewsClassShow' => 'GardenNews/updateNewsClassShow', // 修改资讯愤怒类显示状态
        'deleteNewsClass' => 'GardenNews/deleteNewsClass', // 删除资讯分类
        // endregion
    ),
);


?>
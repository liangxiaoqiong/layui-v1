<?php

namespace Api\Controller;

use Common\Model\BillModel;
use Common\Model\ContractModel;
use Think\Controller;

class TestController extends Controller
{
    public function __construct()
    {
        parent::__construct();
        header("Content-Type: text/html; charset=UTF-8");
        set_time_limit(3500);
    }

    /*查看详情*/
    public function index()
    {
        $meter = M('power_meter');
        $config = M('system_config');
        $w = array();
        $w['wjd_system_config.is_delete'] = 0;
        $w['wjd_system_config.garden_id'] = 1;
        $w['wjd_garden.is_delete'] = 0;
        $w['wjd_garden.garden_status'] = 1;
        $info = $config->join('wjd_garden ON wjd_system_config.garden_id = wjd_garden.garden_id')->where($w)->field('wjd_system_config.garden_id,wjd_system_config.electricity_meter_api')->find();
        $url = $info['electricity_meter_api'];
        $params = array();
        $params['garden_id'] = $info['garden_id'];
        $params['timestamp'] = time();
        $params['action'] = 'getPowerDetail';
        $params['meter_no'] = "0101000357";
        $params['sign'] = MakeSign($params);
        $rt = json_decode(httpRequest($url, 'POST', $params), true);
        dump($rt);

    }

    /*控制开关*/
    public function index2()
    {
        $meter = M('power_meter');
        $config = M('system_config');
        $w = array();
        $w['wjd_system_config.is_delete'] = 0;
        $w['wjd_system_config.garden_id'] = 1;
        $w['wjd_garden.is_delete'] = 0;
        $w['wjd_garden.garden_status'] = 1;
        $info = $config->join('wjd_garden ON wjd_system_config.garden_id = wjd_garden.garden_id')->where($w)->field('wjd_system_config.garden_id,wjd_system_config.electricity_meter_api')->find();
        $url = $info['electricity_meter_api'];
        $params = array();
        $params['garden_id'] = $info['garden_id'];
        $params['timestamp'] = time();
        $params['action'] = 'getPowerDetail';
        $params['meter_no'] = "0101000357";
        $params['sign'] = MakeSign($params);
        $rt = json_decode(httpRequest($url, 'POST', $params), true);
        dump($rt);

    }

    /*导入生产环境的会员用以测试*/
    public function saveMember()
    {
        $member = M('member')->limit(1000)->select();
        F('member_list', $member);
    }

    /*写入测试环境会员列表*/
    public function exportMember()
    {
        $member = F('member_list');
        $result = M('member')->addAll($member);
    }

    /*为导入的会员添加充值流水*/
    public function addRechargeList()
    {
        $memberList = M('member')->where(['id' => ['gt', 130]])->field('id,mall_id,username,nick_name')->select();
        $data = [];
        foreach ($memberList as $member) {
            $v = [];
            $v['mall_id'] = $member['mall_id'];
            $v['trade_no'] = 'xjcz1593763575102662';
            $v['member_id'] = $member['id'];
            $v['member_name'] = $member['username'];
            $v['member_nickname'] = $member['nick_name'];
            $v['trade_project'] = 6;
            $v['funds_type'] = 3;
            $v['flow_type'] = 0;
            $v['remark'] = '充值单号：xjcz1593763575102662';
            $v['create_time'] = NOW_TIME;
            $v['money'] = 100;
            $v['result_money'] = 100;
            $data[] = $v;
        }
        $result = M('trade_detail')->addAll($data);
    }

    /*开启复购*/
    public function addAutoBuy()
    {
        $memberList = M('member')->where(['id' => ['gt', 130]])->field('id,mall_id,username,nick_name')->select();
        $data = [];
        foreach ($memberList as $member) {
            $v = [];
            $v['mall_id'] = $member['mall_id'];
            $v['member_id'] = $member['id'];
            $v['group_type'] = 1;
            $v['goods_id'] = 5;
            $v['auto_buy_type'] = 1;
            $v['create_time'] = NOW_TIME;
            $v['is_history'] = 0;
            $data[] = $v;
        }
        $result = M('auto_buy')->addAll($data);
    }
}     

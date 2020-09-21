/**
 * @author   liangxiaoqiong
 * @version  1.0
 * @date 2018-04-18.
 */
'use strict';
var vm = new Vue({
  el: '#app',
  data: function () {
    return {
      /**
       * 父级数据
       */
      parent: parent.vm.$data,

      /**
       * 房间数据
       */
      room: {
        "room_id": REQ['rid'] > 0 ? REQ['rid'] : 0, // string,房间ID",
        "room_show_name": "", // string,房间名称",
        "building_address": "", // string,楼宇地址",
        "room_area": "", // string,房间面积",
        "rent_type": "", // string,租金方式 0-按平方 1-按固定额",
        "rent_value": "", // string,租金 （用于计算押金）",
        "facility_name": [],
        "room_desc": "", // string,房间描述"
      },

      /**
       * 合同数据
       */
      contract: {
        "room_id": REQ['rid'] > 0 ? REQ['rid'] : 0, // string,签约的房间ID",
        "customer_name": "", // string,租客名称",
        "customer_mobile": "", // string,手机号码",
        "leader_name": "", // string,负责人姓名",
        "reminder_mobile": "", // string,接收账单提醒的手机号码",
        "customer_id_type": "", // string,证件类型 0-身份证 1-护照",
        "customer_id_number": "", // string,证件号码",
        "customer_id_pictures": [],
        "contract_pictures": [],
        "remark": "", // string,合同备注",
        "deposit_num": "", // string,押数",
        "deposit": "", // string,押金（押数 * 租金 或者自定义）",
        "pay_type": "", // string,支付周期 0-月付 1-季付 2-半年付 3-年付 4-其他",
        "pay_period": "", // string,周期月数（当pay_type=4时可输入）",
        "collect_rental_type": "", // string,收租方式 0-提前日 1-固定日",
        "advanced_days": "", // string,提前的天数",
        "fixed_pay_date": "", // string,固定收租日期（每月的几号）",
        "segments_info": [
          {
            "start_time": "", // 开始时间
            "end_time": "", // 结束时间
            "rent_type": "", // 租金方式 0-按平方出租 1-按固定额
            "rent_value": "", // 租金方式值   元/平方/月   元/月
            "month_rental": "100", // 月租金0
            "total_rental": "1000", // 合计租金
            "total_time": "", // 总共的时间字符串
            "pay_type": "", // 支付周期方式 0-月付 1-季付 2-半年付 3-年付 4-其他
            "pay_period": "", // 周期月数
          }
        ],
        "charging_info": [
          {
            "item_id": "", // string,杂费项ID",
            "item_name": "", // string,杂费名称",
            "charge": "", // string,收费方式 0-固定每月收费",
            "fee": "", // string,费用  元/月"
          }
        ],
        "qrcode_id": "", // string,收款二维码ID",
        "tpl_id": "", // string,合同模版ID"
      },
    }
  },

  created: function () {
    var self = this
    if (self.room.room_id > 0) {
      AppUtil.ajaxRequest({
        url: APP + '/getRoomInfoBeforeSign',
        data: {
          room_id: self.room.room_id
        }
      }).then(function (result) {
        self.room = result.data
      }).catch(function (result) {

      })
    }
  },

  methods: {
    /*设置涨幅*/
    setGain: function () {
      layer.confirm($('.set-gain'), {type: 1, title: '快捷换算', skin: 'layer-confirm'}, function (index) {
        layer.close(index);
      })
    },
  }
})
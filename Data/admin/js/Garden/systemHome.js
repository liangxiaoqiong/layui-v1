/**
 * @author   liangxiaoqiong
 * @version  1.0
 * @date 2018-03-27.
 */
  'use strict';
var vm = new Vue({
  el:'#app',
  data: function () {
    return {
      query:{
        time:'',//选择的日期时间（左侧表格日期）
        timeType:1,//时间状态（1：所有逾期未处理，2：今日到期，3：未来5天内到期）
        tableType:1,//表格tab类别（1：应收账单，2：租客合同）
      },
      rightData:{
        tabType:'',//显示的模块id（1：应收账单，2：租客合同）
        data:{}//显示的模块内容
      }//右侧滑块内容
    }
  },
  mounted:function(){

  },
  /*directives: {
    // 日期控件
    layDate: {
      bind: function (el, binding) {
        laydate.render({
          elem: el,
          type: 'date',
          done: function (value, date, endDate) {
            // 根实例
            var obj = vm;
            var param = binding.value;
            if (binding.value.indexOf('.') !== -1) {
              var arr = binding.value.split('.');
              param = arr[arr.length - 1];
              obj = vm[arr[0]];
              for (var i = 1; i < arr.length - 1; i++) {
                if (typeof obj[arr[i]] !== 'undefined') {
                  obj = obj[arr[i]];
                }
              }
            }
            vm.$set(obj, param, value);
          }
        });
      }
    },
  },*/
  methods:{
    /**
     * 切换 应收账单1/租客合同2
     * */
    billContractTab:function (tabType) {
      var self = this;
      self.query.tableType = tabType;
    },
    /**
     * 显示账单/合同信息
     * */
    billContractInfo: function () {
      var self = this;
      self.rightData.tabType = self.query.tableType;
      //self.rightData.data = data_;
      publicObj.slideRight('show');
    },
    /**
     * 租客账单 弹框 start
     * */
    /*确认收租弹框 /data_!==undefined 收租(表格action)*/
    collectRentLayer: function (data_) {
     publicObj.layerShow(2,'确认收租',APP + '/collectBill');
    },
    /*发送账单弹框 / data_!==undefined 催租(表格action)*/
    billSend: function (data_) {
      publicObj.layerShow(2,'发送账单',APP + '/sendBillMessage',{w_:'550px',h_:'350px'});
    },
    /*编辑账单弹框*/
    billEditLayer: function () {
      publicObj.layerShow(2,'编辑账单',APP + '/addBill');
    },
    /*删除账单*/
    billDel: function () {
      layer.confirm('您是否确认删除该账单，删除该账单后，将不可恢复。',{title:'删除账单', skin: 'layer-confirm'}, function (index) {
        publicObj.layerMsg('删除成功',1);
        layer.close(index);
      })
    },
    /*打印账单弹框*/
    billPrintLayer: function () {
      layer.open({
        type: 2,
        area: ['500px', '90%'],
        fix: false, //不固定
        title: '',
        closeBtn:0,
        content: APP + '/billPrint'
      });
    },
    /**
     * 租客账单 end
     * */
    /**
     *租客合同弹框 start
     *  */
    /*续租 /data_!==undefined (表格action)reletRoom*/
    contractInfoLayer:function (data_) {
      publicObj.layerShow(2,'续租',APP + '/Index/contractInfo',{w_:'90%',h_:'90%'});
    },
    /*退租 /data_!==undefined (表格action)*/
    throwLeaseLayer:function (data_) {
      layer.confirm('您还有20个应收未收账单未处理，是否确认退租?',{title:'退租', skin: 'layer-confirm'}, function (index) {
        publicObj.layerShow(2,'退租',APP + '/Index/throwLease');
      })
    }
    /**
     *租客合同弹框 end
     *  */
  }
})
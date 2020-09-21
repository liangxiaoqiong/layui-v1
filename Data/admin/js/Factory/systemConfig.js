/**
 * @author   liangxiaoqiong
 * @version  1.0
 * @date 2018-03-27.
 */
'use strict';
var vm = new Vue({
  el: '#app',
  components: {
    'area-code-phone': COMPONENT.AREA_CODE_PHONE_COMPONENT,
    'service-receipt-layer': COMPONENT.SERVICE_RECEIPT_LAYER,
    'electric-receipt-layer': COMPONENT.ELECTRIC_RECEIPT_LAYER,
  },
  data: function () {
    return {
      sundryData: {},
      showCollectionAccount: false,
      loadCompleted: false,
      tabId: 1, //顶部tab切换
      timeNum: 3,
      textNum: 10,
      configData: {
        service_ctrl: 0,
        service_name: '',
      },
      timeList: [],
      editContractSn: {} // 编辑合同编号规则
    }
  },
  computed: {
    contractSn: function () {
      if ((typeof this.configData.pipeline_number_prefix === "undefined" || this.configData.pipeline_number_prefix === '')
        || (typeof this.configData.pipeline_number_suffix === "undefined" || this.configData.pipeline_number_suffix === '' || this.configData.pipeline_number_suffix == 0)) {
        return 0
      } else {
        return this.configData.pipeline_number_prefix + '' + publicObj.padNum(1, +this.configData.pipeline_number_suffix)
      }
    }
  },
  mounted: function () {
    for (var i = 1; i <= this.timeNum; i++) {
      this.$set(this.configData, 'time_ctrl_' + i, 0)
      this.$set(this.configData, 'time_name_' + i, '')
    }
    for (var i = 1; i <= this.textNum; i++) {
      this.$set(this.configData, 'text_ctrl_' + i, 0)
      this.$set(this.configData, 'text_name_' + i, '')
    }
    var timeList = []
    for (var i = 0; i < 24; i++) {
      var time = publicObj.padNum(i, 2)
      timeList.push('' + time + ':00')
    }
    this.timeList = timeList
    this.getSundryData();
    this.getData();
  },

  methods: {
    /**
     * 获取杂项数据
     */
    getSundryData: function () {
      var self = this
      AppUtil.ajaxRequest({
        url: APP + '/getSundryData'
      }).then(function (result) {
        self.sundryData = result.data
      }).catch(function (result) {

      })
    },
    getData: function () {
      var self = this;
      AppUtil.ajaxRequest({
        url: APP +'/Factory/systemConfigInfo',
        type: 'POST',
      }).then(function (result) {
        result.data.custom_payment_list = [{name: '减免费用', isEdit: 1}]//自定义收款方式数组
        self.configData = result.data;
        self.loadCompleted = true
        layer.closeAll()
      })
    },
    changeTab: function (tid) {
      if (typeof tid !== 'undefined') {
        this.tabId = tid
      }
    },
    saveData: function () {
      var self = this;
      AppUtil.ajaxRequest({
        url: APP +'/Factory/editSystemConfigInfo',
        data: self.configData,
        type: 'POST',
      }).then(function (result) {
        publicObj.layerMsg('系统设置成功', 1);
        self.getData();
      })

    },

  }
})
layui.use(['upload','layer','element'],function(){
  var form = layui.form(),
    jq = layui.jquery
    ,element = layui.element();
  var loading;
  layui.upload({
    url: "/admin.php?c=Public&a=upload"
    ,elem:'#qrcodeImg'
    ,before: function(input){
      loading = layer.load(2, {
        shade: [0.2,'#000']
      });
    }
    ,success: function(res,input){
      console.log(res);
      vm.configData.qr_code_img = res.url;
      layer.close(loading);
      publicObj.layerMsg('上传成功！', 1);
    }
  });
});
layui.use(['upload','layer','element'],function(){
  var form = layui.form(),
    jq = layui.jquery
    ,element = layui.element();
  var loading;
  layui.upload({
    url: "/admin.php?c=Public&a=upload"
    ,elem:'#qrcodeImg2'
    ,before: function(input){
      loading = layer.load(2, {
        shade: [0.2,'#000']
      });
    }
    ,success: function(res,input){
      console.log(res);
      vm.configData.qr_code_img_2 = res.url;
      layer.close(loading);
      publicObj.layerMsg('上传成功！', 1);
    }
  });
});
layui.use(['upload','layer','element'],function(){
  var form = layui.form(),
    jq = layui.jquery
    ,element = layui.element();
  var loading;
  layui.upload({
    url: "/admin.php?c=Public&a=upload"
    ,elem:'#electricqrcodeImg'
    ,before: function(input){
      loading = layer.load(2, {
        shade: [0.2,'#000']
      });
    }
    ,success: function(res,input){
      console.log(res);
      vm.configData.electric_qr_code_img = res.url;
      layer.close(loading);
      publicObj.layerMsg('上传成功！', 1);
    }
  });
});
layui.use(['upload','layer','element'],function(){
  var form = layui.form(),
    jq = layui.jquery
    ,element = layui.element();
  var loading;
  layui.upload({
    url: "/admin.php?c=Public&a=upload"
    ,elem:'#electricqrcodeImg2'
    ,before: function(input){
      loading = layer.load(2, {
        shade: [0.2,'#000']
      });
    }
    ,success: function(res,input){
      console.log(res);
      vm.configData.electric_qr_code_img_2 = res.url;
      layer.close(loading);
      publicObj.layerMsg('上传成功！', 1);
    }
  });
});

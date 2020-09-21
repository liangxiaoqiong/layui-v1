/**
 * @author   liangxiaoqiong
 * @version  1.0
 * @date 2018-05-10.
 *
 * $saveData['logo'] = $this->req['logo'];
 $saveData['longitude'] = $this->req['longitude'];
 $saveData['latitude'] = $this->req['latitude'];
 $saveData['address'] = $this->req['address'];
 $saveData['about_garden'] = $this->req['about_garden'];
 $saveData['service_tel'] = $this->req['service_tel'];
 */
'use strict';
var ue={};var map;
var vm = new Vue({
  el:'#app',
  data: function () {
    return {
      info:{
        garden_name:'',
        create_time:'',
        logo:'',
        longitude:'',
        latitude:'',
        address:'',
        service_tel:'',
        about_garden:'',
        qr_code_ctrl: 1,
        qr_code_name: '',
        qr_code_img: '',
        qr_code_img_2: '',
        bank_ctrl: 1,
        bank_desc: ''
      },
    }
  },
  mounted:function(){
    this.getData();
  },
  methods:{
    /**获取园区信息*/
    getData:function () {
      var self = this;
      AppUtil.ajaxRequest({
        url: '/admin.php?c=Garden&a=getGradenInfo',
        data: {},
        type: 'POST',
      }).then(function (result) {
        self.info = result.data;
        self.info.longitude = (self.info.longitude === null || self.info.longitude === '') ? 0 :self.info.longitude;
        self.info.latitude = (self.info.latitude === null || self.info.latitude === '' )? 0 :self.info.latitude;
        ue.ready(function () {
          ue.setContent(self.info.about_garden);//设置编辑器的内容
        });
      }).catch(function (reason) {
        publicObj.layerMsg(reason.msg,0);
      })
    },
    /**显示百度地图*/
    mapLayer:function () {
      var self = this;
      publicObj.layerShow(1,'标注位置','#map-layer');
      // 百度地图API功能
      map = new BMap.Map("allmap");
      map.enableScrollWheelZoom(true);//启用滚轮放大缩小
      if (+self.info.longitude === 0 || +self.info.latitude === 0) {
        self.lng_lat(118.13388605, 24.4923061);//图中心经纬度--厦门
      } else {
        self.lng_lat(self.info.longitude, self.info.latitude);
      }
    },
    /**根据经纬度定位|拖动标注结束触发*/
    lng_lat:function (lng, lat) {
      var self = this;
      var point = new BMap.Point(lng, lat);
      var marker = new BMap.Marker(point);
      map.centerAndZoom(point, 14);
      map.addOverlay(marker);
      marker.enableDragging(); //启用标注拖动
      marker.addEventListener('dragend', function (e) {//拖动标注结束
        var pointNew = e.point;
        //console.log(pointNew);
        self.info.longitude = pointNew.lng;
        self.info.latitude = pointNew.lat;
        //alert(pointNew.lng + '|' + pointNew.lat);
      })
    },
    saveData:function () {
      var self = this;
      self.info.about_garden=ue.getContent();//获取富文本编辑器内容
      AppUtil.ajaxRequest({
        url: '/admin.php?c=Garden&a=updateGradenInfo',
        data: {
          logo:self.info.logo,
          longitude:self.info.longitude,
          latitude:self.info.latitude,
          address:self.info.address,
          service_tel:self.info.service_tel,
          about_garden:self.info}.about_garden,
        type: 'POST',
      }).then(function (result) {
        publicObj.layerMsg('保存成功！',1);
      }).catch(function (reason) {

      })
    }
  },
  filters: {
    /**时间过滤器*/
    formatDate: function (value) {
      return publicObj.formatDate(new Date(value * 1000));
    }
  },
  directives: {
    uEditor: {
      bind: function (el) {
        // 实例化ue实例
        ue = UE.getEditor('inputContent',{
          serverUrl :uEditor_url,
        });
      }
    }
  },
})
layui.use(['upload','layer','element'],function(){
  var form = layui.form(),
    jq = layui.jquery
    ,element = layui.element();
  var loading;
  layui.upload({
    url: "/admin.php?c=Public&a=upload"
    ,elem:'#gardenLogo'
    ,before: function(input){
      loading = layer.load(2, {
        shade: [0.2,'#000']
      });
    }
    ,success: function(res,input){
      console.log(res);
      vm.info.logo = res.url;
      layer.close(loading);
      publicObj.layerMsg('上传成功！', 1);
    }
  });
});

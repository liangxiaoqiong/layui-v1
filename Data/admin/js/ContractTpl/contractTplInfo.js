/**
 * @author   liangxiaoqiong
 * @version  1.0
 * @date 2018-04-20.
 */
'use strict';
var ue={};
var vm = new Vue({
  el:'#app',
  data:function () {
    return {
			DiffSegmentData: {
				maintain: maintainData,
				property: propertyData,
				rent: rentData,
				service: serviceData
			},
    	thisDiffSegment: '',
			diffSegmentTypeFields: AppUtil.diffSegmentTypeFieldsData,
			templateData : {
				tpl_status: '0'
			},
			scrollHeight: ''
		}
  },
  mounted:function () {
  	if (+tpl_id > 0) {
			this.getData();
		}
  },
  methods:{
    getData:function(){
      var self = this;
      AppUtil.ajaxRequest({
        url: APP + '/ContractTpl/contractTplInfo',
        data: {tpl_id : tpl_id},
        type: 'POST',
      }).then(function (result) {
        self.templateData = result.data;
				self.$nextTick(function () {
					console.log(window.navigator)
					if(window.navigator.connection && window.navigator.connection.rtt && +window.navigator.connection.rtt === 50){
						self.scrollHeight = window.screen.height - 60 - 220
					} else {
						self.scrollHeight = window.screen.height - 60 - 175
					}
					ue.ready(function () {
						ue.setHeight(self.scrollHeight - 140)
						ue.setContent(self.templateData.tpl_content);//设置编辑器的内容
						$('.tpl-variable-word').attr('contenteditable',false);
					});
				})
      })
    } ,
    saveData:function(){
      var self = this;
			$("#saveData").attr('disabled',true);
				self.templateData.tpl_content=ue.getContent();//获取富文本编辑器内容
				var data = self.templateData;
				data.type = 1;
				console.log(data);
				AppUtil.ajaxRequest({
					url: APP + '/ContractTpl/editContractTplInfo',
					data: data,
					type: 'POST',
				}).then(function (result) {
					publicObj.layerMsg('编辑合同模板成功',1);
					setTimeout(function(){
						self.handleTab();
						// window.location.href = APP + 'ContractTpl/index/';
					},1000);
				}).catch(function(result){
				 $("#saveData").attr('disabled',false);
			})

    },
	  handleTab: function () {
		  //region
		  var url = APP + '/ContractTpl/index'
		  var title = '合同模板'
		  var layId = window.parent.$('#layui-tab-list').find('.layui-this').attr('lay-id');
		  var playui = window.parent.layui;
		  var element = playui.element()
		  var tabIndex = -1
		  var tab = playui.tab({
			  elem: window.parent.$('.layout-nav-card'), //设置选项卡容器
			  contextMenu: true
		  });
		  $(window.parent.$("#layui-tab-list")).find("li").each(function (i, e) {
			  var cite = $(this).find("cite").text();
			  var data_id = $(this).find('i').attr("data-id")
			  if (cite === title) {
				  $(this).attr('lay-id', url)
				  tabIndex = i;
				  var iframeId = "#iframe_" + data_id
				  console.log(url)
				  console.log(iframeId)
				  $(parent.$(iframeId)).attr('src', url)
			  }
		  })
		  if (tabIndex > 0) {
			  element.tabChange('layout-tab', url)
		  } else {
			  tab.tabAdd({
				  title: title,
				  icon: undefined,
				  href: url
			  });
		  }
		  tab.deleteTab(layId)
		  //endregion
	  },
    //插入文字
    clickText:function (content) {
      var html_text = "<a class='tpl-variable-word' contenteditable='false' disabled>"+content+"</a>";
		if (content == '{销售单整体表单明细}') {
			html_text = "<table width='100%' class='TAX_UNIT_SHOW_BEGIN'>" +
				"<tr>" +
				"<th style='border-top-width: 1px;'>&nbsp;</th>" +
				"<th style='border-top-width: 1px;'>鞋底型号</th>" +
				"<th style='border-top-width: 1px;'>材质</th>" +
				"<th style='border-top-width: 1px;'>颜色</th>" +
				"<th colspan='2' style='border-top-width: 1px;'>尺寸/数量</th>" +
				"<th colspan='2' style='border-top-width: 1px;'>数量({单位})</th>" +
				"<th colspan='2' style='border-top-width: 1px;'>单价(元)</th>" +
				"<th colspan='2' style='border-top-width: 1px;'>金额(元)</th>" +
				"</tr>" +
				"<tr>" +
				"<th style='border-top-width: 1px;'>合计</th>" +
				"<th style='border-top-width: 1px;'>&nbsp;</th>" +
				"<th style='border-top-width: 1px;'>&nbsp;</th>" +
				"<th style='border-top-width: 1px;'>&nbsp;</th>" +
				"<th colspan='2' style='border-top-width: 1px;'>&nbsp;</th>" +
				"<th colspan='2'>{数量合计}</th>" +
				"<th colspan='2' style='border-top-width: 1px;'>&nbsp;</th>" +
				"<th colspan='2'>{金额合计}</th>" +
				"</tr>" +
				"</table>";
		}
		ue.execCommand('insertHtml', html_text);
    },
    //锁定编辑器中鼠标光标位置。。
    _insertContent:function (element,str) {
      var selection= window.getSelection ? window.getSelection() : document.selection;

      var range= selection.createRange ? selection.createRange() : selection.getRangeAt(0);

      if (!window.getSelection){

        document.getElementById(element).focus();

        var selection= window.getSelection ? window.getSelection() : document.selection;

        var range= selection.createRange ? selection.createRange() : selection.getRangeAt(0);

        range.pasteHTML(str);

        range.collapse(false);

        range.select();

      }else{

        document.getElementById(element).focus();

        range.collapse(false);

        var hasR = range.createContextualFragment(str);

        var hasR_lastChild = hasR.lastChild;

        while (hasR_lastChild && hasR_lastChild.nodeName.toLowerCase() == "br" && hasR_lastChild.previousSibling && hasR_lastChild.previousSibling.nodeName.toLowerCase() == "br") {

          var e = hasR_lastChild;

          hasR_lastChild = hasR_lastChild.previousSibling;

          hasR.removeChild(e);

        }

        range.insertNode(hasR);

        if (hasR_lastChild) {

          range.setEndAfter(hasR_lastChild);

          range.setStartAfter(hasR_lastChild)

        }

        selection.removeAllRanges();

        selection.addRange(range)

      }
    },

  },
  directives: {
		uEditor: {
		  bind: function (el) {
			// 实例化ue实例
			ue = UE.getEditor('inputContent',{
			  serverUrl :uEditor_url,
			  allowDivTransToP: false,//阻止div标签自动转换为p标签
			  enterTag : 'br',

			  toolbars:[
				[
					'anchor', //锚点
					'undo', //撤销
					'redo', //重做
					'bold', //加粗
					'indent', //首行缩进
					//'snapscreen', //截图
					'italic', //斜体
					'underline', //下划线
					'strikethrough', //删除线
					'subscript', //下标
					'fontborder', //字符边框
					'superscript', //上标
					'formatmatch', //格式刷
					'source', //源代码
					'blockquote', //引用
					'pasteplain', //纯文本粘贴模式
					'selectall', //全选
					'print', //打印
					'preview', //预览
					'horizontal', //分隔线
					'removeformat', //清除格式
					'time', //时间
					'date', //日期
					'unlink', //取消链接
					'insertrow', //前插入行
					'insertcol', //前插入列
					'mergeright', //右合并单元格
					'mergedown', //下合并单元格
					'deleterow', //删除行
					'deletecol', //删除列
					'splittorows', //拆分成行
					'splittocols', //拆分成列
					'splittocells', //完全拆分单元格
					'deletecaption', //删除表格标题
					'inserttitle', //插入标题
					'mergecells', //合并多个单元格
					'deletetable', //删除表格
					'cleardoc', //清空文档
					'insertparagraphbeforetable', //"表格前插入行"
					'insertcode', //代码语言
					'fontfamily', //字体
					'fontsize', //字号
					'paragraph', //段落格式
					//'simpleupload', //单图上传
					//'insertimage', //多图上传
					'edittable', //表格属性
					'edittd', //单元格属性
					'link', //超链接
					//'emotion', //表情
					'spechars', //特殊字符
					'searchreplace', //查询替换
					//'map', //Baidu地图
					//'gmap', //Google地图
					//'insertvideo', //视频
					'help', //帮助
					'justifyleft', //居左对齐
					'justifyright', //居右对齐
					'justifycenter', //居中对齐
					'justifyjustify', //两端对齐
					'forecolor', //字体颜色
					'backcolor', //背景色
					'insertorderedlist', //有序列表
					'insertunorderedlist', //无序列表
					'fullscreen', //全屏
					'directionalityltr', //从左向右输入
					'directionalityrtl', //从右向左输入
					//'rowspacingtop', //段前距
					//'rowspacingbottom', //段后距
					'pagebreak', //分页
					'insertframe', //插入Iframe
					'imagenone', //默认
					'imageleft', //左浮动
					'imageright', //右浮动
					'attachment', //附件
					'imagecenter', //居中
					//'wordimage', //图片转存
					//'lineheight', //行间距
					'edittip ', //编辑提示
					'customstyle', //自定义标题
					'autotypeset', //自动排版
					//'webapp', //百度应用
					'touppercase', //字母大写
					'tolowercase', //字母小写
					//'background', //背景
					'template', //模板
					//'scrawl', //涂鸦
					//'music', //音乐
					'inserttable', //插入表格
					'drafts', // 从草稿箱加载
					'charts', // 图表
				]
			]
			});
		  }
		}
  },
})

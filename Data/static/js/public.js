/**
 * @author   liangxiaoqiong
 * @version  1.0
 * @date 2018-03-27.
 */


var publicObj = new Object({
  bodyScroll: '',

  /*点击复制文字*/
  copyContent: function (text, id, doMsg) {
    if (navigator.userAgent.match(/(iPhone|iPod|iPad);?/i)) {
      //ios
      var copyDOM = document.querySelector('#' + id);  //要复制文字的节点
      var range = document.createRange();
      // 选中需要复制的节点
      range.selectNode(copyDOM);
      // 执行选中元素
      window.getSelection().addRange(range);
      // 执行 copy 操作
      var successful = document.execCommand('copy');
      try {
        var msg = successful ? 'successful' : 'unsuccessful';
        console.log('copy is' + msg);
      } catch (err) {
        console.log('Oops, unable to copy');
      }
      // 移除选中的元素
      window.getSelection().removeAllRanges();
    } else {
      // 创建元素用于复制
      var aux = document.createElement("input");
      // 设置元素内容
      aux.setAttribute("value", text);
      // 将元素插入页面进行调用
      document.body.appendChild(aux);
      // 复制内容
      aux.select();
      // 将内容复制到剪贴板
      document.execCommand("copy");
      // 删除创建元素
      document.body.removeChild(aux);
    }
    doMsg = !(doMsg === 0)
    if (doMsg) {
      layer.msg('已复制内容到剪贴板');
    }
  },

  /**
   * 质朴长存法 =>不足位步0 by lifesinger
   * @param value
   */
  padNum: function (num, n) {
    var len = num.toString().length;
    while (len < n) {
      num = "0" + num;
      len++;
    }
    return num;
  },

  /**
   * 正则，只允许正整数
   * @param value
   * limitVal{
   *  "maxVal":"限制最大数"，"maxMsg":"超过最大数限制说明",
   *  "minVal":"限制最小数"，"minMsg":"超过最小数限制说明"}
   * @returns {number}
   */
  numInt: function (obj, limitVal) {
    if (obj.value.length == 1) {
      obj.value = obj.value.replace(/[^0-9]/g, '')
    } else {
      obj.value = obj.value.replace(/\D/g, '')
    }
    if (typeof (limitVal) !== 'undefined') {
      if (obj.value > +limitVal.maxVal) {
        layer.msg(limitVal.maxMsg);//'该商品最大售量9999件！'
        obj.value = +limitVal.maxVal;
      }
    }
    return obj.value;
  },

  /**
   * 浮点小数(最多精确到2位)
   * @param value
   * limitVal{
   *  "maxVal":"限制最大数"，"maxMsg":"超过最大数限制说明",
   *  "minVal":"限制最小数"，"minMsg":"超过最小数限制说明"}
   * @returns {number}
   */
  numPoint2: function (obj, limitVal) {
    obj.value = obj.value.match(/\d+(\.\d{0,2})?/) ? obj.value.match(/\d+(\.\d{0,2})?/)[0] : '';
    if (typeof (limitVal) !== 'undefined') {
      if (obj.value > +limitVal.maxVal) {
        layer.msg(limitVal.maxMsg);
        obj.value = +limitVal.maxVal;
      }
    }
    return obj.value;
  },

  /**
   * 点击图片查看大图
   * 需要指向图片的父容器
   * */
  imgPreview: function (parentEl) {
    /* '<div id="parentEl" class="layer-photos-demo">\n' +
     '  <img layer-pid="图片id，可以不写" layer-src="大图地址" src="缩略图" alt="图片名">\n' +
     '  <img layer-pid="图片id，可以不写" layer-src="大图地址" src="缩略图" alt="图片名">\n' +
     '</div>';*/
    layer.photos({
      photos: parentEl
      , shade: [0.23, '#000000']
      , area: ['500px', '']
      , anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
    });
    /*$('.layui-layer').css({'background-color':'transparent','box-shadow':'none'});*/
  },

  /**
   * 格式化时间
   * @param {} date
   * @param {} format
   */
  formatDate: function (date, format) {
    var paddNum = function (num) {
      num += "";
      return num.replace(/^(\d)$/, "0$1");
    }
    //指定格式字符
    var cfg = {
      yyyy: date.getFullYear() //年 : 4位
      , yy: date.getFullYear().toString().substring(2)//年 : 2位
      , M: date.getMonth() + 1  //月 : 如果1位的时候不补0
      , MM: paddNum(date.getMonth() + 1) //月 : 如果1位的时候补0
      , d: date.getDate()   //日 : 如果1位的时候不补0
      , dd: paddNum(date.getDate())//日 : 如果1位的时候补0
      , hh: paddNum(date.getHours())  //时
      , mm: paddNum(date.getMinutes()) //分
      , ss: paddNum(date.getSeconds()) //秒
    }
    format || (format = "yyyy-MM-dd hh:mm:ss");
    return format.replace(/([a-z])(\1)*/ig, function (m) {
      return cfg[m];
    });
  },
  formatDate2: function (date, format) {
    var paddNum = function (num) {
      num += "";
      return num.replace(/^(\d)$/, "0$1");
    }
    //指定格式字符
    var cfg = {
      yyyy: date.getFullYear() //年 : 4位
      , yy: date.getFullYear().toString().substring(2)//年 : 2位
      , M: date.getMonth() + 1  //月 : 如果1位的时候不补0
      , MM: paddNum(date.getMonth() + 1) //月 : 如果1位的时候补0
      , d: date.getDate()   //日 : 如果1位的时候不补0
      , dd: paddNum(date.getDate())//日 : 如果1位的时候补0
      , hh: paddNum(date.getHours())  //时
      , mm: paddNum(date.getMinutes()) //分
      , ss: paddNum(date.getSeconds()) //秒
    }
    format || (format = "yyyy.MM.dd");
    return format.replace(/([a-z])(\1)*/ig, function (m) {
      return cfg[m];
    });
  },

  //判断多个时间段是否存在重叠的部分
  isTimeRepeat: function (timeList) {
    var begin = []
    var over = []
    timeList.forEach(function (value) {
      begin.push(value.start_time)
      over.push(value.end_time)
    })
    begin = begin.sort();
    over  = over.sort();
    for(i=1;i<begin.length;i++){
      if (begin[i] <= over[i-1]){
        //console.log("时间有重复！");
        return false;
      }
    }
    //console.log("时间没有重复！");
    return true;
  },

  /**
   * 判断是否是手机
   * @param value
   * @returns {boolean}
   */
  isPhone: function (value) {
    var reg = /^1[2|3|4|5|6|7|8|9][0-9]\d{4,8}$/;
    if (!reg.test(value)) {
      publicObj.layerMsg('请输入正确的手机号');
      return false;
    }
    return true;
  },

  /**
   * //毫秒转时间戳2017-08-20 12:12:12*/
  dateTime_Str: function (time_, timeType) {
    var Y = time_.getFullYear();    //获取完整的年份(4位,1970-????)
    var M = publicObj.padNum(time_.getMonth() + 1, 2);       //获取当前月份(0-11,0代表1月)
    var D = publicObj.padNum(time_.getDate(), 2);        //获取当前日(1-31)
    var H = publicObj.padNum(time_.getHours(), 2);       //获取当前小时数(0-23)
    var Min = publicObj.padNum(time_.getMinutes(), 2);     //获取当前分钟数(0-59)
    var S = publicObj.padNum(time_.getSeconds(), 2);     //获取当前秒数(0-59)
    if (timeType === 'date') {
      var dataTime = Y + '-' + M + '-' + D;
    } else {
      var dataTime = Y + '-' + M + '-' + D + ' ' + H + ':' + Min + ':' + S;
    }
    return dataTime;
  },

  // 提交验证数据是否为空
  /*
    var verifyRule = [
      { key: 'name', verify_type: 'required', error_text: '请输入**'},
      { key: 'name', verify_type: 'required_length', error_text: '请输入**'},
    ]
    if (!publicObj.verifyForm(verifyRule, verifyArr)) return false
    verifyRule:验证规则
    verifyArr:验证的数据
  */
  verifyForm: function (verifyRule, verifyArr) {
    // 传入表单数据，调用验证方法a
    let result = true
    try {
      verifyRule.forEach(function (value) {
        switch (value.verify_type) {
          case 'required':
            if (typeof verifyArr[value.key] === 'undefined' || verifyArr[value.key] === '') {
              publicObj.layerMsg(value.error_text)
              result = false
              throw Error()
            }
            break
          case 'required_length':
            if (typeof verifyArr[value.key] === 'undefined' || verifyArr[value.key].length <= 0) {
              publicObj.layerMsg(value.error_text)
              result = false
              throw Error()
            }
            break
          default:
            break
        }
      })
    } catch (e) {
    }
    return result
  },

  //是否选择内容，主要用于选中批量操作
  isCheckItem: function (item) {
    if (item.length <= 0) {
      publicObj.layerMsg('请先选择要操作的内容！')
      return false
    }
    return true
  },
  /**region ====== PC后台layer弹框 ======*/
  /**
   * 右侧滑出/关闭弹框
   * */
  slideRight: function (type, elName) {
    if (elName === undefined) {
      elName = '.slide-right';
    }
    if (type === 'show') {
      $(elName).show("drop", {direction: 'right'}, 400);
      $("#layerModel").parents('html,body').css({'overflow': 'hidden', 'width': 'calc(100% - 5px)'});
      $("#layerModel").show();
    } else {
      $(elName).hide("drop", {direction: 'right'}, 400);
      $("#layerModel").parents('html,body').css({'overflow': 'auto', 'width': '100%'});
      $("#layerModel").hide();
    }
  },

  /**
   * 显示layer 弹框
   参数解释config：
   type==1,div层 ；==2：iframe
   title  标题
   url    请求的url,div el
   * */
  layerDialog: function (config, callback) {
    config.area = config.area || ['700px', '90%']
    if (config.title == null || config.title == '') {
      config.title = false;
    }
    if (+config.type === 2) {
      if (config.content == null || config.content == '') {
        config.content = "404.html";
      }
    }
    layer.open({
      type: config.type,
      area: config.area,
      fix: false, //不固定
      // maxmin: true,
      //shade:0.4,
      title: config.title,
      closeBtn: config.title == null || config.title == '' ? false : true,
      skin: 'layer-open',
      shadeClose: config.shadeClose || true,
      content: config.content,
      success: function (layero) {
        // layer弹层遮罩挡住窗体解决
        var mask = $(".layui-layer-shade");
        mask.appendTo(layero.parent());
        publicObj.isLayerOpenCallback = true
      },
      yes: function (index) {
      },
      cancel: function () {
        publicObj.isLayerOpenCallback = false
      },
      end: function () {
        //弹框销毁后的回调
        if (publicObj.isLayerOpenCallback && typeof callback !== 'undefined') {
          callback()
          publicObj.isLayerOpenCallback = false
        }
      }
    });
  },

  /**
   * 关闭弹出框口 ifream
   * */
  layerFrameClose: function () {
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);
  },

  //layer.confirm弹框
  layerConfirm: function (config, callbackYes, callbackCancel, callbackEnd) {
    layer.confirm(config.content, {
      type: 1,
      title: config.title,
      skin: 'layer-confirm',
      shadeClose: config.shadeClose || true,
      area: config.area || 'auto',
      offset: config.offset || 'auto',
      success: function (layero) {
        //兼容弹框div在滚动条下面，弹框显示内容偏下（代码正常）
        config.self.$nextTick(function () {
          $("#layerModel").parents('html, body').css({'overflow': 'auto'})
        })
        // layer弹层遮罩挡住窗体解决
        var mask = $(".layui-layer-shade");
        mask.appendTo(layero.parent());
      },
      end: function (index) {
        config.self.$nextTick(function () {
          $("#layerModel").parents('html, body').css({'overflow': 'hidden'})
        })
        if (typeof callbackEnd !== 'undefined') {
          callbackEnd(index)//取消后的回调
        }
      },
      yes: function (index) {
        callbackYes(index)//确定后的回调
      },
      cancel: function (index) {
        if (typeof callbackCancel !== 'undefined') {
          callbackCancel(index)//取消后的回调
        }
      }
    })
  },

  //删除弹框
  confirmDel: function (callback, config) {
    var content = config.content ? config.content : ''
    var skin2 = config.content ? '' : ' layer-confirm-del'
    layer.confirm(content, {
      title: config && config.title ? config.title : '确认要删除该项吗？',
      skin: 'layer-confirm' + skin2,
      btn: config && config.btn ? config.btn : ['确定', '取消'],
    }, function (index) {
      callback(index)
    })
  },

  /**
   * 重置layer.msg样式
   * content:msg内容
   * icon:msg类型{0：失败，1：成功}
   * iconName：
   * */
  layerMsg: function (content, config, callback) {
    var className = ''
    var iconName = ''
    config = config || {icon: 2}
    if (+config.icon === 1) {
      iconName = 'myicon-success-white'
      className = 'layer-msg-success'
    } else {
      iconName = 'myicon-fail-white'
      className = 'layer-msg-fail'
    }
    var html = '<div class="'+className+'"><i class="' + iconName + '"></i><div class="display-align">' + content + '</div></div>';
    layer.msg(html,{}, function () {
      if (typeof callback !== 'undefined') {
        callback()
      }
    });
    $('[class^="layer-msg-"]').parents('.layui-layer').css({'background': 'none'});
  },

  /*region 顶部iframe tab*/
  //更改顶部iframe文字
  modifyTabTitle: function (text, layId) {
    parent.$('#layui-tab-list').find('li[lay-id="'+layId+'"]').find('font').text(text)
  },
  //点击左侧菜单更改iframe路径刷新
  clickMenuRefresh: function (title, oldUrl, newUrl) {
    window.parent.$('[title="'+title+'"]').click(function (event) {
      var _iframe = window.parent.$('.beg-layout-body').find('iframe[src="'+oldUrl+'"]')
      _iframe.attr('src', newUrl)
      publicObj.modifyTabTitle(title, newUrl)
    });
  },
  /*endregion*/
  /**endregion*/

  /**region ====== Wap ===== */
  //wap端 layer弹框
  confirmWap: function (callback, config) {
    var content = config.content ? config.content : ''
    config.layerType = config.layerType || 'confirm'
    var skin2 = config.skin ? config.skin : ''
    skin2 += config.layerType === 'alert' ? ' btn-1' : ''
    var btnDefault = config.layerType === 'alert' ? ['确定'] : ['确定', '取消']
    layer[config.layerType](content, {
      type: 1,
      title: config && config.title ? config.title : '',
      closeBtn: false,
      skin: 'layer-confirm-wap ' + skin2,
      btn: config && config.btn ? config.btn : btnDefault,
      area: ['80%', ''],
      offset: ['', '10%']
    }, function (index) {
      callback(index)
    })
  },

  //弹框显示，底部body无法滑动
  bodyFixed: function(isShow){
    if(isShow){
      var scrollTop = $(document).scrollTop();//获取body滚动条位置
      publicObj.bodyScroll = scrollTop;
      $('body').addClass('body-fixed');
      $('body').css('top', '-'+scrollTop+'px');
    } else {
      $('body').removeClass('body-fixed');
      $('body').css('top', 0);
      window.scrollTo(0,publicObj.bodyScroll);
    }
  },
  /**
   * 点击右下角返回顶部icon=》滚动条置顶
   * @param value
   * @returns {}
   */
  toTop: function (el) {
    //$('body,html').animate({scrollTop:0},1000);
    if (typeof (el) === 'undefined') {
      if ($('html').scrollTop()) {
        $('html').animate({scrollTop: 0}, 1000);
        return false;
      }
      $('body').animate({scrollTop: 0}, 1000);
      return false;
    } else {
      $(el).animate({scrollTop: 0}, 1000);
    }
  },
  /**endregion*/
})

<?php

namespace Api\Controller;

/**
 * 自动扣款相关
 * Class AutoPayController
 * @package Api\Controller
 * User: hjun
 * Date: 2019-07-11 18:10:58
 * Update: 2019-07-11 18:10:58
 * Version: 1.00
 */
class AutoPayController extends BaseController
{
    /**
     * 授权相关通知接口
     * User: hjun
     * Date: 2019-07-11 18:11:50
     * Update: 2019-07-11 18:11:50
     * Version: 1.00
     */
    public function authorizeNotify()
    {
        autoPayLogWrite("授权通知参数:" . jsonEncode($this->req));
        if (empty($this->req['gid'])) {
            $this->apiResponse(getReturn(CODE_ERROR, "gid require"));
        }
        if (empty($this->req['app_id'])) {
            $this->apiResponse(getReturn(CODE_ERROR, "app_id require"));
        }
        switch ($this->req['app']) {
            default:
                $model = D('PayAuthorizedAppXX');
                break;
        }
        $model->setGardenId($this->req['gid']);
        $result = $model->authorizeNotify($this->req);
        $this->apiResponse($result);
    }

    /**
     * 自动扣费
     * User: hjun
     * Date: 2019-07-13 17:52:25
     * Update: 2019-07-13 17:52:25
     * Version: 1.00
     */
    public function autoPay()
    {
        if ($this->req['code'] != 'vjd8988998') {
            $this->apiResponse('error');
        }
        switch ($this->req['app']) {
            default:
                $model = D('PayAuthorizedAppXX');
                break;
        }
        $result = $model->crontabAutoPay();
        autoPayLogWrite("自动扣款结果:" . jsonEncode($result));
        $this->apiResponse($result);
    }
}

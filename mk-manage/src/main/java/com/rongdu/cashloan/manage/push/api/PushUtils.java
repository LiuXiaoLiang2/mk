package com.rongdu.cashloan.manage.push.api;

import cn.jiguang.common.ClientConfig;
import cn.jiguang.common.resp.APIConnectionException;
import cn.jiguang.common.resp.APIRequestException;
import cn.jpush.api.JPushClient;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.notification.Notification;

public class PushUtils {


    // demo App defined in resources/jpush-api.conf 
    protected static final String APP_KEY ="f005fa274903b512cd111542";
    protected static final String MASTER_SECRET = "0a4acf55640a36c6552703d6";
    protected static final String GROUP_PUSH_KEY = "2c88a01e073a0fe4fc7b167c";
    protected static final String GROUP_MASTER_SECRET = "b11314807507e2bcfdeebe2e";
	
	public static final String TITLE = "Test from API example";
    public static final String ALERT = "【短贷王】大傻子，您好：您本期借款明日到期，应还款535元，提前还款有助于增加信用积分、加快提升额度的速度";
    public static final String MSG_CONTENT = "Test from API Example - msgContent";
    public static final String REGISTRATION_ID = "0900e8d85ef";
    public static final String TAG = "tag_api";
    public static long sendCount = 0;
    private static long sendTotalTime = 0;
    
    public static String pushByPhone(String jiguang_push_url,String jiguang_push_app_key, String jiguang_push_master_secret, String phone,String alert){
    	String result = testSendPushWithCustomConfig2(jiguang_push_url,jiguang_push_app_key,jiguang_push_master_secret,phone,alert); 
    	return result;
    }
	
  //按照别名发送 测试OK
    public static String testSendPushWithCustomConfig2(String jiguang_push_url,String jiguang_push_app_key, String jiguang_push_master_secret,String phone,String alert) {
        ClientConfig config = ClientConfig.getInstance();
        // Setup the custom hostname
        config.setPushHostName(jiguang_push_url);

        JPushClient jpushClient = new JPushClient(jiguang_push_master_secret, jiguang_push_app_key, null, config);

        // For push, all you need do is to build PushPayload object.
        PushPayload payload = buildPushObject_all_alias_alert(phone,alert);

        try {
            PushResult result = jpushClient.sendPush(payload);
            return result.toString();

        } catch (APIConnectionException e) {
            return "Connection error. Should retry later";

        } catch (APIRequestException e) {
            return e.getErrorMessage();
        }
    }
    
    public static PushPayload buildPushObject_all_alias_alert(String phone,String alert) {
        return PushPayload.newBuilder()
                .setPlatform(Platform.all())
                .setAudience(Audience.alias(phone))
                .setNotification(Notification.alert(alert))
                .build();
    }
}

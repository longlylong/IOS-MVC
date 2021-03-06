//
//  HttpConstant.swift
//  WeprintIOS
//
//  Created by weiyin on 15/8/27.
//  Copyright (c) 2015年 weiyin. All rights reserved.
//

import Foundation

class HttpConstant {
    
    /**
    * 线上服务器
    */
    fileprivate static var  ONLINE_SERVER = true
            
    fileprivate static let  Online_Api_Url = "https://openapi.weiyin.cc/"  //接口
    fileprivate static let  Test_Api_Url = "https://apitest.weiyin.cc/"   //接口
    
    fileprivate static let  Online_Show_Url = "https://app.weiyin.cc/"  //接口
    fileprivate static let  Test_Show_Url = "https://apptest.weiyin.cc/"   //接口
    
    static var  RootApiUrl = ONLINE_SERVER ? Online_Api_Url : Test_Api_Url
    fileprivate static var  RootShowUrl = ONLINE_SERVER ? Online_Show_Url : Test_Show_Url
    /**
     * 请求成功
     */
    static let SUCCESS = "1000"
    
    /**
     * 签名错误
     */
    static let SIGN_ERROR = "1001"
    
    
    static func getToken()->String {
        let sdk = WYSdk.getInstance()
        return "token=" + sdk.token + "&timestamp=" + "\(sdk.timestamp )" + "&guid=" + sdk.guid + "&clientver=" + WYSdk.SDK_VERSION + "&client=" + "\(sdk.getChannel())" + "&"
    }
    
    /**
     * 我的作品
     */
    static func getShowProductListUrl()->String{
        return RootShowUrl + "book/webviewproduct?" + HttpConstant.getToken()
    }
    
    /**
     * 购物车地址
     */
    static func getShowOrderUrl()->String{
        return RootShowUrl + "order/webvieworder?" + HttpConstant.getToken()
    }
    
    /**
     * 订单地址
     */
    static func getShowCartUrl()->String{
        return RootShowUrl + "order/webviewcart?" + HttpConstant.getToken()
    }
    
    /**
     * 纸质画册地址
     */
    static func getPaperUrl()->String {
        return RootShowUrl  + "home/bookshow?" + HttpConstant.getToken()
    }
    
    /**
     * 常见问题地址
     */
    static func getQuestionUrl() ->String {
        return "https://app.weiyin.cc/home/linktowx?" + HttpConstant.getToken()
    }
}

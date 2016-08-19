IOS SDK������ �汾�� 1.3.0 ���� 20160808

��װ

΢ӡsdkֻ֧��ios7.0���ϰ汾

����������WeiYin IOS SDK �� zip ���󣬽������²���:(oc��Ŀ���ȿ��경��,swift��Ŀ˳��ִ�м���)

1.��WYSdk�ϵ��㹤�̵��ʵ�Ŀ¼(���Ŀ¼),���ֺ�ᵯ��ѡ���,ѡ�� copy items if needed,Create groups,add to targets Ȼ��finish

2.�ڸ�Ŀ¼��Podfile������������(����Ϊ1.0.1pod����)

source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '7.0'

target '��Ŀtarget' do
#�߳̿� �����̵߳�
pod 'Bolts'

#֧����sdk
pod 'Pingpp/Alipay'
pod 'Pingpp/Wx'

end


3.�������н�����Ĺ��̸�Ŀ¼ Ȼ��pod update

4.swift���̶���Ҫ����һ�� ��Ŀ��-Bridging-Header.h, ���ļ�д��#import "Pingpp.h" #import "Bolts.h",Ȼ��򿪹�����demoΪ����:ѡ��wysdkdemo ��ѡ�� 
TARGETS��wysdkdemo ѡ�� Build Settings �ҵ� Objective-C Bridging Header ������ϸղ�.h��·�� ��:wysdkdemo/wysdkdemo-Bridging-Header.h

5.oc��Ŀ ����ǵ�һ�ε���swift ���Լ�����һ��swift��,����ʾ���� ��Ŀ��-Bridging-Header.h,��ִ�е��Ĳ��Ĳ���,Ȼ���sdk������Ŀ,Ȼ��򿪹�����demoΪ
����:ѡ��wysdkdemo ��ѡ�� TARGETS��wysdkdemo ѡ�� Build Settings �ҵ� Packaging > Defines Module ��ΪYES ���Ϳ��� #import "��Ŀ��-Swift.h",�Ժ�
�Ĵ����swiftһ��,����ת��oc����

��ʼ��

    //openidÿ����������ÿ���û���Ψһ��ʶ ����д�� ǰ׺+Ψһ��ʶ �� WY_xxxxxx
    WYSdk.getInstance().setSDK("52HJR62BDS6SDD21", accessSecret: "VlYmY2ZjBmOWFmZTJlZTk3NzdhN2M0ODM0MjE3", openId: "openid")


�༭ҳ

    ֧������ɸѡ,����ͼƬ�������޸��ı�
    //���ݱ༭��ҳ Ĭ���Ǵ򿪵� �ر�ֱ�Ӿ���ȥ�Ű�ҳ
    private func edit(){
    //�򿪶��α༭��ҳ Ĭ���ǿ���
    WYSdk.getInstance().isShowSelectDataViewController(true)

    //�������ظ���,Ĭ���ǹرյ�
    WYSdk.getInstance().openLoadMore(true)
    WYSdk.getInstance().setWyLoadMoreDelegate {
        //WYSdk.getInstance().getTextBlock //�����ı�
        //WYSdk.getInstance().getChapterBlock //�����½�

        ThreadUtils.threadOnAfterMain(1000, block: {
            let photoUrl1 = "http://img1.3lian.com/2015/w7/90/d/1.jpg"//1289 x 806
            let block = WYSdk.getInstance().getPhotoBlock("ͼƬ1", url: photoUrl1, lowPixelUrl: photoUrl1, originalTime: TimeUtils.getCurrentTime
(), width: 1289, height: 806)

            let arr = NSMutableArray()
            arr.addObject(block)
            arr.addObject(block)
            arr.addObject(block)
            arr.addObject(block)
            arr.addObject(block)
            arr.addObject(block)
            arr.addObject(block)
            arr.addObject(block)
            arr.addObject(block)
            arr.addObject(block)
            WYSdk.getInstance().addLoadMoreData(arr)
        })
    }
}


������֧��

//�����Ƿ��������app֧��,Ĭ����false
//�������΢ӡ֧�����������pingxx֧������Ҫ������Щ
private func myAppPay(){
    WYSdk.getInstance().setMyAppPay(true)
    WYSdk.getInstance().setWyPayOrderDelegate { (orderId, price, randomStr) in
        //����֧��
        //��������Ҫ orderId randomStr ��֪ͨ΢ӡ������
        //֧���ɹ���,��������������΢ӡ�ķ���������֧�����,�ĵ�������ʱ��ȡ
    }
}
//ˢ��֧���,����ui��ʾ�� {@link WYSdk.PAY_SUCCESS,WYSdk.PAY_FAIL,WYSdk.PAY_CANCEL,WYSdk.PAY_INVALID}
WYSdk.getInstance().refreshPayState(result:String)


Ĭ��΢ӡ֧�������������pingxx֧�� �ص�����

��ĿTARGETS -> info -> URL Type -> URL Schemes ���� weiyin

func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
    return Pingpp.handleOpenURL(url, withCompletion: nil)
}

func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
     return Pingpp.handleOpenURL(url, withCompletion: nil)
}


���ﳵ

    //����Ǵ򿪹��ﳵҳ,��Ҫ��ʱ����Ե���
    WYSdk.getInstance().showShopCart(self);


����ҳ

    //����Ǵ򿪶���ҳ,��Ҫ��ʱ����Ե���
    WYSdk.getInstance().showOrderList(self);
    //�����ˢ�¶���״̬��,�ڶ���ҳ����Ч
    WYSdk.getInstance().refreshOrderState()


�˽�ֽ�ʻ���

    //����Ǵ�ֽ�ʻ���,��Ҫ��ʱ����Ե���
    WYSdk.getInstance().showPaper(self);


�Ű�ҳ

//���ú�����������ݺ���� postPrintData() ����Ԥ���Ű�ҳ
WYSdk.getInstance().postPrintData(self,start,success,falied)


��������

// ����������ɫ 16���Ƶ���ɫ ��: f56971
WYSdk.getInstance().setThemeColor("f56971")


SDKʹ��ע������

��Ƭҳ���ı�ҳ�ǿ��Դ������½�ҳ�µģ�addʱ���˳��Ҫע��

�����ĳ��ͼƬ���ı�Ҫ������ĳ���½�ҳ�£�����ҪaddChapterBlock��add��Ƭҳ���ı�ҳ

��Ȼ����������ĳ���½������ֱ��add��Ƭ���ı�����

��Щadd�������Ⱥ�˳�����ֵģ��Ű�ҳ������˳����add�ȵ���



swift����

func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

    //openidÿ����������ÿ���û���Ψһ��ʶ ����д�� ǰ׺+Ψһ��ʶ �� WY_xxxxxx
    WYSdk.getInstance().setSDK("52HJR62BDS6SDD21", accessSecret: "VlYmY2ZjBmOWFmZTJlZTk3NzdhN2M0ODM0MjE3", openId: "openid")
}

class ViewController: UIViewController {

private var loadingIndicator = LoadingView()

override func viewDidLoad() {
    self.navigationController?.navigationBarHidden  = false
    self.navigationItem.title = "demo"

    let mSubmitDataButton =  UIButton(frame: CGRectMake(0,0,200,200))
    mSubmitDataButton.setTitle("�ύ����", forState: UIControlState.Normal)
    mSubmitDataButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
    mSubmitDataButton.addTarget(self, action: #selector(ViewController.submitData), forControlEvents: UIControlEvents.TouchUpInside)
    self.view.addSubview(mSubmitDataButton)
    self.view.addSubview(loadingIndicator)

    //�༭ҳ����
    //edit()

    //����Ǵ򿪶���ҳ,��Ҫ��ʱ����Ե���
    //WYSdk.getInstance().showOrderList(self)
    //�����ˢ�¶���״̬��,�ڶ���ҳ����Ч
    //WYSdk.getInstance().refreshOrderState()

    //myAppPay()
}
    private func edit(){
    //�򿪶��α༭��ҳ Ĭ���ǿ���
    WYSdk.getInstance().isShowSelectDataViewController(true)

    //�������ظ���,Ĭ���ǹرյ�
    WYSdk.getInstance().openLoadMore(true)
    WYSdk.getInstance().setWyLoadMoreDelegate {
        //WYSdk.getInstance().getTextBlock //�����ı�
        //WYSdk.getInstance().getChapterBlock //�����½�

        ThreadUtils.threadOnAfterMain(1000, block: {
            let photoUrl1 = "http://img1.3lian.com/2015/w7/90/d/1.jpg"//1289 x 806
            let block = WYSdk.getInstance().getPhotoBlock("ͼƬ1", url: photoUrl1, lowPixelUrl: photoUrl1, originalTime: TimeUtils.getCurrentTime
(), width: 1289, height: 806)

            let arr = NSMutableArray()
            arr.addObject(block)
            arr.addObject(block)
            arr.addObject(block)
            arr.addObject(block)
            arr.addObject(block)
            arr.addObject(block)
            arr.addObject(block)
            arr.addObject(block)
            arr.addObject(block)
            arr.addObject(block)
            WYSdk.getInstance().addLoadMoreData(arr)
        })
    }
}

//���ú�������app֧�� Ĭ����false
private func myAppPay(){
    WYSdk.getInstance().setMyAppPay(true)
    WYSdk.getInstance().setWyPayOrderDelegate { (orderId, price, randomStr) in
        //����֧��
        //��������Ҫ orderId randomStr ��֪ͨ΢ӡ������
        //֧���ɹ���,��������������΢ӡ�ķ���������֧�����,�ĵ�������ʱ��ȡ
    }
}

private func addData() {
    //ͼƬ�ز� ����������·�� ���Ҳ�Ǳ�Ҫ��
    let frontCoverUrl = "http://img1.3lian.com/2015/w7/98/d/22.jpg"//1210 x 681
    let flyleafHeadUrl = "http://img21.mtime.cn/mg/2011/05/18/161045.63077415.jpg"//251 x 251
    let backCoverUrl = "http://img.61gequ.com/allimg/2011-4/201142614314278502.jpg"//1358 x 765

    let photoUrl1 = "http://img1.3lian.com/2015/w7/90/d/1.jpg"//1289 x 806
    let photoUrl2 = "http://img2.3lian.com/img2007/23/08/025.jpg"//1001 x 751
    let photoUrl3 = "http://img1.goepe.com/201303/1362711681_6600.jpg"//988 x 738
    let photoUrl4 = "http://pic1.ooopic.com/00/87/39/27b1OOOPICf7.jpg"//813 x 592
    let photoUrl5 = "http://www.ctps.cn/PhotoNet/Profiles2011/20110503/20115302844162622467.jpg"//1208 x 806
    let photoUrl6 = "http://img2.3lian.com/2014/f2/110/d/57.jpg"//626 x 468

    //����ʱ��,����������ͼƬ���Զ�����һ��ʱ��
    let originalTime = TimeUtils.getCurrentTime()

    WYSdk.getInstance().setFrontCover("����Ҳ��������", subTitle: "���渱����", url: frontCoverUrl, lowPixelUrl: frontCoverUrl, originalTime: 
originalTime, width: 1210, height: 681)
    WYSdk.getInstance().setFlyleaf("ͷ��", url: flyleafHeadUrl, lowPixelUrl: flyleafHeadUrl, originalTime: originalTime, width: 251, height: 251)
    WYSdk.getInstance().setPreface("��������")
    WYSdk.getInstance().setCopyright("������������", bookName: "���������")
    WYSdk.getInstance().setBackCover(backCoverUrl, lowPixelUrl: backCoverUrl, originalTime: originalTime, width: 1358, height: 765)

    WYSdk.getInstance().addPhotoBlock("ͼƬ1", url: photoUrl1, lowPixelUrl: photoUrl1, originalTime: originalTime, width: 1289, height: 806)
    WYSdk.getInstance().addTextBlock("����һ�δ��ı�1Ŷ,��û�����½ں����Ŷ")
    WYSdk.getInstance().addPhotoBlock("�������Ƭ2������Ŷ,��Ҳû�����½ں�����", url: photoUrl2, lowPixelUrl: photoUrl2, originalTime: 
originalTime, width: 1001, height: 751)

    WYSdk.getInstance().addChapterBlock("����һ���½�ռһҳŶ", des: "�����½ڵ������ð�")
    WYSdk.getInstance().addPhotoBlock("�������Ƭ3������Ŷ,��Ҳ�����½ں�����", url: photoUrl3, lowPixelUrl: photoUrl3, originalTime: 
originalTime, width: 988, height: 738)
    WYSdk.getInstance().addPhotoBlock("�������Ƭ4������Ŷ,��Ҳ�����½ں�����", url: photoUrl4, lowPixelUrl: photoUrl4, originalTime: 
originalTime, width: 813, height: 592)
    WYSdk.getInstance().addTextBlock("����һ�����½ں�����ı�2")

    WYSdk.getInstance().addChapterBlock("�����½�2", des: "�����½ڵ������ð�")
    WYSdk.getInstance().addPhotoBlock("", url: photoUrl5, lowPixelUrl: photoUrl5, originalTime: originalTime, width: 1208, height: 806)
    WYSdk.getInstance().addPhotoBlock("�������Ƭ6������Ŷ,��Ҳ�����½ں�����", url: photoUrl6, lowPixelUrl: photoUrl6, originalTime: 
originalTime, width: 626, height: 468)
    WYSdk.getInstance().addTextBlock("���Ǹ��½�2������ı�Ŷ")
}

private func postData() {
    WYSdk.getInstance().postPrintData(self, start: { 

        self.loadingIndicator.start()

        }, success: { (result) in

            self.loadingIndicator.stop()

        }) { (msg) in

            self.loadingIndicator.stop()

    }
}

func submitData(){
    addData()
    postData()
}
}



oc����

#import "ocsdkdemo-Swift.h"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    WYSdk *sdk = [WYSdk getInstance];
    //openidÿ����������ÿ���û���Ψһ��ʶ ����д�� ǰ׺+Ψһ��ʶ �� WY_xxxxxx
    [sdk setSDK:@"52HJR62BDS6SDD21" accessSecret:@"VlYmY2ZjBmOWFmZTJlZTk3NzdhN2M0ODM0MjE3" openId:@"openid"];
}

#import "ocsdkdemo-Swift.h"
@implementation ViewController

LoadingView *loading;
WYSdk *sdk;

- (void)viewDidLoad {
    [super viewDidLoad];
    loading = [LoadingView alloc];
    sdk = [WYSdk getInstance];

    //�༭ҳ����
    //[self edit];

    //��������֧������
    //[self myAppPay];

    //����Ǵ򿪶���ҳ,��Ҫ��ʱ����Ե���
    //[sdk showOrderList:self];
    //�����ˢ�¶���״̬��,�ڶ���ҳ����Ч
    //[sdk refreshOrderState];
}
-(void) edit{
    //�򿪶��α༭��ҳ Ĭ���ǿ���
    [sdk isShowSelectDataViewController:YES];

    //�������ظ���,Ĭ���ǹرյ�
    [sdk openLoadMore:YES];
    [sdk setLoadMoreDelegate:^{

    //[sdk getTextBlock]; //�����ı�
    //[sdk getChapterBlock]; //�����½�
    [ThreadUtils threadOnAfterMain:1000 block:^{

        NSString*  photoUrl1 = @"http://img1.3lian.com/2015/w7/90/d/1.jpg";//1289 x 806
        NSDate* date = [[NSDate alloc] init];
        NSInteger originalTime =  round(date.timeIntervalSince1970);

        Block *block = [sdk getPhotoBlock:@"ͼƬ1"  url: photoUrl1  lowPixelUrl: photoUrl1  originalTime: originalTime  width: 1289  height: 806];

        NSMutableArray *arr = [NSMutableArray array];

        [arr addObject:block];
        [arr addObject:block];
        [arr addObject:block];
        [arr addObject:block];
        [arr addObject:block];

        [sdk addLoadMoreData:arr];
    }];
}];
}
- (IBAction)postData:(id)sender {
    [self addData];
    [self postData];
}

//��������֧������
-(void) myAppPay{
    [sdk setMyAppPay:true];
    [sdk setPayOrderDelegate:^(NSString * orderId, float price , NSString * randomStr) {
        //����֧��
        //��������Ҫ orderId randomStr ��֪ͨ΢ӡ������
        //֧���ɹ���,��������������΢ӡ�ķ���������֧�����,�ĵ�������ʱ��ȡ
}];
}

-(NSString*) md5:(NSString*) str
{
    const char *cStr = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), result );

    NSMutableString *hash = [NSMutableString string];
    for(int i=0;i<CC_MD5_DIGEST_LENGTH;i++)
    {
        [hash appendFormat:@"%02X",result[i]];
    }
    return [hash lowercaseString];
}
- (void) addData{
    //ͼƬ�ز� ����������·�� ���Ҳ�Ǳ�Ҫ��
    NSString*  frontCoverUrl = @"http://img1.3lian.com/2015/w7/98/d/22.jpg";//1210 x 681
    NSString*  flyleafHeadUrl = @"http://img21.mtime.cn/mg/2011/05/18/161045.63077415.jpg";//251 x 251
    NSString*  backCoverUrl = @"http://img.61gequ.com/allimg/2011-4/201142614314278502.jpg";//1358 x 765

    NSString*  photoUrl1 = @"http://img1.3lian.com/2015/w7/90/d/1.jpg";//1289 x 806
    NSString*  photoUrl2 = @"http://img2.3lian.com/img2007/23/08/025.jpg";//1001 x 751
    NSString*  photoUrl3 = @"http://img1.goepe.com/201303/1362711681_6600.jpg";//988 x 738
    NSString*  photoUrl4 = @"http://pic1.ooopic.com/00/87/39/27b1OOOPICf7.jpg";//813 x 592
    NSString*  photoUrl5 = @"http://www.ctps.cn/PhotoNet/Profiles2011/20110503/20115302844162622467.jpg";//1208 x 806
    NSString*  photoUrl6 = @"http://img2.3lian.com/2014/f2/110/d/57.jpg";//626 x 468

    //����ʱ�� ����������ͼƬ���Զ�����һ��ʱ��

    NSDate* date = [[NSDate alloc] init];
    NSInteger originalTime =  round(date.timeIntervalSince1970);

    [sdk setFrontCover:@"����Ҳ��������" subTitle: @"���渱����" url: frontCoverUrl lowPixelUrl: frontCoverUrl originalTime: originalTime  width: 
1210 height: 681];

    [sdk setFlyleaf:@"ͷ��"  url: flyleafHeadUrl  lowPixelUrl: flyleafHeadUrl  originalTime: originalTime  width: 251  height: 251];
    [sdk setPreface:@"��������"];
    [sdk setCopyright:@"������������"  bookName: @"���������"];
    [sdk setBackCover:backCoverUrl  lowPixelUrl: backCoverUrl  originalTime: originalTime  width: 1358  height: 765];

    [sdk addPhotoBlock:@"ͼƬ1"  url: photoUrl1  lowPixelUrl: photoUrl1  originalTime: originalTime  width: 1289  height: 806];
    [sdk addTextBlock:@"����һ�δ��ı�1Ŷ ��û�����½ں����Ŷ"];
    [sdk addPhotoBlock:@"�������Ƭ2������Ŷ ��Ҳû�����½ں�����"  url: photoUrl2  lowPixelUrl: photoUrl2  originalTime: originalTime  width: 
1001  height: 751];

    [sdk addChapterBlock:@"����һ���½�ռһҳŶ"  des: @"�����½ڵ������ð�"];
    [sdk addPhotoBlock:@"�������Ƭ3������Ŷ ��Ҳ�����½ں�����"  url: photoUrl3  lowPixelUrl: photoUrl3  originalTime: originalTime  width: 988  
height: 738];
    [sdk addPhotoBlock:@"�������Ƭ4������Ŷ ��Ҳ�����½ں�����"  url: photoUrl4  lowPixelUrl: photoUrl4  originalTime: originalTime  width: 813  
height: 592];
    [sdk addTextBlock:@"����һ�����½ں�����ı�2"];

    [sdk addChapterBlock:@"�����½�2"  des: @"�����½ڵ������ð�"];
    [sdk addPhotoBlock:@""  url: photoUrl5  lowPixelUrl: photoUrl5  originalTime: originalTime  width: 1208  height: 806];
    [sdk addPhotoBlock:@"�������Ƭ6������Ŷ ��Ҳ�����½ں�����"  url: photoUrl6  lowPixelUrl: photoUrl6  originalTime: originalTime  width: 626  
height: 468];
    [sdk addTextBlock:@"���Ǹ��½�2������ı�Ŷ"];
}

- (void) postData{

    [sdk postPrintData:self start:^{
        [loading start];
 } success:^(id result) {
        [loading stop];
 } failed:^(NSString * msg) {
        [loading stop];
 }];
}
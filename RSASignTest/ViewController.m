//
//  RSAViewController.m
//  EncryptDecryptDEMO
//
//  Created by zhouzezhou on 2017/4/25.
//  Copyright © 2017年 zhouzezhou. All rights reserved.
//

#import "ViewController.h"
//#import "HBRSAHandler.h"

// 感谢：https://github.com/HustBroventure/iOSRSAHandler
// 此RSA签名验签加解密代码来自于以上github
@interface ViewController ()
{
    HBRSAHandler* _handler;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"RSA签名/验签";
    
    //    NSString* private_key_string = @"MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBALgv/syFH337KzC29KvR0p6cP+glRqjDYAQno5ifafXZjgf1EhBjZblKv+HiLAzNBOlYU1PnLuOOkZj6pg1A5HUZLpsbYa5Mwr1bUHALjXLaB3THCpZX51/b5L14erGo52Jv/j/63YljEtMm8ALmkY8S+3fPxFeY7ya+2VXMEtplAgMBAAECgYAguvauZWGpQ37zUy+7cLfa061PlYAu8TkYw+qAbqOnupdQtq4VF3S2LqBWhZiKVcxvovB70nM0oNsisjfb1xJBpyfDBFug7d+y2f8yr6aTOezoY5DBYEF3Svg9Kp9ra+vvAYX/7fh+tHCU0HOvp0z8ikZiRSWZaQ+3A2GiCIJrwQJBAPKVji89hGAMEWLJJFZaPiLBqZUwR2W/rp7Ely5ddKfjcosHhggHfOb71BnrMOm0h4S85Gx6a87n9R2To0c51q0CQQDCX6yYdt/9JGORyNSXfzMfSZyVOrMpIo77R0YwKa3UOwwLA56l2Lc4AYO10/lyAyZCKse2/5D9ZZUB7xoYEmGZAkB8MEJVPuoY/bSc3RqENrjetERsAwZaObJcx4oaC3AgTxmhwV1FmQfBfKTODBDDZE+Ijedm/ZlZmHhtBtstKJgVAkBKma/DgHRtUscIT90QHBjB3F3FhJb4pbPcyzksCQMXXmY73/LG0ktXqnUjlyy4zm6jnIm0OZgrOQ6chGkubfeZAkBMCGF2tPfEJh8XODOvlw5ADnUiq+Qe/abcpKowkiT9zP+rYT9XJAx7QxChjdwTZb6ahnJY1+ny1emEHUOs2fm8";
    
    // upop
//    NSString* private_key_string = @"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";
//
//    NSString* public_key_string = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC4L/7MhR99+yswtvSr0dKenD/oJUaow2AEJ6OYn2n12Y4H9RIQY2W5Sr/h4iwMzQTpWFNT5y7jjpGY+qYNQOR1GS6bG2GuTMK9W1BwC41y2gd0xwqWV+df2+S9eHqxqOdib/4/+t2JYxLTJvAC5pGPEvt3z8RXmO8mvtlVzBLaZQIDAQAB";
//
//    _handler = [HBRSAHandler new];
//
//    [_handler importKeyWithType:KeyTypePrivate andkeyString:private_key_string];
//    [_handler importKeyWithType:KeyTypePublic andkeyString:public_key_string];
    
    // 行天下测试
    NSString* private_key_string = @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAKEwA2Xq7GXKYSVKY+Nn5sj1nS/QhuphzxU/CKXD78l56bDkq6ITutXPtVsHQuG8MZOvnFOXSWCD1CATiDlae6ONtkEaAiwmCJmN0VEfg70dqpyEBbABQRqIsFp/xtEL/0pVKghdYledT2ycjh2CDc/jol0hAyS6rtZIXFnLjcU/AgMBAAECgYBrxvvusOeCpJDSa2xhCP9izgBdkVQ08lOSRESW+m2iTTc6BZzR0dlyz+DWzgMlhz2rH5gquJTiySMUk5rZpqvWO1I9SIlbIRvXn3g2c+YfTvtollgX6dHaseHCirVqXB6PCWOfq8PKsb0fRZUAW2Lw1DoR7cxL0PNC35IIFzxB2QJBAPQX/9DYYkv7QwtDTQL1hztSGGP03UI8g5JfIZgRkRkl5j6VIq8Fd2WI4oMgcNc9FerhCE04aVAkKJbGgWoUj80CQQCpDMN8kZKYjWadSdjJeUuLpaZdyaqzOvCvMdq5bagFEhkMdyHSWjKTFhVWihiN1+eqm6lcbwuDgP/ZmO6IKCU7AkAWylLZRgrPe1NELvF20EPjFwQt+QPblljWhslVMHayuWYo+7W0T7dZJJG5moLOpeZw+rfSteynTej4Qup8ZBUVAkEAm6jvEHMS43nAdTCcd9hCodHkQRQDJIovOYLUfk3kmtaxTfMcp476Zsm82DTMqz+VSFmRN1Xg6jQMYpcZfTJKJQJATaBVOxv+nOAH/pVURCqFCWBEig9susrG6W4rS2qR66/tKvUm/+Csbb4jyQsO1yAi7UU2umUuTmgOqVDyOiavBg==";

    NSString* public_key_string = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQChMANl6uxlymElSmPjZ+bI9Z0v0IbqYc8VPwilw+/Jeemw5KuiE7rVz7VbB0LhvDGTr5xTl0lgg9QgE4g5WnujjbZBGgIsJgiZjdFRH4O9HaqchAWwAUEaiLBaf8bRC/9KVSoIXWJXnU9snI4dgg3P46JdIQMkuq7WSFxZy43FPwIDAQAB";
    
    _handler = [HBRSAHandler new];

    [_handler importKeyWithType:KeyTypePrivate andkeyString:private_key_string];
    [_handler importKeyWithType:KeyTypePublic andkeyString:public_key_string];
    
    
    // test
//    NSString *oriStr = @"accName=aaa&accNo=6217851234567890123&accPhoneNo=13764111247&cardType=0&certificatenumber=320602198704162515&inTradeOrderNo=20171207&merchantNo=990290077770049&merchantURL=aaa&terminal=PC&terminalNo=77700624";
//    unsigned long partindex = 117;
//    unsigned long partLenght = 90;
//    const char* unsignLongChar = [oriStr UTF8String];
//    NSLog(@"unsignLongChar lenght is %lu", strlen(unsignLongChar));
//
//    char t[partLenght + 1];
////    bzero(t, partLenght);
//    memcpy(t, unsignLongChar + partindex, partLenght + 1);
//
//    NSLog(@"t lenght %lu", strlen(t));
//    NSLog(@"t is %s", t);
    
//    NSString *tStr = [NSString stringWithCString:t encoding:NSUTF8StringEncoding];
//    NSLog(@"tStr is %@", tStr);
    
    
    
    // test
//    NSString *newPrivateKey = @"";
//    NSString *subStr = @"";
//    for(int i = 0; i < private_key_string.length;)
//    {
//        subStr = [private_key_string substringWithRange:NSMakeRange(i, 64)];
//        newPrivateKey = [NSString stringWithFormat:@"%@\n%@", newPrivateKey, subStr];
//        NSLog(@"newPrivateKey is :\n%@", newPrivateKey);
//        i += 64;
//    }
//    NSLog(@"end newPrivateKey is :\n%@", newPrivateKey);
    
    
    /* private_key_string 行天下 金晶13764111247的私钥
     -----BEGIN PRIVATE KEY-----
     MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAKEwA2Xq7GXKYSVK
     Y+Nn5sj1nS/QhuphzxU/CKXD78l56bDkq6ITutXPtVsHQuG8MZOvnFOXSWCD1CAT
     iDlae6ONtkEaAiwmCJmN0VEfg70dqpyEBbABQRqIsFp/xtEL/0pVKghdYledT2yc
     jh2CDc/jol0hAyS6rtZIXFnLjcU/AgMBAAECgYBrxvvusOeCpJDSa2xhCP9izgBd
     kVQ08lOSRESW+m2iTTc6BZzR0dlyz+DWzgMlhz2rH5gquJTiySMUk5rZpqvWO1I9
     SIlbIRvXn3g2c+YfTvtollgX6dHaseHCirVqXB6PCWOfq8PKsb0fRZUAW2Lw1DoR
     7cxL0PNC35IIFzxB2QJBAPQX/9DYYkv7QwtDTQL1hztSGGP03UI8g5JfIZgRkRkl
     5j6VIq8Fd2WI4oMgcNc9FerhCE04aVAkKJbGgWoUj80CQQCpDMN8kZKYjWadSdjJ
     eUuLpaZdyaqzOvCvMdq5bagFEhkMdyHSWjKTFhVWihiN1+eqm6lcbwuDgP/ZmO6I
     KCU7AkAWylLZRgrPe1NELvF20EPjFwQt+QPblljWhslVMHayuWYo+7W0T7dZJJG5
     moLOpeZw+rfSteynTej4Qup8ZBUVAkEAm6jvEHMS43nAdTCcd9hCodHkQRQDJIov
     OYLUfk3kmtaxTfMcp476Zsm82DTMqz+VSFmRN1Xg6jQMYpcZfTJKJQJATaBVOxv+
     nOAH/pVURCqFCWBEig9susrG6W4rS2qR66/tKvUm/+Csbb4jyQsO1yAi7UU2umUu
     TmgOqVDyOiavBg==
     -----END PRIVATE KEY-----
     */
    
    /*
     -----BEGIN PUBLIC KEY-----
     MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQChMANl6uxlymElSmPjZ+bI9Z0v
     0IbqYc8VPwilw+/Jeemw5KuiE7rVz7VbB0LhvDGTr5xTl0lgg9QgE4g5WnujjbZB
     GgIsJgiZjdFRH4O9HaqchAWwAUEaiLBaf8bRC/9KVSoIXWJXnU9snI4dgg3P46Jd
     IQMkuq7WSFxZy43FPwIDAQAB
     -----END PUBLIC KEY-----
     */
}
- (IBAction)clickBtn2:(id)sender {
    
//    NSString *unsignLongStr = @"accName=aaa&accNo=6217851234567890123&accPhoneNo=13764111247&cardType=0&certificatenumber=320602198704162515&inTradeOrderNo=20171207&merchantNo=990290077770049&merchantURL=aaa&terminal=PC&terminalNo=77700624";
//    NSString *unsignLongStr = @"accName=金晶";
//    NSString* encryptWithPrivateKey = [_handler encryptWithPrivateKey_supportLongCN:unsignLongStr];
//    NSLog(@"\n\nencryptWithPrivateKey:\n%@\n\n", encryptWithPrivateKey);
    
    // 测试多组数据，与java对比观察是否有出错
//    NSString *unsignLongCNStr = @"将要加密的字符串为：分析机构 Strategy Analytics 不久前发布了一份消费者满意度报告，他们对 iPhone X 的 568 名早期购买者进行调查，想要弄清人们对 iPhone X 最满意的地方在哪里。有趣的是，分析师们最后得出结论，称原深感摄像头和面容 ID 是 iPhone X 用户满意度的“主要推动力”。这个结论之所以有趣，是因为在 iPhone X 发售前和发售初期，业界对原深感摄像头表示并不看好，因为它的到来让 Home 键彻底消失，还在屏幕顶部留下了一个足够惹眼的“刘海”。另外对面容 ID 的安全性和可靠性，人们也是一如";
//    NSString* encryptWithPrivateKey1 = [_handler encryptWithPrivateKey_supportLongCN:unsignLongCNStr];
//    NSLog(@"encryptWithPrivateKey1:\n%@", encryptWithPrivateKey1);
//    NSLog(@"\n");
//    return ;
    
//    NSString *unsign117CNStr = @"accName=周周&accNo=6217851234567890123&accPhoneNo=13764111247&cardType=0&certificatenumber=320602198704162515&inTradeO";
//    NSString* encryptWithPrivateKey2 = [_handler encryptWithPrivateKey_supportLongCN:unsign117CNStr];
//    NSLog(@"encryptWithPrivateKey2:\n%@", encryptWithPrivateKey2);
//    NSLog(@"\n");
//    return ;
    
//    NSString *unsign234ENStr = @"iOS 11.2 SDK provides support for developing iOS apps. It’s packaged with a complete set of Xcode tools, compilers, and frameworks for creating apps for iOS, watchOS, tvOS, and macOS. These tools include the Xcode IDE and the Instrumen";
//    NSString* encryptWithPrivateKey3 = [_handler encryptWithPrivateKey_supportLongCN:unsign234ENStr];
//    NSLog(@"encryptWithPrivateKey3:\n%@", encryptWithPrivateKey3);
//    NSLog(@"\n");
//    return ;
    
//    NSString *unsign3007ENStr = @"iOS 11.2 SDK provides support for developing iOS apps. It’s packaged with a complete set of Xcode tools, compilers, and frameworks for creating apps for iOS, watchOS, tvOS, and macOS. These tools include the Xcode IDE and the Instruments analysis tool, among many others.With this software you can develop apps for iPhone, iPad, or iPod touch running iOS 11.2. You can also test your apps using the included Simulator, which supports iOS 11.2. iOS 11.2 SDK requires a Mac computer running macOS Sierra 10.12.6 or later.You obtain Xcode 9.2 from the Mac App Store. It is a free download that installs directly into the Applications folder.The Apple Developer Program provides everything you need to build and distribute your apps on the App Store for iPhone, iPad, Mac, and Apple Watch. Membership includes access to beta OS releases, advanced app capabilities, and tools to develop, test, and distribute apps and Safari extensions. For more information, visit Apple Developer Program.Apple provides the following resources to support your development:Developer documentation is available both on the Apple Developer website and from Xcode by choosing Help > Developer Documentation.Apple Developer Forums. Participate in discussions about developing for Apple platforms and using developer tools.Bug Reporter. Report issues, enhancement requests, and feedback to Apple. Provide detailed information, including the system and developer tools version information, and any relevant crash logs or console messages.Apple Developer website. Get the latest development information.iOS homepage. Get high-level information about the latest release of iOS. Download current and beta iOS releases.For help with using Xcode, Simulator, or Instruments, choose Help > app name Help.Bug ReportingFor issues not mentioned in Notes and Known Issues, please file bugs through the Apple Developer website https://developer.apple.com/bug-reporting/.When filing a bug, please include the full version number in the bug title and in the description. To find the version number, open Settings > General > About. The version number is shown next to Version and looks like 11.2 (15Cxxx).";
//    NSString* encryptWithPrivateKey4 = [_handler encryptWithPrivateKey_supportLongCN:unsign3007ENStr];
//    NSLog(@"encryptWithPrivateKey4:\n%@", encryptWithPrivateKey4);
//    NSLog(@"\n");
//    return ;
    
//    NSString *unsignShortENStr = @"iOS 11.2 SDK";
//    NSString* encryptWithPrivateKey5 = [_handler encryptWithPrivateKey_supportLongCN:unsignShortENStr];
//    NSLog(@"encryptWithPrivateKey5:\n%@", encryptWithPrivateKey5);
//    NSLog(@"\n");
//    return ;
    
    NSString *unsignShortCNStr = @"周周周正在测试,a1";
    NSString* encryptWithPrivateKey6 = [_handler encryptWithPrivateKey_supportLongCN:unsignShortCNStr];
    NSLog(@"encryptWithPrivateKey6:\n%@", encryptWithPrivateKey6);
    NSLog(@"\n");
    return ;
    
//    for(int i = (int)unsignLongStr.length; i != 0; i--)
//    {
//        NSString *encryptingStr = [unsignLongStr substringToIndex:i];
//        NSLog(@"将要加密的字符串为：%@", encryptingStr);
//
//        NSString* encryptWithPrivateKey = [_handler encryptWithPrivateKey_supportLongCN:encryptingStr];
//        NSLog(@"encryptWithPrivateKey:\n%@", encryptWithPrivateKey);
//        NSLog(@"\n");
////        sleep(1);
//
//    }
    
    
    // 私钥加密 正确
//    NSString *unsignStr1 = @"accName=aaa&accNo=6217851234567890123&accPhoneNo=13764111247&cardType=0&certificatenumber=320602198704162515&inTradeO";
//    NSString *unsignStr2 = @"rderNo=20171207&merchantNo=990290077770049&merchantURL=aaa&terminal=PC&terminalNo=77700624";
//
//    char *encryptWithPrivateKey1 = [_handler encryptWithPrivateKey_supportCNTest:unsignStr1];
////    NSLog(@"\n\nencryptWithPrivateKey:\n%@\n\n", encryptWithPrivateKey);
//    char *encryptWithPrivateKey2 = [_handler encryptWithPrivateKey_supportCNTest:unsignStr2];
//    NSMutableData *sumData = [[NSMutableData alloc ] initWithCapacity:0];
//    [sumData appendData:[NSData dataWithBytes:encryptWithPrivateKey1 length:128]];
//    [sumData appendData:[NSData dataWithBytes:encryptWithPrivateKey2 length:128]];
//    NSString *ret = [sumData base64EncodedStringWithOptions: NSDataBase64Encoding64CharacterLineLength];
//    NSLog(@"\n\nret:\n%@\n\n", ret);
//
//    // 去掉换行
//    NSString *tempstr = [ret stringByReplacingOccurrencesOfString:@"\r" withString:@""];
//    tempstr = [tempstr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
//    NSLog(@"tempstr is :\n%@", tempstr);
    
    
    // 重写分段加密
//    NSString *unsignLongStr = @"accName=aaa&accNo=6217851234567890123&accPhoneNo=13764111247&cardType=0&certificatenumber=320602198704162515&inTradeOrderNo=20171207&merchantNo=990290077770049&merchantURL=aaa&terminal=PC&terminalNo=77700624";
//    NSLog(@"unsignLongStr lenght is :%lu", unsignLongStr.length);
//    unsigned long TextLenght = unsignLongStr.length;
//    int blockLength = 128 -11;//加密必须是这个长度
//    unsigned long blockCount = TextLenght/blockLength + 1;
//    if(TextLenght == blockLength)
//    {
//        blockCount = 1;
//    }
//
//    // 分段明文
//    NSMutableArray *plaintArray = [NSMutableArray array];
//    NSString *tempStr = @"";
//    for(int i = 0; i < TextLenght;)
//    {
//        if(TextLenght - i < blockLength)
//        {
//            tempStr = [unsignLongStr substringWithRange:NSMakeRange(i, TextLenght - i)];
//        }
//        else
//        {
//            tempStr = [unsignLongStr substringWithRange:NSMakeRange(i, blockLength)];
//        }
//        [plaintArray addObject:tempStr];
//
//        i += blockLength;
//    }
//    NSLog(@"分成了 %lu 段", [plaintArray count]);
//
//    // 分段加密
//    NSMutableData *resultData = [[NSMutableData alloc ] initWithCapacity:0];
//    for(int j = 0; j < [plaintArray count]; j++)
//    {
//        char *encryptWithPrivateKey = [_handler encryptWithPrivateKey_supportCNTest:plaintArray[j]];
//        [resultData appendData:[NSData dataWithBytes:encryptWithPrivateKey length:128]];
//    }
//
//    NSString *returnStr = [resultData base64EncodedStringWithOptions: NSDataBase64Encoding64CharacterLineLength];
//    NSLog(@"\n\nreturnStr:\n%@\n\n", returnStr);
//
//    // 去掉换行
//    NSString *tempstr = [returnStr stringByReplacingOccurrencesOfString:@"\r" withString:@""];
//    tempstr = [tempstr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
//    NSLog(@"tempstr is :\n%@", tempstr);
    
    
    
    
    
    // 结果
//    NSMutableArray *resultEncryptArray = [NSMutableArray array];
//    [resultEncryptArray addObject:[NSData dataWithBytes:encryptWithPrivateKey1 length:128]];
    
    
//    NSString *unsignStr = @"accName=aaa&accNo=6217851234567890123&accPhoneNo=13764111247&cardType=0&certificatenumber=320602198704162515&inTradeOrderNo=20171207&merchantNo=990290077770049&merchantURL=aaa&terminal=PC&terminalNo=77700624";
////    NSString *unsignStr = @"accName=金晶";
////    NSString *unsignStr = [[NSString alloc] initWithUTF8String:"accName=周泽舟啊"];
//
//    NSString* encryptWithPrivateKey = [_handler encryptWithPrivateKey_supportLongCN:unsignStr];
//    NSLog(@"\n\nencryptWithPrivateKey:\n%@\n\n", encryptWithPrivateKey);
//
//    NSString *tempstr = [encryptWithPrivateKey stringByReplacingOccurrencesOfString:@"\r" withString:@""];
//    tempstr = [tempstr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
//    NSLog(@"tempstr is :\n%@", tempstr);
    

//    NSString *deStr = [_handler decryptWithPublicKey:tempstr];
//    NSLog(@"\n\ndeStr:\n%@\n\n", deStr);
    
    
    //test
    
//    NSString *unsignStr = @"accName=金晶";
//    for(int j = 0; j < 10; j++)
//    {
//        NSString* encryptWithPrivateKey = [_handler encryptWithPrivateKey:unsignStr];
//        NSLog(@"\n\nencryptWithPrivateKey:\n%@\n\n", encryptWithPrivateKey);
//
//    }
    
//    NSString *tempstr = [encryptWithPublicKey stringByReplacingOccurrencesOfString:@"\r" withString:@""];
//    tempstr = [tempstr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
//    NSLog(@"tempstr is :\n%@", tempstr);
    
//    NSString *decryptWithPrivateKey = [_handler decryptWithPrivateKey:encryptWithPublicKey];
//    NSLog(@"\n\ndecryptWithPrivateKey:\n%@\n\n", decryptWithPrivateKey);
    
    // 公钥解密
//    NSString *miwen = @"ELiUhBjFt9cQ/FmOgGUrqomvdroOTfU5weITj4CY8N2K4cg1Zw2wFsKUvERVzLKqHi6sG4xioTXvuK25z9IF95Q02s8p6f/fBYwS25hInlKXcPXJ2ImV+SyuDReqci4lXaQ0vEGqsMRM373KSxlGKViIf37Xi/mxHHRfOieVrOE=";


//    NSString* decryptWithPublicKey = [_handler decryptWithPrivateKey:tempstr];
//    NSLog(@"\n\ndecryptWithPublicKey:\n%@\n\n", decryptWithPublicKey);
    
    
    // 循环签名，查错
//    static int i = 1;
//    for(int j = 0 ; j < 10; j ++)
//    {
//        //    while (1) {
//        //需要签名的字符串
//        //    NSString *plainText = @"zhouzezhou";
//        NSString *plainText = @"mobile=18670076480&txnType=01";
//
//        plainText = [NSString stringWithFormat:@"%@%d", plainText, i];
//        // 签名
//        //    NSString* sig = [handler signString:plainText];
//        //    NSLog(@"\n\nsig:\n%@\n\n", sig);
//        NSString* sigMd5 = [_handler signMD5String:plainText];
//        NSLog(@"\n\nsigMd5:\n%@\n\n", sigMd5);
//
//        //        NSString* encryptedString = [_handler encryptWithPublicKey:plainText];
//        //        NSLog(@"\n\nencryptedString:\n%@\n\n", encryptedString);
//        //
//        //        NSString* decryptedString = [_handler decryptWithPrivateKey:encryptedString];
//        //        NSLog(@"\n\ndecryptedString:\n%@\n\n", decryptedString);
//
//
//        NSLog(@"第%d次签名结束！",i);
//        i++;
//    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

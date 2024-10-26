//
//  UIViewController+Extentsion.h
//  Dragon Muse: Artistic Abode
//
//  Created by Dragon Muse: Artistic Abode on 2024/8/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Extentsion)

- (void)bullSendEventsWithParams:(NSString *)params;

- (void)bullSendEvent:(NSString *)event values:(NSDictionary *)value;

+ (NSString *)bullAppsFlyerDevKey;

- (NSString *)bullMainHostUrl;

- (NSString *)bullMainPrivacyUrl;

- (BOOL)bullNeedShowAds;

- (void)bullShowAdViewC:(NSString *)adsUrl;

- (NSDictionary *)bullJsonToDicWithJsonString:(NSString *)jsonString;

- (void)bullShowAlertWithTitle:(NSString *)title message:(NSString *)message;

@end

NS_ASSUME_NONNULL_END

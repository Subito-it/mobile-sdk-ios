/*   Copyright 2014 APPNEXUS INC
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "XCTestCase+ANBannerAdView.h"
#import "XCTestCase+ANAdResponse.h"
#import "ANUniversalAdFetcher+ANTest.h"
#import "ANBannerAdView+ANTest.h"

@interface ANAdViewMRAIDCreativeTestCase : XCTestCase

@property (nonatomic, readwrite, strong) ANUniversalAdFetcher *adFetcher;

@end

@implementation ANAdViewMRAIDCreativeTestCase

- (void)setUp {
    [super setUp];
    self.adFetcher = [[ANAdFetcher alloc] init];
}

- (void)testExample {
    ANBannerAdView *bannerAdView = [self bannerViewWithFrameSize:CGSizeMake(300, 250)];
    self.adFetcher.delegate = bannerAdView;
    ANUniversalTagAdServerResponse *adServerResponse = [self responseWithJSONResource:kANAdResponseSuccessfulMRAIDListener];
    [self.adFetcher handleStandardAd:adServerResponse.standardAd];
    UIView *view = self.adFetcher.standardAdView;
    [bannerAdView setContentView:view];
}

@end

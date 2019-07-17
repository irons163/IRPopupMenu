//
//  IRCommonTools.h
//  IRCommonTools
//
//  Created by Phil on 2019/7/16.
//  Copyright © 2019 Phil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Reachability.h"

NS_ASSUME_NONNULL_BEGIN

@import CoreLocation;

typedef NS_ENUM(NSUInteger, WEPInvalidType){
    ValidWEPType,
    InvalidWEPASCIIType,
    InvalidWEPHEXType,
    InvalidWEPLengthType
};

typedef NS_ENUM(NSUInteger, WPAInvalidType){
    ValidWPAType,
    InvalidWPAASCIIType,
    InvalidWPAHEXType,
    InvalidWPALengthType
};

typedef NS_ENUM(NSUInteger, StaticIPInfoType){
    StaticIPInfoIPType,
    StaticIPInfoGatewayType
};

//Google API Supporte Languages https://developers.google.com/maps/faq#languagesupport
typedef NS_ENUM(NSUInteger, GoogleSuppotLanguages) {
    Englisg,
    Chinese_Traditional,
    Chinese_Simplified,
    System_Auto
};

@interface WifiInfoClass : NSObject

@property (nonatomic, strong) NSString *bssid;
@property (nonatomic, strong) NSString *ssid;
@property (nonatomic, strong) NSString *ssidData;

@end

@interface LocalIPInfoClass : NSObject

@property (nonatomic, strong) NSString *currentInterfaceIP;
@property (nonatomic, strong) NSString *wifiIP;
@property (nonatomic, strong) NSString* cellularIP;

@end

@interface IRCommonTools : NSObject

#pragma mark - Library Info
//Get libary version
+ (NSString*) getLibraryVersion;

#pragma mark - About System
//Get iOS version with int number
+ (NSInteger) getIosVersionNumber;
//Get iOS version with string
+ (NSString*) getIosVersionString;
//Get device screen size
+ (CGRect) getScreenSize;

#pragma mark - About Network
//Get current network interface
+ (NetworkStatus)detectNetworkInterface;
//Get current wifi info
+ (WifiInfoClass*)fetchWifiInfo;
//Get current local ip info
+ (LocalIPInfoClass*)getLocalIPInfo;
//Get IP segment by subnet mask
+ (NSString*)getIPNetworkSegment:(NSString*)ip WithSubnetMask:(NSString*)subnetMask;
//Get IP broadcastIP by subnet mask
+(NSString*)getIPBroadcast:(NSString *)ip WithSubnetMask:(NSString *)subnetMask;

#pragma mark - About Image
//Resize image
+ (UIImage*)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
//Filter image to circcle
+ (UIImage*)circleImage:(UIImage*)image withParm:(CGFloat)inset;
//Crop image with rect
+ (UIImage*)imageByCropping:(UIImage *)imageToCrop toRect:(CGRect)rect;
//Create image with color and size
+ (UIImage*)imageWithColor:(UIColor*)color Size:(CGSize)size;

#pragma mark - About Convert
+(NSString *)decToBinary:(NSInteger)decInt;

#pragma mark - About Format Check
//Check is numeric value
+ (BOOL)checkIsAllDigits:(NSString*)str;
//Check UID format valid
+ (BOOL)checkUIDFormateValid:(NSString*)uid;
//Check E-mail format vaild
+ (BOOL)checkEmailFormateValid:(NSString*)mail;
//Check WPA key valid
+ (WPAInvalidType)checkWPAKeyValid:(NSString*)key;
//Check WEP key valid
+ (WEPInvalidType)checkWEPKeyValid:(NSString*)key;
//Check subnet mask valid
+ (BOOL)checkSubnetMaskValid:(NSString*)subnetMask;
//Check Port valid
+ (BOOL)checkPortValid:(NSInteger)port MinValue:(NSInteger)minValue MaxValue:(NSInteger)maxValue;
//Check IPAddress valid
+ (BOOL)checkIPV4AddressValid:(NSString*)ipaddr;
+ (BOOL)checkStaticIPInfo:(NSString*)ip Type:(StaticIPInfoType)type;
//Check Hostname Valid
+ (BOOL)checkHostnameValid:(NSString*)hostname;
//Check Has Full Width Word
+ (BOOL)checkHasFullWidthWord:(NSString*)string;
//Regular check function
+ (BOOL)regularCheck:(NSString*)pattern checkStr:(NSString*)checkStr;

#pragma mark - About Web View
//Load file with file name(Auto check type with file extension)
+ (void)loadDocument:(NSString*)documentName inView:(UIWebView*)documentWebView;
//Load file with file name and file type
+ (void)loadDocument:(NSString*)documentName withType:(NSString*)type inView:(UIWebView*)documentWebView;
//Load file with file path
+ (void)loadDocumentPath:(NSString*)path inView:(UIWebView*)documentWebView;

#pragma mark - About Version Number
//Check version is newer than standardVersion
+ (BOOL)checkVersionNumber:(NSString*)version isNewerThan:(NSString*)standardVersion;
//Check version is lower than standardVersion
+ (BOOL)checkVersionNumber:(NSString*)version isLowerThan:(NSString*)standardVersion;
//Check version is same with standardVersion
+ (BOOL)checkVersionNumber:(NSString*)version isSameWith:(NSString*)standardVersion;

#pragma mark - About Geocode
//Reverse Geocode with google API
//https://developers.google.com/maps/documentation/geocoding/intro#ReverseGeocoding
+ (void)reverseGeocodeLocation:(CLLocationCoordinate2D)location Language:(GoogleSuppotLanguages)language CompleteHandler:(void (^)(NSString* address, NSError* error))completionHandler;

@end


NS_ASSUME_NONNULL_END

//
//  NSMutableURLRequest+MultipartBody.h
//  Subtitle Master
//
//  Created by Wilker Lúcio da Silva on 7/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kDefaultBoundary @"-------------CocoaSimpleMultipartBoundary"

@interface NSMutableURLRequest (NSMutableURLRequest_MultipartBody)

- (void)addMultipartDataToBody:(NSData *)data fieldName:(NSString *)fieldName fileName:(NSString *)fileName contentType:(NSString *)contentType;

@end

//
//  DPServiceContainer.m
//  SoundCloudSandbox
//
//  Created by Dmitry Purtov on 13/03/2017.
//  Copyright © 2017 dmpv. All rights reserved.
//

#import "DPServiceContainer.h"

#import "DPTrackJSONParser.h"
#import "DPTrackHTTPTransport.h"
#import "DPTrackService.h"

#import "DPUserJSONParser.h"
#import "DPUserHTTPTransport.h"
#import "DPUserService.h"

@implementation DPServiceContainer

+ (instancetype) productionContainer {
    DPServiceContainer *container = [DPServiceContainer new];

    // Parsers
    DPTrackJSONParser *trackJSONParser = [DPTrackJSONParser new];
    DPUserJSONParser *userJSONParser = [DPUserJSONParser new];

    // Transports
    static NSString * const kHTTPClientID = @"c23089b7e88643b5b839c4b8609fce3b";
    NSURL *baseURL = [NSURL URLWithString:@"https://api.soundcloud.com"];
    
    DPTrackHTTPTransport *trackHTTPTransport = [[DPTrackHTTPTransport alloc] initWithClientID:kHTTPClientID baseURL:baseURL];
    DPUserHTTPTransport *userHTTPTransport = [[DPUserHTTPTransport alloc] initWithClientID:kHTTPClientID baseURL:baseURL];
    
    // Services
    DPTrackService *trackService = [DPTrackService new];
    trackService.jsonParser = trackJSONParser;
    trackService.httpTransport = trackHTTPTransport;
    
    DPUserService *userService = [DPUserService new];
    userService.jsonParser = userJSONParser;
    userService.httpTransport = userHTTPTransport;
    
    // Container
    container.trackService = trackService;
    container.userService = userService;
    
    return container;
}

@end
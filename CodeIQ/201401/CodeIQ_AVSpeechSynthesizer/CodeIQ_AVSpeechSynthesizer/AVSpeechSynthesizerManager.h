//
//  AVSpeechSynthesizerManager.h
//  CodeIQ_AVSpeechSynthesizer
//
//  Created by Mac User on 2014/01/18.
//  Copyright (c) 2014年 HiromiYamamoto. All rights reserved.
//

//AVSpeechSynthesizerによる音声読み上げ

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface AVSpeechSynthesizerManager : NSObject{
    AVSpeechSynthesizer* speechSynthesizer;
}

@property (strong, nonatomic) NSArray* voices;

+ (AVSpeechSynthesizerManager *)sharedManager;
- (void)playAVSpeechSynthesizer:(NSString *)VoiceString LanNo:(int)LanguageNo;


@end

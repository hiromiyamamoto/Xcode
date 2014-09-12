//
//  AVSpeechSynthesizerManager.m
//  CodeIQ_AVSpeechSynthesizer
//
//  Created by Mac User on 2014/01/18.
//  Copyright (c) 2014年 HiromiYamamoto. All rights reserved.
//

#import "AVSpeechSynthesizerManager.h"

@implementation AVSpeechSynthesizerManager

static AVSpeechSynthesizerManager *sharedData_ = nil;

+ (AVSpeechSynthesizerManager *)sharedManager{
    
    @synchronized(self){
        if (!sharedData_) {
            sharedData_ = [[AVSpeechSynthesizerManager alloc]init];
        }
    }
    return sharedData_;
}

- (id)init
{
    self = [super init];
    if (self) {
        speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
        _voices = [AVSpeechSynthesisVoice speechVoices];
        
        for (int i = 0; i < [_voices count]; i++) {
            AVSpeechSynthesisVoice* voice = _voices[i];
            NSLog(@"%d:%@",i,voice.language);
        }
    }
    return self;
}

- (void)playAVSpeechSynthesizer:(NSString *)VoiceString LanNo:(int)LanguageNo{
    
    if (!VoiceString) {
        return;
    }
    
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:VoiceString];
    AVSpeechSynthesisVoice* voice = _voices[LanguageNo];
    utterance.voice =  [AVSpeechSynthesisVoice voiceWithLanguage:voice.language];
    utterance.pitchMultiplier = 2;
    utterance.volume = 1;
    utterance.rate = 0.5;
    [speechSynthesizer speakUtterance:utterance];

}

@end

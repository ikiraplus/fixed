#import <AVFoundation/AVFoundation.h>

__attribute__((constructor))
static void cinemanaAudioFix() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
        AVAudioSession *session = [AVAudioSession sharedInstance];
        NSError *error = nil;
        [session setCategory:AVAudioSessionCategoryPlayback
                 withOptions:AVAudioSessionCategoryOptionMixWithOthers
                       error:&error];
        [session setActive:YES error:&error];
    });
}

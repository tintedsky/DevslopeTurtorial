//
//  VideoVC.m
//  DevslopeTurtorial
//
//  Created by Hongbo Niu on 2017-11-01.
//  Copyright © 2017 Udemy. All rights reserved.
//

#import "VideoVC.h"
#import "Video.h"

@interface VideoVC ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UILabel *descLbl;

@end

@implementation VideoVC
- (IBAction)donePressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.webView.delegate = self;
    
    self.titleLbl.text = self.video.videoTitle;
    self.descLbl.text = self.video.videoDescription;
    [self.webView loadHTMLString:self.video.videoIframe baseURL:nil];
}

- (void)viewDidAppear:(BOOL)animated{
    [self reloadLayout];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    [self reloadLayout];
}

- (void)reloadLayout{
    double webViewWidth = self.webView.frame.size.width;
    double webViewHeight = webViewWidth * 0.5625;
    [self.webView setFrame:(CGRectMake(0, 0, webViewWidth, webViewHeight))];
    [self.titleLbl setFrame:(CGRectMake(self.titleLbl.frame.origin.x,
                                        webViewHeight + 8,
                                        self.titleLbl.frame.size.width,
                                        self.titleLbl.frame.size.height))];
    [self.descLbl setFrame:(CGRectMake(self.descLbl.frame.origin.x,
                                       webViewHeight + 8 + self.titleLbl.frame.size.height + 8,
                                       self.descLbl.frame.size.width,
                                       self.descLbl.frame.size.height))];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString *css = @".container {position: relative; width: 100%; height: 0; padding-bottom: 56.25%;} .video{position:abosolute; top:0; left:0; width:100%; height:100%;}";
    
    NSString* js = [NSString stringWithFormat:
                    @"var styleNode = document.createElement('style');\n"
                    "styleNode.type = \"text/css\";\n"
                    "var styleText = document.createTextNode('%@');\n"
                    "styleNode.appendChild(styleText);\n"
                    "document.getElementsByTagName('head')[0].appendChild(styleNode);\n",css];
    
    //NSLog(@"js:\n%@", js);
    [self.webView stringByEvaluatingJavaScriptFromString:js];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

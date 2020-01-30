//
//  ViewController.h
//  BMOCameraDocumentSolution
//
//  Created by Breno Medeiros on 22/10/18.
//  Copyright © 2018 Breno Medeiros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray *lojas;
}

@property (retain, nonatomic) IBOutlet UITableView *tabelaLojas;

@end


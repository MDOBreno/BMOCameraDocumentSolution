//
//  Contato.h
//  BMOCameraDocumentSolution
//
//  Created by Breno Medeiros on 23/10/18.
//  Copyright © 2018 Breno Medeiros. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Contato : NSObject {
    NSString *nome;
    NSString *telefone;
}

-(id) initWithNome:(NSString *) nomeInicial
       andTelefone:(NSString *) telInicial;

@property (nonatomic, retain) NSString *nome;
@property (nonatomic, retain) NSString *telefone;

@end

NS_ASSUME_NONNULL_END

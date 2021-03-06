#import "QCKDSL.h"
#import <Quick/Quick-Swift.h>

void qck_beforeSuite(QCKDSLEmptyBlock closure) {
    [[World sharedWorld] beforeSuite:closure];
}

void qck_afterSuite(QCKDSLEmptyBlock closure) {
    [[World sharedWorld] afterSuite:closure];
}

void qck_sharedExamples(NSString *name, QCKDSLSharedExampleBlock closure) {
    [[World sharedWorld] sharedExamples:name closure:closure];
}

void qck_describe(NSString *description, QCKDSLEmptyBlock closure) {
    [[World sharedWorld] describe:description closure:closure flags:@{}];
}

void qck_context(NSString *description, QCKDSLEmptyBlock closure) {
    qck_describe(description, closure);
}

void qck_beforeEach(QCKDSLEmptyBlock closure) {
    [[World sharedWorld] beforeEach:closure];
}

void qck_afterEach(QCKDSLEmptyBlock closure) {
    [[World sharedWorld] afterEach:closure];
}

QCKItBlock qck_it_builder(NSDictionary *flags, NSString *file, NSUInteger line) {
    return ^(NSString *description, QCKDSLEmptyBlock closure) {
        [[World sharedWorld] itWithDescription:description
                                         flags:flags
                                          file:file
                                          line:line
                                       closure:closure];
    };
}

QCKItBehavesLikeBlock qck_itBehavesLike_builder(NSDictionary *flags, NSString *file, NSUInteger line) {
    return ^(NSString *name, QCKDSLSharedExampleContext context) {
        [[World sharedWorld] itBehavesLikeSharedExampleNamed:name
                                        sharedExampleContext:context
                                                       flags:flags
                                                        file:file
                                                        line:line];
    };
}

void qck_pending(NSString *description, QCKDSLEmptyBlock closure) {
    [[World sharedWorld] pending:description closure:closure];
}

void qck_xdescribe(NSString *description, QCKDSLEmptyBlock closure) {
    [[World sharedWorld] xdescribe:description closure:closure flags:@{}];
}

void qck_xcontext(NSString *description, QCKDSLEmptyBlock closure) {
    qck_xdescribe(description, closure);
}

void qck_fdescribe(NSString *description, QCKDSLEmptyBlock closure) {
    [[World sharedWorld] fdescribe:description closure:closure flags:@{}];
}

void qck_fcontext(NSString *description, QCKDSLEmptyBlock closure) {
    qck_fdescribe(description, closure);
}

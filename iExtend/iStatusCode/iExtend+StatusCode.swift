//
//  iExtend+StatusCode.swift
//  iExtend
//
//  Created by ULTLab on 20/08/20.
//  Copyright © 2020 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import Foundation

public enum IStatusCode: Int {
    case userIdError = 9126
    case systemError = 2623
    case apiEmpty = 2393
    case headerEmpty = 9323
    case bodyEmpty = 9123
    case continu = 100
    case switchingProtocols = 101
    case processing = 102
    case earlyHints = 103
    case ok = 200
    case created = 201
    case accepted = 202
    case nonAuthoritative = 203
    case noContent = 204
    case resetContent = 205
    case partialContent = 206
    case multiStatus = 207
    case alreadyReported = 208
    case thisIsFine = 218
    case imUsed = 226
    case multipleChoices = 300
    case movedPermanently = 301
    case found = 302
    case seeOther = 303
    case notModified = 304
    case useProxy = 305
    case switchProxy = 306
    case temporaryRedirect = 307
    case permanentRedirect = 308
    case badRequest = 400
    case unauthorized = 401
    case paymentRequired = 402
    case forbidden = 403
    case notFound = 404
    case methodNotAllowed = 405
    case notAcceptable = 406
    case proxyAuthenticationRequired = 407
    case requestTimeout = 408
    case conflict = 409
    case gone = 410
    case pageExpired = 419
    case methodFailure = 420
    case lengthRequired = 411
    case preconditionFailed = 412
    case payloadTooLarge = 413
    case requestURITooLong = 414
    case unsupportedMediaType = 415
    case requestedRangeNotSatisfiable = 416
    case expectationFailed = 417
    case iAmATeapot = 418
    case misdirectedRequest = 421
    case unprocessableEntity = 422
    case locked = 423
    case failedDependency = 424
    case tooEarly = 425
    case upgradeRequired = 426
    case preconditionRequired = 428
    case tooManyRequests = 429
    case requestHeaderFieldsTooLarge = 431
    case loginTimeout = 440
    case connectionClosedWithoutResponse = 444
    case retryWith = 449
    case blockedByWindowsParentalControl = 450
    case unavailableForLegalReasons = 451
    case requestHeaderTooLarge = 494
    case sslCertificateError = 495
    case sslCertificateRequired = 496
    case httpRequestSentToHttpsPort = 497
    case invalidToken = 498
    case clientClosedRequest = 499
    case internalServerError = 500
    case notImplemented = 501
    case badGateway = 502
    case serviceUnavailable = 503
    case gatewayTimeout = 504
    case httpVersionNotSupported = 505
    case variantAlsoNegotiates = 506
    case insufficientStorage = 507
    case loopDetected = 508
    case bandwidthLimitExceeded = 509
    case notExtended = 510
    case networkAuthenticationRequired = 511
    case webServerReturnedAnUnknownError = 520
    case webServerIsDown = 521
    case connectionTimeOut = 522
    case originIsUnreachable = 523
    case aTimeoutOccured = 524
    case sslHandshakeFailed = 525
    case invalidSSLCertificate = 526
    case railgunError = 527
    case siteIsFrozen = 529
    case networkReadTimeout = 598
    case networkConnectTimeoutError = 599
}

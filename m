Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A902182E87
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Mar 2020 12:03:17 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id ACE7565FBF
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Mar 2020 11:03:16 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 9ED7265FCA; Thu, 12 Mar 2020 11:03:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A7F906105C;
	Thu, 12 Mar 2020 11:02:59 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 2FF336097D
 for <greybus-dev@lists.linaro.org>; Thu, 12 Mar 2020 11:02:56 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 254C2617EF; Thu, 12 Mar 2020 11:02:56 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by lists.linaro.org (Postfix) with ESMTPS id 9D8976105C
 for <greybus-dev@lists.linaro.org>; Thu, 12 Mar 2020 11:02:27 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id r7so5873594ljp.10
 for <greybus-dev@lists.linaro.org>; Thu, 12 Mar 2020 04:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xDdc7kJCwX6NG51y4/WhGpKrhuKlpllW6J0+34aBuUM=;
 b=G5raSVZ7ry1WCcm6qjk7TfvTKx10vinbdylv0ZLlaz5JV9TN1CO59tEnBp+IJktNZ5
 /xRV9g3clmHe7L8LoHuKjYhNUEYwuLp3VKDIyIacfjvdF5aXEL73WXoMN+tgPkDk1RS+
 r/kQL+ZrH5eolXFZJw+Q77yLFQY8wc8SuFNJoqziopSLboVJXZ+U6RhuwjhN6eufYtvT
 WXH0ylbf5KinsQYvUgv+5UJRJvs9STn6UE88rLjZhznjua2s8WSI/4UQdPLh542qJp/2
 TETH9RpaM8uXqwOOV1Jd/gsZnFD1nIISYhVHw8SkN8z/dsGmbFTfLJR34IkV4erHaKAV
 AA6w==
X-Gm-Message-State: ANhLgQ21Mz0DJXH8B6vU9RA6YlNs41gy/Aj9USUYXkVJdZFq9np8rW6L
 509iLDqizilKo3lUyPwc1qs=
X-Google-Smtp-Source: ADFU+vsmOZIFeUfO5yjeQGM0J/m8azRAO/gGJ3hAhSFyU/Ra3PAxnqt6mjXyuMaP4RnH09Ungsc0gA==
X-Received: by 2002:a2e:b55c:: with SMTP id a28mr5012329ljn.108.1584010946521; 
 Thu, 12 Mar 2020 04:02:26 -0700 (PDT)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.170.18])
 by smtp.gmail.com with ESMTPSA id b3sm7342740ljj.46.2020.03.12.04.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 04:02:25 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@xi.terra>)
 id 1jCLbS-0005kD-C1; Thu, 12 Mar 2020 12:02:14 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 12 Mar 2020 12:01:48 +0100
Message-Id: <20200312110151.22028-1-johan@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org
Subject: [greybus-dev] [PATCH 0/3] staging: greybus: loopback_test: fix
	build breakage
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.16
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

VGhlIGxvb3BiYWNrX3Rlc3QgdG9vbCBoYXNuJ3QgcmVjZWl2ZWQgbXVjaCBsb3ZlIGxhdGVseS4g
SW4gZmFjdCwgaXQgaGFzCmZhaWxlZCB0byBidWlsZCBmb3IgdGhlIHBhc3QgdHdvIHllYXJzIGFm
dGVyIGEgc2NyaXB0ZWQgRVBPTEwqCmNvbnZlcnNpb24uCgpOZXdlciBHQ0MgYWxzbyBzdGFydGVk
IHdhcm5pbmcgZm9yIHBvdGVudGlhbCBzdHJpbmcgdHJ1bmNhdGlvbiBvZgpnZW5lcmF0ZWQgcGF0
aCBuYW1lczsgdGhlIGxhc3QgdHdvIHBhdGNoZXMgYWRkcmVzc2VzIHRoYXQuCgpKb2hhbgoKCkpv
aGFuIEhvdm9sZCAoMyk6CiAgc3RhZ2luZzogZ3JleWJ1czogbG9vcGJhY2tfdGVzdDogZml4IHBv
bGwtbWFzayBidWlsZCBicmVha2FnZQogIHN0YWdpbmc6IGdyZXlidXM6IGxvb3BiYWNrX3Rlc3Q6
IGZpeCBwb3RlbnRpYWwgcGF0aCB0cnVuY2F0aW9uCiAgc3RhZ2luZzogZ3JleWJ1czogbG9vcGJh
Y2tfdGVzdDogZml4IHBvdGVudGlhbCBwYXRoIHRydW5jYXRpb25zCgogZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvdG9vbHMvbG9vcGJhY2tfdGVzdC5jIHwgMjEgKysrKysrKysrKy0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKLS0gCjIu
MjQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3Jl
eWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6
Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK

Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AuTL5Q3l2lfvwIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Feb 2026 17:17:24 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A54416091A
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Feb 2026 17:17:24 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 65BC6401E2
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Feb 2026 16:17:23 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	by lists.linaro.org (Postfix) with ESMTPS id 9D3AD3F700
	for <greybus-dev@lists.linaro.org>; Thu, 19 Feb 2026 13:28:23 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=kd0ZF0bZ;
	spf=pass (lists.linaro.org: domain of bartekkonecki97@gmail.com designates 209.85.167.65 as permitted sender) smtp.mailfrom=bartekkonecki97@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-59dd4bec4ecso1094711e87.0
        for <greybus-dev@lists.linaro.org>; Thu, 19 Feb 2026 05:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771507702; x=1772112502; darn=lists.linaro.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t+2AaA9AcBLSwETgyv/I7NUZsmXAYThrsZi9I0+tTqA=;
        b=kd0ZF0bZUbSEEpwfvNKQbO1gYZCkHKK/M4qiNH4d41XS6wqhUTn4ipAda1LC9DCAJb
         KtP7O6e0dFKsJucb/gL9Lvqqdrtk6VWUl9YPnCGGVvJsv57uqfX2PGmLCTHR1QWYyX0n
         UQpVuIs0a9vsBsjvaR9eTR9K+mwWWj/ggd505JfcBqXtWkLfmzDgPAMpCiSG33nXZnsb
         H3eFfhWzuLUB8JCXWzooyTpFc8phURPCQjenI8zscE2kNB3CBOSN/ZyuziOo82r+Khs5
         B8/8w1nLD4bMljCb3ek7RQiYohjbJbccsWFo8g4PvCHs/Dso6JHL/7fy7wq1iV1f9qIr
         +J0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771507702; x=1772112502;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:to:from:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t+2AaA9AcBLSwETgyv/I7NUZsmXAYThrsZi9I0+tTqA=;
        b=mNsh5xioancHgGS+XV9TlEx04Mfbjab18lkTI9TWXnnVTYMibdM3srtwMgWduVo4/R
         MQhBUOmTApLbd+gBAMYqJ5qJSHkKhdiq0aEo7vDiUbia80gwKcONLxau/O7Mre+rlb76
         pBJH7QF6PeWn2IY0qL3a+UogxGuwTSAPfOnLoat2D6t6GHGzg6IKNZXGlo+5NPuPUUiJ
         APGJFWqVVwLCisyXwWBDfq5YFfM16joH8QRwhfKgytci3BZmvdFhdrTCOHo3FyPuw2GB
         gYHTx8IGeVbKP+9kkPsgvIRGF0yXiUg1j2DbK3zK6pXTzHW4LLCkcYmDAvs4IqCy9EAx
         nbPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe7E7juu2HfC+nBLOvDpk93uBaI7u6JjPM1I44f2Y19ZxfB0a9bciq2/VaYs0xRgZdyCjD1TRA8ga6Eg==@lists.linaro.org
X-Gm-Message-State: AOJu0YyMpuu7igKtC72SOG24YPNVzWHu2c+TOlZVc6U+37tlRBEfyJfe
	dPVQM11/+8AA3KSeAOCtbLxtZSNmkjgSJ10BN5e/WoS58Wc91R21QTfR
X-Gm-Gg: AZuq6aJ9rdL6vM8h+qhCykXcz2RTdkXs6wj8MdlfrXw0lA2O46lpQPLJzg4t6JyG9LZ
	LtXceevlTAMqqkv/4OxiBM70WS9+BKEuhblht2d+RwPywA9VcLeW/orOSHgtQer+W4XqLpMyfV6
	DIusIXx+mmibGZTgAAW5l7E2fDpYhaKLYD+0LKECYYGlb2xIwskYkHEt+bDcYG2dxDtHwZMNv19
	08SaQ7BdTSH63s0pOExTv2CIohMegYEYDPETkAmHS2lj+TjTNlltRF02EK5sDJdd2N2I/m7v5+u
	vScTug9lDgAtrsCt+jSNTvO30r+lnGIthKHt88BpXi0UFz9pLWtTNgU49GY7tuxGEPHM00nXNft
	26nkbNOnnaXnxsm0QCkBn7kHWf2CEN/vhn6fnGgScQob4dzKlsGqGQETSsVfROJBEf2mjfAbksf
	JhX+pWWVCsv2xQ0OH2NUfgmNSRz1I0krwgXg==
X-Received: by 2002:a05:6512:b8a:b0:59f:69ad:4816 with SMTP id 2adb3069b0e04-59f83bc4cbamr2137804e87.47.1771507702060;
        Thu, 19 Feb 2026 05:28:22 -0800 (PST)
Received: from LT495s ([188.146.32.207])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f568bb7sm5379527e87.25.2026.02.19.05.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 05:28:21 -0800 (PST)
Date: Thu, 19 Feb 2026 14:28:19 +0100
From: =?utf-8?Q?Bart=C5=82omiej?= Konecki <bartekkonecki97@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Message-ID: <aZcP88KGUnxDBjTT@LT495s>
MIME-Version: 1.0
Content-Disposition: inline
X-Spamd-Bar: ---
X-MailFrom: bartekkonecki97@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: KJSAYDR76X5INXNQ3RY4XFRSD2GBSPPC
X-Message-ID-Hash: KJSAYDR76X5INXNQ3RY4XFRSD2GBSPPC
X-Mailman-Approved-At: Thu, 19 Feb 2026 16:17:21 +0000
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: document codec mutex usage
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KJSAYDR76X5INXNQ3RY4XFRSD2GBSPPC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.984];
	FROM_NEQ_ENVFROM(0.00)[bartekkonecki97@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 5A54416091A
X-Rspamd-Action: no action

QWRkIGNvbW1lbnRzIGRlc2NyaWJpbmcgbG9jayBhbmQgcmVnaXN0ZXJfbXV0ZXgNCmluIHN0cnVj
dCBnYmF1ZGlvX2NvZGVjX2luZm8uDQpUaGUgbG9jayBwcm90ZWN0cyB0aGUgY29kZWMgcnVudGlt
ZSBzdGF0ZSBhbmQgbW9kdWxlL0RBSSBsaXN0cywgd2hpbGUNCnJlZ2lzdGVyX211dGV4IHByb3Rl
Y3RzIGhhcmR3YXJlIHJlZ2lzdGVycy4NCkltcHJvdmUgcmVhZGFiaWxpdHkgYW5kIGNsYXJpZnkg
bG9ja2luZyBzZW1hbnRpY3MuDQoNClNpZ25lZC1vZmYtYnk6IEJhcnTFgm9taWVqIEtvbmVja2kg
PGJhcnRla2tvbmVja2k5N0BnbWFpbC5jb20+DQotLS0NCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9hdWRpb19jb2RlYy5oIHwgMyArKy0NCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9h
dWRpb19jb2RlYy5oIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuaA0KaW5k
ZXggZjNmN2E3ZWM2YmU0Li45MGRkMzQyNmQ0YTQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9hdWRpb19jb2RlYy5oDQorKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9h
dWRpb19jb2RlYy5oDQpAQCAtNzAsOCArNzAsOSBAQCBzdHJ1Y3QgZ2JhdWRpb19jb2RlY19pbmZv
IHsNCiAJc3RydWN0IGxpc3RfaGVhZCBtb2R1bGVfbGlzdDsNCiAJLyogdG8gbWFpbnRhaW4gcnVu
dGltZSBzdHJlYW0gcGFyYW1zIGZvciBlYWNoIERBSSAqLw0KIAlzdHJ1Y3QgbGlzdF9oZWFkIGRh
aV9saXN0Ow0KLQlzdHJ1Y3QgbXV0ZXggbG9jazsNCisJc3RydWN0IG11dGV4IGxvY2s7CS8qIHBy
b3RlY3RzIGNvZGVjIHN0YXRlIGFuZCBtb2R1bGUvREFJIGxpc3RzICovDQogCXN0cnVjdCBtdXRl
eCByZWdpc3Rlcl9tdXRleDsNCisJLyogc2VyaWFsaXplcyBhY2Nlc3MgdG8gY29kZWMgaGFyZHdh
cmUgcmVnaXN0ZXJzKi8NCiB9Ow0KIA0KIHN0cnVjdCBnYmF1ZGlvX3dpZGdldCB7DQotLSANCjIu
NDcuMw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpn
cmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpU
byB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxp
bmFyby5vcmcK

Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAtGFVabymmg+QUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 17:48:38 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BD035E228
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 17:48:37 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 916953F76C
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 15:48:36 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	by lists.linaro.org (Postfix) with ESMTPS id 747243F719
	for <greybus-dev@lists.linaro.org>; Mon, 30 Mar 2026 12:08:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GAyVjNvv;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of geoffreyhe2@gmail.com designates 209.85.210.172 as permitted sender) smtp.mailfrom=geoffreyhe2@gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-823c56765fdso2071086b3a.1
        for <greybus-dev@lists.linaro.org>; Mon, 30 Mar 2026 05:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774872489; x=1775477289; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t47FTzjGejS6l0c/OZj369t+FiYeAAlmEsRfVM5hMso=;
        b=GAyVjNvvg+KgVCFUCKHb/ET3CVwCR2BbXtueJ3dF/FJbTRmFAsaS0hHWy9uBKnLwUH
         zF/PzmzXq6IRtgwrEGlBAtKeN8O/4BVwiaL9dFFqyXtKvlbrggc3WWZnZHmQGpVIp1uT
         7L4KwCyQ2/Bd1qTpTVwXwhx6Pf7CFB4xodauAeqKeoho+TEcBTIt56us5GjD0OARjp8S
         k1AtX8d68VYC3cqstOv34ZFb/2hiEoldp2MlkVc6+7YGdHp+/9rlqOgjjH9mop5lFVqV
         H2i+xe964mM95eGinPJ3QfFHQ8Q5vZKWg6JHuEfnFaEHZGcFmB9mmSUiHRC3UWjVB8Zl
         ZFkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774872489; x=1775477289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t47FTzjGejS6l0c/OZj369t+FiYeAAlmEsRfVM5hMso=;
        b=WG4kOiiFnqRCqD6IS/eYtkYlw2qG9/FZr9Dv8pG5IDbVsU40nV2vK75s0lVS/caNNq
         5J91y26FN3+ZMjqO9NLgBiEEzrGVNIXj+TsEpOJzpHOqF3Qv6/4s2lg3V3ggoLMEhEYB
         VneKggWDFbzXy/fa6vBh4PSioJwiz2Cbt3jcj66q0XdomOV3EUBPXDs9EuMNyAjUCrAG
         r4yFYL9UCJrDYUy1oHEXz70IbclGfxe55XAXDkQvUA9JBiK6P0DVLIAHCjfqUcr2zSZb
         +6or3y+7LJrKXOd5SYmeuWkYbjqXOdfR2SlRNBSsFjuDrFrzX1uKES0bVeK5m2WFxmfn
         9zeQ==
X-Gm-Message-State: AOJu0YybyJM3bkTVRm52EHHTTciHA5gcK7Q58XIRLtXBwwR4lQjdk1gr
	+n8bipueyuZutaft+luATOzqRMFhw44YYxzPESjhZl3JLfuCvnCE3RyAPeS1qQQI67I=
X-Gm-Gg: ATEYQzztqnUKFgVFcNwn1C06FuL31ExgF7sQA4AN4kb60GlHTvNdYP6WM/lOahwzlz/
	qvUYUbl3xfHn0QQntKcErM6qGOIPay7suCReVTwfG5N6XrQR77YavfzicJEwQYOFisPSNAyjHG4
	erMe7edeUUqee3Y2wcN+g6ELFFl4un+dSRqDTpg+9yMXbCDVBAAssIQGAx4jYydoplOpDM81LYa
	hJDLpUDMHI3VAynAKPBYLVvFR89CFUdO09OxdTAuVO1O5hjpKtRUcs2CNUatTftVO3P3yYBPh+u
	1XoS9J638s3zKdsAvlMgbrVuAB0C7POFPkzz9KG1yPMYqMw6jDqDSEKhRBywyHgdOetRUe/DrR+
	p6Bw4jo50JNYTqV13IcO2S9rBcz/Lo9E52WrRxRDA31tSEtgJ+YmmClo/UwZQFxk3o/TsDBjSZ7
	LI9IjBRkC4JsU2HctfceRoFoCmjqcZ7bcNoGxKsAyq9oRth9BIWFklTWYbRqbIQKswngr9pfaGJ
	xjIFxFjO6ZSBJyFjTsa8a+grDkLYKQLiqYjC+jgld7kRONUSnwH3FG2Pmuo
X-Received: by 2002:a05:6a00:1789:b0:82a:6de8:fa50 with SMTP id d2e1a72fcca58-82c95e45d30mr12770235b3a.18.1774872489085;
        Mon, 30 Mar 2026 05:08:09 -0700 (PDT)
Received: from c8971f1abf06.ap-southeast-2.compute.internal (ec2-3-106-126-184.ap-southeast-2.compute.amazonaws.com. [3.106.126.184])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca860b125sm7137780b3a.50.2026.03.30.05.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 05:08:08 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org
Date: Mon, 30 Mar 2026 12:08:00 +0000
Message-Id: <20260330120801.981506-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spamd-Bar: ---
X-MailFrom: geoffreyhe2@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: YEABHCMFLT6TY3EFEO3EPQKAO42JCRJB
X-Message-ID-Hash: YEABHCMFLT6TY3EFEO3EPQKAO42JCRJB
X-Mailman-Approved-At: Mon, 30 Mar 2026 15:48:34 +0000
CC: Weigang He <geoffreyhe2@gmail.com>, stable@vger.kernel.org, Ayush Singh <ayushdevel1325@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/2] greybus: gb-beagleplay: fix sleep in atomic context in hdlc_tx_frames()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YEABHCMFLT6TY3EFEO3EPQKAO42JCRJB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Spamd-Result: default: False [1.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.948];
	FROM_NEQ_ENVFROM(0.00)[geoffreyhe2@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email]
X-Rspamd-Queue-Id: B8BD035E228
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

aGRsY19hcHBlbmQoKSBjYWxscyB1c2xlZXBfcmFuZ2UoKSB0byB3YWl0IGZvciBjaXJjdWxhciBi
dWZmZXIgc3BhY2UsDQpidXQgaXQgaXMgY2FsbGVkIHdpdGggdHhfcHJvZHVjZXJfbG9jayAoYSBz
cGlubG9jaykgaGVsZCB2aWENCmhkbGNfdHhfZnJhbWVzKCkgLT4gaGRsY19hcHBlbmRfdHhfZnJh
bWUoKS9oZGxjX2FwcGVuZF90eF91OCgpL2V0Yy4NClNsZWVwaW5nIHdoaWxlIGhvbGRpbmcgYSBz
cGlubG9jayBpcyBpbGxlZ2FsIGFuZCBjYW4gdHJpZ2dlcg0KIkJVRzogc2NoZWR1bGluZyB3aGls
ZSBhdG9taWMiLg0KDQpGaXggdGhpcyBieSBtb3ZpbmcgdGhlIGJ1ZmZlci1zcGFjZSB3YWl0IG91
dCBvZiBoZGxjX2FwcGVuZCgpIGFuZCBpbnRvDQpoZGxjX3R4X2ZyYW1lcygpLCBiZWZvcmUgdGhl
IHNwaW5sb2NrIGlzIGFjcXVpcmVkLiAgVGhlIG5ldyBmbG93Og0KDQogMS4gUHJlLWNhbGN1bGF0
ZSB0aGUgd29yc3QtY2FzZSBlbmNvZGVkIGZyYW1lIGxlbmd0aC4NCiAyLiBXYWl0ICh3aXRoIHNs
ZWVwKSBvdXRzaWRlIHRoZSBsb2NrIHVudGlsIGVub3VnaCBzcGFjZSBpcyBhdmFpbGFibGUsDQog
ICAga2lja2luZyB0aGUgVFggY29uc3VtZXIgd29yayB0byBkcmFpbiB0aGUgYnVmZmVyLg0KIDMu
IEFjcXVpcmUgdGhlIHNwaW5sb2NrLCByZS12ZXJpZnkgc3BhY2UsIGFuZCB3cml0ZSB0aGUgZW50
aXJlIGZyYW1lDQogICAgYXRvbWljYWxseS4NCg0KVGhpcyBlbnN1cmVzIHRoYXQgc2xlZXBpbmcg
b25seSBoYXBwZW5zIHdpdGhvdXQgYW55IGxvY2sgaGVsZCwgYW5kDQp0aGF0IGZyYW1lcyBhcmUg
ZWl0aGVyIGZ1bGx5IGVucXVldWVkIG9yIG5vdCB3cml0dGVuIGF0IGFsbC4NCg0KVGhpcyBidWcg
aXMgZm91bmQgYnkgQ29kZVFMIHN0YXRpYyBhbmFseXNpcyB0b29sIChpbnRlcnByb2NlZHVyYWwN
CnNsZWVwLWluLWF0b21pYyBxdWVyeSkgYW5kIG15IGNvZGUgcmV2aWV3Lg0KDQpGaXhlczogZWM1
NThiYmZlYTY3ICgiZ3JleWJ1czogQWRkIEJlYWdsZVBsYXkgTGludXggRHJpdmVyIikNCkNjOiBz
dGFibGVAdmdlci5rZXJuZWwub3JnDQpDYzogQXl1c2ggU2luZ2ggPGF5dXNoZGV2ZWwxMzI1QGdt
YWlsLmNvbT4NCkNjOiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5vcmc+DQpDYzogQWxleCBF
bGRlciA8ZWxkZXJAa2VybmVsLm9yZz4NCkNjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBs
aW51eGZvdW5kYXRpb24ub3JnPg0KU2lnbmVkLW9mZi1ieTogV2VpZ2FuZyBIZSA8Z2VvZmZyZXlo
ZTJAZ21haWwuY29tPg0KLS0tDQogZHJpdmVycy9ncmV5YnVzL2diLWJlYWdsZXBsYXkuYyB8IDEw
NSArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA4OSBp
bnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Jl
eWJ1cy9nYi1iZWFnbGVwbGF5LmMgYi9kcml2ZXJzL2dyZXlidXMvZ2ItYmVhZ2xlcGxheS5jDQpp
bmRleCA4NzE4NmY4OTFhNmFjLi5kYTFiOTAzOWZkMmYzIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9n
cmV5YnVzL2diLWJlYWdsZXBsYXkuYw0KKysrIGIvZHJpdmVycy9ncmV5YnVzL2diLWJlYWdsZXBs
YXkuYw0KQEAgLTI0MiwzMCArMjQyLDI2IEBAIHN0YXRpYyB2b2lkIGhkbGNfd3JpdGUoc3RydWN0
IGdiX2JlYWdsZXBsYXkgKmJnKQ0KIH0NCiANCiAvKioNCi0gKiBoZGxjX2FwcGVuZCgpIC0gUXVl
dWUgSERMQyBkYXRhIGZvciBzZW5kaW5nLg0KKyAqIGhkbGNfYXBwZW5kKCkgLSBRdWV1ZSBhIHNp
bmdsZSBIRExDIGJ5dGUgZm9yIHNlbmRpbmcuDQogICogQGJnOiBiZWFnbGVwbGF5IGdyZXlidXMg
ZHJpdmVyDQogICogQHZhbHVlOiBoZGxjIGJ5dGUgdG8gdHJhbnNtaXQNCiAgKg0KLSAqIEFzc3Vt
ZXMgdGhhdCBwcm9kdWNlciBsb2NrIGFzIGJlZW4gYWNxdWlyZWQuDQorICogQ2FsbGVyIG11c3Qg
aG9sZCB0eF9wcm9kdWNlcl9sb2NrIGFuZCBtdXN0IGhhdmUgZW5zdXJlZCBzdWZmaWNpZW50DQor
ICogc3BhY2UgaW4gdGhlIGNpcmN1bGFyIGJ1ZmZlciBiZWZvcmUgY2FsbGluZyAoc2VlIGhkbGNf
dHhfZnJhbWVzKCkpLg0KICAqLw0KIHN0YXRpYyB2b2lkIGhkbGNfYXBwZW5kKHN0cnVjdCBnYl9i
ZWFnbGVwbGF5ICpiZywgdTggdmFsdWUpDQogew0KLQlpbnQgdGFpbCwgaGVhZCA9IGJnLT50eF9j
aXJjX2J1Zi5oZWFkOw0KKwlpbnQgaGVhZCA9IGJnLT50eF9jaXJjX2J1Zi5oZWFkOw0KKwlpbnQg
dGFpbCA9IFJFQURfT05DRShiZy0+dHhfY2lyY19idWYudGFpbCk7DQogDQotCXdoaWxlICh0cnVl
KSB7DQotCQl0YWlsID0gUkVBRF9PTkNFKGJnLT50eF9jaXJjX2J1Zi50YWlsKTsNCi0NCi0JCWlm
IChDSVJDX1NQQUNFKGhlYWQsIHRhaWwsIFRYX0NJUkNfQlVGX1NJWkUpID49IDEpIHsNCi0JCQli
Zy0+dHhfY2lyY19idWYuYnVmW2hlYWRdID0gdmFsdWU7DQorCWxvY2tkZXBfYXNzZXJ0X2hlbGQo
JmJnLT50eF9wcm9kdWNlcl9sb2NrKTsNCisJaWYgKFdBUk5fT05fT05DRShDSVJDX1NQQUNFKGhl
YWQsIHRhaWwsIFRYX0NJUkNfQlVGX1NJWkUpIDwgMSkpDQorCQlyZXR1cm47DQogDQotCQkJLyog
RmluaXNoIHByb2R1Y2luZyBIRExDIGJ5dGUgKi8NCi0JCQlzbXBfc3RvcmVfcmVsZWFzZSgmYmct
PnR4X2NpcmNfYnVmLmhlYWQsDQotCQkJCQkgIChoZWFkICsgMSkgJiAoVFhfQ0lSQ19CVUZfU0la
RSAtIDEpKTsNCi0JCQlyZXR1cm47DQotCQl9DQotCQlkZXZfd2FybigmYmctPnNkLT5kZXYsICJU
eCBjaXJjIGJ1ZiBmdWxsIik7DQotCQl1c2xlZXBfcmFuZ2UoMzAwMCwgNTAwMCk7DQotCX0NCisJ
YmctPnR4X2NpcmNfYnVmLmJ1ZltoZWFkXSA9IHZhbHVlOw0KKwkvKiBFbnN1cmUgYnVmZmVyIHdy
aXRlIGlzIHZpc2libGUgYmVmb3JlIGFkdmFuY2luZyBoZWFkLiAqLw0KKwlzbXBfc3RvcmVfcmVs
ZWFzZSgmYmctPnR4X2NpcmNfYnVmLmhlYWQsDQorCQkJICAoaGVhZCArIDEpICYgKFRYX0NJUkNf
QlVGX1NJWkUgLSAxKSk7DQogfQ0KIA0KIHN0YXRpYyB2b2lkIGhkbGNfYXBwZW5kX2VzY2FwZWQo
c3RydWN0IGdiX2JlYWdsZXBsYXkgKmJnLCB1OCB2YWx1ZSkNCkBAIC0zMTMsMTMgKzMwOSw5MCBA
QCBzdGF0aWMgdm9pZCBoZGxjX3RyYW5zbWl0KHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykNCiAJ
c3Bpbl91bmxvY2tfYmgoJmJnLT50eF9jb25zdW1lcl9sb2NrKTsNCiB9DQogDQorLyoqDQorICog
aGRsY19lbmNvZGVkX2xlbmd0aCgpIC0gQ2FsY3VsYXRlIHdvcnN0LWNhc2UgZW5jb2RlZCBsZW5n
dGggb2YgYW4gSERMQyBmcmFtZS4NCisgKiBAcGF5bG9hZHM6IGFycmF5IG9mIHBheWxvYWQgYnVm
ZmVycw0KKyAqIEBjb3VudDogbnVtYmVyIG9mIHBheWxvYWRzDQorICoNCisgKiBSZXR1cm5zIHRo
ZSBtYXhpbXVtIG51bWJlciBvZiBieXRlcyBuZWVkZWQgaW4gdGhlIGNpcmN1bGFyIGJ1ZmZlci4N
CisgKi8NCitzdGF0aWMgc2l6ZV90IGhkbGNfZW5jb2RlZF9sZW5ndGgoY29uc3Qgc3RydWN0IGhk
bGNfcGF5bG9hZCBwYXlsb2Fkc1tdLA0KKwkJCQkgIHNpemVfdCBjb3VudCkNCit7DQorCXNpemVf
dCBpLCBwYXlsb2FkX2xlbiA9IDA7DQorDQorCWZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKQ0K
KwkJcGF5bG9hZF9sZW4gKz0gcGF5bG9hZHNbaV0ubGVuOw0KKw0KKwkvKg0KKwkgKiBXb3JzdCBj
YXNlOiBldmVyeSBkYXRhIGJ5dGUgbmVlZHMgZXNjYXBpbmcgKGRvdWJsZXMgaW4gc2l6ZSkuDQor
CSAqIGRhdGEgYnl0ZXMgPSBhZGRyZXNzKDEpICsgY29udHJvbCgxKSArIHBheWxvYWQgKyBjcmMo
MikNCisJICogZnJhbWluZyAgICA9IG9wZW5pbmcgZmxhZygxKSArIGNsb3NpbmcgZmxhZygxKQ0K
KwkgKi8NCisJcmV0dXJuIDIgKyAoMSArIDEgKyBwYXlsb2FkX2xlbiArIDIpICogMjsNCit9DQor
DQorI2RlZmluZSBIRExDX1RYX0JVRl9XQUlUX1JFVFJJRVMJNTAwDQorI2RlZmluZSBIRExDX1RY
X0JVRl9XQUlUX1VTX01JTgkzMDAwDQorI2RlZmluZSBIRExDX1RYX0JVRl9XQUlUX1VTX01BWAk1
MDAwDQorDQorLyoqDQorICogaGRsY190eF9mcmFtZXMoKSAtIEVuY29kZSBhbmQgcXVldWUgYW4g
SERMQyBmcmFtZSBmb3IgdHJhbnNtaXNzaW9uLg0KKyAqIEBiZzogYmVhZ2xlcGxheSBncmV5YnVz
IGRyaXZlcg0KKyAqIEBhZGRyZXNzOiBIRExDIGFkZHJlc3MgZmllbGQNCisgKiBAY29udHJvbDog
SERMQyBjb250cm9sIGZpZWxkDQorICogQHBheWxvYWRzOiBhcnJheSBvZiBwYXlsb2FkIGJ1ZmZl
cnMNCisgKiBAY291bnQ6IG51bWJlciBvZiBwYXlsb2Fkcw0KKyAqDQorICogU2xlZXBzIG91dHNp
ZGUgdGhlIHNwaW5sb2NrIHVudGlsIGVub3VnaCBjaXJjdWxhci1idWZmZXIgc3BhY2UgaXMNCisg
KiBhdmFpbGFibGUsIHRoZW4gdmVyaWZpZXMgc3BhY2UgdW5kZXIgdGhlIGxvY2sgYW5kIHdyaXRl
cyB0aGUgZW50aXJlDQorICogZnJhbWUgYXRvbWljYWxseS4gIEVpdGhlciBhIGNvbXBsZXRlIGZy
YW1lIGlzIGVucXVldWVkIG9yIG5vdGhpbmcgaXMNCisgKiB3cml0dGVuLCBhdm9pZGluZyBib3Ro
IHNsZWVwaW5nIGluIGF0b21pYyBjb250ZXh0IGFuZCBwYXJ0aWFsIGZyYW1lcy4NCisgKi8NCiBz
dGF0aWMgdm9pZCBoZGxjX3R4X2ZyYW1lcyhzdHJ1Y3QgZ2JfYmVhZ2xlcGxheSAqYmcsIHU4IGFk
ZHJlc3MsIHU4IGNvbnRyb2wsDQogCQkJICAgY29uc3Qgc3RydWN0IGhkbGNfcGF5bG9hZCBwYXls
b2Fkc1tdLCBzaXplX3QgY291bnQpDQogew0KKwlzaXplX3QgbmVlZGVkID0gaGRsY19lbmNvZGVk
X2xlbmd0aChwYXlsb2FkcywgY291bnQpOw0KKwlpbnQgcmV0cmllcyA9IEhETENfVFhfQlVGX1dB
SVRfUkVUUklFUzsNCiAJc2l6ZV90IGk7DQorCWludCBoZWFkLCB0YWlsOw0KKw0KKwkvKiBXYWl0
IG91dHNpZGUgdGhlIGxvY2sgZm9yIHN1ZmZpY2llbnQgYnVmZmVyIHNwYWNlLiAqLw0KKwl3aGls
ZSAocmV0cmllcy0tKSB7DQorCQkvKiBQYWlycyB3aXRoIHNtcF9zdG9yZV9yZWxlYXNlKCkgaW4g
aGRsY19hcHBlbmQoKS4gKi8NCisJCWhlYWQgPSBzbXBfbG9hZF9hY3F1aXJlKCZiZy0+dHhfY2ly
Y19idWYuaGVhZCk7DQorCQl0YWlsID0gUkVBRF9PTkNFKGJnLT50eF9jaXJjX2J1Zi50YWlsKTsN
CisNCisJCWlmIChDSVJDX1NQQUNFKGhlYWQsIHRhaWwsIFRYX0NJUkNfQlVGX1NJWkUpID49IG5l
ZWRlZCkNCisJCQlicmVhazsNCisNCisJCS8qIEtpY2sgdGhlIGNvbnN1bWVyIGFuZCBzbGVlcCDi
gJQgbm8gbG9jayBoZWxkLiAqLw0KKwkJc2NoZWR1bGVfd29yaygmYmctPnR4X3dvcmspOw0KKwkJ
dXNsZWVwX3JhbmdlKEhETENfVFhfQlVGX1dBSVRfVVNfTUlOLCBIRExDX1RYX0JVRl9XQUlUX1VT
X01BWCk7DQorCX0NCisNCisJaWYgKHJldHJpZXMgPCAwKSB7DQorCQlkZXZfd2Fybl9yYXRlbGlt
aXRlZCgmYmctPnNkLT5kZXYsDQorCQkJCSAgICAgIlR4IGNpcmMgYnVmIGZ1bGwsIGRyb3BwaW5n
IGZyYW1lXG4iKTsNCisJCXJldHVybjsNCisJfQ0KIA0KIAlzcGluX2xvY2soJmJnLT50eF9wcm9k
dWNlcl9sb2NrKTsNCiANCisJLyoNCisJICogUmUtY2hlY2sgdW5kZXIgdGhlIGxvY2suICBTaG91
bGQgbm90IGZhaWwgc2luY2UNCisJICogdHhfcHJvZHVjZXJfbG9jayBzZXJpYWxpc2VzIGFsbCBw
cm9kdWNlcnMgYW5kIHRoZQ0KKwkgKiBjb25zdW1lciBvbmx5IGZyZWVzIHNwYWNlLCBidXQgZ3Vh
cmQgYWdhaW5zdCBpdC4NCisJICovDQorCWhlYWQgPSBiZy0+dHhfY2lyY19idWYuaGVhZDsNCisJ
dGFpbCA9IFJFQURfT05DRShiZy0+dHhfY2lyY19idWYudGFpbCk7DQorCWlmICh1bmxpa2VseShD
SVJDX1NQQUNFKGhlYWQsIHRhaWwsIFRYX0NJUkNfQlVGX1NJWkUpIDwgbmVlZGVkKSkgew0KKwkJ
c3Bpbl91bmxvY2soJmJnLT50eF9wcm9kdWNlcl9sb2NrKTsNCisJCWRldl93YXJuX3JhdGVsaW1p
dGVkKCZiZy0+c2QtPmRldiwNCisJCQkJICAgICAiVHggY2lyYyBidWYgc3BhY2UgbG9zdCwgZHJv
cHBpbmcgZnJhbWVcbiIpOw0KKwkJcmV0dXJuOw0KKwl9DQorDQogCWhkbGNfYXBwZW5kX3R4X2Zy
YW1lKGJnKTsNCiAJaGRsY19hcHBlbmRfdHhfdTgoYmcsIGFkZHJlc3MpOw0KIAloZGxjX2FwcGVu
ZF90eF91OChiZywgY29udHJvbCk7DQotLSANCjIuMzQuMQ0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0g
Z3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWls
IHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK

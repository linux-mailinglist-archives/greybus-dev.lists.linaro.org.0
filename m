Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Hyq1HGCfTmquQwIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 08 Jul 2026 21:05:04 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DCC729C5F
	for <lists+greybus-dev@lfdr.de>; Wed, 08 Jul 2026 21:05:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=baylibre.com header.s=google header.b=APa1A63F;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org"
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0935C40977
	for <lists+greybus-dev@lfdr.de>; Wed,  8 Jul 2026 19:05:03 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	by lists.linaro.org (Postfix) with ESMTPS id 6B3B53F8F1
	for <greybus-dev@lists.linaro.org>; Mon,  6 Jul 2026 16:09:41 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47de008b020so683899f8f.1
        for <greybus-dev@lists.linaro.org>; Mon, 06 Jul 2026 09:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783354180; x=1783958980; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KIhoSfDHL45fFIkGzANRY3iLW8FpOnvtdcPj6CNgyiY=;
        b=APa1A63FKUP6VWtzMAV0+HjEW4UzmgF7pGhyGECzkQOAWXr9FIxFGF0jyMuRZuuUjz
         Ee6XA/H7cCGF55M/YEdrIQ+bdQCstmVGgFR54yBEvRWj0jpA7CcO9UJrD8sT3xXgUMEM
         BCeal5yqoVxtVMWhkt8O1tBMJK6/VOoDcWXODMx8BuJY3IGeKpVDMjR9b07i4nF8MW05
         QaBTxvA5yBgeyVxa5NF2yWkA8p17LAHxPVaIo626JFQjIDukLxBOpjlYfcnoLqcf7vUK
         FfzJ7UYgWk9FmIdrfSIpCjuegab7tfAU/EzzzN8gPDkL3A0GfnuIyvYx0+oxYgv7OmZo
         XTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783354180; x=1783958980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIhoSfDHL45fFIkGzANRY3iLW8FpOnvtdcPj6CNgyiY=;
        b=SAVelzlD36PBa+lxYVpwHFNvb+tho5yQqHx4Ny6RKYJgwEFhfOW5ZPpiASi989v7sx
         0kI7ugj4GhUXHtwL893culW58MaqNp/u9cFjsdWEhD3rtIMMo6U9Ad3asyAD+G0cmGsg
         5UfV1ZHRmgmOWVo05x7wxAa+05+6F2uM2D+yuSibOLniWBPADzr+VfyR9kdP9t4FkALH
         OtKIPiJf9W710AN7xekzKmrVx5aoEQZtGfrdTPkBS+4SVleqULbIgW6xaaqOSrEx+9pa
         31NLDQG2zZdmkfb4NhjprfOYqvH3epdmPZ4oOOrJsuidZt89nmKskr6aSuvJSmVzGTZ9
         RN/g==
X-Gm-Message-State: AOJu0YxP4XeRHS/Qrkm9POePg4/eZ1aBSOiGMrQidcZjkeV9Y9K0Wgw2
	JzKCe6uuBy8i9har4CwoIlh5ONKDPwjtw9dSfQEk6aRWR3SjRJ79hCSuZTA72JOR8Mc=
X-Gm-Gg: AfdE7clWMQ+w+4//BtooNVY/5lEaXqz/yKknGEYQqmi7cRTHvoL5gx8bgMTiA+oUqXZ
	7W25A0JMviNnor6TIO+nc+uyie//RkfZV4iMznvunrYHAmSqDsd4VhvvAp0Clivnn2S8C0JNpbv
	No+O+xntFwmX/7HgPkVUEX14KoyjCekTXD69ef3Zlod7S6iY9mRU+aRWJCGGZEZop5/OSC+8+Wr
	uQoXKjDq71r6nsxX/Xhbj56PE1WWFm7u58f4voOANOIVf6Aa9DVaFJZIJtR1ahwG92MqFibBico
	7VZKmK6S/KhgkAz2ZvfPBvalY4D+L34SHp/bIs4qj2/Jv3UgFbK5ipm0xDyG/GHLkJ9NolRb2P+
	BzwA/AVW6lC2ZNbkBNxktPxSNhBu3ZFKmF3BAh+WsMj+h5fd5H2wNO9UWDbw7F8gNfsQj8ff8iq
	YEYsl7jwnNIBX9nVsvJ2To5nFl/wvsSdQ2zhp8+C5j+8bENEBtteYr1I2hjnQFjiD3sJpksnHaU
	Yg=
X-Received: by 2002:adf:f3cd:0:b0:473:fc10:f675 with SMTP id ffacd0b85a97d-47de619d82amr1297666f8f.18.1783354180292;
        Mon, 06 Jul 2026 09:09:40 -0700 (PDT)
Received: from localhost (p200300f65f47db0404eb41111570ffdc.dip0.t-ipconnect.de. [2003:f6:5f47:db04:4eb:4111:1570:ffdc])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9de1e785sm25620735f8f.8.2026.07.06.09.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:09:39 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon,  6 Jul 2026 18:09:32 +0200
Message-ID: <80964227feede2d8f1978f13f4219fcf9e63d8d0.1783354012.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2777; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=nwwI/yG17KabbJhrZbzS/WTKLoyilBYIBqhqTkkgwz0=; b=owGbwMvMwMXY3/A7olbonx/jabUkhizvy7ac/deqdYqkgj/KhN3dL5WkHvT+UjJX8AHTH5Wf4 xmDhHQ6GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZjIsTvs/0vYzx6pf9Xu4Sxv UBW/x/dKLff/iHfT73F2mnc7P5ryS77J4Zd9cMTbF5IhF9JZwqrNLK2uzr9h1OK4jvvzjZPzGG7 cY83wTl0iIfzme4zM81N8VmcT+b/Xritm76wPuJFz8k9VTLPgnNQDlxur/Zw9YlcvKty372xGjJ H9fos3ptH9u3m3lk1x/q333d/Ljtt14eSp6zmCzkQ5Ohj1Pzy86k1jE5uiceCDOrGa35Vtr+Ot0 9PW1yznKkz1Wd2eafTg3YKXd/6p1Gw9KO93sbdjmc7+0Oq6S1f1BdmDJl9lUFm2RLs+6PBGky9K wrf/dqrK/95z27x1tYzjn+kSbD6M1Sq+J3T0E6/wXHgMAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-Spamd-Bar: --
X-MailFrom: ukleinek@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: SYQE35OPU6MY5F6HLMO3PENZPVTZA5XJ
X-Message-ID-Hash: SYQE35OPU6MY5F6HLMO3PENZPVTZA5XJ
X-Mailman-Approved-At: Wed, 08 Jul 2026 19:04:58 +0000
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v1] greybus: Drop #include of <linux/mod_devicetable.h>
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SYQE35OPU6MY5F6HLMO3PENZPVTZA5XJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[baylibre.com:s=google];
	DATE_IN_PAST(1.00)[50];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:greybus-dev@lists.linaro.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,greybus-dev-bounces@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	DKIM_TRACE(0.00)[baylibre.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 05DCC729C5F

VGhlIGhlYWRlciBpdHNlbGYgYWxzbyBpbmNsdWRlcyA8bGludXgvdHlwZXMuaD4gYW5kIGFkZGl0
aW9uYWwgdG8gdGhhdA0KZG9lc24ndCBtYWtlIHVzZSBvZiBhbnkgc3ltYm9sIGRlZmluZWQgKHRy
YW5zaXRpdmVseSkgYnkNCjxsaW51eC9tb2RfZGV2aWNldGFibGUuaD4uIEFsc28gdGhlIC5jIGZp
bGVzIHRoYXQgaW5jbHVkZSB0aGF0IGhlYWRlcg0KZG9uJ3QgbmVlZCBpdCAodGhlcmUgaXMgbm8g
ZGlyZWN0IGluY2x1ZGUsIG9ubHkgdmlhIDxsaW51eC9ncmV5YnVzLmg+KToNCg0KCSQgZ2l0IGdy
ZXAgLWwgZ3JleWJ1c1xcLmggfCB4YXJncyBncmVwIC1FICJcPChhY3BpX2RldmljZV9pZHxhbWJh
X2lkfGFwX2RldmljZV9pZHxhcHJfZGV2aWNlX2lkfGF1eGlsaWFyeV9kZXZpY2VfaWR8YmNtYV9k
ZXZpY2VfaWR8Y2N3X2RldmljZV9pZHxjZHhfZGV2aWNlX2lkfGNvcmVib290X2RldmljZV9pZHxj
c3NfZGV2aWNlX2lkfGRmbF9kZXZpY2VfaWR8ZG1pXyhkZXZpY2V8c3lzdGVtKV9pZHxlaXNhX2Rl
dmljZV9pZHxmc2xfbWNfZGV2aWNlX2lkfGhkYV9kZXZpY2VfaWR8aGlkX2RldmljZV9pZHxodl92
bWJ1c19kZXZpY2VfaWR8aTJjX2RldmljZV9pZHxpM2NfZGV2aWNlX2lkfGllZWUxMzk0X2Rldmlj
ZV9pZHxpbnB1dF9kZXZpY2VfaWR8aXBhY2tfZGV2aWNlX2lkfGlzYXBucF9kZXZpY2VfaWR8aXNo
dHBfZGV2aWNlX2lkfG1jYl9kZXZpY2VfaWR8bWRpb19kZXZpY2VfaWR8bWVpX2NsX2RldmljZV9p
ZHxtaGlfZGV2aWNlX2lkfG1pcHNfY2RtbV9kZXZpY2VfaWR8b2ZfZGV2aWNlX2lkfHBhcmlzY19k
ZXZpY2VfaWR8cGNpX2RldmljZV9pZHxwY2lfZXBmX2RldmljZV9pZHxwY21jaWFfZGV2aWNlX2lk
fHBsYXRmb3JtX2RldmljZV9pZHxwbnBfKGNhcmRfKT9kZXZpY2VfaWR8cmlvX2RldmljZV9pZHxy
cG1zZ19kZXZpY2VfaWR8c2Rpb19kZXZpY2VfaWR8c2R3X2RldmljZV9pZHxzZXJpb19kZXZpY2Vf
aWR8c2xpbV9kZXZpY2VfaWR8c3BpX2RldmljZV9pZHxzcG1pX2RldmljZV9pZHxzc2FtX2Rldmlj
ZV9pZHxzc2JfZGV2aWNlX2lkfHRiX3NlcnZpY2VfaWR8dGVlX2NsaWVudF9kZXZpY2VfaWR8dHlw
ZWNfZGV2aWNlX2lkfHVscGlfZGV2aWNlX2lkfHVzYl9kZXZpY2VfaWR8dmNoaXFfZGV2aWNlX2lk
fHZpcnRpb19kZXZpY2VfaWR8d21pX2RldmljZV9pZHx4ODZfKGNwdXxkZXZpY2UpX2lkfHpvcnJv
X2RldmljZV9pZHxjcHVfZmVhdHVyZSlcPiINCglkcml2ZXJzL2dyZXlidXMvZXMyLmM6c3RhdGlj
IGNvbnN0IHN0cnVjdCB1c2JfZGV2aWNlX2lkIGlkX3RhYmxlW10gPSB7DQoJZHJpdmVycy9ncmV5
YnVzL2VzMi5jOgkJICAgIGNvbnN0IHN0cnVjdCB1c2JfZGV2aWNlX2lkICppZCkNCglkcml2ZXJz
L2dyZXlidXMvZ2ItYmVhZ2xlcGxheS5jOnN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IGdiX2JlYWdsZXBsYXlfb2ZfbWF0Y2hbXSA9IHsNCglkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9h
cmNoZS1wbGF0Zm9ybS5jOnN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGFyY2hlX3Bs
YXRmb3JtX29mX21hdGNoW10gPSB7DQoNCmRyaXZlcnMvZ3JleWJ1cy9lczIuYyBpbmNsdWRlcyA8
bGludXgvdXNiLmg+LA0KZHJpdmVycy9ncmV5YnVzL2diLWJlYWdsZXBsYXkuYyBpbmNsdWRlcyA8
bGludXgvc2VyZGV2Lmg+IHdoaWNoIHByb3ZpZGVzDQpvZl9kZXZpY2VfaWQgdmlhIDxsaW51eC9k
ZXZpY2UuaD4sIHNpbWlsYXINCmRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2FyY2hlLXBsYXRmb3Jt
LmMgaW5jbHVkZXMNCjxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4gd2hpY2ggYWxzbyBwcm92aWRl
cyBvZl9kZXZpY2VfaWQuDQoNClNvIHRoZSAjaW5jbHVkZSBjYW4gZ28gYXdheSB3aXRob3V0IGZ1
cnRoZXIgYWRhcHRpb24uDQoNClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIChUaGUg
Q2FwYWJsZSBIdWIpIDx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPg0KLS0tDQogaW5jbHVk
ZS9saW51eC9ncmV5YnVzL2dyZXlidXNfaWQuaCB8IDQgKy0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvZ3JleWJ1cy9ncmV5YnVzX2lkLmggYi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvZ3JleWJ1c19p
ZC5oDQppbmRleCBmNGM4NDQwMDkzZTQuLjcyZjMzMGEzNTU2OSAxMDA2NDQNCi0tLSBhL2luY2x1
ZGUvbGludXgvZ3JleWJ1cy9ncmV5YnVzX2lkLmgNCisrKyBiL2luY2x1ZGUvbGludXgvZ3JleWJ1
cy9ncmV5YnVzX2lkLmgNCkBAIC0xLDE0ICsxLDEyIEBADQogLyogU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAgKi8NCiAvKiBGSVhNRQ0KLSAqIG1vdmUgdGhpcyB0byBpbmNsdWRlL2xp
bnV4L21vZF9kZXZpY2V0YWJsZS5oIHdoZW4gbWVyZ2luZw0KKyAqIG1vdmUgdGhpcyB0byBpbmNs
dWRlL2xpbnV4L2RldmljZS1pZC9ncmV5YnVzLmggd2hlbiBtZXJnaW5nDQogICovDQogDQogI2lm
bmRlZiBfX0xJTlVYX0dSRVlCVVNfSURfSA0KICNkZWZpbmUgX19MSU5VWF9HUkVZQlVTX0lEX0gN
CiANCiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4NCi0jaW5jbHVkZSA8bGludXgvbW9kX2Rldmlj
ZXRhYmxlLmg+DQotDQogDQogc3RydWN0IGdyZXlidXNfYnVuZGxlX2lkIHsNCiAJX191MTYJbWF0
Y2hfZmxhZ3M7DQoNCmJhc2UtY29tbWl0OiA4Y2RlYWE1MGVhZThkYWQzNDg4NTUxNWY2MjU1OWVl
ODNlN2U4ZGRhDQotLSANCjIuNTUuMC4xMS5nMTUzNjY2YTdkOWJiDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlz
dCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4g
ZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
